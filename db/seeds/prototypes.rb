# require 'pry'
# require 'logger'

# ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Seed prototypes...'

MATTRESS_SIZES = %w( 70x186 70x190 70x195 70x200 80x186 80x190 80x195 80x200 90x186 90x190 90x195 90x200 110x186 110x190
                     110x195 110x200 120x186 120x190 120x195 120x200 130x186 130x190 130x195 130x200 140x186 140x190
                     140x195 140x200 150x186 150x190 150x195 150x200 160x186 160x190 160x195 160x200 170x186 170x190
                     170x195 170x200 180x186 180x190 180x195 180x200 )

COVER_SIZES = %w( 80x200 90x200 100x200 110x200 130x200 140x200 150x200 160x200 170x200 180x200 190x200 200x200 )

BED_FRAME_SIZES = %w( 80x190 80x195 80x200 90x190 90x195 90x200 100x190 100x195 100x200 120x190 120x195 140x190 140x195
                     140x200 160x190 160x195 160x200 180x190 180x195 180x200 200x190 200x195 200x200 )

MATTRESS_PROPERTIES = %i( warranty service_time mattress_type mattress_height max_load top_load_level bottom_load_level
                         base_mattress_block springs_number clothing_material removable_cover manufacturer )

BED_FRAME_PROPERTIES = %i( warranty manufacturer lamellas_distance lamellas_witdth linkage )

PILLOW_PROPERTIES = %i( age_category warranty clothing_material pillow_block pillow_size)

COVER_PROPERTIES = %i( age_category warranty manufacturer cover_type fixation cleaning_method)

def create_option_type(prototype_type)
  return if prototype_type == :pillow
  option_type = Spree::OptionType.find_by_name(I18n.t("option_types.#{prototype_type}_size.name")) ||
                Spree::OptionType.create(name: I18n.t("option_types.#{prototype_type}_size.name"),
                                         presentation: I18n.t("option_types.#{prototype_type}_size.presentation"))
  create_option_values(option_type, prototype_type)
  option_type
end

def create_option_values(option_type, prototype_type)
  "#{prototype_type.upcase}_SIZES".constantize.each do |size|
    Spree::OptionValue.create(option_type_id: option_type.id, name: size, presentation: size)
  end
end

%i( mattress cover bed_frame pillow ).each do |prototype_type|
  prototype = Spree::Prototype.find_by(name: I18n.t("prototypes.#{prototype_type}")) ||
              Spree::Prototype.new(name: I18n.t("prototypes.#{prototype_type}"))

  prototype.option_type_ids = [create_option_type(prototype_type).try(:id)]

  properties = []
  "#{prototype_type.upcase}_PROPERTIES".constantize.each do |property|
    property = Spree::Property.joins(:translations).find_by_name(I18n.t("properties.#{property}.name")) ||
               Spree::Property.create(name: I18n.t("properties.#{property}.name"),
                                      presentation: I18n.t("properties.#{property}.presentation"))
    properties << property.id
  end

  prototype.property_ids = properties
  prototype.save
end

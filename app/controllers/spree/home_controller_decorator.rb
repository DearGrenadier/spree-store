Spree::HomeController.class_eval do
  helper 'spree/products'

  def index
    @taxon = Spree::Taxon.joins(:translations).find_by_name(Spree.t(:mattresses))
    @mattresses = build_searcher(params.merge(taxon: @taxon.id, include_images: true)).retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end
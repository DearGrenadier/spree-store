--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE friendly_id_slugs OWNER TO cosmosloth;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE friendly_id_slugs_id_seq OWNER TO cosmosloth;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO cosmosloth;

--
-- Name: spree_addresses; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_addresses (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    zipcode character varying,
    phone character varying,
    state_name character varying,
    alternative_phone character varying,
    company character varying,
    state_id integer,
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_addresses OWNER TO cosmosloth;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_addresses_id_seq OWNER TO cosmosloth;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_addresses_id_seq OWNED BY spree_addresses.id;


--
-- Name: spree_adjustments; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_adjustments (
    id integer NOT NULL,
    source_id integer,
    source_type character varying,
    adjustable_id integer,
    adjustable_type character varying,
    amount numeric(10,2),
    label character varying,
    mandatory boolean,
    eligible boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying,
    order_id integer NOT NULL,
    included boolean DEFAULT false
);


ALTER TABLE spree_adjustments OWNER TO cosmosloth;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_adjustments_id_seq OWNER TO cosmosloth;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_adjustments_id_seq OWNED BY spree_adjustments.id;


--
-- Name: spree_assets; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_assets (
    id integer NOT NULL,
    viewable_id integer,
    viewable_type character varying,
    attachment_width integer,
    attachment_height integer,
    attachment_file_size integer,
    "position" integer,
    attachment_content_type character varying,
    attachment_file_name character varying,
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    alt text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE spree_assets OWNER TO cosmosloth;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_assets_id_seq OWNER TO cosmosloth;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_assets_id_seq OWNED BY spree_assets.id;


--
-- Name: spree_calculators; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_calculators (
    id integer NOT NULL,
    type character varying,
    calculable_id integer,
    calculable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    preferences text,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_calculators OWNER TO cosmosloth;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_calculators_id_seq OWNER TO cosmosloth;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_calculators_id_seq OWNED BY spree_calculators.id;


--
-- Name: spree_countries; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_countries (
    id integer NOT NULL,
    iso_name character varying,
    iso character varying,
    iso3 character varying,
    name character varying,
    numcode integer,
    states_required boolean DEFAULT false,
    updated_at timestamp without time zone
);


ALTER TABLE spree_countries OWNER TO cosmosloth;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_countries_id_seq OWNER TO cosmosloth;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_countries_id_seq OWNED BY spree_countries.id;


--
-- Name: spree_credit_cards; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_credit_cards (
    id integer NOT NULL,
    month character varying,
    year character varying,
    cc_type character varying,
    last_digits character varying,
    address_id integer,
    gateway_customer_profile_id character varying,
    gateway_payment_profile_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    user_id integer,
    payment_method_id integer,
    "default" boolean DEFAULT false NOT NULL
);


ALTER TABLE spree_credit_cards OWNER TO cosmosloth;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_credit_cards_id_seq OWNER TO cosmosloth;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_credit_cards_id_seq OWNED BY spree_credit_cards.id;


--
-- Name: spree_customer_returns; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_customer_returns (
    id integer NOT NULL,
    number character varying,
    stock_location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_customer_returns OWNER TO cosmosloth;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_customer_returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_customer_returns_id_seq OWNER TO cosmosloth;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_customer_returns_id_seq OWNED BY spree_customer_returns.id;


--
-- Name: spree_gateways; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_gateways (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    environment character varying DEFAULT 'development'::character varying,
    server character varying DEFAULT 'test'::character varying,
    test_mode boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    preferences text
);


ALTER TABLE spree_gateways OWNER TO cosmosloth;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_gateways_id_seq OWNER TO cosmosloth;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_gateways_id_seq OWNED BY spree_gateways.id;


--
-- Name: spree_inventory_units; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_inventory_units (
    id integer NOT NULL,
    state character varying,
    variant_id integer,
    order_id integer,
    shipment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pending boolean DEFAULT true,
    line_item_id integer
);


ALTER TABLE spree_inventory_units OWNER TO cosmosloth;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_inventory_units_id_seq OWNER TO cosmosloth;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_inventory_units_id_seq OWNED BY spree_inventory_units.id;


--
-- Name: spree_line_items; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_line_items (
    id integer NOT NULL,
    variant_id integer,
    order_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying,
    cost_price numeric(10,2),
    tax_category_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL
);


ALTER TABLE spree_line_items OWNER TO cosmosloth;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_line_items_id_seq OWNER TO cosmosloth;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_line_items_id_seq OWNED BY spree_line_items.id;


--
-- Name: spree_log_entries; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_log_entries (
    id integer NOT NULL,
    source_id integer,
    source_type character varying,
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_log_entries OWNER TO cosmosloth;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_log_entries_id_seq OWNER TO cosmosloth;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_log_entries_id_seq OWNED BY spree_log_entries.id;


--
-- Name: spree_option_type_translations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_option_type_translations (
    id integer NOT NULL,
    spree_option_type_id integer,
    locale character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    presentation character varying
);


ALTER TABLE spree_option_type_translations OWNER TO cosmosloth;

--
-- Name: spree_option_type_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_option_type_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_option_type_translations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_option_type_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_option_type_translations_id_seq OWNED BY spree_option_type_translations.id;


--
-- Name: spree_option_types; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_option_types OWNER TO cosmosloth;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_option_types_id_seq OWNER TO cosmosloth;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_option_types_id_seq OWNED BY spree_option_types.id;


--
-- Name: spree_option_types_prototypes; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_option_types_prototypes (
    prototype_id integer,
    option_type_id integer
);


ALTER TABLE spree_option_types_prototypes OWNER TO cosmosloth;

--
-- Name: spree_option_value_translations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_option_value_translations (
    id integer NOT NULL,
    spree_option_value_id integer,
    locale character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    presentation character varying
);


ALTER TABLE spree_option_value_translations OWNER TO cosmosloth;

--
-- Name: spree_option_value_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_option_value_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_option_value_translations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_option_value_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_option_value_translations_id_seq OWNED BY spree_option_value_translations.id;


--
-- Name: spree_option_values; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_option_values (
    id integer NOT NULL,
    "position" integer,
    name character varying,
    presentation character varying,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_option_values OWNER TO cosmosloth;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_option_values_id_seq OWNER TO cosmosloth;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_option_values_id_seq OWNED BY spree_option_values.id;


--
-- Name: spree_option_values_variants; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_option_values_variants (
    variant_id integer,
    option_value_id integer
);


ALTER TABLE spree_option_values_variants OWNER TO cosmosloth;

--
-- Name: spree_orders; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_orders (
    id integer NOT NULL,
    number character varying(32),
    item_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    total numeric(10,2) DEFAULT 0.0 NOT NULL,
    state character varying,
    adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    user_id integer,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(10,2) DEFAULT 0.0,
    shipping_method_id integer,
    shipment_state character varying,
    payment_state character varying,
    email character varying,
    special_instructions text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying,
    last_ip_address character varying,
    created_by_id integer,
    shipment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    channel character varying DEFAULT 'spree'::character varying,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    item_count integer DEFAULT 0,
    approver_id integer,
    approved_at timestamp without time zone,
    confirmation_delivered boolean DEFAULT false,
    considered_risky boolean DEFAULT false,
    guest_token character varying,
    canceled_at timestamp without time zone,
    canceler_id integer,
    store_id integer,
    state_lock_version integer DEFAULT 0 NOT NULL
);


ALTER TABLE spree_orders OWNER TO cosmosloth;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_orders_id_seq OWNER TO cosmosloth;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_orders_id_seq OWNED BY spree_orders.id;


--
-- Name: spree_orders_promotions; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_orders_promotions (
    order_id integer,
    promotion_id integer
);


ALTER TABLE spree_orders_promotions OWNER TO cosmosloth;

--
-- Name: spree_pages; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_pages (
    id integer NOT NULL,
    title character varying,
    body text,
    slug character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    show_in_header boolean DEFAULT false NOT NULL,
    show_in_footer boolean DEFAULT false NOT NULL,
    foreign_link character varying,
    "position" integer DEFAULT 1 NOT NULL,
    visible boolean DEFAULT true,
    meta_keywords character varying,
    meta_description character varying,
    layout character varying,
    show_in_sidebar boolean DEFAULT false NOT NULL,
    meta_title character varying,
    render_layout_as_partial boolean DEFAULT false
);


ALTER TABLE spree_pages OWNER TO cosmosloth;

--
-- Name: spree_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_pages_id_seq OWNER TO cosmosloth;

--
-- Name: spree_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_pages_id_seq OWNED BY spree_pages.id;


--
-- Name: spree_pages_stores; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_pages_stores (
    store_id integer,
    page_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE spree_pages_stores OWNER TO cosmosloth;

--
-- Name: spree_payment_capture_events; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_payment_capture_events (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0,
    payment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_payment_capture_events OWNER TO cosmosloth;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_payment_capture_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_payment_capture_events_id_seq OWNER TO cosmosloth;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_payment_capture_events_id_seq OWNED BY spree_payment_capture_events.id;


--
-- Name: spree_payment_methods; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_payment_methods (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    display_on character varying,
    auto_capture boolean,
    preferences text
);


ALTER TABLE spree_payment_methods OWNER TO cosmosloth;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_payment_methods_id_seq OWNER TO cosmosloth;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_payment_methods_id_seq OWNED BY spree_payment_methods.id;


--
-- Name: spree_payments; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_payments (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    source_id integer,
    source_type character varying,
    payment_method_id integer,
    state character varying,
    response_code character varying,
    avs_response character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying,
    cvv_response_code character varying,
    cvv_response_message character varying
);


ALTER TABLE spree_payments OWNER TO cosmosloth;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_payments_id_seq OWNER TO cosmosloth;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_payments_id_seq OWNED BY spree_payments.id;


--
-- Name: spree_preferences; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_preferences (
    id integer NOT NULL,
    value text,
    key character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_preferences OWNER TO cosmosloth;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_preferences_id_seq OWNER TO cosmosloth;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_preferences_id_seq OWNED BY spree_preferences.id;


--
-- Name: spree_prices; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_prices (
    id integer NOT NULL,
    variant_id integer NOT NULL,
    amount numeric(10,2),
    currency character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_prices OWNER TO cosmosloth;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_prices_id_seq OWNER TO cosmosloth;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_prices_id_seq OWNED BY spree_prices.id;


--
-- Name: spree_product_option_types; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_product_option_types (
    id integer NOT NULL,
    "position" integer,
    product_id integer,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_product_option_types OWNER TO cosmosloth;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_product_option_types_id_seq OWNER TO cosmosloth;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_product_option_types_id_seq OWNED BY spree_product_option_types.id;


--
-- Name: spree_product_properties; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_product_properties (
    id integer NOT NULL,
    value character varying,
    product_id integer,
    property_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
);


ALTER TABLE spree_product_properties OWNER TO cosmosloth;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_product_properties_id_seq OWNER TO cosmosloth;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_product_properties_id_seq OWNED BY spree_product_properties.id;


--
-- Name: spree_product_property_translations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_product_property_translations (
    id integer NOT NULL,
    spree_product_property_id integer,
    locale character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    value character varying
);


ALTER TABLE spree_product_property_translations OWNER TO cosmosloth;

--
-- Name: spree_product_property_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_product_property_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_product_property_translations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_product_property_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_product_property_translations_id_seq OWNED BY spree_product_property_translations.id;


--
-- Name: spree_product_translations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_product_translations (
    id integer NOT NULL,
    spree_product_id integer,
    locale character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    description text,
    meta_description character varying,
    meta_keywords character varying,
    slug character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_product_translations OWNER TO cosmosloth;

--
-- Name: spree_product_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_product_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_product_translations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_product_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_product_translations_id_seq OWNED BY spree_product_translations.id;


--
-- Name: spree_products; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_products (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    available_on timestamp without time zone,
    deleted_at timestamp without time zone,
    slug character varying,
    meta_description text,
    meta_keywords character varying,
    tax_category_id integer,
    shipping_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    promotionable boolean DEFAULT true,
    meta_title character varying
);


ALTER TABLE spree_products OWNER TO cosmosloth;

--
-- Name: spree_products_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_products_id_seq OWNER TO cosmosloth;

--
-- Name: spree_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_products_id_seq OWNED BY spree_products.id;


--
-- Name: spree_products_promotion_rules; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_products_promotion_rules (
    product_id integer,
    promotion_rule_id integer
);


ALTER TABLE spree_products_promotion_rules OWNER TO cosmosloth;

--
-- Name: spree_products_taxons; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_products_taxons (
    product_id integer,
    taxon_id integer,
    id integer NOT NULL,
    "position" integer
);


ALTER TABLE spree_products_taxons OWNER TO cosmosloth;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_products_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_products_taxons_id_seq OWNER TO cosmosloth;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_products_taxons_id_seq OWNED BY spree_products_taxons.id;


--
-- Name: spree_promotion_action_line_items; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_promotion_action_line_items (
    id integer NOT NULL,
    promotion_action_id integer,
    variant_id integer,
    quantity integer DEFAULT 1
);


ALTER TABLE spree_promotion_action_line_items OWNER TO cosmosloth;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_action_line_items_id_seq OWNER TO cosmosloth;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_promotion_action_line_items_id_seq OWNED BY spree_promotion_action_line_items.id;


--
-- Name: spree_promotion_actions; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_promotion_actions (
    id integer NOT NULL,
    promotion_id integer,
    "position" integer,
    type character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_promotion_actions OWNER TO cosmosloth;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_actions_id_seq OWNER TO cosmosloth;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_promotion_actions_id_seq OWNED BY spree_promotion_actions.id;


--
-- Name: spree_promotion_categories; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_promotion_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying
);


ALTER TABLE spree_promotion_categories OWNER TO cosmosloth;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_promotion_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_categories_id_seq OWNER TO cosmosloth;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_promotion_categories_id_seq OWNED BY spree_promotion_categories.id;


--
-- Name: spree_promotion_rules; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_promotion_rules (
    id integer NOT NULL,
    promotion_id integer,
    user_id integer,
    product_group_id integer,
    type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying,
    preferences text
);


ALTER TABLE spree_promotion_rules OWNER TO cosmosloth;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_rules_id_seq OWNER TO cosmosloth;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_promotion_rules_id_seq OWNED BY spree_promotion_rules.id;


--
-- Name: spree_promotion_rules_users; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_promotion_rules_users (
    user_id integer,
    promotion_rule_id integer
);


ALTER TABLE spree_promotion_rules_users OWNER TO cosmosloth;

--
-- Name: spree_promotion_translations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_promotion_translations (
    id integer NOT NULL,
    spree_promotion_id integer,
    locale character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    description character varying
);


ALTER TABLE spree_promotion_translations OWNER TO cosmosloth;

--
-- Name: spree_promotion_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_promotion_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_translations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_promotion_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_promotion_translations_id_seq OWNED BY spree_promotion_translations.id;


--
-- Name: spree_promotions; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_promotions (
    id integer NOT NULL,
    description character varying,
    expires_at timestamp without time zone,
    starts_at timestamp without time zone,
    name character varying,
    type character varying,
    usage_limit integer,
    match_policy character varying DEFAULT 'all'::character varying,
    code character varying,
    advertise boolean DEFAULT false,
    path character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    promotion_category_id integer
);


ALTER TABLE spree_promotions OWNER TO cosmosloth;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotions_id_seq OWNER TO cosmosloth;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_promotions_id_seq OWNED BY spree_promotions.id;


--
-- Name: spree_properties; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_properties (
    id integer NOT NULL,
    name character varying,
    presentation character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_properties OWNER TO cosmosloth;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_properties_id_seq OWNER TO cosmosloth;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_properties_id_seq OWNED BY spree_properties.id;


--
-- Name: spree_properties_prototypes; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_properties_prototypes (
    prototype_id integer,
    property_id integer
);


ALTER TABLE spree_properties_prototypes OWNER TO cosmosloth;

--
-- Name: spree_property_translations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_property_translations (
    id integer NOT NULL,
    spree_property_id integer,
    locale character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    presentation character varying
);


ALTER TABLE spree_property_translations OWNER TO cosmosloth;

--
-- Name: spree_property_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_property_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_property_translations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_property_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_property_translations_id_seq OWNED BY spree_property_translations.id;


--
-- Name: spree_prototypes; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_prototypes (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_prototypes OWNER TO cosmosloth;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_prototypes_id_seq OWNER TO cosmosloth;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_prototypes_id_seq OWNED BY spree_prototypes.id;


--
-- Name: spree_refund_reasons; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_refund_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_refund_reasons OWNER TO cosmosloth;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_refund_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_refund_reasons_id_seq OWNER TO cosmosloth;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_refund_reasons_id_seq OWNED BY spree_refund_reasons.id;


--
-- Name: spree_refunds; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_refunds (
    id integer NOT NULL,
    payment_id integer,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    transaction_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    refund_reason_id integer,
    reimbursement_id integer
);


ALTER TABLE spree_refunds OWNER TO cosmosloth;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_refunds_id_seq OWNER TO cosmosloth;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_refunds_id_seq OWNED BY spree_refunds.id;


--
-- Name: spree_reimbursement_credits; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_reimbursement_credits (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    reimbursement_id integer,
    creditable_id integer,
    creditable_type character varying
);


ALTER TABLE spree_reimbursement_credits OWNER TO cosmosloth;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_reimbursement_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_reimbursement_credits_id_seq OWNER TO cosmosloth;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_reimbursement_credits_id_seq OWNED BY spree_reimbursement_credits.id;


--
-- Name: spree_reimbursement_types; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_reimbursement_types (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying
);


ALTER TABLE spree_reimbursement_types OWNER TO cosmosloth;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_reimbursement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_reimbursement_types_id_seq OWNER TO cosmosloth;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_reimbursement_types_id_seq OWNED BY spree_reimbursement_types.id;


--
-- Name: spree_reimbursements; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_reimbursements (
    id integer NOT NULL,
    number character varying,
    reimbursement_status character varying,
    customer_return_id integer,
    order_id integer,
    total numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_reimbursements OWNER TO cosmosloth;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_reimbursements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_reimbursements_id_seq OWNER TO cosmosloth;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_reimbursements_id_seq OWNED BY spree_reimbursements.id;


--
-- Name: spree_return_authorization_reasons; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_return_authorization_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_return_authorization_reasons OWNER TO cosmosloth;

--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_return_authorization_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_return_authorization_reasons_id_seq OWNER TO cosmosloth;

--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_return_authorization_reasons_id_seq OWNED BY spree_return_authorization_reasons.id;


--
-- Name: spree_return_authorizations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_return_authorizations (
    id integer NOT NULL,
    number character varying,
    state character varying,
    order_id integer,
    memo text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stock_location_id integer,
    return_authorization_reason_id integer
);


ALTER TABLE spree_return_authorizations OWNER TO cosmosloth;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_return_authorizations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_return_authorizations_id_seq OWNED BY spree_return_authorizations.id;


--
-- Name: spree_return_items; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_return_items (
    id integer NOT NULL,
    return_authorization_id integer,
    inventory_unit_id integer,
    exchange_variant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    included_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    reception_status character varying,
    acceptance_status character varying,
    customer_return_id integer,
    reimbursement_id integer,
    exchange_inventory_unit_id integer,
    acceptance_status_errors text,
    preferred_reimbursement_type_id integer,
    override_reimbursement_type_id integer,
    resellable boolean DEFAULT true NOT NULL
);


ALTER TABLE spree_return_items OWNER TO cosmosloth;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_return_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_return_items_id_seq OWNER TO cosmosloth;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_return_items_id_seq OWNED BY spree_return_items.id;


--
-- Name: spree_roles; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_roles (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE spree_roles OWNER TO cosmosloth;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_roles_id_seq OWNER TO cosmosloth;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_roles_id_seq OWNED BY spree_roles.id;


--
-- Name: spree_roles_users; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_roles_users (
    role_id integer,
    user_id integer
);


ALTER TABLE spree_roles_users OWNER TO cosmosloth;

--
-- Name: spree_shipments; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_shipments (
    id integer NOT NULL,
    tracking character varying,
    number character varying,
    cost numeric(10,2) DEFAULT 0.0,
    shipped_at timestamp without time zone,
    order_id integer,
    address_id integer,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stock_location_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL
);


ALTER TABLE spree_shipments OWNER TO cosmosloth;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipments_id_seq OWNER TO cosmosloth;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_shipments_id_seq OWNED BY spree_shipments.id;


--
-- Name: spree_shipping_categories; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_shipping_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_shipping_categories OWNER TO cosmosloth;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipping_categories_id_seq OWNER TO cosmosloth;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_shipping_categories_id_seq OWNED BY spree_shipping_categories.id;


--
-- Name: spree_shipping_method_categories; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_shipping_method_categories (
    id integer NOT NULL,
    shipping_method_id integer NOT NULL,
    shipping_category_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_shipping_method_categories OWNER TO cosmosloth;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_shipping_method_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipping_method_categories_id_seq OWNER TO cosmosloth;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_shipping_method_categories_id_seq OWNED BY spree_shipping_method_categories.id;


--
-- Name: spree_shipping_methods; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_shipping_methods (
    id integer NOT NULL,
    name character varying,
    display_on character varying,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tracking_url character varying,
    admin_name character varying,
    tax_category_id integer,
    code character varying
);


ALTER TABLE spree_shipping_methods OWNER TO cosmosloth;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipping_methods_id_seq OWNER TO cosmosloth;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_shipping_methods_id_seq OWNED BY spree_shipping_methods.id;


--
-- Name: spree_shipping_methods_zones; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_shipping_methods_zones (
    shipping_method_id integer,
    zone_id integer
);


ALTER TABLE spree_shipping_methods_zones OWNER TO cosmosloth;

--
-- Name: spree_shipping_rates; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_shipping_rates (
    id integer NOT NULL,
    shipment_id integer,
    shipping_method_id integer,
    selected boolean DEFAULT false,
    cost numeric(8,2) DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tax_rate_id integer
);


ALTER TABLE spree_shipping_rates OWNER TO cosmosloth;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_shipping_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipping_rates_id_seq OWNER TO cosmosloth;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_shipping_rates_id_seq OWNED BY spree_shipping_rates.id;


--
-- Name: spree_skrill_transactions; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_skrill_transactions (
    id integer NOT NULL,
    email character varying,
    amount double precision,
    currency character varying,
    transaction_id integer,
    customer_id integer,
    payment_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE spree_skrill_transactions OWNER TO cosmosloth;

--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_skrill_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_skrill_transactions_id_seq OWNER TO cosmosloth;

--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_skrill_transactions_id_seq OWNED BY spree_skrill_transactions.id;


--
-- Name: spree_slide_locations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_slide_locations (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE spree_slide_locations OWNER TO cosmosloth;

--
-- Name: spree_slide_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_slide_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_slide_locations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_slide_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_slide_locations_id_seq OWNED BY spree_slide_locations.id;


--
-- Name: spree_slide_slide_locations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_slide_slide_locations (
    id integer NOT NULL,
    slide_id integer,
    slide_location_id integer
);


ALTER TABLE spree_slide_slide_locations OWNER TO cosmosloth;

--
-- Name: spree_slide_slide_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_slide_slide_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_slide_slide_locations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_slide_slide_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_slide_slide_locations_id_seq OWNED BY spree_slide_slide_locations.id;


--
-- Name: spree_slides; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_slides (
    id integer NOT NULL,
    name character varying,
    body text,
    link_url character varying,
    published boolean,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer DEFAULT 0 NOT NULL,
    product_id integer
);


ALTER TABLE spree_slides OWNER TO cosmosloth;

--
-- Name: spree_slides_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_slides_id_seq OWNER TO cosmosloth;

--
-- Name: spree_slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_slides_id_seq OWNED BY spree_slides.id;


--
-- Name: spree_state_changes; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_state_changes (
    id integer NOT NULL,
    name character varying,
    previous_state character varying,
    stateful_id integer,
    user_id integer,
    stateful_type character varying,
    next_state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_state_changes OWNER TO cosmosloth;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_state_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_state_changes_id_seq OWNER TO cosmosloth;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_state_changes_id_seq OWNED BY spree_state_changes.id;


--
-- Name: spree_states; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_states (
    id integer NOT NULL,
    name character varying,
    abbr character varying,
    country_id integer,
    updated_at timestamp without time zone
);


ALTER TABLE spree_states OWNER TO cosmosloth;

--
-- Name: spree_states_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_states_id_seq OWNER TO cosmosloth;

--
-- Name: spree_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_states_id_seq OWNED BY spree_states.id;


--
-- Name: spree_stock_items; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_stock_items (
    id integer NOT NULL,
    stock_location_id integer,
    variant_id integer,
    count_on_hand integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    backorderable boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_stock_items OWNER TO cosmosloth;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_stock_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stock_items_id_seq OWNER TO cosmosloth;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_stock_items_id_seq OWNED BY spree_stock_items.id;


--
-- Name: spree_stock_locations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_stock_locations (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    address1 character varying,
    address2 character varying,
    city character varying,
    state_id integer,
    state_name character varying,
    country_id integer,
    zipcode character varying,
    phone character varying,
    active boolean DEFAULT true,
    backorderable_default boolean DEFAULT false,
    propagate_all_variants boolean DEFAULT true,
    admin_name character varying
);


ALTER TABLE spree_stock_locations OWNER TO cosmosloth;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stock_locations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_stock_locations_id_seq OWNED BY spree_stock_locations.id;


--
-- Name: spree_stock_movements; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_stock_movements (
    id integer NOT NULL,
    stock_item_id integer,
    quantity integer DEFAULT 0,
    action character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    originator_id integer,
    originator_type character varying
);


ALTER TABLE spree_stock_movements OWNER TO cosmosloth;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stock_movements_id_seq OWNER TO cosmosloth;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_stock_movements_id_seq OWNED BY spree_stock_movements.id;


--
-- Name: spree_stock_transfers; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_stock_transfers (
    id integer NOT NULL,
    type character varying,
    reference character varying,
    source_location_id integer,
    destination_location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying
);


ALTER TABLE spree_stock_transfers OWNER TO cosmosloth;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_stock_transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stock_transfers_id_seq OWNER TO cosmosloth;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_stock_transfers_id_seq OWNED BY spree_stock_transfers.id;


--
-- Name: spree_stores; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_stores (
    id integer NOT NULL,
    name character varying,
    url character varying,
    meta_description text,
    meta_keywords text,
    seo_title character varying,
    mail_from_address character varying,
    default_currency character varying,
    code character varying,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_stores OWNER TO cosmosloth;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stores_id_seq OWNER TO cosmosloth;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_stores_id_seq OWNED BY spree_stores.id;


--
-- Name: spree_tax_categories; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_tax_categories (
    id integer NOT NULL,
    name character varying,
    description character varying,
    is_default boolean DEFAULT false,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tax_code character varying
);


ALTER TABLE spree_tax_categories OWNER TO cosmosloth;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_tax_categories_id_seq OWNER TO cosmosloth;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_tax_categories_id_seq OWNED BY spree_tax_categories.id;


--
-- Name: spree_tax_rates; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_tax_rates (
    id integer NOT NULL,
    amount numeric(8,5),
    zone_id integer,
    tax_category_id integer,
    included_in_price boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    show_rate_in_label boolean DEFAULT true,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_tax_rates OWNER TO cosmosloth;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_tax_rates_id_seq OWNER TO cosmosloth;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_tax_rates_id_seq OWNED BY spree_tax_rates.id;


--
-- Name: spree_taxon_translations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_taxon_translations (
    id integer NOT NULL,
    spree_taxon_id integer,
    locale character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    description text,
    meta_title character varying,
    meta_description character varying,
    meta_keywords character varying,
    permalink character varying
);


ALTER TABLE spree_taxon_translations OWNER TO cosmosloth;

--
-- Name: spree_taxon_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_taxon_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_taxon_translations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_taxon_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_taxon_translations_id_seq OWNED BY spree_taxon_translations.id;


--
-- Name: spree_taxonomies; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_taxonomies (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
);


ALTER TABLE spree_taxonomies OWNER TO cosmosloth;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_taxonomies_id_seq OWNER TO cosmosloth;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_taxonomies_id_seq OWNED BY spree_taxonomies.id;


--
-- Name: spree_taxonomy_translations; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_taxonomy_translations (
    id integer NOT NULL,
    spree_taxonomy_id integer,
    locale character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying
);


ALTER TABLE spree_taxonomy_translations OWNER TO cosmosloth;

--
-- Name: spree_taxonomy_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_taxonomy_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_taxonomy_translations_id_seq OWNER TO cosmosloth;

--
-- Name: spree_taxonomy_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_taxonomy_translations_id_seq OWNED BY spree_taxonomy_translations.id;


--
-- Name: spree_taxons; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_taxons (
    id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying,
    permalink character varying,
    taxonomy_id integer,
    lft integer,
    rgt integer,
    icon_file_name character varying,
    icon_content_type character varying,
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    meta_title character varying,
    meta_description character varying,
    meta_keywords character varying,
    depth integer
);


ALTER TABLE spree_taxons OWNER TO cosmosloth;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_taxons_id_seq OWNER TO cosmosloth;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_taxons_id_seq OWNED BY spree_taxons.id;


--
-- Name: spree_taxons_promotion_rules; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_taxons_promotion_rules (
    id integer NOT NULL,
    taxon_id integer,
    promotion_rule_id integer
);


ALTER TABLE spree_taxons_promotion_rules OWNER TO cosmosloth;

--
-- Name: spree_taxons_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_taxons_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_taxons_promotion_rules_id_seq OWNER TO cosmosloth;

--
-- Name: spree_taxons_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_taxons_promotion_rules_id_seq OWNED BY spree_taxons_promotion_rules.id;


--
-- Name: spree_taxons_prototypes; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_taxons_prototypes (
    id integer NOT NULL,
    taxon_id integer,
    prototype_id integer
);


ALTER TABLE spree_taxons_prototypes OWNER TO cosmosloth;

--
-- Name: spree_taxons_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_taxons_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_taxons_prototypes_id_seq OWNER TO cosmosloth;

--
-- Name: spree_taxons_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_taxons_prototypes_id_seq OWNED BY spree_taxons_prototypes.id;


--
-- Name: spree_trackers; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_trackers (
    id integer NOT NULL,
    analytics_id character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_trackers OWNER TO cosmosloth;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_trackers_id_seq OWNER TO cosmosloth;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_trackers_id_seq OWNED BY spree_trackers.id;


--
-- Name: spree_users; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_users (
    id integer NOT NULL,
    encrypted_password character varying(128),
    password_salt character varying(128),
    email character varying,
    remember_token character varying,
    persistence_token character varying,
    reset_password_token character varying,
    perishable_token character varying,
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    login character varying,
    ship_address_id integer,
    bill_address_id integer,
    authentication_token character varying,
    unlock_token character varying,
    locked_at timestamp without time zone,
    reset_password_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    spree_api_key character varying(48),
    remember_created_at timestamp without time zone,
    deleted_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
);


ALTER TABLE spree_users OWNER TO cosmosloth;

--
-- Name: spree_users_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_users_id_seq OWNER TO cosmosloth;

--
-- Name: spree_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_users_id_seq OWNED BY spree_users.id;


--
-- Name: spree_variants; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_variants (
    id integer NOT NULL,
    sku character varying DEFAULT ''::character varying NOT NULL,
    weight numeric(8,2) DEFAULT 0.0,
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    product_id integer,
    cost_price numeric(10,2),
    "position" integer,
    cost_currency character varying,
    track_inventory boolean DEFAULT true,
    tax_category_id integer,
    updated_at timestamp without time zone,
    stock_items_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE spree_variants OWNER TO cosmosloth;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_variants_id_seq OWNER TO cosmosloth;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_variants_id_seq OWNED BY spree_variants.id;


--
-- Name: spree_zone_members; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_zone_members (
    id integer NOT NULL,
    zoneable_id integer,
    zoneable_type character varying,
    zone_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_zone_members OWNER TO cosmosloth;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_zone_members_id_seq OWNER TO cosmosloth;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_zone_members_id_seq OWNED BY spree_zone_members.id;


--
-- Name: spree_zones; Type: TABLE; Schema: public; Owner: cosmosloth
--

CREATE TABLE spree_zones (
    id integer NOT NULL,
    name character varying,
    description character varying,
    default_tax boolean DEFAULT false,
    zone_members_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    kind character varying
);


ALTER TABLE spree_zones OWNER TO cosmosloth;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmosloth
--

CREATE SEQUENCE spree_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_zones_id_seq OWNER TO cosmosloth;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cosmosloth
--

ALTER SEQUENCE spree_zones_id_seq OWNED BY spree_zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_addresses ALTER COLUMN id SET DEFAULT nextval('spree_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_adjustments ALTER COLUMN id SET DEFAULT nextval('spree_adjustments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_assets ALTER COLUMN id SET DEFAULT nextval('spree_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_calculators ALTER COLUMN id SET DEFAULT nextval('spree_calculators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_countries ALTER COLUMN id SET DEFAULT nextval('spree_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_credit_cards ALTER COLUMN id SET DEFAULT nextval('spree_credit_cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_customer_returns ALTER COLUMN id SET DEFAULT nextval('spree_customer_returns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_gateways ALTER COLUMN id SET DEFAULT nextval('spree_gateways_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_inventory_units ALTER COLUMN id SET DEFAULT nextval('spree_inventory_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_line_items ALTER COLUMN id SET DEFAULT nextval('spree_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_log_entries ALTER COLUMN id SET DEFAULT nextval('spree_log_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_option_type_translations ALTER COLUMN id SET DEFAULT nextval('spree_option_type_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_option_types ALTER COLUMN id SET DEFAULT nextval('spree_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_option_value_translations ALTER COLUMN id SET DEFAULT nextval('spree_option_value_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_option_values ALTER COLUMN id SET DEFAULT nextval('spree_option_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_orders ALTER COLUMN id SET DEFAULT nextval('spree_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_pages ALTER COLUMN id SET DEFAULT nextval('spree_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_payment_capture_events ALTER COLUMN id SET DEFAULT nextval('spree_payment_capture_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_payment_methods ALTER COLUMN id SET DEFAULT nextval('spree_payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_payments ALTER COLUMN id SET DEFAULT nextval('spree_payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_preferences ALTER COLUMN id SET DEFAULT nextval('spree_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_prices ALTER COLUMN id SET DEFAULT nextval('spree_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_product_option_types ALTER COLUMN id SET DEFAULT nextval('spree_product_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_product_properties ALTER COLUMN id SET DEFAULT nextval('spree_product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_product_property_translations ALTER COLUMN id SET DEFAULT nextval('spree_product_property_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_product_translations ALTER COLUMN id SET DEFAULT nextval('spree_product_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_products ALTER COLUMN id SET DEFAULT nextval('spree_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_products_taxons ALTER COLUMN id SET DEFAULT nextval('spree_products_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('spree_promotion_action_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_actions ALTER COLUMN id SET DEFAULT nextval('spree_promotion_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_categories ALTER COLUMN id SET DEFAULT nextval('spree_promotion_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_translations ALTER COLUMN id SET DEFAULT nextval('spree_promotion_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotions ALTER COLUMN id SET DEFAULT nextval('spree_promotions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_properties ALTER COLUMN id SET DEFAULT nextval('spree_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_property_translations ALTER COLUMN id SET DEFAULT nextval('spree_property_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_refund_reasons ALTER COLUMN id SET DEFAULT nextval('spree_refund_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_refunds ALTER COLUMN id SET DEFAULT nextval('spree_refunds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_reimbursement_credits ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_credits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_reimbursement_types ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_reimbursements ALTER COLUMN id SET DEFAULT nextval('spree_reimbursements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_return_authorization_reasons ALTER COLUMN id SET DEFAULT nextval('spree_return_authorization_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_return_authorizations ALTER COLUMN id SET DEFAULT nextval('spree_return_authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_return_items ALTER COLUMN id SET DEFAULT nextval('spree_return_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_roles ALTER COLUMN id SET DEFAULT nextval('spree_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipments ALTER COLUMN id SET DEFAULT nextval('spree_shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipping_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipping_method_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_method_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipping_methods ALTER COLUMN id SET DEFAULT nextval('spree_shipping_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipping_rates ALTER COLUMN id SET DEFAULT nextval('spree_shipping_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_skrill_transactions ALTER COLUMN id SET DEFAULT nextval('spree_skrill_transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_slide_locations ALTER COLUMN id SET DEFAULT nextval('spree_slide_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_slide_slide_locations ALTER COLUMN id SET DEFAULT nextval('spree_slide_slide_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_slides ALTER COLUMN id SET DEFAULT nextval('spree_slides_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_state_changes ALTER COLUMN id SET DEFAULT nextval('spree_state_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_states ALTER COLUMN id SET DEFAULT nextval('spree_states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stock_items ALTER COLUMN id SET DEFAULT nextval('spree_stock_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stock_locations ALTER COLUMN id SET DEFAULT nextval('spree_stock_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stock_movements ALTER COLUMN id SET DEFAULT nextval('spree_stock_movements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stock_transfers ALTER COLUMN id SET DEFAULT nextval('spree_stock_transfers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stores ALTER COLUMN id SET DEFAULT nextval('spree_stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_tax_categories ALTER COLUMN id SET DEFAULT nextval('spree_tax_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_tax_rates ALTER COLUMN id SET DEFAULT nextval('spree_tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxon_translations ALTER COLUMN id SET DEFAULT nextval('spree_taxon_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxonomies ALTER COLUMN id SET DEFAULT nextval('spree_taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxonomy_translations ALTER COLUMN id SET DEFAULT nextval('spree_taxonomy_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxons ALTER COLUMN id SET DEFAULT nextval('spree_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxons_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_taxons_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxons_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_taxons_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_trackers ALTER COLUMN id SET DEFAULT nextval('spree_trackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_users ALTER COLUMN id SET DEFAULT nextval('spree_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_variants ALTER COLUMN id SET DEFAULT nextval('spree_variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_zone_members ALTER COLUMN id SET DEFAULT nextval('spree_zone_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_zones ALTER COLUMN id SET DEFAULT nextval('spree_zones_id_seq'::regclass);


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at, deleted_at) FROM stdin;
1	ruby-on-rails-tote	1	Spree::Product	\N	2016-04-23 23:18:22.40246	\N
2	ruby-on-rails-bag	2	Spree::Product	\N	2016-04-23 23:18:22.531891	\N
3	ruby-on-rails-baseball-jersey	3	Spree::Product	\N	2016-04-23 23:18:22.653514	\N
4	ruby-on-rails-jr-spaghetti	4	Spree::Product	\N	2016-04-23 23:18:22.777352	\N
5	ruby-on-rails-ringer-t-shirt	5	Spree::Product	\N	2016-04-23 23:18:22.901052	\N
6	ruby-baseball-jersey	6	Spree::Product	\N	2016-04-23 23:18:23.026946	\N
7	apache-baseball-jersey	7	Spree::Product	\N	2016-04-23 23:18:23.161313	\N
8	spree-baseball-jersey	8	Spree::Product	\N	2016-04-23 23:18:23.282393	\N
9	spree-jr-spaghetti	9	Spree::Product	\N	2016-04-23 23:18:23.403332	\N
10	spree-ringer-t-shirt	10	Spree::Product	\N	2016-04-23 23:18:23.529487	\N
11	spree-tote	11	Spree::Product	\N	2016-04-23 23:18:23.649618	\N
12	spree-bag	12	Spree::Product	\N	2016-04-23 23:18:23.766591	\N
13	ruby-on-rails-mug	13	Spree::Product	\N	2016-04-23 23:18:23.889578	\N
14	ruby-on-rails-stein	14	Spree::Product	\N	2016-04-23 23:18:24.007485	\N
15	spree-stein	15	Spree::Product	\N	2016-04-23 23:18:24.125452	\N
16	spree-mug	16	Spree::Product	\N	2016-04-23 23:18:24.253578	\N
17	spring	17	Spree::Product	\N	2016-04-24 00:06:17.446664	\N
18	comfort-5a	18	Spree::Product	\N	2016-04-25 22:45:42.729803	\N
19	selena	19	Spree::Product	\N	2016-04-27 22:49:13.793925	\N
20	nevada-prada	20	Spree::Product	\N	2016-04-27 22:57:03.346483	\N
\.


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 20, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY schema_migrations (version) FROM stdin;
20160401211858
20160401211859
20160401211860
20160401211861
20160401211862
20160401211863
20160401211864
20160401211865
20160401211866
20160401211867
20160401211868
20160401211869
20160401211870
20160401211871
20160401211872
20160401211873
20160401211874
20160401211875
20160401211876
20160401211877
20160401211878
20160401211879
20160401211880
20160401211881
20160401211882
20160401211883
20160401211884
20160401211885
20160401211886
20160401211887
20160401211888
20160401211889
20160401211890
20160401211891
20160401211892
20160401211893
20160401211894
20160401211895
20160401211896
20160401211897
20160401211898
20160401211899
20160401211900
20160401211901
20160401211902
20160401211903
20160401211904
20160401211905
20160401211906
20160401211907
20160401211908
20160401211909
20160401211910
20160401211911
20160401211912
20160401211913
20160401211914
20160401211915
20160401211916
20160401211917
20160401211918
20160401211919
20160401211920
20160401211921
20160401211922
20160401211923
20160401211924
20160401211925
20160401211926
20160401211927
20160401211928
20160401211929
20160401211930
20160401211931
20160401211932
20160401211933
20160401211934
20160401211935
20160401211936
20160401211937
20160401211938
20160401211939
20160401211940
20160401211941
20160401211942
20160401211943
20160401211944
20160401211945
20160401211946
20160401211947
20160401211948
20160401211949
20160401211950
20160401211951
20160401211952
20160401211953
20160401211954
20160401211955
20160401211956
20160401211957
20160401211958
20160401211959
20160401211960
20160401211961
20160401211962
20160401211963
20160401211964
20160401211965
20160401211966
20160401211967
20160401211968
20160401211969
20160401211970
20160401211971
20160401211972
20160401211973
20160401211974
20160401211975
20160401211976
20160401211977
20160401211978
20160401211979
20160401211980
20160401211981
20160401211982
20160401211983
20160401211984
20160401211985
20160401211986
20160401211987
20160401211988
20160401211989
20160401211990
20160401211991
20160401211992
20160401211993
20160401211994
20160401211995
20160401211996
20160401211997
20160401211998
20160401211999
20160401212000
20160401212001
20160401212002
20160401212003
20160401212004
20160401212005
20160401212006
20160401212007
20160401212008
20160401212009
20160401212010
20160401212011
20160401212012
20160401212013
20160401212014
20160401212015
20160401212016
20160401212017
20160401212018
20160401212019
20160401212020
20160401212021
20160401212022
20160401212023
20160401212024
20160401212025
20160401212026
20160401212027
20160401212028
20160401212029
20160401212030
20160401212031
20160401212032
20160401212033
20160401212034
20160401212035
20160401212036
20160401212037
20160401212038
20160401212039
20160401212040
20160401212041
20160401212042
20160401212043
20160401212044
20160401212045
20160401212046
20160401212047
20160401212048
20160401212049
20160401212050
20160401212051
20160401212052
20160401212053
20160401212054
20160401212055
20160401212056
20160401212057
20160401212058
20160401212059
20160401212060
20160401212061
20160401212062
20160401212063
20160401212064
20160401212065
20160401212066
20160401212067
20160401212068
20160401212069
20160401212070
20160401212071
20160401212072
20160401212073
20160401212074
20160401212075
20160401212076
20160401212077
20160401212078
20160401212079
20160401212080
20160401214423
20160401214424
20160401214425
20160401214426
20160401214427
20160401214428
20160401214429
20160401214430
20160419212844
20160419212845
20160419212846
20160419212847
20160423195428
20160423195429
20160423195430
20160423195431
20160423195432
20160423195433
20160423195434
20160423195435
20160423195436
20160423195437
20160423195438
\.


--
-- Data for Name: spree_addresses; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_addresses (id, firstname, lastname, address1, address2, city, zipcode, phone, state_name, alternative_phone, company, state_id, country_id, created_at, updated_at) FROM stdin;
1	Shayne	Bauch	3998 Beier Burg	Suite 111	East Callie	16804	1-663-279-8912 x996	\N	\N	\N	3561	232	2016-04-23 23:18:45.146472	2016-04-23 23:18:45.146472
2	Jennings	Dooley	413 Vern Light	Apt. 129	Port Ryannshire	16804	296.206.2431 x8035	\N	\N	\N	3561	232	2016-04-23 23:18:45.151846	2016-04-23 23:18:45.151846
\.


--
-- Name: spree_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_addresses_id_seq', 2, true);


--
-- Data for Name: spree_adjustments; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_adjustments (id, source_id, source_type, adjustable_id, adjustable_type, amount, label, mandatory, eligible, created_at, updated_at, state, order_id, included) FROM stdin;
2	1	Spree::TaxRate	1	Spree::LineItem	0.80	North America 5.0%	\N	t	2016-04-23 23:18:45.487844	2016-04-23 23:18:46.005098	open	1	f
5	1	Spree::TaxRate	1	Spree::Order	0.84	Tax	t	t	2016-04-23 23:18:45.847203	2016-04-23 23:18:46.015889	open	1	f
4	1	Spree::TaxRate	2	Spree::LineItem	1.15	North America 5.0%	\N	t	2016-04-23 23:18:45.59895	2016-04-23 23:18:46.311381	open	2	f
6	1	Spree::TaxRate	2	Spree::Order	1.21	Tax	t	t	2016-04-23 23:18:45.885823	2016-04-23 23:18:46.321247	open	2	f
\.


--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_adjustments_id_seq', 6, true);


--
-- Data for Name: spree_assets; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_assets (id, viewable_id, viewable_type, attachment_width, attachment_height, attachment_file_size, "position", attachment_content_type, attachment_file_name, type, attachment_updated_at, alt, created_at, updated_at) FROM stdin;
1	17	Spree::Variant	240	240	44463	1	image/png	ror_baseball_jersey_red.png	Spree::Image	2016-04-23 23:18:30.163957	\N	2016-04-23 23:18:30.446516	2016-04-23 23:18:30.446516
2	17	Spree::Variant	240	240	36895	2	image/png	ror_baseball_jersey_back_red.png	Spree::Image	2016-04-23 23:18:30.490282	\N	2016-04-23 23:18:30.753376	2016-04-23 23:18:30.753376
3	18	Spree::Variant	240	240	46277	1	image/png	ror_baseball_jersey_blue.png	Spree::Image	2016-04-23 23:18:30.808193	\N	2016-04-23 23:18:31.068488	2016-04-23 23:18:31.068488
4	18	Spree::Variant	240	240	38424	2	image/png	ror_baseball_jersey_back_blue.png	Spree::Image	2016-04-23 23:18:31.119927	\N	2016-04-23 23:18:31.378412	2016-04-23 23:18:31.378412
5	19	Spree::Variant	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2016-04-23 23:18:31.432596	\N	2016-04-23 23:18:31.727134	2016-04-23 23:18:31.727134
6	19	Spree::Variant	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2016-04-23 23:18:31.770106	\N	2016-04-23 23:18:32.051425	2016-04-23 23:18:32.051425
7	20	Spree::Variant	240	240	44463	1	image/png	ror_baseball_jersey_red.png	Spree::Image	2016-04-23 23:18:32.10436	\N	2016-04-23 23:18:32.366669	2016-04-23 23:18:32.366669
8	20	Spree::Variant	240	240	36895	2	image/png	ror_baseball_jersey_back_red.png	Spree::Image	2016-04-23 23:18:32.40647	\N	2016-04-23 23:18:32.665669	2016-04-23 23:18:32.665669
9	21	Spree::Variant	240	240	46277	1	image/png	ror_baseball_jersey_blue.png	Spree::Image	2016-04-23 23:18:32.718917	\N	2016-04-23 23:18:32.982348	2016-04-23 23:18:32.982348
10	21	Spree::Variant	240	240	38424	2	image/png	ror_baseball_jersey_back_blue.png	Spree::Image	2016-04-23 23:18:33.023145	\N	2016-04-23 23:18:33.275648	2016-04-23 23:18:33.275648
11	22	Spree::Variant	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2016-04-23 23:18:33.329996	\N	2016-04-23 23:18:33.585605	2016-04-23 23:18:33.585605
12	22	Spree::Variant	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2016-04-23 23:18:33.625633	\N	2016-04-23 23:18:33.887619	2016-04-23 23:18:33.887619
13	23	Spree::Variant	240	240	44463	1	image/png	ror_baseball_jersey_red.png	Spree::Image	2016-04-23 23:18:33.944614	\N	2016-04-23 23:18:34.201238	2016-04-23 23:18:34.201238
14	23	Spree::Variant	240	240	36895	2	image/png	ror_baseball_jersey_back_red.png	Spree::Image	2016-04-23 23:18:34.24065	\N	2016-04-23 23:18:34.499694	2016-04-23 23:18:34.499694
15	24	Spree::Variant	240	240	46277	1	image/png	ror_baseball_jersey_blue.png	Spree::Image	2016-04-23 23:18:34.551693	\N	2016-04-23 23:18:34.807697	2016-04-23 23:18:34.807697
16	24	Spree::Variant	240	240	38424	2	image/png	ror_baseball_jersey_back_blue.png	Spree::Image	2016-04-23 23:18:34.848138	\N	2016-04-23 23:18:35.107838	2016-04-23 23:18:35.107838
17	25	Spree::Variant	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2016-04-23 23:18:35.178944	\N	2016-04-23 23:18:35.429788	2016-04-23 23:18:35.429788
18	25	Spree::Variant	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2016-04-23 23:18:35.469936	\N	2016-04-23 23:18:35.728476	2016-04-23 23:18:35.728476
19	26	Spree::Variant	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2016-04-23 23:18:35.785706	\N	2016-04-23 23:18:36.03866	2016-04-23 23:18:36.03866
20	26	Spree::Variant	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2016-04-23 23:18:36.080934	\N	2016-04-23 23:18:36.34415	2016-04-23 23:18:36.34415
21	1	Spree::Variant	360	360	31490	1	image/jpeg	ror_tote.jpeg	Spree::Image	2016-04-23 23:18:36.388336	\N	2016-04-23 23:18:36.680357	2016-04-23 23:18:36.680357
22	1	Spree::Variant	360	360	28620	2	image/jpeg	ror_tote_back.jpeg	Spree::Image	2016-04-23 23:18:36.721777	\N	2016-04-23 23:18:36.985682	2016-04-23 23:18:36.985682
23	2	Spree::Variant	360	360	28230	1	image/jpeg	ror_bag.jpeg	Spree::Image	2016-04-23 23:18:37.02771	\N	2016-04-23 23:18:37.315533	2016-04-23 23:18:37.315533
24	3	Spree::Variant	360	360	27626	1	image/jpeg	ror_baseball.jpeg	Spree::Image	2016-04-23 23:18:37.359926	\N	2016-04-23 23:18:37.650689	2016-04-23 23:18:37.650689
25	3	Spree::Variant	360	360	23490	2	image/jpeg	ror_baseball_back.jpeg	Spree::Image	2016-04-23 23:18:37.690578	\N	2016-04-23 23:18:37.953899	2016-04-23 23:18:37.953899
26	4	Spree::Variant	360	360	14083	1	image/jpeg	ror_jr_spaghetti.jpeg	Spree::Image	2016-04-23 23:18:37.996299	\N	2016-04-23 23:18:38.275135	2016-04-23 23:18:38.275135
27	13	Spree::Variant	360	360	20026	1	image/jpeg	ror_mug.jpeg	Spree::Image	2016-04-23 23:18:38.318678	\N	2016-04-23 23:18:38.594524	2016-04-23 23:18:38.594524
28	13	Spree::Variant	360	360	10929	2	image/jpeg	ror_mug_back.jpeg	Spree::Image	2016-04-23 23:18:38.634088	\N	2016-04-23 23:18:38.888498	2016-04-23 23:18:38.888498
29	5	Spree::Variant	360	360	18252	1	image/jpeg	ror_ringer.jpeg	Spree::Image	2016-04-23 23:18:38.932564	\N	2016-04-23 23:18:39.201767	2016-04-23 23:18:39.201767
30	5	Spree::Variant	360	360	13276	2	image/jpeg	ror_ringer_back.jpeg	Spree::Image	2016-04-23 23:18:39.244173	\N	2016-04-23 23:18:39.495914	2016-04-23 23:18:39.495914
31	14	Spree::Variant	360	360	20714	1	image/jpeg	ror_stein.jpeg	Spree::Image	2016-04-23 23:18:39.540421	\N	2016-04-23 23:18:39.82156	2016-04-23 23:18:39.82156
32	14	Spree::Variant	360	360	20619	2	image/jpeg	ror_stein_back.jpeg	Spree::Image	2016-04-23 23:18:39.863871	\N	2016-04-23 23:18:40.124565	2016-04-23 23:18:40.124565
33	7	Spree::Variant	504	484	123779	1	image/png	apache_baseball.png	Spree::Image	2016-04-23 23:18:40.167458	\N	2016-04-23 23:18:40.553894	2016-04-23 23:18:40.553894
34	6	Spree::Variant	495	477	138622	1	image/png	ruby_baseball.png	Spree::Image	2016-04-23 23:18:40.599228	\N	2016-04-23 23:18:40.999437	2016-04-23 23:18:40.999437
35	12	Spree::Variant	480	480	38369	1	image/jpeg	spree_bag.jpeg	Spree::Image	2016-04-23 23:18:41.046511	\N	2016-04-23 23:18:41.360607	2016-04-23 23:18:41.360607
36	11	Spree::Variant	480	480	44579	1	image/jpeg	spree_tote_front.jpeg	Spree::Image	2016-04-23 23:18:41.421081	\N	2016-04-23 23:18:41.739876	2016-04-23 23:18:41.739876
37	11	Spree::Variant	480	480	16947	2	image/jpeg	spree_tote_back.jpeg	Spree::Image	2016-04-23 23:18:41.782844	\N	2016-04-23 23:18:42.067839	2016-04-23 23:18:42.067839
38	10	Spree::Variant	480	480	17641	1	image/jpeg	spree_ringer_t.jpeg	Spree::Image	2016-04-23 23:18:42.110208	\N	2016-04-23 23:18:42.416132	2016-04-23 23:18:42.416132
39	10	Spree::Variant	480	480	10514	2	image/jpeg	spree_ringer_t_back.jpeg	Spree::Image	2016-04-23 23:18:42.457195	\N	2016-04-23 23:18:42.734505	2016-04-23 23:18:42.734505
40	9	Spree::Variant	480	480	5898	1	image/jpeg	spree_spaghetti.jpeg	Spree::Image	2016-04-23 23:18:42.778328	\N	2016-04-23 23:18:43.081658	2016-04-23 23:18:43.081658
41	8	Spree::Variant	480	480	18012	1	image/jpeg	spree_jersey.jpeg	Spree::Image	2016-04-23 23:18:43.124126	\N	2016-04-23 23:18:43.471515	2016-04-23 23:18:43.471515
42	8	Spree::Variant	480	480	17868	2	image/jpeg	spree_jersey_back.jpeg	Spree::Image	2016-04-23 23:18:43.514318	\N	2016-04-23 23:18:43.797884	2016-04-23 23:18:43.797884
43	15	Spree::Variant	480	480	12999	1	image/jpeg	spree_stein.jpeg	Spree::Image	2016-04-23 23:18:43.842467	\N	2016-04-23 23:18:44.142811	2016-04-23 23:18:44.142811
44	15	Spree::Variant	480	480	12687	2	image/jpeg	spree_stein_back.jpeg	Spree::Image	2016-04-23 23:18:44.185488	\N	2016-04-23 23:18:44.46444	2016-04-23 23:18:44.46444
45	16	Spree::Variant	240	240	4148	1	image/jpeg	spree_mug.jpeg	Spree::Image	2016-04-23 23:18:44.509483	\N	2016-04-23 23:18:44.749405	2016-04-23 23:18:44.749405
46	16	Spree::Variant	240	240	4428	2	image/jpeg	spree_mug_back.jpeg	Spree::Image	2016-04-23 23:18:44.790932	\N	2016-04-23 23:18:45.006837	2016-04-23 23:18:45.006837
47	71	Spree::Variant	300	300	43338	1	image/jpeg	Flexy_3.jpg	Spree::Image	2016-04-24 00:11:10.93981		2016-04-24 00:11:11.242665	2016-04-24 00:11:11.242665
48	72	Spree::Variant	1417	827	105967	1	image/jpeg	komfort-5a.jpg	Spree::Image	2016-04-25 22:49:34.870204		2016-04-25 22:49:35.535013	2016-04-25 22:49:35.535013
49	76	Spree::Variant	1600	800	78723	1	image/jpeg	selena.jpg	Spree::Image	2016-04-27 22:50:48.87599		2016-04-27 22:50:49.498394	2016-04-27 22:50:49.498394
50	80	Spree::Variant	1600	800	256925	1	image/jpeg	izar.jpg	Spree::Image	2016-04-27 23:05:35.962454		2016-04-27 23:05:36.674953	2016-04-27 23:05:36.674953
\.


--
-- Name: spree_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_assets_id_seq', 50, true);


--
-- Data for Name: spree_calculators; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_calculators (id, type, calculable_id, calculable_type, created_at, updated_at, preferences, deleted_at) FROM stdin;
1	Spree::Calculator::Shipping::FlatRate	1	Spree::ShippingMethod	2016-04-23 23:18:20.307294	2016-04-23 23:18:20.458998	---\n:amount: 5\n:currency: USD\n	\N
4	Spree::Calculator::Shipping::FlatRate	4	Spree::ShippingMethod	2016-04-23 23:18:20.329035	2016-04-23 23:18:20.47235	---\n:amount: 5\n:currency: USD\n	\N
3	Spree::Calculator::Shipping::FlatRate	3	Spree::ShippingMethod	2016-04-23 23:18:20.319511	2016-04-23 23:18:20.483285	---\n:amount: 15\n:currency: USD\n	\N
2	Spree::Calculator::Shipping::FlatRate	2	Spree::ShippingMethod	2016-04-23 23:18:20.31381	2016-04-23 23:18:20.494258	---\n:amount: 10\n:currency: USD\n	\N
5	Spree::Calculator::Shipping::FlatRate	5	Spree::ShippingMethod	2016-04-23 23:18:20.333727	2016-04-23 23:18:20.504881	---\n:amount: 8\n:currency: EUR\n	\N
6	Spree::Calculator::DefaultTax	1	Spree::TaxRate	2016-04-23 23:18:22.170565	2016-04-23 23:18:22.176901	\N	\N
\.


--
-- Name: spree_calculators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_calculators_id_seq', 6, true);


--
-- Data for Name: spree_countries; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_countries (id, iso_name, iso, iso3, name, numcode, states_required, updated_at) FROM stdin;
1	ANDORRA	AD	AND	Andorra	20	t	\N
2	UNITED ARAB EMIRATES	AE	ARE	United Arab Emirates	784	t	\N
3	AFGHANISTAN	AF	AFG	Afghanistan	4	t	\N
4	ANTIGUA AND BARBUDA	AG	ATG	Antigua and Barbuda	28	t	\N
5	ANGUILLA	AI	AIA	Anguilla	660	f	\N
6	ALBANIA	AL	ALB	Albania	8	t	\N
7	ARMENIA	AM	ARM	Armenia	51	t	\N
8	ANGOLA	AO	AGO	Angola	24	t	\N
9	ANTARCTICA	AQ	ATA	Antarctica	10	f	\N
10	ARGENTINA	AR	ARG	Argentina	32	t	\N
11	AMERICAN SAMOA	AS	ASM	American Samoa	16	f	\N
12	AUSTRIA	AT	AUT	Austria	40	t	\N
13	AUSTRALIA	AU	AUS	Australia	36	t	\N
14	ARUBA	AW	ABW	Aruba	533	f	\N
15	ÅLAND ISLANDS	AX	ALA	Åland Islands	248	f	\N
16	AZERBAIJAN	AZ	AZE	Azerbaijan	31	t	\N
17	BOSNIA AND HERZEGOVINA	BA	BIH	Bosnia and Herzegovina	70	t	\N
18	BARBADOS	BB	BRB	Barbados	52	t	\N
19	BANGLADESH	BD	BGD	Bangladesh	50	t	\N
20	BELGIUM	BE	BEL	Belgium	56	t	\N
21	BURKINA FASO	BF	BFA	Burkina Faso	854	t	\N
22	BULGARIA	BG	BGR	Bulgaria	100	t	\N
23	BAHRAIN	BH	BHR	Bahrain	48	t	\N
24	BURUNDI	BI	BDI	Burundi	108	t	\N
25	BENIN	BJ	BEN	Benin	204	t	\N
26	SAINT BARTHéLEMY	BL	BLM	Saint Barthélemy	652	f	\N
27	BERMUDA	BM	BMU	Bermuda	60	f	\N
28	BRUNEI DARUSSALAM	BN	BRN	Brunei Darussalam	96	t	\N
29	BOLIVIA, PLURINATIONAL STATE OF	BO	BOL	Bolivia, Plurinational State of	68	t	\N
30	BONAIRE, SINT EUSTATIUS AND SABA	BQ	BES	Bonaire, Sint Eustatius and Saba	535	t	\N
31	BRAZIL	BR	BRA	Brazil	76	t	\N
32	BAHAMAS	BS	BHS	Bahamas	44	t	\N
33	BHUTAN	BT	BTN	Bhutan	64	t	\N
34	BOUVET ISLAND	BV	BVT	Bouvet Island	74	f	\N
35	BOTSWANA	BW	BWA	Botswana	72	t	\N
36	BELARUS	BY	BLR	Belarus	112	t	\N
37	BELIZE	BZ	BLZ	Belize	84	t	\N
38	CANADA	CA	CAN	Canada	124	t	\N
39	COCOS (KEELING) ISLANDS	CC	CCK	Cocos (Keeling) Islands	166	f	\N
40	CONGO, THE DEMOCRATIC REPUBLIC OF THE	CD	COD	Congo, The Democratic Republic of the	180	t	\N
41	CENTRAL AFRICAN REPUBLIC	CF	CAF	Central African Republic	140	t	\N
42	CONGO	CG	COG	Congo	178	t	\N
43	SWITZERLAND	CH	CHE	Switzerland	756	t	\N
44	CôTE D'IVOIRE	CI	CIV	Côte d'Ivoire	384	t	\N
45	COOK ISLANDS	CK	COK	Cook Islands	184	f	\N
46	CHILE	CL	CHL	Chile	152	t	\N
47	CAMEROON	CM	CMR	Cameroon	120	t	\N
48	CHINA	CN	CHN	China	156	t	\N
49	COLOMBIA	CO	COL	Colombia	170	t	\N
50	COSTA RICA	CR	CRI	Costa Rica	188	t	\N
51	CUBA	CU	CUB	Cuba	192	t	\N
52	CAPE VERDE	CV	CPV	Cape Verde	132	t	\N
53	CURAçAO	CW	CUW	Curaçao	531	f	\N
54	CHRISTMAS ISLAND	CX	CXR	Christmas Island	162	f	\N
55	CYPRUS	CY	CYP	Cyprus	196	t	\N
56	CZECH REPUBLIC	CZ	CZE	Czech Republic	203	t	\N
57	GERMANY	DE	DEU	Germany	276	t	\N
58	DJIBOUTI	DJ	DJI	Djibouti	262	t	\N
59	DENMARK	DK	DNK	Denmark	208	t	\N
60	DOMINICA	DM	DMA	Dominica	212	t	\N
61	DOMINICAN REPUBLIC	DO	DOM	Dominican Republic	214	t	\N
62	ALGERIA	DZ	DZA	Algeria	12	t	\N
63	ECUADOR	EC	ECU	Ecuador	218	t	\N
64	ESTONIA	EE	EST	Estonia	233	t	\N
65	EGYPT	EG	EGY	Egypt	818	t	\N
66	WESTERN SAHARA	EH	ESH	Western Sahara	732	f	\N
67	ERITREA	ER	ERI	Eritrea	232	t	\N
68	SPAIN	ES	ESP	Spain	724	t	\N
69	ETHIOPIA	ET	ETH	Ethiopia	231	t	\N
70	FINLAND	FI	FIN	Finland	246	t	\N
71	FIJI	FJ	FJI	Fiji	242	t	\N
72	FALKLAND ISLANDS (MALVINAS)	FK	FLK	Falkland Islands (Malvinas)	238	f	\N
73	MICRONESIA, FEDERATED STATES OF	FM	FSM	Micronesia, Federated States of	583	t	\N
74	FAROE ISLANDS	FO	FRO	Faroe Islands	234	f	\N
75	FRANCE	FR	FRA	France	250	t	\N
76	GABON	GA	GAB	Gabon	266	t	\N
77	UNITED KINGDOM	GB	GBR	United Kingdom	826	t	\N
78	GRENADA	GD	GRD	Grenada	308	t	\N
79	GEORGIA	GE	GEO	Georgia	268	t	\N
80	FRENCH GUIANA	GF	GUF	French Guiana	254	f	\N
81	GUERNSEY	GG	GGY	Guernsey	831	f	\N
82	GHANA	GH	GHA	Ghana	288	t	\N
83	GIBRALTAR	GI	GIB	Gibraltar	292	f	\N
84	GREENLAND	GL	GRL	Greenland	304	t	\N
85	GAMBIA	GM	GMB	Gambia	270	t	\N
86	GUINEA	GN	GIN	Guinea	324	t	\N
87	GUADELOUPE	GP	GLP	Guadeloupe	312	f	\N
88	EQUATORIAL GUINEA	GQ	GNQ	Equatorial Guinea	226	t	\N
89	GREECE	GR	GRC	Greece	300	t	\N
90	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	GS	SGS	South Georgia and the South Sandwich Islands	239	f	\N
91	GUATEMALA	GT	GTM	Guatemala	320	t	\N
92	GUAM	GU	GUM	Guam	316	f	\N
93	GUINEA-BISSAU	GW	GNB	Guinea-Bissau	624	t	\N
94	GUYANA	GY	GUY	Guyana	328	t	\N
95	HONG KONG	HK	HKG	Hong Kong	344	f	\N
96	HEARD ISLAND AND MCDONALD ISLANDS	HM	HMD	Heard Island and McDonald Islands	334	f	\N
97	HONDURAS	HN	HND	Honduras	340	t	\N
98	CROATIA	HR	HRV	Croatia	191	t	\N
99	HAITI	HT	HTI	Haiti	332	t	\N
100	HUNGARY	HU	HUN	Hungary	348	t	\N
101	INDONESIA	ID	IDN	Indonesia	360	t	\N
102	IRELAND	IE	IRL	Ireland	372	t	\N
103	ISRAEL	IL	ISR	Israel	376	t	\N
104	ISLE OF MAN	IM	IMN	Isle of Man	833	f	\N
105	INDIA	IN	IND	India	356	t	\N
106	BRITISH INDIAN OCEAN TERRITORY	IO	IOT	British Indian Ocean Territory	86	f	\N
107	IRAQ	IQ	IRQ	Iraq	368	t	\N
108	IRAN, ISLAMIC REPUBLIC OF	IR	IRN	Iran, Islamic Republic of	364	t	\N
109	ICELAND	IS	ISL	Iceland	352	t	\N
110	ITALY	IT	ITA	Italy	380	t	\N
111	JERSEY	JE	JEY	Jersey	832	f	\N
112	JAMAICA	JM	JAM	Jamaica	388	t	\N
113	JORDAN	JO	JOR	Jordan	400	t	\N
114	JAPAN	JP	JPN	Japan	392	t	\N
115	KENYA	KE	KEN	Kenya	404	t	\N
116	KYRGYZSTAN	KG	KGZ	Kyrgyzstan	417	t	\N
117	CAMBODIA	KH	KHM	Cambodia	116	t	\N
118	KIRIBATI	KI	KIR	Kiribati	296	t	\N
119	COMOROS	KM	COM	Comoros	174	t	\N
120	SAINT KITTS AND NEVIS	KN	KNA	Saint Kitts and Nevis	659	t	\N
121	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	KP	PRK	Korea, Democratic People's Republic of	408	t	\N
122	KOREA, REPUBLIC OF	KR	KOR	Korea, Republic of	410	t	\N
123	KUWAIT	KW	KWT	Kuwait	414	t	\N
124	CAYMAN ISLANDS	KY	CYM	Cayman Islands	136	f	\N
125	KAZAKHSTAN	KZ	KAZ	Kazakhstan	398	t	\N
126	LAO PEOPLE'S DEMOCRATIC REPUBLIC	LA	LAO	Lao People's Democratic Republic	418	t	\N
127	LEBANON	LB	LBN	Lebanon	422	t	\N
128	SAINT LUCIA	LC	LCA	Saint Lucia	662	f	\N
129	LIECHTENSTEIN	LI	LIE	Liechtenstein	438	t	\N
130	SRI LANKA	LK	LKA	Sri Lanka	144	t	\N
131	LIBERIA	LR	LBR	Liberia	430	t	\N
132	LESOTHO	LS	LSO	Lesotho	426	t	\N
133	LITHUANIA	LT	LTU	Lithuania	440	t	\N
134	LUXEMBOURG	LU	LUX	Luxembourg	442	t	\N
135	LATVIA	LV	LVA	Latvia	428	t	\N
136	LIBYA	LY	LBY	Libya	434	t	\N
137	MOROCCO	MA	MAR	Morocco	504	t	\N
138	MONACO	MC	MCO	Monaco	492	t	\N
139	MOLDOVA, REPUBLIC OF	MD	MDA	Moldova, Republic of	498	t	\N
140	MONTENEGRO	ME	MNE	Montenegro	499	t	\N
141	SAINT MARTIN (FRENCH PART)	MF	MAF	Saint Martin (French part)	663	f	\N
142	MADAGASCAR	MG	MDG	Madagascar	450	t	\N
143	MARSHALL ISLANDS	MH	MHL	Marshall Islands	584	t	\N
144	MACEDONIA, REPUBLIC OF	MK	MKD	Macedonia, Republic of	807	t	\N
145	MALI	ML	MLI	Mali	466	t	\N
146	MYANMAR	MM	MMR	Myanmar	104	t	\N
147	MONGOLIA	MN	MNG	Mongolia	496	t	\N
148	MACAO	MO	MAC	Macao	446	f	\N
149	NORTHERN MARIANA ISLANDS	MP	MNP	Northern Mariana Islands	580	f	\N
150	MARTINIQUE	MQ	MTQ	Martinique	474	f	\N
151	MAURITANIA	MR	MRT	Mauritania	478	t	\N
152	MONTSERRAT	MS	MSR	Montserrat	500	f	\N
153	MALTA	MT	MLT	Malta	470	t	\N
154	MAURITIUS	MU	MUS	Mauritius	480	t	\N
155	MALDIVES	MV	MDV	Maldives	462	t	\N
156	MALAWI	MW	MWI	Malawi	454	t	\N
157	MEXICO	MX	MEX	Mexico	484	t	\N
158	MALAYSIA	MY	MYS	Malaysia	458	t	\N
159	MOZAMBIQUE	MZ	MOZ	Mozambique	508	t	\N
160	NAMIBIA	NA	NAM	Namibia	516	t	\N
161	NEW CALEDONIA	NC	NCL	New Caledonia	540	f	\N
162	NIGER	NE	NER	Niger	562	t	\N
163	NORFOLK ISLAND	NF	NFK	Norfolk Island	574	f	\N
164	NIGERIA	NG	NGA	Nigeria	566	t	\N
165	NICARAGUA	NI	NIC	Nicaragua	558	t	\N
166	NETHERLANDS	NL	NLD	Netherlands	528	t	\N
167	NORWAY	NO	NOR	Norway	578	t	\N
168	NEPAL	NP	NPL	Nepal	524	t	\N
169	NAURU	NR	NRU	Nauru	520	t	\N
170	NIUE	NU	NIU	Niue	570	f	\N
171	NEW ZEALAND	NZ	NZL	New Zealand	554	t	\N
172	OMAN	OM	OMN	Oman	512	t	\N
173	PANAMA	PA	PAN	Panama	591	t	\N
174	PERU	PE	PER	Peru	604	t	\N
175	FRENCH POLYNESIA	PF	PYF	French Polynesia	258	f	\N
176	PAPUA NEW GUINEA	PG	PNG	Papua New Guinea	598	t	\N
177	PHILIPPINES	PH	PHL	Philippines	608	t	\N
178	PAKISTAN	PK	PAK	Pakistan	586	t	\N
179	POLAND	PL	POL	Poland	616	t	\N
180	SAINT PIERRE AND MIQUELON	PM	SPM	Saint Pierre and Miquelon	666	f	\N
181	PITCAIRN	PN	PCN	Pitcairn	612	f	\N
182	PALESTINE, STATE OF	PS	PSE	Palestine, State of	275	t	\N
183	PORTUGAL	PT	PRT	Portugal	620	t	\N
184	PALAU	PW	PLW	Palau	585	t	\N
185	PARAGUAY	PY	PRY	Paraguay	600	t	\N
186	QATAR	QA	QAT	Qatar	634	t	\N
187	RéUNION	RE	REU	Réunion	638	f	\N
188	ROMANIA	RO	ROU	Romania	642	t	\N
189	SERBIA	RS	SRB	Serbia	688	t	\N
190	RUSSIAN FEDERATION	RU	RUS	Russian Federation	643	t	\N
191	RWANDA	RW	RWA	Rwanda	646	t	\N
192	SAUDI ARABIA	SA	SAU	Saudi Arabia	682	t	\N
193	SOLOMON ISLANDS	SB	SLB	Solomon Islands	90	t	\N
194	SEYCHELLES	SC	SYC	Seychelles	690	t	\N
195	SUDAN	SD	SDN	Sudan	729	t	\N
196	SWEDEN	SE	SWE	Sweden	752	t	\N
197	SINGAPORE	SG	SGP	Singapore	534	t	\N
198	SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA	SH	SHN	Saint Helena, Ascension and Tristan da Cunha	654	t	\N
199	SLOVENIA	SI	SVN	Slovenia	705	t	\N
200	SVALBARD AND JAN MAYEN	SJ	SJM	Svalbard and Jan Mayen	744	f	\N
201	SLOVAKIA	SK	SVK	Slovakia	703	t	\N
202	SIERRA LEONE	SL	SLE	Sierra Leone	694	t	\N
203	SAN MARINO	SM	SMR	San Marino	674	t	\N
204	SENEGAL	SN	SEN	Senegal	686	t	\N
205	SOMALIA	SO	SOM	Somalia	706	t	\N
206	SURINAME	SR	SUR	Suriname	740	t	\N
207	SOUTH SUDAN	SS	SSD	South Sudan	728	t	\N
208	SAO TOME AND PRINCIPE	ST	STP	Sao Tome and Principe	678	t	\N
209	EL SALVADOR	SV	SLV	El Salvador	222	t	\N
210	SINT MAARTEN (DUTCH PART)	SX	SXM	Sint Maarten (Dutch part)	534	f	\N
211	SYRIAN ARAB REPUBLIC	SY	SYR	Syrian Arab Republic	760	t	\N
212	SWAZILAND	SZ	SWZ	Swaziland	748	t	\N
213	TURKS AND CAICOS ISLANDS	TC	TCA	Turks and Caicos Islands	796	f	\N
214	CHAD	TD	TCD	Chad	148	t	\N
215	FRENCH SOUTHERN TERRITORIES	TF	ATF	French Southern Territories	260	f	\N
216	TOGO	TG	TGO	Togo	768	t	\N
217	THAILAND	TH	THA	Thailand	764	t	\N
218	TAJIKISTAN	TJ	TJK	Tajikistan	762	t	\N
219	TOKELAU	TK	TKL	Tokelau	772	f	\N
220	TIMOR-LESTE	TL	TLS	Timor-Leste	626	t	\N
221	TURKMENISTAN	TM	TKM	Turkmenistan	795	t	\N
222	TUNISIA	TN	TUN	Tunisia	788	t	\N
223	TONGA	TO	TON	Tonga	776	t	\N
224	TURKEY	TR	TUR	Turkey	792	t	\N
225	TRINIDAD AND TOBAGO	TT	TTO	Trinidad and Tobago	780	t	\N
226	TUVALU	TV	TUV	Tuvalu	798	t	\N
227	TAIWAN	TW	TWN	Taiwan	158	t	\N
228	TANZANIA, UNITED REPUBLIC OF	TZ	TZA	Tanzania, United Republic of	834	t	\N
229	UKRAINE	UA	UKR	Ukraine	804	t	\N
230	UGANDA	UG	UGA	Uganda	800	t	\N
231	UNITED STATES MINOR OUTLYING ISLANDS	UM	UMI	United States Minor Outlying Islands	581	t	\N
232	UNITED STATES	US	USA	United States	840	t	\N
233	URUGUAY	UY	URY	Uruguay	858	t	\N
234	UZBEKISTAN	UZ	UZB	Uzbekistan	860	t	\N
235	HOLY SEE (VATICAN CITY STATE)	VA	VAT	Holy See (Vatican City State)	336	f	\N
236	SAINT VINCENT AND THE GRENADINES	VC	VCT	Saint Vincent and the Grenadines	670	t	\N
237	VENEZUELA, BOLIVARIAN REPUBLIC OF	VE	VEN	Venezuela, Bolivarian Republic of	862	t	\N
238	VIRGIN ISLANDS, BRITISH	VG	VGB	Virgin Islands, British	92	f	\N
239	VIRGIN ISLANDS, U.S.	VI	VIR	Virgin Islands, U.S.	850	f	\N
240	VIETNAM	VN	VNM	Vietnam	704	t	\N
241	VANUATU	VU	VUT	Vanuatu	548	t	\N
242	WALLIS AND FUTUNA	WF	WLF	Wallis and Futuna	876	f	\N
243	SAMOA	WS	WSM	Samoa	882	t	\N
244	YEMEN	YE	YEM	Yemen	887	t	\N
245	MAYOTTE	YT	MYT	Mayotte	175	f	\N
246	SOUTH AFRICA	ZA	ZAF	South Africa	710	t	\N
247	ZAMBIA	ZM	ZMB	Zambia	894	t	\N
248	ZIMBABWE	ZW	ZWE	Zimbabwe	716	t	\N
249	ANDORRA	AD	AND	Andorra	20	t	\N
250	UNITED ARAB EMIRATES	AE	ARE	United Arab Emirates	784	t	\N
251	AFGHANISTAN	AF	AFG	Afghanistan	4	t	\N
252	ANTIGUA AND BARBUDA	AG	ATG	Antigua and Barbuda	28	t	\N
253	ANGUILLA	AI	AIA	Anguilla	660	f	\N
254	ALBANIA	AL	ALB	Albania	8	t	\N
255	ARMENIA	AM	ARM	Armenia	51	t	\N
256	ANGOLA	AO	AGO	Angola	24	t	\N
257	ANTARCTICA	AQ	ATA	Antarctica	10	f	\N
258	ARGENTINA	AR	ARG	Argentina	32	t	\N
259	AMERICAN SAMOA	AS	ASM	American Samoa	16	f	\N
260	AUSTRIA	AT	AUT	Austria	40	t	\N
261	AUSTRALIA	AU	AUS	Australia	36	t	\N
262	ARUBA	AW	ABW	Aruba	533	f	\N
263	ÅLAND ISLANDS	AX	ALA	Åland Islands	248	f	\N
264	AZERBAIJAN	AZ	AZE	Azerbaijan	31	t	\N
265	BOSNIA AND HERZEGOVINA	BA	BIH	Bosnia and Herzegovina	70	t	\N
266	BARBADOS	BB	BRB	Barbados	52	t	\N
267	BANGLADESH	BD	BGD	Bangladesh	50	t	\N
268	BELGIUM	BE	BEL	Belgium	56	t	\N
269	BURKINA FASO	BF	BFA	Burkina Faso	854	t	\N
270	BULGARIA	BG	BGR	Bulgaria	100	t	\N
271	BAHRAIN	BH	BHR	Bahrain	48	t	\N
272	BURUNDI	BI	BDI	Burundi	108	t	\N
273	BENIN	BJ	BEN	Benin	204	t	\N
274	SAINT BARTHéLEMY	BL	BLM	Saint Barthélemy	652	f	\N
275	BERMUDA	BM	BMU	Bermuda	60	f	\N
276	BRUNEI DARUSSALAM	BN	BRN	Brunei Darussalam	96	t	\N
277	BOLIVIA, PLURINATIONAL STATE OF	BO	BOL	Bolivia, Plurinational State of	68	t	\N
278	BONAIRE, SINT EUSTATIUS AND SABA	BQ	BES	Bonaire, Sint Eustatius and Saba	535	t	\N
279	BRAZIL	BR	BRA	Brazil	76	t	\N
280	BAHAMAS	BS	BHS	Bahamas	44	t	\N
281	BHUTAN	BT	BTN	Bhutan	64	t	\N
282	BOUVET ISLAND	BV	BVT	Bouvet Island	74	f	\N
283	BOTSWANA	BW	BWA	Botswana	72	t	\N
284	BELARUS	BY	BLR	Belarus	112	t	\N
285	BELIZE	BZ	BLZ	Belize	84	t	\N
286	CANADA	CA	CAN	Canada	124	t	\N
287	COCOS (KEELING) ISLANDS	CC	CCK	Cocos (Keeling) Islands	166	f	\N
288	CONGO, THE DEMOCRATIC REPUBLIC OF THE	CD	COD	Congo, The Democratic Republic of the	180	t	\N
289	CENTRAL AFRICAN REPUBLIC	CF	CAF	Central African Republic	140	t	\N
290	CONGO	CG	COG	Congo	178	t	\N
291	SWITZERLAND	CH	CHE	Switzerland	756	t	\N
292	CôTE D'IVOIRE	CI	CIV	Côte d'Ivoire	384	t	\N
293	COOK ISLANDS	CK	COK	Cook Islands	184	f	\N
294	CHILE	CL	CHL	Chile	152	t	\N
295	CAMEROON	CM	CMR	Cameroon	120	t	\N
296	CHINA	CN	CHN	China	156	t	\N
297	COLOMBIA	CO	COL	Colombia	170	t	\N
298	COSTA RICA	CR	CRI	Costa Rica	188	t	\N
299	CUBA	CU	CUB	Cuba	192	t	\N
300	CAPE VERDE	CV	CPV	Cape Verde	132	t	\N
301	CURAçAO	CW	CUW	Curaçao	531	f	\N
302	CHRISTMAS ISLAND	CX	CXR	Christmas Island	162	f	\N
303	CYPRUS	CY	CYP	Cyprus	196	t	\N
304	CZECH REPUBLIC	CZ	CZE	Czech Republic	203	t	\N
305	GERMANY	DE	DEU	Germany	276	t	\N
306	DJIBOUTI	DJ	DJI	Djibouti	262	t	\N
307	DENMARK	DK	DNK	Denmark	208	t	\N
308	DOMINICA	DM	DMA	Dominica	212	t	\N
309	DOMINICAN REPUBLIC	DO	DOM	Dominican Republic	214	t	\N
310	ALGERIA	DZ	DZA	Algeria	12	t	\N
311	ECUADOR	EC	ECU	Ecuador	218	t	\N
312	ESTONIA	EE	EST	Estonia	233	t	\N
313	EGYPT	EG	EGY	Egypt	818	t	\N
314	WESTERN SAHARA	EH	ESH	Western Sahara	732	f	\N
315	ERITREA	ER	ERI	Eritrea	232	t	\N
316	SPAIN	ES	ESP	Spain	724	t	\N
317	ETHIOPIA	ET	ETH	Ethiopia	231	t	\N
318	FINLAND	FI	FIN	Finland	246	t	\N
319	FIJI	FJ	FJI	Fiji	242	t	\N
320	FALKLAND ISLANDS (MALVINAS)	FK	FLK	Falkland Islands (Malvinas)	238	f	\N
321	MICRONESIA, FEDERATED STATES OF	FM	FSM	Micronesia, Federated States of	583	t	\N
322	FAROE ISLANDS	FO	FRO	Faroe Islands	234	f	\N
323	FRANCE	FR	FRA	France	250	t	\N
324	GABON	GA	GAB	Gabon	266	t	\N
325	UNITED KINGDOM	GB	GBR	United Kingdom	826	t	\N
326	GRENADA	GD	GRD	Grenada	308	t	\N
327	GEORGIA	GE	GEO	Georgia	268	t	\N
328	FRENCH GUIANA	GF	GUF	French Guiana	254	f	\N
329	GUERNSEY	GG	GGY	Guernsey	831	f	\N
330	GHANA	GH	GHA	Ghana	288	t	\N
331	GIBRALTAR	GI	GIB	Gibraltar	292	f	\N
332	GREENLAND	GL	GRL	Greenland	304	t	\N
333	GAMBIA	GM	GMB	Gambia	270	t	\N
334	GUINEA	GN	GIN	Guinea	324	t	\N
335	GUADELOUPE	GP	GLP	Guadeloupe	312	f	\N
336	EQUATORIAL GUINEA	GQ	GNQ	Equatorial Guinea	226	t	\N
337	GREECE	GR	GRC	Greece	300	t	\N
338	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	GS	SGS	South Georgia and the South Sandwich Islands	239	f	\N
339	GUATEMALA	GT	GTM	Guatemala	320	t	\N
340	GUAM	GU	GUM	Guam	316	f	\N
341	GUINEA-BISSAU	GW	GNB	Guinea-Bissau	624	t	\N
342	GUYANA	GY	GUY	Guyana	328	t	\N
343	HONG KONG	HK	HKG	Hong Kong	344	f	\N
344	HEARD ISLAND AND MCDONALD ISLANDS	HM	HMD	Heard Island and McDonald Islands	334	f	\N
345	HONDURAS	HN	HND	Honduras	340	t	\N
346	CROATIA	HR	HRV	Croatia	191	t	\N
347	HAITI	HT	HTI	Haiti	332	t	\N
348	HUNGARY	HU	HUN	Hungary	348	t	\N
349	INDONESIA	ID	IDN	Indonesia	360	t	\N
350	IRELAND	IE	IRL	Ireland	372	t	\N
351	ISRAEL	IL	ISR	Israel	376	t	\N
352	ISLE OF MAN	IM	IMN	Isle of Man	833	f	\N
353	INDIA	IN	IND	India	356	t	\N
354	BRITISH INDIAN OCEAN TERRITORY	IO	IOT	British Indian Ocean Territory	86	f	\N
355	IRAQ	IQ	IRQ	Iraq	368	t	\N
356	IRAN, ISLAMIC REPUBLIC OF	IR	IRN	Iran, Islamic Republic of	364	t	\N
357	ICELAND	IS	ISL	Iceland	352	t	\N
358	ITALY	IT	ITA	Italy	380	t	\N
359	JERSEY	JE	JEY	Jersey	832	f	\N
360	JAMAICA	JM	JAM	Jamaica	388	t	\N
361	JORDAN	JO	JOR	Jordan	400	t	\N
362	JAPAN	JP	JPN	Japan	392	t	\N
363	KENYA	KE	KEN	Kenya	404	t	\N
364	KYRGYZSTAN	KG	KGZ	Kyrgyzstan	417	t	\N
365	CAMBODIA	KH	KHM	Cambodia	116	t	\N
366	KIRIBATI	KI	KIR	Kiribati	296	t	\N
367	COMOROS	KM	COM	Comoros	174	t	\N
368	SAINT KITTS AND NEVIS	KN	KNA	Saint Kitts and Nevis	659	t	\N
369	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	KP	PRK	Korea, Democratic People's Republic of	408	t	\N
370	KOREA, REPUBLIC OF	KR	KOR	Korea, Republic of	410	t	\N
371	KUWAIT	KW	KWT	Kuwait	414	t	\N
372	CAYMAN ISLANDS	KY	CYM	Cayman Islands	136	f	\N
373	KAZAKHSTAN	KZ	KAZ	Kazakhstan	398	t	\N
374	LAO PEOPLE'S DEMOCRATIC REPUBLIC	LA	LAO	Lao People's Democratic Republic	418	t	\N
375	LEBANON	LB	LBN	Lebanon	422	t	\N
376	SAINT LUCIA	LC	LCA	Saint Lucia	662	f	\N
377	LIECHTENSTEIN	LI	LIE	Liechtenstein	438	t	\N
378	SRI LANKA	LK	LKA	Sri Lanka	144	t	\N
379	LIBERIA	LR	LBR	Liberia	430	t	\N
380	LESOTHO	LS	LSO	Lesotho	426	t	\N
381	LITHUANIA	LT	LTU	Lithuania	440	t	\N
382	LUXEMBOURG	LU	LUX	Luxembourg	442	t	\N
383	LATVIA	LV	LVA	Latvia	428	t	\N
384	LIBYA	LY	LBY	Libya	434	t	\N
385	MOROCCO	MA	MAR	Morocco	504	t	\N
386	MONACO	MC	MCO	Monaco	492	t	\N
387	MOLDOVA, REPUBLIC OF	MD	MDA	Moldova, Republic of	498	t	\N
388	MONTENEGRO	ME	MNE	Montenegro	499	t	\N
389	SAINT MARTIN (FRENCH PART)	MF	MAF	Saint Martin (French part)	663	f	\N
390	MADAGASCAR	MG	MDG	Madagascar	450	t	\N
391	MARSHALL ISLANDS	MH	MHL	Marshall Islands	584	t	\N
392	MACEDONIA, REPUBLIC OF	MK	MKD	Macedonia, Republic of	807	t	\N
393	MALI	ML	MLI	Mali	466	t	\N
394	MYANMAR	MM	MMR	Myanmar	104	t	\N
395	MONGOLIA	MN	MNG	Mongolia	496	t	\N
396	MACAO	MO	MAC	Macao	446	f	\N
397	NORTHERN MARIANA ISLANDS	MP	MNP	Northern Mariana Islands	580	f	\N
398	MARTINIQUE	MQ	MTQ	Martinique	474	f	\N
399	MAURITANIA	MR	MRT	Mauritania	478	t	\N
400	MONTSERRAT	MS	MSR	Montserrat	500	f	\N
401	MALTA	MT	MLT	Malta	470	t	\N
402	MAURITIUS	MU	MUS	Mauritius	480	t	\N
403	MALDIVES	MV	MDV	Maldives	462	t	\N
404	MALAWI	MW	MWI	Malawi	454	t	\N
405	MEXICO	MX	MEX	Mexico	484	t	\N
406	MALAYSIA	MY	MYS	Malaysia	458	t	\N
407	MOZAMBIQUE	MZ	MOZ	Mozambique	508	t	\N
408	NAMIBIA	NA	NAM	Namibia	516	t	\N
409	NEW CALEDONIA	NC	NCL	New Caledonia	540	f	\N
410	NIGER	NE	NER	Niger	562	t	\N
411	NORFOLK ISLAND	NF	NFK	Norfolk Island	574	f	\N
412	NIGERIA	NG	NGA	Nigeria	566	t	\N
413	NICARAGUA	NI	NIC	Nicaragua	558	t	\N
414	NETHERLANDS	NL	NLD	Netherlands	528	t	\N
415	NORWAY	NO	NOR	Norway	578	t	\N
416	NEPAL	NP	NPL	Nepal	524	t	\N
417	NAURU	NR	NRU	Nauru	520	t	\N
418	NIUE	NU	NIU	Niue	570	f	\N
419	NEW ZEALAND	NZ	NZL	New Zealand	554	t	\N
420	OMAN	OM	OMN	Oman	512	t	\N
421	PANAMA	PA	PAN	Panama	591	t	\N
422	PERU	PE	PER	Peru	604	t	\N
423	FRENCH POLYNESIA	PF	PYF	French Polynesia	258	f	\N
424	PAPUA NEW GUINEA	PG	PNG	Papua New Guinea	598	t	\N
425	PHILIPPINES	PH	PHL	Philippines	608	t	\N
426	PAKISTAN	PK	PAK	Pakistan	586	t	\N
427	POLAND	PL	POL	Poland	616	t	\N
428	SAINT PIERRE AND MIQUELON	PM	SPM	Saint Pierre and Miquelon	666	f	\N
429	PITCAIRN	PN	PCN	Pitcairn	612	f	\N
430	PALESTINE, STATE OF	PS	PSE	Palestine, State of	275	t	\N
431	PORTUGAL	PT	PRT	Portugal	620	t	\N
432	PALAU	PW	PLW	Palau	585	t	\N
433	PARAGUAY	PY	PRY	Paraguay	600	t	\N
434	QATAR	QA	QAT	Qatar	634	t	\N
435	RéUNION	RE	REU	Réunion	638	f	\N
436	ROMANIA	RO	ROU	Romania	642	t	\N
437	SERBIA	RS	SRB	Serbia	688	t	\N
438	RUSSIAN FEDERATION	RU	RUS	Russian Federation	643	t	\N
439	RWANDA	RW	RWA	Rwanda	646	t	\N
440	SAUDI ARABIA	SA	SAU	Saudi Arabia	682	t	\N
441	SOLOMON ISLANDS	SB	SLB	Solomon Islands	90	t	\N
442	SEYCHELLES	SC	SYC	Seychelles	690	t	\N
443	SUDAN	SD	SDN	Sudan	729	t	\N
444	SWEDEN	SE	SWE	Sweden	752	t	\N
445	SINGAPORE	SG	SGP	Singapore	534	t	\N
446	SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA	SH	SHN	Saint Helena, Ascension and Tristan da Cunha	654	t	\N
447	SLOVENIA	SI	SVN	Slovenia	705	t	\N
448	SVALBARD AND JAN MAYEN	SJ	SJM	Svalbard and Jan Mayen	744	f	\N
449	SLOVAKIA	SK	SVK	Slovakia	703	t	\N
450	SIERRA LEONE	SL	SLE	Sierra Leone	694	t	\N
451	SAN MARINO	SM	SMR	San Marino	674	t	\N
452	SENEGAL	SN	SEN	Senegal	686	t	\N
453	SOMALIA	SO	SOM	Somalia	706	t	\N
454	SURINAME	SR	SUR	Suriname	740	t	\N
455	SOUTH SUDAN	SS	SSD	South Sudan	728	t	\N
456	SAO TOME AND PRINCIPE	ST	STP	Sao Tome and Principe	678	t	\N
457	EL SALVADOR	SV	SLV	El Salvador	222	t	\N
458	SINT MAARTEN (DUTCH PART)	SX	SXM	Sint Maarten (Dutch part)	534	f	\N
459	SYRIAN ARAB REPUBLIC	SY	SYR	Syrian Arab Republic	760	t	\N
460	SWAZILAND	SZ	SWZ	Swaziland	748	t	\N
461	TURKS AND CAICOS ISLANDS	TC	TCA	Turks and Caicos Islands	796	f	\N
462	CHAD	TD	TCD	Chad	148	t	\N
463	FRENCH SOUTHERN TERRITORIES	TF	ATF	French Southern Territories	260	f	\N
464	TOGO	TG	TGO	Togo	768	t	\N
465	THAILAND	TH	THA	Thailand	764	t	\N
466	TAJIKISTAN	TJ	TJK	Tajikistan	762	t	\N
467	TOKELAU	TK	TKL	Tokelau	772	f	\N
468	TIMOR-LESTE	TL	TLS	Timor-Leste	626	t	\N
469	TURKMENISTAN	TM	TKM	Turkmenistan	795	t	\N
470	TUNISIA	TN	TUN	Tunisia	788	t	\N
471	TONGA	TO	TON	Tonga	776	t	\N
472	TURKEY	TR	TUR	Turkey	792	t	\N
473	TRINIDAD AND TOBAGO	TT	TTO	Trinidad and Tobago	780	t	\N
474	TUVALU	TV	TUV	Tuvalu	798	t	\N
475	TAIWAN	TW	TWN	Taiwan	158	t	\N
476	TANZANIA, UNITED REPUBLIC OF	TZ	TZA	Tanzania, United Republic of	834	t	\N
477	UKRAINE	UA	UKR	Ukraine	804	t	\N
478	UGANDA	UG	UGA	Uganda	800	t	\N
479	UNITED STATES MINOR OUTLYING ISLANDS	UM	UMI	United States Minor Outlying Islands	581	t	\N
480	UNITED STATES	US	USA	United States	840	t	\N
481	URUGUAY	UY	URY	Uruguay	858	t	\N
482	UZBEKISTAN	UZ	UZB	Uzbekistan	860	t	\N
483	HOLY SEE (VATICAN CITY STATE)	VA	VAT	Holy See (Vatican City State)	336	f	\N
484	SAINT VINCENT AND THE GRENADINES	VC	VCT	Saint Vincent and the Grenadines	670	t	\N
485	VENEZUELA, BOLIVARIAN REPUBLIC OF	VE	VEN	Venezuela, Bolivarian Republic of	862	t	\N
486	VIRGIN ISLANDS, BRITISH	VG	VGB	Virgin Islands, British	92	f	\N
487	VIRGIN ISLANDS, U.S.	VI	VIR	Virgin Islands, U.S.	850	f	\N
488	VIETNAM	VN	VNM	Vietnam	704	t	\N
489	VANUATU	VU	VUT	Vanuatu	548	t	\N
490	WALLIS AND FUTUNA	WF	WLF	Wallis and Futuna	876	f	\N
491	SAMOA	WS	WSM	Samoa	882	t	\N
492	YEMEN	YE	YEM	Yemen	887	t	\N
493	MAYOTTE	YT	MYT	Mayotte	175	f	\N
494	SOUTH AFRICA	ZA	ZAF	South Africa	710	t	\N
495	ZAMBIA	ZM	ZMB	Zambia	894	t	\N
496	ZIMBABWE	ZW	ZWE	Zimbabwe	716	t	\N
\.


--
-- Name: spree_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_countries_id_seq', 496, true);


--
-- Data for Name: spree_credit_cards; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_credit_cards (id, month, year, cc_type, last_digits, address_id, gateway_customer_profile_id, gateway_payment_profile_id, created_at, updated_at, name, user_id, payment_method_id, "default") FROM stdin;
1	12	2018	visa	1111	\N	BGS-1234	\N	2016-04-23 23:18:45.941684	2016-04-23 23:18:45.941684	Sean Schofield	\N	\N	f
\.


--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_credit_cards_id_seq', 1, true);


--
-- Data for Name: spree_customer_returns; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_customer_returns (id, number, stock_location_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_customer_returns_id_seq', 1, false);


--
-- Data for Name: spree_gateways; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_gateways (id, type, name, description, active, environment, server, test_mode, created_at, updated_at, preferences) FROM stdin;
\.


--
-- Name: spree_gateways_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_gateways_id_seq', 1, false);


--
-- Data for Name: spree_inventory_units; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_inventory_units (id, state, variant_id, order_id, shipment_id, created_at, updated_at, pending, line_item_id) FROM stdin;
1	on_hand	1	1	1	2016-04-23 23:18:45.739347	2016-04-23 23:18:45.739347	t	1
2	on_hand	2	2	2	2016-04-23 23:18:45.808232	2016-04-23 23:18:45.808232	t	2
\.


--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_inventory_units_id_seq', 2, true);


--
-- Data for Name: spree_line_items; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_line_items (id, variant_id, order_id, quantity, price, created_at, updated_at, currency, cost_price, tax_category_id, adjustment_total, additional_tax_total, promo_total, included_tax_total, pre_tax_amount) FROM stdin;
1	1	1	1	15.99	2016-04-23 23:18:45.322706	2016-04-23 23:18:45.983403	USD	17.00	1	0.80	0.80	0.00	0.00	15.9900
2	2	2	1	22.99	2016-04-23 23:18:45.518078	2016-04-23 23:18:46.300826	USD	21.00	1	1.15	1.15	0.00	0.00	22.9900
\.


--
-- Name: spree_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_line_items_id_seq', 2, true);


--
-- Data for Name: spree_log_entries; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_log_entries (id, source_id, source_type, details, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_log_entries_id_seq', 1, false);


--
-- Data for Name: spree_option_type_translations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_option_type_translations (id, spree_option_type_id, locale, created_at, updated_at, name, presentation) FROM stdin;
1	1	ru	2016-04-23 23:18:25.702812	2016-04-23 23:18:25.702812	tshirt-size	Size
2	2	ru	2016-04-23 23:18:25.715273	2016-04-23 23:18:25.715273	tshirt-color	Color
3	3	ru	2016-04-23 23:57:42.847496	2016-04-23 23:57:42.849904	Размеры для матрасов	Размер
4	4	ru	2016-04-23 23:57:43.841375	2016-04-23 23:57:43.843375	Размеры для наматрасников	Размер
5	5	ru	2016-04-23 23:57:44.126064	2016-04-23 23:57:44.128166	Размеры для оснований	Размер
\.


--
-- Name: spree_option_type_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_option_type_translations_id_seq', 5, true);


--
-- Data for Name: spree_option_types; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_option_types (id, name, presentation, "position", created_at, updated_at) FROM stdin;
1	\N	\N	1	2016-04-23 23:18:25.696569	2016-04-23 23:18:25.847885
2	\N	\N	2	2016-04-23 23:18:25.712192	2016-04-23 23:18:25.894496
3	\N	\N	3	2016-04-23 23:57:42.844761	2016-04-23 23:57:43.648075
4	\N	\N	4	2016-04-23 23:57:43.839185	2016-04-23 23:57:44.044853
5	\N	\N	5	2016-04-23 23:57:44.123774	2016-04-23 23:57:44.511679
\.


--
-- Name: spree_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_option_types_id_seq', 5, true);


--
-- Data for Name: spree_option_types_prototypes; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_option_types_prototypes (prototype_id, option_type_id) FROM stdin;
4	3
8	4
9	5
\.


--
-- Data for Name: spree_option_value_translations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_option_value_translations (id, spree_option_value_id, locale, created_at, updated_at, name, presentation) FROM stdin;
1	1	ru	2016-04-23 23:18:25.767452	2016-04-23 23:18:25.767452	Small	S
2	2	ru	2016-04-23 23:18:25.811454	2016-04-23 23:18:25.811454	Medium	M
3	3	ru	2016-04-23 23:18:25.831334	2016-04-23 23:18:25.831334	Large	L
4	4	ru	2016-04-23 23:18:25.845909	2016-04-23 23:18:25.845909	Extra Large	XL
5	5	ru	2016-04-23 23:18:25.8621	2016-04-23 23:18:25.8621	Red	Red
6	6	ru	2016-04-23 23:18:25.878795	2016-04-23 23:18:25.878795	Green	Green
7	7	ru	2016-04-23 23:18:25.893135	2016-04-23 23:18:25.893135	Blue	Blue
8	8	ru	2016-04-23 23:57:42.873084	2016-04-23 23:57:42.875392	70x186	70x186
9	9	ru	2016-04-23 23:57:42.908847	2016-04-23 23:57:42.910487	70x190	70x190
10	10	ru	2016-04-23 23:57:42.927422	2016-04-23 23:57:42.929958	70x195	70x195
11	11	ru	2016-04-23 23:57:42.946029	2016-04-23 23:57:42.947919	70x200	70x200
12	12	ru	2016-04-23 23:57:42.963402	2016-04-23 23:57:42.965169	80x186	80x186
13	13	ru	2016-04-23 23:57:42.980881	2016-04-23 23:57:42.982774	80x190	80x190
14	14	ru	2016-04-23 23:57:42.999089	2016-04-23 23:57:43.001039	80x195	80x195
15	15	ru	2016-04-23 23:57:43.015949	2016-04-23 23:57:43.017782	80x200	80x200
16	16	ru	2016-04-23 23:57:43.03259	2016-04-23 23:57:43.034352	90x186	90x186
17	17	ru	2016-04-23 23:57:43.049268	2016-04-23 23:57:43.050951	90x190	90x190
18	18	ru	2016-04-23 23:57:43.066165	2016-04-23 23:57:43.068236	90x195	90x195
19	19	ru	2016-04-23 23:57:43.083371	2016-04-23 23:57:43.085114	90x200	90x200
20	20	ru	2016-04-23 23:57:43.100378	2016-04-23 23:57:43.102504	110x186	110x186
21	21	ru	2016-04-23 23:57:43.117713	2016-04-23 23:57:43.11943	110x190	110x190
22	22	ru	2016-04-23 23:57:43.134765	2016-04-23 23:57:43.136639	110x195	110x195
23	23	ru	2016-04-23 23:57:43.151659	2016-04-23 23:57:43.153272	110x200	110x200
24	24	ru	2016-04-23 23:57:43.168277	2016-04-23 23:57:43.169981	120x186	120x186
25	25	ru	2016-04-23 23:57:43.186506	2016-04-23 23:57:43.18822	120x190	120x190
26	26	ru	2016-04-23 23:57:43.203692	2016-04-23 23:57:43.205431	120x195	120x195
27	27	ru	2016-04-23 23:57:43.221533	2016-04-23 23:57:43.22356	120x200	120x200
28	28	ru	2016-04-23 23:57:43.238951	2016-04-23 23:57:43.240599	130x186	130x186
29	29	ru	2016-04-23 23:57:43.256161	2016-04-23 23:57:43.258023	130x190	130x190
30	30	ru	2016-04-23 23:57:43.272852	2016-04-23 23:57:43.274536	130x195	130x195
31	31	ru	2016-04-23 23:57:43.290402	2016-04-23 23:57:43.29216	130x200	130x200
32	32	ru	2016-04-23 23:57:43.308631	2016-04-23 23:57:43.310675	140x186	140x186
33	33	ru	2016-04-23 23:57:43.326057	2016-04-23 23:57:43.32777	140x190	140x190
34	34	ru	2016-04-23 23:57:43.342569	2016-04-23 23:57:43.34436	140x195	140x195
35	35	ru	2016-04-23 23:57:43.359756	2016-04-23 23:57:43.361563	140x200	140x200
36	36	ru	2016-04-23 23:57:43.376548	2016-04-23 23:57:43.378378	150x186	150x186
37	37	ru	2016-04-23 23:57:43.393181	2016-04-23 23:57:43.394983	150x190	150x190
38	38	ru	2016-04-23 23:57:43.410473	2016-04-23 23:57:43.412336	150x195	150x195
39	39	ru	2016-04-23 23:57:43.427003	2016-04-23 23:57:43.429073	150x200	150x200
40	40	ru	2016-04-23 23:57:43.444765	2016-04-23 23:57:43.446583	160x186	160x186
41	41	ru	2016-04-23 23:57:43.462017	2016-04-23 23:57:43.463769	160x190	160x190
42	42	ru	2016-04-23 23:57:43.479053	2016-04-23 23:57:43.480672	160x195	160x195
43	43	ru	2016-04-23 23:57:43.496363	2016-04-23 23:57:43.497996	160x200	160x200
44	44	ru	2016-04-23 23:57:43.512739	2016-04-23 23:57:43.51471	170x186	170x186
45	45	ru	2016-04-23 23:57:43.530171	2016-04-23 23:57:43.531933	170x190	170x190
46	46	ru	2016-04-23 23:57:43.547865	2016-04-23 23:57:43.549564	170x195	170x195
47	47	ru	2016-04-23 23:57:43.56471	2016-04-23 23:57:43.56648	170x200	170x200
48	48	ru	2016-04-23 23:57:43.582019	2016-04-23 23:57:43.58407	180x186	180x186
49	49	ru	2016-04-23 23:57:43.600499	2016-04-23 23:57:43.602281	180x190	180x190
50	50	ru	2016-04-23 23:57:43.626514	2016-04-23 23:57:43.628316	180x195	180x195
51	51	ru	2016-04-23 23:57:43.643554	2016-04-23 23:57:43.64546	180x200	180x200
52	52	ru	2016-04-23 23:57:43.851666	2016-04-23 23:57:43.853428	80x200	80x200
53	53	ru	2016-04-23 23:57:43.86828	2016-04-23 23:57:43.870237	90x200	90x200
54	54	ru	2016-04-23 23:57:43.885354	2016-04-23 23:57:43.887028	100x200	100x200
55	55	ru	2016-04-23 23:57:43.901749	2016-04-23 23:57:43.903394	110x200	110x200
56	56	ru	2016-04-23 23:57:43.918181	2016-04-23 23:57:43.919858	130x200	130x200
57	57	ru	2016-04-23 23:57:43.936911	2016-04-23 23:57:43.938671	140x200	140x200
58	58	ru	2016-04-23 23:57:43.953811	2016-04-23 23:57:43.955511	150x200	150x200
59	59	ru	2016-04-23 23:57:43.970339	2016-04-23 23:57:43.971943	160x200	160x200
60	60	ru	2016-04-23 23:57:43.98679	2016-04-23 23:57:43.988491	170x200	170x200
61	61	ru	2016-04-23 23:57:44.003469	2016-04-23 23:57:44.005888	180x200	180x200
62	62	ru	2016-04-23 23:57:44.023944	2016-04-23 23:57:44.025592	190x200	190x200
63	63	ru	2016-04-23 23:57:44.04052	2016-04-23 23:57:44.042202	200x200	200x200
64	64	ru	2016-04-23 23:57:44.136648	2016-04-23 23:57:44.138472	80x190	80x190
65	65	ru	2016-04-23 23:57:44.153404	2016-04-23 23:57:44.155291	80x195	80x195
66	66	ru	2016-04-23 23:57:44.169686	2016-04-23 23:57:44.17142	80x200	80x200
67	67	ru	2016-04-23 23:57:44.186346	2016-04-23 23:57:44.188013	90x190	90x190
68	68	ru	2016-04-23 23:57:44.203017	2016-04-23 23:57:44.20474	90x195	90x195
69	69	ru	2016-04-23 23:57:44.219734	2016-04-23 23:57:44.221443	90x200	90x200
70	70	ru	2016-04-23 23:57:44.236211	2016-04-23 23:57:44.237965	100x190	100x190
71	71	ru	2016-04-23 23:57:44.25291	2016-04-23 23:57:44.254891	100x195	100x195
72	72	ru	2016-04-23 23:57:44.270412	2016-04-23 23:57:44.272256	100x200	100x200
73	73	ru	2016-04-23 23:57:44.287498	2016-04-23 23:57:44.289346	120x190	120x190
74	74	ru	2016-04-23 23:57:44.303976	2016-04-23 23:57:44.305668	120x195	120x195
75	75	ru	2016-04-23 23:57:44.320952	2016-04-23 23:57:44.322681	140x190	140x190
76	76	ru	2016-04-23 23:57:44.337255	2016-04-23 23:57:44.338869	140x195	140x195
77	77	ru	2016-04-23 23:57:44.354159	2016-04-23 23:57:44.355799	140x200	140x200
78	78	ru	2016-04-23 23:57:44.370848	2016-04-23 23:57:44.372548	160x190	160x190
79	79	ru	2016-04-23 23:57:44.38762	2016-04-23 23:57:44.389391	160x195	160x195
80	80	ru	2016-04-23 23:57:44.405537	2016-04-23 23:57:44.407277	160x200	160x200
81	81	ru	2016-04-23 23:57:44.42223	2016-04-23 23:57:44.423973	180x190	180x190
82	82	ru	2016-04-23 23:57:44.438583	2016-04-23 23:57:44.440495	180x195	180x195
83	83	ru	2016-04-23 23:57:44.457129	2016-04-23 23:57:44.458928	180x200	180x200
84	84	ru	2016-04-23 23:57:44.473697	2016-04-23 23:57:44.475533	200x190	200x190
85	85	ru	2016-04-23 23:57:44.490538	2016-04-23 23:57:44.492285	200x195	200x195
86	86	ru	2016-04-23 23:57:44.507172	2016-04-23 23:57:44.50895	200x200	200x200
\.


--
-- Name: spree_option_value_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_option_value_translations_id_seq', 86, true);


--
-- Data for Name: spree_option_values; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_option_values (id, "position", name, presentation, option_type_id, created_at, updated_at) FROM stdin;
1	1	\N	\N	1	2016-04-23 23:18:25.753342	2016-04-23 23:18:25.753342
2	2	\N	\N	1	2016-04-23 23:18:25.804738	2016-04-23 23:18:25.804738
3	3	\N	\N	1	2016-04-23 23:18:25.827918	2016-04-23 23:18:25.827918
4	4	\N	\N	1	2016-04-23 23:18:25.842469	2016-04-23 23:18:25.842469
5	1	\N	\N	2	2016-04-23 23:18:25.858853	2016-04-23 23:18:25.858853
6	2	\N	\N	2	2016-04-23 23:18:25.875699	2016-04-23 23:18:25.875699
7	3	\N	\N	2	2016-04-23 23:18:25.89001	2016-04-23 23:18:25.89001
8	1	\N	\N	3	2016-04-23 23:57:42.870126	2016-04-23 23:57:42.870126
9	2	\N	\N	3	2016-04-23 23:57:42.906366	2016-04-23 23:57:42.906366
10	3	\N	\N	3	2016-04-23 23:57:42.92374	2016-04-23 23:57:42.92374
11	4	\N	\N	3	2016-04-23 23:57:42.943557	2016-04-23 23:57:42.943557
12	5	\N	\N	3	2016-04-23 23:57:42.961011	2016-04-23 23:57:42.961011
13	6	\N	\N	3	2016-04-23 23:57:42.978504	2016-04-23 23:57:42.978504
14	7	\N	\N	3	2016-04-23 23:57:42.996866	2016-04-23 23:57:42.996866
15	8	\N	\N	3	2016-04-23 23:57:43.013479	2016-04-23 23:57:43.013479
16	9	\N	\N	3	2016-04-23 23:57:43.030343	2016-04-23 23:57:43.030343
17	10	\N	\N	3	2016-04-23 23:57:43.04694	2016-04-23 23:57:43.04694
18	11	\N	\N	3	2016-04-23 23:57:43.063629	2016-04-23 23:57:43.063629
19	12	\N	\N	3	2016-04-23 23:57:43.081099	2016-04-23 23:57:43.081099
20	13	\N	\N	3	2016-04-23 23:57:43.097786	2016-04-23 23:57:43.097786
21	14	\N	\N	3	2016-04-23 23:57:43.115251	2016-04-23 23:57:43.115251
22	15	\N	\N	3	2016-04-23 23:57:43.132244	2016-04-23 23:57:43.132244
23	16	\N	\N	3	2016-04-23 23:57:43.148951	2016-04-23 23:57:43.148951
24	17	\N	\N	3	2016-04-23 23:57:43.165782	2016-04-23 23:57:43.165782
25	18	\N	\N	3	2016-04-23 23:57:43.183915	2016-04-23 23:57:43.183915
26	19	\N	\N	3	2016-04-23 23:57:43.201314	2016-04-23 23:57:43.201314
27	20	\N	\N	3	2016-04-23 23:57:43.21904	2016-04-23 23:57:43.21904
28	21	\N	\N	3	2016-04-23 23:57:43.236541	2016-04-23 23:57:43.236541
29	22	\N	\N	3	2016-04-23 23:57:43.253541	2016-04-23 23:57:43.253541
30	23	\N	\N	3	2016-04-23 23:57:43.270303	2016-04-23 23:57:43.270303
31	24	\N	\N	3	2016-04-23 23:57:43.288039	2016-04-23 23:57:43.288039
32	25	\N	\N	3	2016-04-23 23:57:43.306196	2016-04-23 23:57:43.306196
33	26	\N	\N	3	2016-04-23 23:57:43.323643	2016-04-23 23:57:43.323643
34	27	\N	\N	3	2016-04-23 23:57:43.340248	2016-04-23 23:57:43.340248
35	28	\N	\N	3	2016-04-23 23:57:43.357183	2016-04-23 23:57:43.357183
36	29	\N	\N	3	2016-04-23 23:57:43.374344	2016-04-23 23:57:43.374344
37	30	\N	\N	3	2016-04-23 23:57:43.390626	2016-04-23 23:57:43.390626
38	31	\N	\N	3	2016-04-23 23:57:43.408274	2016-04-23 23:57:43.408274
39	32	\N	\N	3	2016-04-23 23:57:43.424784	2016-04-23 23:57:43.424784
40	33	\N	\N	3	2016-04-23 23:57:43.442448	2016-04-23 23:57:43.442448
41	34	\N	\N	3	2016-04-23 23:57:43.45945	2016-04-23 23:57:43.45945
42	35	\N	\N	3	2016-04-23 23:57:43.476643	2016-04-23 23:57:43.476643
43	36	\N	\N	3	2016-04-23 23:57:43.494028	2016-04-23 23:57:43.494028
44	37	\N	\N	3	2016-04-23 23:57:43.510273	2016-04-23 23:57:43.510273
45	38	\N	\N	3	2016-04-23 23:57:43.527728	2016-04-23 23:57:43.527728
46	39	\N	\N	3	2016-04-23 23:57:43.545207	2016-04-23 23:57:43.545207
47	40	\N	\N	3	2016-04-23 23:57:43.562272	2016-04-23 23:57:43.562272
48	41	\N	\N	3	2016-04-23 23:57:43.579467	2016-04-23 23:57:43.579467
49	42	\N	\N	3	2016-04-23 23:57:43.597448	2016-04-23 23:57:43.597448
50	43	\N	\N	3	2016-04-23 23:57:43.624066	2016-04-23 23:57:43.624066
51	44	\N	\N	3	2016-04-23 23:57:43.641121	2016-04-23 23:57:43.641121
52	1	\N	\N	4	2016-04-23 23:57:43.849576	2016-04-23 23:57:43.849576
53	2	\N	\N	4	2016-04-23 23:57:43.866032	2016-04-23 23:57:43.866032
54	3	\N	\N	4	2016-04-23 23:57:43.882999	2016-04-23 23:57:43.882999
55	4	\N	\N	4	2016-04-23 23:57:43.899139	2016-04-23 23:57:43.899139
56	5	\N	\N	4	2016-04-23 23:57:43.915744	2016-04-23 23:57:43.915744
57	6	\N	\N	4	2016-04-23 23:57:43.934421	2016-04-23 23:57:43.934421
58	7	\N	\N	4	2016-04-23 23:57:43.951488	2016-04-23 23:57:43.951488
59	8	\N	\N	4	2016-04-23 23:57:43.967907	2016-04-23 23:57:43.967907
60	9	\N	\N	4	2016-04-23 23:57:43.984348	2016-04-23 23:57:43.984348
61	10	\N	\N	4	2016-04-23 23:57:44.00081	2016-04-23 23:57:44.00081
62	11	\N	\N	4	2016-04-23 23:57:44.021699	2016-04-23 23:57:44.021699
63	12	\N	\N	4	2016-04-23 23:57:44.038179	2016-04-23 23:57:44.038179
64	1	\N	\N	5	2016-04-23 23:57:44.134588	2016-04-23 23:57:44.134588
65	2	\N	\N	5	2016-04-23 23:57:44.150754	2016-04-23 23:57:44.150754
66	3	\N	\N	5	2016-04-23 23:57:44.167469	2016-04-23 23:57:44.167469
67	4	\N	\N	5	2016-04-23 23:57:44.184084	2016-04-23 23:57:44.184084
68	5	\N	\N	5	2016-04-23 23:57:44.200655	2016-04-23 23:57:44.200655
69	6	\N	\N	5	2016-04-23 23:57:44.217381	2016-04-23 23:57:44.217381
70	7	\N	\N	5	2016-04-23 23:57:44.233716	2016-04-23 23:57:44.233716
71	8	\N	\N	5	2016-04-23 23:57:44.250461	2016-04-23 23:57:44.250461
72	9	\N	\N	5	2016-04-23 23:57:44.268037	2016-04-23 23:57:44.268037
73	10	\N	\N	5	2016-04-23 23:57:44.285188	2016-04-23 23:57:44.285188
74	11	\N	\N	5	2016-04-23 23:57:44.301668	2016-04-23 23:57:44.301668
75	12	\N	\N	5	2016-04-23 23:57:44.318631	2016-04-23 23:57:44.318631
76	13	\N	\N	5	2016-04-23 23:57:44.334978	2016-04-23 23:57:44.334978
77	14	\N	\N	5	2016-04-23 23:57:44.351516	2016-04-23 23:57:44.351516
78	15	\N	\N	5	2016-04-23 23:57:44.368446	2016-04-23 23:57:44.368446
79	16	\N	\N	5	2016-04-23 23:57:44.385287	2016-04-23 23:57:44.385287
80	17	\N	\N	5	2016-04-23 23:57:44.402941	2016-04-23 23:57:44.402941
81	18	\N	\N	5	2016-04-23 23:57:44.419788	2016-04-23 23:57:44.419788
82	19	\N	\N	5	2016-04-23 23:57:44.436398	2016-04-23 23:57:44.436398
83	20	\N	\N	5	2016-04-23 23:57:44.454624	2016-04-23 23:57:44.454624
84	21	\N	\N	5	2016-04-23 23:57:44.471401	2016-04-23 23:57:44.471401
85	22	\N	\N	5	2016-04-23 23:57:44.488246	2016-04-23 23:57:44.488246
86	23	\N	\N	5	2016-04-23 23:57:44.504905	2016-04-23 23:57:44.504905
\.


--
-- Name: spree_option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_option_values_id_seq', 86, true);


--
-- Data for Name: spree_option_values_variants; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_option_values_variants (variant_id, option_value_id) FROM stdin;
17	1
17	5
18	1
18	7
19	1
19	6
20	2
20	5
21	2
21	7
22	2
22	6
23	3
23	5
24	3
24	7
25	3
25	6
26	4
26	6
28	8
29	9
30	10
31	11
32	12
33	13
34	14
35	15
36	16
37	17
38	18
39	19
40	20
41	21
42	22
43	23
44	24
45	25
46	26
47	27
48	28
49	29
50	30
51	31
52	32
53	33
54	34
55	35
56	36
57	37
58	38
59	39
60	40
61	41
62	42
63	43
64	44
65	45
66	46
67	47
68	48
69	49
70	50
71	51
74	9
73	31
75	51
77	19
78	33
79	51
81	19
82	35
83	51
\.


--
-- Data for Name: spree_orders; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_orders (id, number, item_total, total, state, adjustment_total, user_id, completed_at, bill_address_id, ship_address_id, payment_total, shipping_method_id, shipment_state, payment_state, email, special_instructions, created_at, updated_at, currency, last_ip_address, created_by_id, shipment_total, additional_tax_total, promo_total, channel, included_tax_total, item_count, approver_id, approved_at, confirmation_delivered, considered_risky, guest_token, canceled_at, canceler_id, store_id, state_lock_version) FROM stdin;
1	R123456789	15.99	17.63	complete	1.64	\N	2016-04-22 23:18:45.817784	2	1	0.00	\N	pending	balance_due	spree@example.com	\N	2016-04-23 23:18:45.24585	2016-04-23 23:18:46.279356	USD	\N	\N	0.00	0.80	0.00	spree	0.00	0	\N	\N	f	f	WW0RmrzS_cKIfe0ikyUoDA	\N	\N	\N	0
2	R987654321	22.99	25.35	complete	2.36	\N	2016-04-22 23:18:45.828825	2	1	0.00	\N	pending	balance_due	spree@example.com	\N	2016-04-23 23:18:45.271507	2016-04-23 23:18:46.499365	USD	\N	\N	0.00	1.15	0.00	spree	0.00	0	\N	\N	f	f	_FoTq2W3L_OkKmv2o-GwRA	\N	\N	\N	0
\.


--
-- Name: spree_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_orders_id_seq', 2, true);


--
-- Data for Name: spree_orders_promotions; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_orders_promotions (order_id, promotion_id) FROM stdin;
\.


--
-- Data for Name: spree_pages; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_pages (id, title, body, slug, created_at, updated_at, show_in_header, show_in_footer, foreign_link, "position", visible, meta_keywords, meta_description, layout, show_in_sidebar, meta_title, render_layout_as_partial) FROM stdin;
\.


--
-- Name: spree_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_pages_id_seq', 1, false);


--
-- Data for Name: spree_pages_stores; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_pages_stores (store_id, page_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_payment_capture_events; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_payment_capture_events (id, amount, payment_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_payment_capture_events_id_seq', 1, false);


--
-- Data for Name: spree_payment_methods; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_payment_methods (id, type, name, description, active, deleted_at, created_at, updated_at, display_on, auto_capture, preferences) FROM stdin;
1	Spree::Gateway::Bogus	Credit Card	Bogus payment gateway.	t	\N	2016-04-23 23:18:20.224605	2016-04-23 23:18:20.224605	\N	\N	---\n:server: test\n:test_mode: true\n
2	Spree::PaymentMethod::Check	Check	Pay by check.	t	\N	2016-04-23 23:18:20.239046	2016-04-23 23:18:20.239046	\N	\N	\N
\.


--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_payment_methods_id_seq', 2, true);


--
-- Data for Name: spree_payments; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_payments (id, amount, order_id, source_id, source_type, payment_method_id, state, response_code, avs_response, created_at, updated_at, number, cvv_response_code, cvv_response_message) FROM stdin;
1	17.63	1	1	Spree::CreditCard	1	pending	12345	\N	2016-04-23 23:18:46.195255	2016-04-23 23:18:46.195255	PI6WI08L	\N	\N
2	25.35	2	1	Spree::CreditCard	1	pending	12345	\N	2016-04-23 23:18:46.419873	2016-04-23 23:18:46.419873	PUE5ZMCM	\N	\N
\.


--
-- Name: spree_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_payments_id_seq', 2, true);


--
-- Data for Name: spree_preferences; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_preferences (id, value, key, created_at, updated_at) FROM stdin;
1	--- 232\n...\n	spree/app_configuration/default_country_id	2016-04-23 23:18:05.938241	2016-04-23 23:18:05.938241
3	---\n- :ru\n	spree_i18n/configuration/supported_locales	2016-04-24 00:06:48.740184	2016-04-24 00:06:48.740184
4	---\n- :ru\n	spree_i18n/configuration/available_locales	2016-04-24 00:06:48.746344	2016-04-24 00:06:48.746344
2	--- BYR\n...\n	spree/app_configuration/currency	2016-04-23 23:18:22.194164	2016-04-24 00:06:48.752284
\.


--
-- Name: spree_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_preferences_id_seq', 4, true);


--
-- Data for Name: spree_prices; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_prices (id, variant_id, amount, currency, deleted_at) FROM stdin;
1	1	15.99	USD	\N
2	1	14.00	EUR	\N
3	2	22.99	USD	\N
4	2	19.00	EUR	\N
5	3	19.99	USD	\N
6	3	16.00	EUR	\N
7	4	19.99	USD	\N
8	4	16.00	EUR	\N
9	5	19.99	USD	\N
10	5	16.00	EUR	\N
11	6	19.99	USD	\N
12	6	16.00	EUR	\N
13	7	19.99	USD	\N
14	7	16.00	EUR	\N
15	8	19.99	USD	\N
16	8	16.00	EUR	\N
17	9	19.99	USD	\N
18	9	16.00	EUR	\N
19	10	19.99	USD	\N
20	10	16.00	EUR	\N
21	11	15.99	USD	\N
22	11	14.00	EUR	\N
23	12	22.99	USD	\N
24	12	19.00	EUR	\N
25	13	13.99	USD	\N
26	13	12.00	EUR	\N
27	14	16.99	USD	\N
28	14	14.00	EUR	\N
29	15	16.99	USD	\N
30	15	14.00	EUR	\N
31	16	13.99	USD	\N
32	16	12.00	EUR	\N
33	17	19.99	USD	\N
34	18	19.99	USD	\N
35	19	19.99	USD	\N
36	20	19.99	USD	\N
37	21	19.99	USD	\N
38	22	19.99	USD	\N
39	23	19.99	USD	\N
40	24	19.99	USD	\N
41	25	19.99	USD	\N
42	26	19.99	USD	\N
43	27	1000000.00	USD	\N
44	28	1000000.00	USD	\N
45	29	1000000.00	USD	\N
46	30	1000000.00	USD	\N
47	31	1000000.00	USD	\N
48	32	1000000.00	USD	\N
49	33	1000000.00	USD	\N
50	34	1000000.00	USD	\N
51	35	1000000.00	USD	\N
52	36	1000000.00	USD	\N
53	37	1000000.00	USD	\N
54	38	1000000.00	USD	\N
55	39	1000000.00	USD	\N
56	40	1000000.00	USD	\N
57	41	1000000.00	USD	\N
58	42	1000000.00	USD	\N
59	43	1000000.00	USD	\N
60	44	1000000.00	USD	\N
61	45	1000000.00	USD	\N
62	46	1000000.00	USD	\N
63	47	1000000.00	USD	\N
64	48	1000000.00	USD	\N
65	49	1000000.00	USD	\N
66	50	1000000.00	USD	\N
67	51	1000000.00	USD	\N
68	52	1000000.00	USD	\N
69	53	1000000.00	USD	\N
70	54	1000000.00	USD	\N
71	55	1000000.00	USD	\N
72	56	1000000.00	USD	\N
73	57	1000000.00	USD	\N
74	58	1000000.00	USD	\N
75	59	1000000.00	USD	\N
76	60	1000000.00	USD	\N
77	61	1000000.00	USD	\N
78	62	1000000.00	USD	\N
79	63	1000000.00	USD	\N
80	64	1000000.00	USD	\N
81	65	1000000.00	USD	\N
82	66	1000000.00	USD	\N
83	67	1000000.00	USD	\N
84	68	1000000.00	USD	\N
85	69	1000000.00	USD	\N
86	70	1000000.00	USD	\N
87	71	1000000.00	USD	\N
88	1	\N	BYR	\N
89	2	\N	BYR	\N
90	3	\N	BYR	\N
91	4	\N	BYR	\N
92	5	\N	BYR	\N
93	6	\N	BYR	\N
94	7	\N	BYR	\N
95	8	\N	BYR	\N
96	9	\N	BYR	\N
97	10	\N	BYR	\N
98	11	\N	BYR	\N
99	12	\N	BYR	\N
100	13	\N	BYR	\N
101	14	\N	BYR	\N
102	15	\N	BYR	\N
103	16	\N	BYR	\N
106	29	\N	BYR	\N
107	30	\N	BYR	\N
108	31	\N	BYR	\N
109	32	\N	BYR	\N
110	33	\N	BYR	\N
111	34	\N	BYR	\N
112	35	\N	BYR	\N
113	36	\N	BYR	\N
114	37	\N	BYR	\N
115	38	\N	BYR	\N
116	39	\N	BYR	\N
117	40	\N	BYR	\N
118	41	\N	BYR	\N
119	42	\N	BYR	\N
120	43	\N	BYR	\N
121	44	\N	BYR	\N
122	45	\N	BYR	\N
123	46	\N	BYR	\N
124	47	\N	BYR	\N
125	48	\N	BYR	\N
126	49	\N	BYR	\N
127	50	\N	BYR	\N
128	51	\N	BYR	\N
129	52	\N	BYR	\N
130	53	\N	BYR	\N
131	54	\N	BYR	\N
132	55	\N	BYR	\N
133	56	\N	BYR	\N
134	57	\N	BYR	\N
135	58	\N	BYR	\N
136	59	\N	BYR	\N
137	60	\N	BYR	\N
138	61	\N	BYR	\N
139	62	\N	BYR	\N
140	63	\N	BYR	\N
141	64	\N	BYR	\N
142	65	\N	BYR	\N
143	66	\N	BYR	\N
144	67	\N	BYR	\N
145	68	\N	BYR	\N
146	69	\N	BYR	\N
147	70	\N	BYR	\N
148	71	\N	BYR	\N
105	28	1500000.00	BYR	\N
104	27	1500000.00	BYR	\N
149	72	2850000.00	BYR	\N
151	74	2850000.00	BYR	\N
150	73	4120000.00	BYR	\N
152	75	5700000.00	BYR	\N
153	76	3485000.00	BYR	\N
154	77	3485000.00	BYR	\N
155	78	5356000.00	BYR	\N
156	79	6721000.00	BYR	\N
157	80	2002000.00	BYR	\N
158	81	2002000.00	BYR	\N
159	82	2895000.00	BYR	\N
160	83	3442000.00	BYR	\N
\.


--
-- Name: spree_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_prices_id_seq', 160, true);


--
-- Data for Name: spree_product_option_types; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_product_option_types (id, "position", product_id, option_type_id, created_at, updated_at) FROM stdin;
1	1	3	1	2016-04-23 23:18:25.922444	2016-04-23 23:18:25.922444
2	2	3	2	2016-04-23 23:18:25.927123	2016-04-23 23:18:25.927123
3	1	8	1	2016-04-23 23:18:25.965949	2016-04-23 23:18:25.965949
4	2	8	2	2016-04-23 23:18:25.969726	2016-04-23 23:18:25.969726
5	1	17	3	2016-04-24 00:06:15.497124	2016-04-24 00:06:15.497124
6	1	18	3	2016-04-25 22:45:42.51827	2016-04-25 22:45:42.51827
7	1	19	3	2016-04-27 22:49:13.576694	2016-04-27 22:49:13.576694
8	1	20	3	2016-04-27 22:57:03.190008	2016-04-27 22:57:03.190008
\.


--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_product_option_types_id_seq', 8, true);


--
-- Data for Name: spree_product_properties; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_product_properties (id, value, product_id, property_id, created_at, updated_at, "position") FROM stdin;
1	\N	3	1	2016-04-23 23:18:26.045634	2016-04-23 23:18:26.045634	1
2	\N	3	2	2016-04-23 23:18:26.094194	2016-04-23 23:18:26.094194	2
3	\N	3	3	2016-04-23 23:18:26.126974	2016-04-23 23:18:26.126974	3
4	\N	3	4	2016-04-23 23:18:26.159811	2016-04-23 23:18:26.159811	4
5	\N	3	5	2016-04-23 23:18:26.192173	2016-04-23 23:18:26.192173	5
6	\N	3	6	2016-04-23 23:18:26.223172	2016-04-23 23:18:26.223172	6
7	\N	3	7	2016-04-23 23:18:26.264715	2016-04-23 23:18:26.264715	7
8	\N	3	8	2016-04-23 23:18:26.29554	2016-04-23 23:18:26.29554	8
9	\N	4	1	2016-04-23 23:18:26.329173	2016-04-23 23:18:26.329173	1
10	\N	4	2	2016-04-23 23:18:26.356837	2016-04-23 23:18:26.356837	2
11	\N	4	3	2016-04-23 23:18:26.384399	2016-04-23 23:18:26.384399	3
12	\N	4	4	2016-04-23 23:18:26.41227	2016-04-23 23:18:26.41227	4
13	\N	4	5	2016-04-23 23:18:26.440368	2016-04-23 23:18:26.440368	5
14	\N	4	6	2016-04-23 23:18:26.467605	2016-04-23 23:18:26.467605	6
15	\N	4	7	2016-04-23 23:18:26.494879	2016-04-23 23:18:26.494879	7
16	\N	4	8	2016-04-23 23:18:26.521759	2016-04-23 23:18:26.521759	8
17	\N	5	1	2016-04-23 23:18:26.552887	2016-04-23 23:18:26.552887	1
18	\N	5	2	2016-04-23 23:18:26.580264	2016-04-23 23:18:26.580264	2
19	\N	5	3	2016-04-23 23:18:26.6067	2016-04-23 23:18:26.6067	3
20	\N	5	4	2016-04-23 23:18:26.63345	2016-04-23 23:18:26.63345	4
21	\N	5	5	2016-04-23 23:18:26.659786	2016-04-23 23:18:26.659786	5
22	\N	5	6	2016-04-23 23:18:26.685848	2016-04-23 23:18:26.685848	6
23	\N	5	7	2016-04-23 23:18:26.711793	2016-04-23 23:18:26.711793	7
24	\N	5	8	2016-04-23 23:18:26.737727	2016-04-23 23:18:26.737727	8
25	\N	1	9	2016-04-23 23:18:26.771154	2016-04-23 23:18:26.771154	1
26	\N	1	10	2016-04-23 23:18:26.800887	2016-04-23 23:18:26.800887	2
27	\N	1	11	2016-04-23 23:18:26.83004	2016-04-23 23:18:26.83004	3
28	\N	2	9	2016-04-23 23:18:26.860844	2016-04-23 23:18:26.860844	1
29	\N	2	10	2016-04-23 23:18:26.886705	2016-04-23 23:18:26.886705	2
30	\N	2	11	2016-04-23 23:18:26.912888	2016-04-23 23:18:26.912888	3
31	\N	13	9	2016-04-23 23:18:26.941928	2016-04-23 23:18:26.941928	1
32	\N	13	10	2016-04-23 23:18:26.96757	2016-04-23 23:18:26.96757	2
33	\N	14	9	2016-04-23 23:18:26.997123	2016-04-23 23:18:26.997123	1
34	\N	14	10	2016-04-23 23:18:27.02293	2016-04-23 23:18:27.02293	2
35	\N	15	9	2016-04-23 23:18:27.052223	2016-04-23 23:18:27.052223	1
36	\N	15	10	2016-04-23 23:18:27.078458	2016-04-23 23:18:27.078458	2
37	\N	16	9	2016-04-23 23:18:27.109459	2016-04-23 23:18:27.109459	1
38	\N	16	10	2016-04-23 23:18:27.138107	2016-04-23 23:18:27.138107	2
39	\N	11	9	2016-04-23 23:18:27.167843	2016-04-23 23:18:27.167843	1
40	\N	11	10	2016-04-23 23:18:27.194552	2016-04-23 23:18:27.194552	2
41	\N	12	9	2016-04-23 23:18:27.232632	2016-04-23 23:18:27.232632	1
42	\N	12	10	2016-04-23 23:18:27.258247	2016-04-23 23:18:27.258247	2
43	\N	8	1	2016-04-23 23:18:27.28779	2016-04-23 23:18:27.28779	1
44	\N	8	2	2016-04-23 23:18:27.313569	2016-04-23 23:18:27.313569	2
45	\N	8	3	2016-04-23 23:18:27.340086	2016-04-23 23:18:27.340086	3
46	\N	8	4	2016-04-23 23:18:27.366375	2016-04-23 23:18:27.366375	4
47	\N	8	5	2016-04-23 23:18:27.393493	2016-04-23 23:18:27.393493	5
48	\N	8	6	2016-04-23 23:18:27.421146	2016-04-23 23:18:27.421146	6
49	\N	8	7	2016-04-23 23:18:27.447851	2016-04-23 23:18:27.447851	7
50	\N	8	8	2016-04-23 23:18:27.47457	2016-04-23 23:18:27.47457	8
51	\N	9	1	2016-04-23 23:18:27.504619	2016-04-23 23:18:27.504619	1
52	\N	9	2	2016-04-23 23:18:27.530964	2016-04-23 23:18:27.530964	2
53	\N	9	3	2016-04-23 23:18:27.557777	2016-04-23 23:18:27.557777	3
54	\N	9	4	2016-04-23 23:18:27.584372	2016-04-23 23:18:27.584372	4
55	\N	9	5	2016-04-23 23:18:27.610812	2016-04-23 23:18:27.610812	5
56	\N	9	6	2016-04-23 23:18:27.637348	2016-04-23 23:18:27.637348	6
57	\N	9	7	2016-04-23 23:18:27.663663	2016-04-23 23:18:27.663663	7
58	\N	9	8	2016-04-23 23:18:27.689693	2016-04-23 23:18:27.689693	8
59	\N	10	1	2016-04-23 23:18:27.719635	2016-04-23 23:18:27.719635	1
60	\N	10	2	2016-04-23 23:18:27.745539	2016-04-23 23:18:27.745539	2
61	\N	10	3	2016-04-23 23:18:27.771468	2016-04-23 23:18:27.771468	3
62	\N	10	4	2016-04-23 23:18:27.797998	2016-04-23 23:18:27.797998	4
63	\N	10	5	2016-04-23 23:18:27.824698	2016-04-23 23:18:27.824698	5
64	\N	10	6	2016-04-23 23:18:27.851504	2016-04-23 23:18:27.851504	6
65	\N	10	7	2016-04-23 23:18:27.878403	2016-04-23 23:18:27.878403	7
66	\N	10	8	2016-04-23 23:18:27.90405	2016-04-23 23:18:27.90405	8
67	\N	17	12	2016-04-24 00:06:15.322183	2016-04-24 00:06:15.322183	1
68	\N	17	13	2016-04-24 00:06:15.337715	2016-04-24 00:06:15.337715	2
69	\N	17	14	2016-04-24 00:06:15.349143	2016-04-24 00:06:15.349143	3
70	\N	17	15	2016-04-24 00:06:15.361246	2016-04-24 00:06:15.361246	4
71	\N	17	16	2016-04-24 00:06:15.373705	2016-04-24 00:06:15.373705	5
72	\N	17	17	2016-04-24 00:06:15.385815	2016-04-24 00:06:15.385815	6
73	\N	17	18	2016-04-24 00:06:15.398001	2016-04-24 00:06:15.398001	7
74	\N	17	19	2016-04-24 00:06:15.423718	2016-04-24 00:06:15.423718	8
75	\N	17	20	2016-04-24 00:06:15.435157	2016-04-24 00:06:15.435157	9
76	\N	17	21	2016-04-24 00:06:15.445615	2016-04-24 00:06:15.445615	10
77	\N	17	22	2016-04-24 00:06:15.456591	2016-04-24 00:06:15.456591	11
78	\N	17	23	2016-04-24 00:06:15.467001	2016-04-24 00:06:15.467001	12
79	\N	18	12	2016-04-25 22:45:42.379163	2016-04-25 23:21:19.99929	1
80	\N	18	13	2016-04-25 22:45:42.392713	2016-04-25 23:21:20.009575	2
81	\N	18	14	2016-04-25 22:45:42.403009	2016-04-25 23:21:20.018488	3
82	\N	18	15	2016-04-25 22:45:42.41316	2016-04-25 23:21:20.026809	4
83	\N	18	16	2016-04-25 22:45:42.422909	2016-04-25 23:21:20.035764	5
84	\N	18	17	2016-04-25 22:45:42.433242	2016-04-25 23:21:20.04569	6
85	\N	18	18	2016-04-25 22:45:42.443479	2016-04-25 23:21:20.05561	7
86	\N	18	19	2016-04-25 22:45:42.453249	2016-04-25 23:21:20.065898	8
87	\N	18	20	2016-04-25 22:45:42.463518	2016-04-25 23:21:20.073904	9
88	\N	18	21	2016-04-25 22:45:42.474126	2016-04-25 23:21:20.08407	10
89	\N	18	22	2016-04-25 22:45:42.485517	2016-04-25 23:21:20.094627	11
90	\N	18	23	2016-04-25 22:45:42.496338	2016-04-25 23:21:20.105469	12
91	\N	19	12	2016-04-27 22:49:13.402152	2016-04-27 22:49:13.402152	1
92	\N	19	13	2016-04-27 22:49:13.418397	2016-04-27 22:49:13.418397	2
93	\N	19	14	2016-04-27 22:49:13.429308	2016-04-27 22:49:13.429308	3
94	\N	19	15	2016-04-27 22:49:13.441409	2016-04-27 22:49:13.441409	4
95	\N	19	16	2016-04-27 22:49:13.453346	2016-04-27 22:49:13.453346	5
96	\N	19	17	2016-04-27 22:49:13.464902	2016-04-27 22:49:13.464902	6
97	\N	19	18	2016-04-27 22:49:13.477379	2016-04-27 22:49:13.477379	7
98	\N	19	19	2016-04-27 22:49:13.489094	2016-04-27 22:49:13.489094	8
99	\N	19	20	2016-04-27 22:49:13.500688	2016-04-27 22:49:13.500688	9
100	\N	19	21	2016-04-27 22:49:13.514456	2016-04-27 22:49:13.514456	10
101	\N	19	22	2016-04-27 22:49:13.527315	2016-04-27 22:49:13.527315	11
102	\N	19	23	2016-04-27 22:49:13.54011	2016-04-27 22:49:13.54011	12
103	\N	20	12	2016-04-27 22:57:03.048306	2016-04-27 22:57:03.048306	1
104	\N	20	13	2016-04-27 22:57:03.059721	2016-04-27 22:57:03.059721	2
105	\N	20	14	2016-04-27 22:57:03.071656	2016-04-27 22:57:03.071656	3
106	\N	20	15	2016-04-27 22:57:03.082996	2016-04-27 22:57:03.082996	4
107	\N	20	16	2016-04-27 22:57:03.095006	2016-04-27 22:57:03.095006	5
108	\N	20	17	2016-04-27 22:57:03.106171	2016-04-27 22:57:03.106171	6
109	\N	20	18	2016-04-27 22:57:03.1175	2016-04-27 22:57:03.1175	7
110	\N	20	19	2016-04-27 22:57:03.128917	2016-04-27 22:57:03.128917	8
111	\N	20	20	2016-04-27 22:57:03.139568	2016-04-27 22:57:03.139568	9
112	\N	20	21	2016-04-27 22:57:03.150736	2016-04-27 22:57:03.150736	10
113	\N	20	22	2016-04-27 22:57:03.161986	2016-04-27 22:57:03.161986	11
114	\N	20	23	2016-04-27 22:57:03.173585	2016-04-27 22:57:03.173585	12
\.


--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_product_properties_id_seq', 114, true);


--
-- Data for Name: spree_product_property_translations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_product_property_translations (id, spree_product_property_id, locale, created_at, updated_at, value) FROM stdin;
1	1	ru	2016-04-23 23:18:26.056725	2016-04-23 23:18:26.056725	Wilson
2	2	ru	2016-04-23 23:18:26.098125	2016-04-23 23:18:26.098125	Wannabe Sports
3	3	ru	2016-04-23 23:18:26.130707	2016-04-23 23:18:26.130707	JK1002
4	4	ru	2016-04-23 23:18:26.1636	2016-04-23 23:18:26.1636	Baseball Jersey
5	5	ru	2016-04-23 23:18:26.195832	2016-04-23 23:18:26.195832	Long
6	6	ru	2016-04-23 23:18:26.226885	2016-04-23 23:18:26.226885	100% cotton
7	7	ru	2016-04-23 23:18:26.268038	2016-04-23 23:18:26.268038	Loose
8	8	ru	2016-04-23 23:18:26.299102	2016-04-23 23:18:26.299102	Men's
9	9	ru	2016-04-23 23:18:26.332529	2016-04-23 23:18:26.332529	Jerseys
10	10	ru	2016-04-23 23:18:26.360435	2016-04-23 23:18:26.360435	Resiliance
11	11	ru	2016-04-23 23:18:26.38802	2016-04-23 23:18:26.38802	TL174
12	12	ru	2016-04-23 23:18:26.416007	2016-04-23 23:18:26.416007	Jr. Spaghetti T
13	13	ru	2016-04-23 23:18:26.444129	2016-04-23 23:18:26.444129	None
14	14	ru	2016-04-23 23:18:26.471212	2016-04-23 23:18:26.471212	90% Cotton, 10% Nylon
15	15	ru	2016-04-23 23:18:26.498461	2016-04-23 23:18:26.498461	Form
16	16	ru	2016-04-23 23:18:26.525535	2016-04-23 23:18:26.525535	Women's
17	17	ru	2016-04-23 23:18:26.556413	2016-04-23 23:18:26.556413	Jerseys
18	18	ru	2016-04-23 23:18:26.583615	2016-04-23 23:18:26.583615	Conditioned
19	19	ru	2016-04-23 23:18:26.610418	2016-04-23 23:18:26.610418	TL9002
20	20	ru	2016-04-23 23:18:26.636936	2016-04-23 23:18:26.636936	Ringer T
21	21	ru	2016-04-23 23:18:26.66317	2016-04-23 23:18:26.66317	Short
22	22	ru	2016-04-23 23:18:26.689361	2016-04-23 23:18:26.689361	100% Vellum
23	23	ru	2016-04-23 23:18:26.715015	2016-04-23 23:18:26.715015	Loose
24	24	ru	2016-04-23 23:18:26.741331	2016-04-23 23:18:26.741331	Men's
25	25	ru	2016-04-23 23:18:26.774312	2016-04-23 23:18:26.774312	Tote
26	26	ru	2016-04-23 23:18:26.804158	2016-04-23 23:18:26.804158	15" x 18" x 6"
27	27	ru	2016-04-23 23:18:26.83356	2016-04-23 23:18:26.83356	Canvas
28	28	ru	2016-04-23 23:18:26.864355	2016-04-23 23:18:26.864355	Messenger
29	29	ru	2016-04-23 23:18:26.890053	2016-04-23 23:18:26.890053	14 1/2" x 12" x 5"
30	30	ru	2016-04-23 23:18:26.916244	2016-04-23 23:18:26.916244	600 Denier Polyester
31	31	ru	2016-04-23 23:18:26.945344	2016-04-23 23:18:26.945344	Mug
32	32	ru	2016-04-23 23:18:26.970954	2016-04-23 23:18:26.970954	4.5" tall, 3.25" dia.
33	33	ru	2016-04-23 23:18:27.000453	2016-04-23 23:18:27.000453	Stein
34	34	ru	2016-04-23 23:18:27.026525	2016-04-23 23:18:27.026525	6.75" tall, 3.75" dia. base, 3" dia. rim
35	35	ru	2016-04-23 23:18:27.055806	2016-04-23 23:18:27.055806	Stein
36	36	ru	2016-04-23 23:18:27.081761	2016-04-23 23:18:27.081761	6.75" tall, 3.75" dia. base, 3" dia. rim
37	37	ru	2016-04-23 23:18:27.113604	2016-04-23 23:18:27.113604	Mug
38	38	ru	2016-04-23 23:18:27.141845	2016-04-23 23:18:27.141845	4.5" tall, 3.25" dia.
39	39	ru	2016-04-23 23:18:27.17137	2016-04-23 23:18:27.17137	Tote
40	40	ru	2016-04-23 23:18:27.205841	2016-04-23 23:18:27.205841	15" x 18" x 6"
41	41	ru	2016-04-23 23:18:27.236031	2016-04-23 23:18:27.236031	Messenger
42	42	ru	2016-04-23 23:18:27.261462	2016-04-23 23:18:27.261462	14 1/2" x 12" x 5"
43	43	ru	2016-04-23 23:18:27.291233	2016-04-23 23:18:27.291233	Wilson
44	44	ru	2016-04-23 23:18:27.317084	2016-04-23 23:18:27.317084	Wannabe Sports
45	45	ru	2016-04-23 23:18:27.343526	2016-04-23 23:18:27.343526	JK1002
46	46	ru	2016-04-23 23:18:27.370509	2016-04-23 23:18:27.370509	Baseball Jersey
47	47	ru	2016-04-23 23:18:27.396946	2016-04-23 23:18:27.396946	Long
48	48	ru	2016-04-23 23:18:27.424725	2016-04-23 23:18:27.424725	100% cotton
49	49	ru	2016-04-23 23:18:27.451164	2016-04-23 23:18:27.451164	Loose
50	50	ru	2016-04-23 23:18:27.478044	2016-04-23 23:18:27.478044	Men's
51	51	ru	2016-04-23 23:18:27.507988	2016-04-23 23:18:27.507988	Jerseys
52	52	ru	2016-04-23 23:18:27.534095	2016-04-23 23:18:27.534095	Resiliance
53	53	ru	2016-04-23 23:18:27.56126	2016-04-23 23:18:27.56126	TL174
54	54	ru	2016-04-23 23:18:27.588057	2016-04-23 23:18:27.588057	Jr. Spaghetti T
55	55	ru	2016-04-23 23:18:27.614245	2016-04-23 23:18:27.614245	None
56	56	ru	2016-04-23 23:18:27.640784	2016-04-23 23:18:27.640784	90% Cotton, 10% Nylon
57	57	ru	2016-04-23 23:18:27.66696	2016-04-23 23:18:27.66696	Form
58	58	ru	2016-04-23 23:18:27.693139	2016-04-23 23:18:27.693139	Women's
59	59	ru	2016-04-23 23:18:27.723029	2016-04-23 23:18:27.723029	Jerseys
60	60	ru	2016-04-23 23:18:27.749034	2016-04-23 23:18:27.749034	Conditioned
61	61	ru	2016-04-23 23:18:27.774875	2016-04-23 23:18:27.774875	TL9002
62	62	ru	2016-04-23 23:18:27.801403	2016-04-23 23:18:27.801403	Ringer T
63	63	ru	2016-04-23 23:18:27.82807	2016-04-23 23:18:27.82807	Short
64	64	ru	2016-04-23 23:18:27.855235	2016-04-23 23:18:27.855235	100% Vellum
65	65	ru	2016-04-23 23:18:27.881613	2016-04-23 23:18:27.881613	Loose
66	66	ru	2016-04-23 23:18:27.907475	2016-04-23 23:18:27.907475	Men's
67	67	ru	2016-04-24 00:06:15.327531	2016-04-24 00:06:15.327531	\N
68	68	ru	2016-04-24 00:06:15.340904	2016-04-24 00:06:15.340904	\N
69	69	ru	2016-04-24 00:06:15.35224	2016-04-24 00:06:15.35224	\N
70	70	ru	2016-04-24 00:06:15.364488	2016-04-24 00:06:15.364488	\N
71	71	ru	2016-04-24 00:06:15.376887	2016-04-24 00:06:15.376887	\N
72	72	ru	2016-04-24 00:06:15.38918	2016-04-24 00:06:15.38918	\N
73	73	ru	2016-04-24 00:06:15.401294	2016-04-24 00:06:15.401294	\N
74	74	ru	2016-04-24 00:06:15.426307	2016-04-24 00:06:15.426307	\N
75	75	ru	2016-04-24 00:06:15.438234	2016-04-24 00:06:15.438234	\N
76	76	ru	2016-04-24 00:06:15.448399	2016-04-24 00:06:15.448399	\N
77	77	ru	2016-04-24 00:06:15.459306	2016-04-24 00:06:15.459306	\N
78	78	ru	2016-04-24 00:06:15.469782	2016-04-24 00:06:15.469782	\N
79	79	ru	2016-04-25 22:45:42.384298	2016-04-25 23:21:20.002439	36
80	80	ru	2016-04-25 22:45:42.39521	2016-04-25 23:21:20.012904	10
81	81	ru	2016-04-25 22:45:42.405875	2016-04-25 23:21:20.021321	С независимыми пружинами
82	82	ru	2016-04-25 22:45:42.415593	2016-04-25 23:21:20.030362	18
83	83	ru	2016-04-25 22:45:42.425506	2016-04-25 23:21:20.038756	120
84	84	ru	2016-04-25 22:45:42.435966	2016-04-25 23:21:20.04964	Среднежесткий
85	85	ru	2016-04-25 22:45:42.446032	2016-04-25 23:21:20.058844	Среднежесткий
86	86	ru	2016-04-25 22:45:42.455759	2016-04-25 23:21:20.068593	TFK
87	87	ru	2016-04-25 22:45:42.46646	2016-04-25 23:21:20.078257	
88	88	ru	2016-04-25 22:45:42.476942	2016-04-25 23:21:20.086772	
89	89	ru	2016-04-25 22:45:42.48834	2016-04-25 23:21:20.098898	да
90	90	ru	2016-04-25 22:45:42.499589	2016-04-25 23:21:20.108265	Беларусь
91	91	ru	2016-04-27 22:49:13.408501	2016-04-27 22:49:13.408501	\N
92	92	ru	2016-04-27 22:49:13.421198	2016-04-27 22:49:13.421198	\N
93	93	ru	2016-04-27 22:49:13.432267	2016-04-27 22:49:13.432267	\N
94	94	ru	2016-04-27 22:49:13.444149	2016-04-27 22:49:13.444149	\N
95	95	ru	2016-04-27 22:49:13.456735	2016-04-27 22:49:13.456735	\N
96	96	ru	2016-04-27 22:49:13.467966	2016-04-27 22:49:13.467966	\N
97	97	ru	2016-04-27 22:49:13.480325	2016-04-27 22:49:13.480325	\N
98	98	ru	2016-04-27 22:49:13.491877	2016-04-27 22:49:13.491877	\N
99	99	ru	2016-04-27 22:49:13.504168	2016-04-27 22:49:13.504168	\N
100	100	ru	2016-04-27 22:49:13.516954	2016-04-27 22:49:13.516954	\N
101	101	ru	2016-04-27 22:49:13.530913	2016-04-27 22:49:13.530913	\N
102	102	ru	2016-04-27 22:49:13.543194	2016-04-27 22:49:13.543194	\N
103	103	ru	2016-04-27 22:57:03.050761	2016-04-27 22:57:03.050761	\N
104	104	ru	2016-04-27 22:57:03.063511	2016-04-27 22:57:03.063511	\N
105	105	ru	2016-04-27 22:57:03.074463	2016-04-27 22:57:03.074463	\N
106	106	ru	2016-04-27 22:57:03.085458	2016-04-27 22:57:03.085458	\N
107	107	ru	2016-04-27 22:57:03.097696	2016-04-27 22:57:03.097696	\N
108	108	ru	2016-04-27 22:57:03.109093	2016-04-27 22:57:03.109093	\N
109	109	ru	2016-04-27 22:57:03.119987	2016-04-27 22:57:03.119987	\N
110	110	ru	2016-04-27 22:57:03.131456	2016-04-27 22:57:03.131456	\N
111	111	ru	2016-04-27 22:57:03.142438	2016-04-27 22:57:03.142438	\N
112	112	ru	2016-04-27 22:57:03.153265	2016-04-27 22:57:03.153265	\N
113	113	ru	2016-04-27 22:57:03.164519	2016-04-27 22:57:03.164519	\N
114	114	ru	2016-04-27 22:57:03.176675	2016-04-27 22:57:03.176675	\N
\.


--
-- Name: spree_product_property_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_product_property_translations_id_seq', 114, true);


--
-- Data for Name: spree_product_translations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_product_translations (id, spree_product_id, locale, created_at, updated_at, name, description, meta_description, meta_keywords, slug, deleted_at) FROM stdin;
1	1	ru	2016-04-23 23:18:22.387513	2016-04-23 23:18:22.390266	Ruby on Rails Tote	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	ruby-on-rails-tote	\N
2	2	ru	2016-04-23 23:18:22.523078	2016-04-23 23:18:22.52534	Ruby on Rails Bag	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	ruby-on-rails-bag	\N
3	3	ru	2016-04-23 23:18:22.644987	2016-04-23 23:18:22.647196	Ruby on Rails Baseball Jersey	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	ruby-on-rails-baseball-jersey	\N
4	4	ru	2016-04-23 23:18:22.769201	2016-04-23 23:18:22.771511	Ruby on Rails Jr. Spaghetti	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	ruby-on-rails-jr-spaghetti	\N
5	5	ru	2016-04-23 23:18:22.89249	2016-04-23 23:18:22.894993	Ruby on Rails Ringer T-Shirt	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	ruby-on-rails-ringer-t-shirt	\N
6	6	ru	2016-04-23 23:18:23.019097	2016-04-23 23:18:23.021433	Ruby Baseball Jersey	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	ruby-baseball-jersey	\N
7	7	ru	2016-04-23 23:18:23.153542	2016-04-23 23:18:23.155782	Apache Baseball Jersey	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	apache-baseball-jersey	\N
8	8	ru	2016-04-23 23:18:23.27496	2016-04-23 23:18:23.277005	Spree Baseball Jersey	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	spree-baseball-jersey	\N
9	9	ru	2016-04-23 23:18:23.394289	2016-04-23 23:18:23.396637	Spree Jr. Spaghetti	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	spree-jr-spaghetti	\N
10	10	ru	2016-04-23 23:18:23.521214	2016-04-23 23:18:23.523393	Spree Ringer T-Shirt	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	spree-ringer-t-shirt	\N
11	11	ru	2016-04-23 23:18:23.641338	2016-04-23 23:18:23.64351	Spree Tote	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	spree-tote	\N
12	12	ru	2016-04-23 23:18:23.758598	2016-04-23 23:18:23.760691	Spree Bag	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	spree-bag	\N
13	13	ru	2016-04-23 23:18:23.881964	2016-04-23 23:18:23.884454	Ruby on Rails Mug	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	ruby-on-rails-mug	\N
14	14	ru	2016-04-23 23:18:23.999847	2016-04-23 23:18:24.001943	Ruby on Rails Stein	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	ruby-on-rails-stein	\N
15	15	ru	2016-04-23 23:18:24.117574	2016-04-23 23:18:24.11975	Spree Stein	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	spree-stein	\N
16	16	ru	2016-04-23 23:18:24.245756	2016-04-23 23:18:24.247937	Spree Mug	Et nobis consequatur quis similique non beatae adipisci. Hic ex est repudiandae nisi. Deserunt blanditiis ea sed vitae non iste quia adipisci.	\N	\N	spree-mug	\N
17	17	ru	2016-04-24 00:06:17.430951	2016-04-24 00:06:24.085715	Spring				spring	\N
18	18	ru	2016-04-25 22:45:42.710606	2016-04-27 22:44:37.967591	Comfort 5а				comfort-5a	\N
19	19	ru	2016-04-27 22:49:13.778662	2016-04-27 22:50:20.763052	Селена				selena	\N
20	20	ru	2016-04-27 22:57:03.336921	2016-04-27 23:07:37.997435	Невада-Прада				nevada-prada	\N
\.


--
-- Name: spree_product_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_product_translations_id_seq', 20, true);


--
-- Data for Name: spree_products; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_products (id, name, description, available_on, deleted_at, slug, meta_description, meta_keywords, tax_category_id, shipping_category_id, created_at, updated_at, promotionable, meta_title) FROM stdin;
1		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:22.285841	2016-04-24 00:06:51.313654	t	\N
2		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:22.486794	2016-04-24 00:06:51.346375	t	\N
3		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:22.609118	2016-04-24 00:06:51.38878	t	\N
4		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:22.733139	2016-04-24 00:06:51.41258	t	\N
5		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:22.856637	2016-04-24 00:06:51.434171	t	\N
6		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:22.982152	2016-04-24 00:06:51.457708	t	\N
7		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:23.11803	2016-04-24 00:06:51.48159	t	\N
8		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:23.240512	2016-04-24 00:06:51.505554	t	\N
9		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:23.359879	2016-04-24 00:06:51.529944	t	\N
10		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:23.486903	2016-04-24 00:06:51.554009	t	\N
11		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:23.60699	2016-04-24 00:07:01.875994	t	\N
12		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	1	1	2016-04-23 23:18:23.72536	2016-04-24 00:07:01.904311	t	\N
13		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	\N	1	2016-04-23 23:18:23.843152	2016-04-24 00:07:01.932044	t	\N
20		\N	2016-04-17 21:00:00	\N	\N	\N	\N	\N	1	2016-04-27 22:57:03.001834	2016-04-27 23:07:37.99509	t	
14		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	\N	1	2016-04-23 23:18:23.966603	2016-04-24 00:07:01.963102	t	\N
15		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	\N	1	2016-04-23 23:18:24.083124	2016-04-24 00:07:01.992886	t	\N
16		\N	2016-04-23 23:18:22.184058	\N	\N	\N	\N	\N	1	2016-04-23 23:18:24.210538	2016-04-24 00:07:02.022524	t	\N
18		\N	2016-04-24 21:00:00	\N	\N	\N	\N	\N	1	2016-04-25 22:45:42.278972	2016-04-27 22:44:37.964806	t	
19		\N	2016-04-24 21:00:00	\N	\N	\N	\N	\N	1	2016-04-27 22:49:13.252987	2016-04-27 22:53:16.597593	t	
17		\N	2016-04-21 21:00:00	\N	\N	\N	\N	\N	1	2016-04-24 00:06:15.198453	2016-04-24 00:12:39.586807	t	
\.


--
-- Name: spree_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_products_id_seq', 20, true);


--
-- Data for Name: spree_products_promotion_rules; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_products_promotion_rules (product_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: spree_products_taxons; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_products_taxons (product_id, taxon_id, id, "position") FROM stdin;
1	3	1	1
2	3	2	2
11	3	3	3
12	3	4	4
13	4	5	1
14	4	6	2
15	4	7	3
16	4	8	4
4	6	9	1
9	6	10	2
3	7	11	1
5	7	12	2
7	7	13	3
6	7	14	4
8	7	15	5
10	7	16	6
6	8	17	1
7	9	18	1
15	10	19	1
16	10	20	2
10	10	21	3
8	10	22	4
11	10	23	5
12	10	24	6
9	10	25	7
1	11	26	1
2	11	27	2
13	11	28	3
14	11	29	4
3	11	30	5
4	11	31	6
5	11	32	7
17	12	33	1
18	12	34	2
19	17	35	1
19	12	36	3
20	12	37	4
20	17	38	2
\.


--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_products_taxons_id_seq', 38, true);


--
-- Data for Name: spree_promotion_action_line_items; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_promotion_action_line_items (id, promotion_action_id, variant_id, quantity) FROM stdin;
\.


--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_promotion_action_line_items_id_seq', 1, false);


--
-- Data for Name: spree_promotion_actions; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_promotion_actions (id, promotion_id, "position", type, deleted_at) FROM stdin;
\.


--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_promotion_actions_id_seq', 1, false);


--
-- Data for Name: spree_promotion_categories; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_promotion_categories (id, name, created_at, updated_at, code) FROM stdin;
\.


--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_promotion_categories_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rules; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_promotion_rules (id, promotion_id, user_id, product_group_id, type, created_at, updated_at, code, preferences) FROM stdin;
\.


--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_promotion_rules_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rules_users; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_promotion_rules_users (user_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: spree_promotion_translations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_promotion_translations (id, spree_promotion_id, locale, created_at, updated_at, name, description) FROM stdin;
\.


--
-- Name: spree_promotion_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_promotion_translations_id_seq', 1, false);


--
-- Data for Name: spree_promotions; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_promotions (id, description, expires_at, starts_at, name, type, usage_limit, match_policy, code, advertise, path, created_at, updated_at, promotion_category_id) FROM stdin;
\.


--
-- Name: spree_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_promotions_id_seq', 1, false);


--
-- Data for Name: spree_properties; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_properties (id, name, presentation, created_at, updated_at) FROM stdin;
1	\N	\N	2016-04-23 23:18:26.014909	2016-04-23 23:18:26.014909
2	\N	\N	2016-04-23 23:18:26.085419	2016-04-23 23:18:26.085419
3	\N	\N	2016-04-23 23:18:26.117394	2016-04-23 23:18:26.117394
4	\N	\N	2016-04-23 23:18:26.150266	2016-04-23 23:18:26.150266
5	\N	\N	2016-04-23 23:18:26.182402	2016-04-23 23:18:26.182402
6	\N	\N	2016-04-23 23:18:26.214293	2016-04-23 23:18:26.214293
7	\N	\N	2016-04-23 23:18:26.256665	2016-04-23 23:18:26.256665
8	\N	\N	2016-04-23 23:18:26.286649	2016-04-23 23:18:26.286649
9	\N	\N	2016-04-23 23:18:26.762751	2016-04-23 23:18:26.762751
10	\N	\N	2016-04-23 23:18:26.792763	2016-04-23 23:18:26.792763
11	\N	\N	2016-04-23 23:18:26.82198	2016-04-23 23:18:26.82198
12	\N	\N	2016-04-23 23:57:43.677612	2016-04-23 23:57:43.677612
13	\N	\N	2016-04-23 23:57:43.6868	2016-04-23 23:57:43.6868
14	\N	\N	2016-04-23 23:57:43.695344	2016-04-23 23:57:43.695344
15	\N	\N	2016-04-23 23:57:43.70412	2016-04-23 23:57:43.70412
16	\N	\N	2016-04-23 23:57:43.711887	2016-04-23 23:57:43.711887
17	\N	\N	2016-04-23 23:57:43.720459	2016-04-23 23:57:43.720459
18	\N	\N	2016-04-23 23:57:43.728967	2016-04-23 23:57:43.728967
19	\N	\N	2016-04-23 23:57:43.737527	2016-04-23 23:57:43.737527
20	\N	\N	2016-04-23 23:57:43.745769	2016-04-23 23:57:43.745769
21	\N	\N	2016-04-23 23:57:43.753673	2016-04-23 23:57:43.753673
22	\N	\N	2016-04-23 23:57:43.761841	2016-04-23 23:57:43.761841
23	\N	\N	2016-04-23 23:57:43.769438	2016-04-23 23:57:43.769438
24	\N	\N	2016-04-23 23:57:44.056442	2016-04-23 23:57:44.056442
25	\N	\N	2016-04-23 23:57:44.066894	2016-04-23 23:57:44.066894
26	\N	\N	2016-04-23 23:57:44.075574	2016-04-23 23:57:44.075574
27	\N	\N	2016-04-23 23:57:44.083311	2016-04-23 23:57:44.083311
28	\N	\N	2016-04-23 23:57:44.525681	2016-04-23 23:57:44.525681
29	\N	\N	2016-04-23 23:57:44.534294	2016-04-23 23:57:44.534294
30	\N	\N	2016-04-23 23:57:44.5422	2016-04-23 23:57:44.5422
31	\N	\N	2016-04-23 23:57:44.589539	2016-04-23 23:57:44.589539
32	\N	\N	2016-04-23 23:57:44.597622	2016-04-23 23:57:44.597622
\.


--
-- Name: spree_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_properties_id_seq', 32, true);


--
-- Data for Name: spree_properties_prototypes; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_properties_prototypes (prototype_id, property_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	11
1	7
1	8
2	9
2	10
2	11
3	10
3	9
4	12
4	13
4	14
4	15
4	16
4	17
4	18
4	19
4	20
4	21
4	22
4	23
7	24
7	12
7	21
7	31
7	32
8	24
8	12
8	23
8	25
8	26
8	27
9	12
9	23
9	28
9	29
9	30
\.


--
-- Data for Name: spree_property_translations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_property_translations (id, spree_property_id, locale, created_at, updated_at, name, presentation) FROM stdin;
1	1	ru	2016-04-23 23:18:26.017073	2016-04-23 23:18:26.020855	Manufacturer	Manufacturer
2	2	ru	2016-04-23 23:18:26.086824	2016-04-23 23:18:26.088815	Brand	Brand
3	3	ru	2016-04-23 23:18:26.119091	2016-04-23 23:18:26.121256	Model	Model
4	4	ru	2016-04-23 23:18:26.151894	2016-04-23 23:18:26.154132	Shirt Type	Shirt Type
5	5	ru	2016-04-23 23:18:26.183837	2016-04-23 23:18:26.185806	Sleeve Type	Sleeve Type
6	6	ru	2016-04-23 23:18:26.215553	2016-04-23 23:18:26.217765	Made from	Made from
7	7	ru	2016-04-23 23:18:26.258021	2016-04-23 23:18:26.25981	Fit	Fit
8	8	ru	2016-04-23 23:18:26.2881	2016-04-23 23:18:26.289976	Gender	Gender
9	9	ru	2016-04-23 23:18:26.763967	2016-04-23 23:18:26.765789	Type	Type
10	10	ru	2016-04-23 23:18:26.794022	2016-04-23 23:18:26.795795	Size	Size
11	11	ru	2016-04-23 23:18:26.823127	2016-04-23 23:18:26.824833	Material	Material
12	12	ru	2016-04-23 23:57:43.679245	2016-04-23 23:57:43.681317	Гарантия	Гарантийный срок (мес.)
13	13	ru	2016-04-23 23:57:43.688193	2016-04-23 23:57:43.689865	Срок службы	Срок службы (лет)
14	14	ru	2016-04-23 23:57:43.696691	2016-04-23 23:57:43.698615	Тип матраса	Тип матраса
15	15	ru	2016-04-23 23:57:43.705256	2016-04-23 23:57:43.70689	Высота матраса	Высота матраса (см)
16	16	ru	2016-04-23 23:57:43.712988	2016-04-23 23:57:43.71494	Макс. нагрузка	Макс. нагрузка на спальное место (кг)
17	17	ru	2016-04-23 23:57:43.721657	2016-04-23 23:57:43.723395	Ур. жестк.(верх)	Уровень жесткости (верхняя сторона)
18	18	ru	2016-04-23 23:57:43.730143	2016-04-23 23:57:43.731918	Ур. жестк.(низ)	Уровень жесткости (нижняя сторона)
19	19	ru	2016-04-23 23:57:43.738719	2016-04-23 23:57:43.740412	Блок матраса	Базовый блок матраса
20	20	ru	2016-04-23 23:57:43.746844	2016-04-23 23:57:43.748413	Кол-во пружин	Количество пружин (на м2)
21	21	ru	2016-04-23 23:57:43.754945	2016-04-23 23:57:43.756828	Ткань чехла	Ткань чехла
22	22	ru	2016-04-23 23:57:43.762947	2016-04-23 23:57:43.764584	Съемный чехол	Съемный чехол
23	23	ru	2016-04-23 23:57:43.770536	2016-04-23 23:57:43.772327	Производитель	Старана производителя
24	24	ru	2016-04-23 23:57:44.057614	2016-04-23 23:57:44.059355	Возрастная категория	Возрастная категория
25	25	ru	2016-04-23 23:57:44.068455	2016-04-23 23:57:44.070293	Тип наматрасника	Тип наматрасника
26	26	ru	2016-04-23 23:57:44.076747	2016-04-23 23:57:44.078395	Крепление	Крепление
27	27	ru	2016-04-23 23:57:44.084465	2016-04-23 23:57:44.086266	Способ очистки	Способ очистки
28	28	ru	2016-04-23 23:57:44.527049	2016-04-23 23:57:44.529012	Расстояние между ламелями	Расстояние между ламелями(мм)
29	29	ru	2016-04-23 23:57:44.535401	2016-04-23 23:57:44.537093	Ширина ламели	Ширина ламели (мм)
30	30	ru	2016-04-23 23:57:44.543444	2016-04-23 23:57:44.545374	Подъемный механизм	Подъемный механизм
31	31	ru	2016-04-23 23:57:44.590847	2016-04-23 23:57:44.592561	Базовый блок подушки	Базовый блок подушки
32	32	ru	2016-04-23 23:57:44.598801	2016-04-23 23:57:44.600477	Размер подушки	Размер
\.


--
-- Name: spree_property_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_property_translations_id_seq', 32, true);


--
-- Data for Name: spree_prototypes; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_prototypes (id, name, created_at, updated_at) FROM stdin;
1	Shirt	2016-04-23 23:18:27.935387	2016-04-23 23:18:27.935387
2	Bag	2016-04-23 23:18:28.018312	2016-04-23 23:18:28.018312
3	Mugs	2016-04-23 23:18:28.040207	2016-04-23 23:18:28.040207
4	Матрас	2016-04-23 23:57:43.809263	2016-04-23 23:57:43.809263
7	Подушка	2016-04-23 23:57:44.613328	2016-04-23 23:57:44.613328
8	Наматрасник	2016-04-24 00:03:02.742357	2016-04-24 00:03:02.742357
9	Основание для кровати	2016-04-24 00:03:02.915388	2016-04-24 00:03:02.915388
\.


--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_prototypes_id_seq', 9, true);


--
-- Data for Name: spree_refund_reasons; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_refund_reasons (id, name, active, mutable, created_at, updated_at) FROM stdin;
1	Return processing	t	f	2016-04-23 23:18:03.389397	2016-04-23 23:18:03.389397
\.


--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_refund_reasons_id_seq', 1, true);


--
-- Data for Name: spree_refunds; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_refunds (id, payment_id, amount, transaction_id, created_at, updated_at, refund_reason_id, reimbursement_id) FROM stdin;
\.


--
-- Name: spree_refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_refunds_id_seq', 1, false);


--
-- Data for Name: spree_reimbursement_credits; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_reimbursement_credits (id, amount, reimbursement_id, creditable_id, creditable_type) FROM stdin;
\.


--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_reimbursement_credits_id_seq', 1, false);


--
-- Data for Name: spree_reimbursement_types; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_reimbursement_types (id, name, active, mutable, created_at, updated_at, type) FROM stdin;
1	original	t	t	2016-04-23 23:18:03.611632	2016-04-23 23:18:03.679075	Spree::ReimbursementType::OriginalPayment
\.


--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_reimbursement_types_id_seq', 1, true);


--
-- Data for Name: spree_reimbursements; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_reimbursements (id, number, reimbursement_status, customer_return_id, order_id, total, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_reimbursements_id_seq', 1, false);


--
-- Data for Name: spree_return_authorization_reasons; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_return_authorization_reasons (id, name, active, mutable, created_at, updated_at) FROM stdin;
1	Better price available	t	t	2016-04-23 23:18:03.260906	2016-04-23 23:18:03.260906
2	Missed estimated delivery date	t	t	2016-04-23 23:18:03.264384	2016-04-23 23:18:03.264384
3	Missing parts or accessories	t	t	2016-04-23 23:18:03.267273	2016-04-23 23:18:03.267273
4	Damaged/Defective	t	t	2016-04-23 23:18:03.270275	2016-04-23 23:18:03.270275
5	Different from what was ordered	t	t	2016-04-23 23:18:03.278224	2016-04-23 23:18:03.278224
6	Different from description	t	t	2016-04-23 23:18:03.287269	2016-04-23 23:18:03.287269
7	No longer needed/wanted	t	t	2016-04-23 23:18:03.293297	2016-04-23 23:18:03.293297
8	Accidental order	t	t	2016-04-23 23:18:03.297579	2016-04-23 23:18:03.297579
9	Unauthorized purchase	t	t	2016-04-23 23:18:03.301165	2016-04-23 23:18:03.301165
\.


--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_return_authorization_reasons_id_seq', 9, true);


--
-- Data for Name: spree_return_authorizations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_return_authorizations (id, number, state, order_id, memo, created_at, updated_at, stock_location_id, return_authorization_reason_id) FROM stdin;
\.


--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_return_authorizations_id_seq', 1, false);


--
-- Data for Name: spree_return_items; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_return_items (id, return_authorization_id, inventory_unit_id, exchange_variant_id, created_at, updated_at, pre_tax_amount, included_tax_total, additional_tax_total, reception_status, acceptance_status, customer_return_id, reimbursement_id, exchange_inventory_unit_id, acceptance_status_errors, preferred_reimbursement_type_id, override_reimbursement_type_id, resellable) FROM stdin;
\.


--
-- Name: spree_return_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_return_items_id_seq', 1, false);


--
-- Data for Name: spree_roles; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_roles (id, name) FROM stdin;
1	admin
2	user
\.


--
-- Name: spree_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_roles_id_seq', 2, true);


--
-- Data for Name: spree_roles_users; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_roles_users (role_id, user_id) FROM stdin;
1	1
\.


--
-- Data for Name: spree_shipments; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_shipments (id, tracking, number, cost, shipped_at, order_id, address_id, state, created_at, updated_at, stock_location_id, adjustment_total, additional_tax_total, promo_total, included_tax_total, pre_tax_amount) FROM stdin;
1	\N	H41012481851	5.00	\N	1	1	pending	2016-04-23 23:18:45.73679	2016-04-23 23:18:46.277464	1	0.00	0.00	0.00	0.00	0.0000
2	\N	H35697705788	5.00	\N	2	1	pending	2016-04-23 23:18:45.806322	2016-04-23 23:18:46.497493	1	0.00	0.00	0.00	0.00	0.0000
\.


--
-- Name: spree_shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_shipments_id_seq', 2, true);


--
-- Data for Name: spree_shipping_categories; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_shipping_categories (id, name, created_at, updated_at) FROM stdin;
1	Бесплатная	2016-04-23 23:18:02.172092	2016-04-27 23:03:54.799705
\.


--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_shipping_categories_id_seq', 1, true);


--
-- Data for Name: spree_shipping_method_categories; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_shipping_method_categories (id, shipping_method_id, shipping_category_id, created_at, updated_at) FROM stdin;
1	1	1	2016-04-23 23:18:20.396069	2016-04-23 23:18:20.396069
2	2	1	2016-04-23 23:18:20.409597	2016-04-23 23:18:20.409597
3	3	1	2016-04-23 23:18:20.423246	2016-04-23 23:18:20.423246
4	4	1	2016-04-23 23:18:20.435776	2016-04-23 23:18:20.435776
5	5	1	2016-04-23 23:18:20.448926	2016-04-23 23:18:20.448926
\.


--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_shipping_method_categories_id_seq', 5, true);


--
-- Data for Name: spree_shipping_methods; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_shipping_methods (id, name, display_on, deleted_at, created_at, updated_at, tracking_url, admin_name, tax_category_id, code) FROM stdin;
1	UPS Ground (USD)	\N	\N	2016-04-23 23:18:20.390591	2016-04-23 23:18:20.390591	\N	\N	\N	\N
2	UPS Two Day (USD)	\N	\N	2016-04-23 23:18:20.405781	2016-04-23 23:18:20.405781	\N	\N	\N	\N
3	UPS One Day (USD)	\N	\N	2016-04-23 23:18:20.418992	2016-04-23 23:18:20.418992	\N	\N	\N	\N
4	UPS Ground (EU)	\N	\N	2016-04-23 23:18:20.431699	2016-04-23 23:18:20.431699	\N	\N	\N	\N
5	UPS Ground (EUR)	\N	\N	2016-04-23 23:18:20.445001	2016-04-23 23:18:20.445001	\N	\N	\N	\N
\.


--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_shipping_methods_id_seq', 5, true);


--
-- Data for Name: spree_shipping_methods_zones; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_shipping_methods_zones (shipping_method_id, zone_id) FROM stdin;
1	2
2	2
3	2
4	1
5	1
\.


--
-- Data for Name: spree_shipping_rates; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_shipping_rates (id, shipment_id, shipping_method_id, selected, cost, created_at, updated_at, tax_rate_id) FROM stdin;
11	1	2	f	10.00	2016-04-23 23:18:46.263938	2016-04-23 23:18:46.263938	\N
12	1	3	f	15.00	2016-04-23 23:18:46.265144	2016-04-23 23:18:46.265144	\N
10	1	1	t	5.00	2016-04-23 23:18:46.262406	2016-04-23 23:18:46.27099	\N
17	2	2	f	10.00	2016-04-23 23:18:46.483965	2016-04-23 23:18:46.483965	\N
18	2	3	f	15.00	2016-04-23 23:18:46.485195	2016-04-23 23:18:46.485195	\N
16	2	1	t	5.00	2016-04-23 23:18:46.482312	2016-04-23 23:18:46.490884	\N
\.


--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_shipping_rates_id_seq', 18, true);


--
-- Data for Name: spree_skrill_transactions; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_skrill_transactions (id, email, amount, currency, transaction_id, customer_id, payment_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_skrill_transactions_id_seq', 1, false);


--
-- Data for Name: spree_slide_locations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_slide_locations (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_slide_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_slide_locations_id_seq', 1, false);


--
-- Data for Name: spree_slide_slide_locations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_slide_slide_locations (id, slide_id, slide_location_id) FROM stdin;
\.


--
-- Name: spree_slide_slide_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_slide_slide_locations_id_seq', 1, false);


--
-- Data for Name: spree_slides; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_slides (id, name, body, link_url, published, image_file_name, image_content_type, image_file_size, image_updated_at, created_at, updated_at, "position", product_id) FROM stdin;
\.


--
-- Name: spree_slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_slides_id_seq', 1, false);


--
-- Data for Name: spree_state_changes; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_state_changes (id, name, previous_state, stateful_id, user_id, stateful_type, next_state, created_at, updated_at) FROM stdin;
1	payment	\N	1	\N	Spree::Order	balance_due	2016-04-23 23:18:46.076421	2016-04-23 23:18:46.076421
2	shipment	\N	1	\N	Spree::Order	pending	2016-04-23 23:18:46.178303	2016-04-23 23:18:46.178303
3	payment	\N	2	\N	Spree::Order	balance_due	2016-04-23 23:18:46.336953	2016-04-23 23:18:46.336953
4	shipment	\N	2	\N	Spree::Order	pending	2016-04-23 23:18:46.412459	2016-04-23 23:18:46.412459
\.


--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_state_changes_id_seq', 4, true);


--
-- Data for Name: spree_states; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_states (id, name, abbr, country_id, updated_at) FROM stdin;
1	Canillo	02	1	\N
2	Encamp	03	1	\N
3	La Massana	04	1	\N
4	Ordino	05	1	\N
5	Sant Julià de Lòria	06	1	\N
6	Andorra la Vella	07	1	\N
7	Escaldes-Engordany	08	1	\N
8	'Ajmān	AJ	2	\N
9	Abū Ȥaby [Abu Dhabi]	AZ	2	\N
10	Dubayy	DU	2	\N
11	Al Fujayrah	FU	2	\N
12	Ra’s al Khaymah	RK	2	\N
13	Ash Shāriqah	SH	2	\N
14	Umm al Qaywayn	UQ	2	\N
15	Balkh	BAL	3	\N
16	Bāmyān	BAM	3	\N
17	Bādghīs	BDG	3	\N
18	Badakhshān	BDS	3	\N
19	Baghlān	BGL	3	\N
20	Dāykundī	DAY	3	\N
21	Farāh	FRA	3	\N
22	Fāryāb	FYB	3	\N
23	Ghaznī	GHA	3	\N
24	Ghōr	GHO	3	\N
25	Helmand	HEL	3	\N
26	Herāt	HER	3	\N
27	Jowzjān	JOW	3	\N
28	Kābul	KAB	3	\N
29	Kandahār	KAN	3	\N
30	Kāpīsā	KAP	3	\N
31	Kunduz	KDZ	3	\N
32	Khōst	KHO	3	\N
33	Kunar	KNR	3	\N
34	Laghmān	LAG	3	\N
35	Lōgar	LOG	3	\N
36	Nangarhār	NAN	3	\N
37	Nīmrōz	NIM	3	\N
38	Nūristān	NUR	3	\N
39	Panjshayr	PAN	3	\N
40	Parwān	PAR	3	\N
41	Paktiyā	PIA	3	\N
42	Paktīkā	PKA	3	\N
43	Samangān	SAM	3	\N
44	Sar-e Pul	SAR	3	\N
45	Takhār	TAK	3	\N
46	Uruzgān	URU	3	\N
47	Wardak	WAR	3	\N
48	Zābul	ZAB	3	\N
49	Saint George	03	4	\N
50	Saint John	04	4	\N
51	Saint Mary	05	4	\N
52	Saint Paul	06	4	\N
53	Saint Peter	07	4	\N
54	Saint Philip	08	4	\N
55	Barbuda	10	4	\N
56	Redonda	11	4	\N
57	Berat	01	6	\N
58	Durrës	02	6	\N
59	Elbasan	03	6	\N
60	Fier	04	6	\N
61	Gjirokastër	05	6	\N
62	Korçë	06	6	\N
63	Kukës	07	6	\N
64	Lezhë	08	6	\N
65	Dibër	09	6	\N
66	Shkodër	10	6	\N
67	Tiranë	11	6	\N
68	Vlorë	12	6	\N
69	Aragacotn	AG	7	\N
70	Ararat	AR	7	\N
71	Armavir	AV	7	\N
72	Erevan	ER	7	\N
73	Gegarkunik'	GR	7	\N
74	Kotayk'	KT	7	\N
75	Lory	LO	7	\N
76	Sirak	SH	7	\N
77	Syunik'	SU	7	\N
78	Tavus	TV	7	\N
79	Vayoc Jor	VD	7	\N
80	Bengo	BGO	8	\N
81	Benguela	BGU	8	\N
82	Bié	BIE	8	\N
83	Cabinda	CAB	8	\N
84	Cuando-Cubango	CCU	8	\N
85	Cunene	CNN	8	\N
86	Cuanza Norte	CNO	8	\N
87	Cuanza Sul	CUS	8	\N
88	Huambo	HUA	8	\N
89	Huíla	HUI	8	\N
90	Lunda Norte	LNO	8	\N
91	Lunda Sul	LSU	8	\N
92	Luanda	LUA	8	\N
93	Malange	MAL	8	\N
94	Moxico	MOX	8	\N
95	Namibe	NAM	8	\N
96	Uíge	UIG	8	\N
97	Zaire	ZAI	8	\N
98	Salta	A	10	\N
99	Buenos Aires	B	10	\N
100	Ciudad Autónoma de Buenos Aires	C	10	\N
101	San Luis	D	10	\N
102	Entre Rios	E	10	\N
103	Santiago del Estero	G	10	\N
104	Chaco	H	10	\N
105	San Juan	J	10	\N
106	Catamarca	K	10	\N
107	La Pampa	L	10	\N
108	Mendoza	M	10	\N
109	Misiones	N	10	\N
110	Formosa	P	10	\N
111	Neuquen	Q	10	\N
112	Rio Negro	R	10	\N
113	Santa Fe	S	10	\N
114	Tucuman	T	10	\N
115	Chubut	U	10	\N
116	Tierra del Fuego	V	10	\N
117	Corrientes	W	10	\N
118	Cordoba	X	10	\N
119	Jujuy	Y	10	\N
120	Santa Cruz	Z	10	\N
121	La Rioja	F	10	\N
122	Burgenland	1	12	\N
123	Kärnten	2	12	\N
124	Niederösterreich	3	12	\N
125	Oberösterreich	4	12	\N
126	Salzburg	5	12	\N
127	Steiermark	6	12	\N
128	Tirol	7	12	\N
129	Vorarlberg	8	12	\N
130	Wien	9	12	\N
131	Australian Capital Territory	ACT	13	\N
132	New South Wales	NSW	13	\N
133	Northern Territory	NT	13	\N
134	Queensland	QLD	13	\N
135	South Australia	SA	13	\N
136	Tasmania	TAS	13	\N
137	Victoria	VIC	13	\N
138	Western Australia	WA	13	\N
139	Abşeron	ABS	16	\N
140	Ağstafa	AGA	16	\N
141	Ağcabədi	AGC	16	\N
142	Ağdam	AGM	16	\N
143	Ağdaş	AGS	16	\N
144	Ağsu	AGU	16	\N
145	Astara	AST	16	\N
146	Bakı	BA	16	\N
147	Balakən	BAL	16	\N
148	Bərdə	BAR	16	\N
149	Beyləqan	BEY	16	\N
150	Biləsuvar	BIL	16	\N
151	Cəbrayıl	CAB	16	\N
152	Cəlilabab	CAL	16	\N
153	Daşkəsən	DAS	16	\N
154	Füzuli	FUZ	16	\N
155	Gəncə	GA	16	\N
156	Gədəbəy	GAD	16	\N
157	Goranboy	GOR	16	\N
158	Göyçay	GOY	16	\N
159	Göygöl	GYG	16	\N
160	Hacıqabul	HAC	16	\N
161	İmişli	IMI	16	\N
162	İsmayıllı	ISM	16	\N
163	Kəlbəcər	KAL	16	\N
164	Kürdəmir	KUR	16	\N
165	Lənkəran	LA	16	\N
166	Laçın	LAC	16	\N
167	Lənkəran	LAN	16	\N
168	Lerik	LER	16	\N
169	Masallı	MAS	16	\N
170	Mingəçevir	MI	16	\N
171	Naftalan	NA	16	\N
172	Neftçala	NEF	16	\N
173	Naxçıvan	NX	16	\N
174	Oğuz	OGU	16	\N
175	Qəbələ	QAB	16	\N
176	Qax	QAX	16	\N
177	Qazax	QAZ	16	\N
178	Quba	QBA	16	\N
179	Qubadlı	QBI	16	\N
180	Qobustan	QOB	16	\N
181	Qusar	QUS	16	\N
182	Şəki	SA	16	\N
183	Sabirabad	SAB	16	\N
184	Şəki	SAK	16	\N
185	Salyan	SAL	16	\N
186	Saatlı	SAT	16	\N
187	Şabran	SBN	16	\N
188	Siyəzən	SIY	16	\N
189	Şəmkir	SKR	16	\N
190	Sumqayıt	SM	16	\N
191	Şamaxı	SMI	16	\N
192	Samux	SMX	16	\N
193	Şirvan	SR	16	\N
194	Şuşa	SUS	16	\N
195	Tərtər	TAR	16	\N
196	Tovuz	TOV	16	\N
197	Ucar	UCA	16	\N
198	Xankəndi	XA	16	\N
199	Xaçmaz	XAC	16	\N
200	Xocalı	XCI	16	\N
201	Xızı	XIZ	16	\N
202	Xocavənd	XVD	16	\N
203	Yardımlı	YAR	16	\N
204	Yevlax	YE	16	\N
205	Yevlax	YEV	16	\N
206	Zəngilan	ZAN	16	\N
207	Zaqatala	ZAQ	16	\N
208	Zərdab	ZAR	16	\N
209	Federacija Bosne i Hercegovine	BIH	17	\N
210	Brčko distrikt	BRC	17	\N
211	Republika Srpska	SRP	17	\N
212	Christ Church	01	18	\N
213	Saint Andrew	02	18	\N
214	Saint George	03	18	\N
215	Saint James	04	18	\N
216	Saint John	05	18	\N
217	Saint Joseph	06	18	\N
218	Saint Lucy	07	18	\N
219	Saint Michael	08	18	\N
220	Saint Peter	09	18	\N
221	Saint Philip	10	18	\N
222	Saint Thomas	11	18	\N
223	Barisal	A	19	\N
224	Chittagong	B	19	\N
225	Dhaka	C	19	\N
226	Khulna	D	19	\N
227	Rajshahi	E	19	\N
228	Rangpur	F	19	\N
229	Sylhet	G	19	\N
230	Bruxelles-Capitale, Région de;Brussels Hoofdstedelijk Gewest	BRU	20	\N
231	Vlaams Gewest	VLG	20	\N
232	wallonne, Région	WAL	20	\N
233	Boucle du Mouhoun	01	21	\N
234	Cascades	02	21	\N
235	Centre	03	21	\N
236	Centre-Est	04	21	\N
237	Centre-Nord	05	21	\N
238	Centre-Ouest	06	21	\N
239	Centre-Sud	07	21	\N
240	Est	08	21	\N
241	Hauts-Bassins	09	21	\N
242	Nord	10	21	\N
243	Plateau-Central	11	21	\N
244	Sahel	12	21	\N
245	Sud-Ouest	13	21	\N
246	Blagoevgrad	01	22	\N
247	Burgas	02	22	\N
248	Varna	03	22	\N
249	Veliko Tarnovo	04	22	\N
250	Vidin	05	22	\N
251	Vratsa	06	22	\N
252	Gabrovo	07	22	\N
253	Dobrich	08	22	\N
254	Kardzhali	09	22	\N
255	Kyustendil	10	22	\N
256	Lovech	11	22	\N
257	Montana	12	22	\N
258	Pazardzhik	13	22	\N
259	Pernik	14	22	\N
260	Pleven	15	22	\N
261	Plovdiv	16	22	\N
262	Razgrad	17	22	\N
263	Ruse	18	22	\N
264	Silistra	19	22	\N
265	Sliven	20	22	\N
266	Smolyan	21	22	\N
267	Sofia-Grad	22	22	\N
268	Sofia	23	22	\N
269	Stara Zagora	24	22	\N
270	Targovishte	25	22	\N
271	Haskovo	26	22	\N
272	Shumen	27	22	\N
273	Yambol	28	22	\N
274	Al Manāmah (Al ‘Āşimah)	13	23	\N
275	Al Janūbīyah	14	23	\N
276	Al Muḩarraq	15	23	\N
277	Al Wusţá	16	23	\N
278	Ash Shamālīyah	17	23	\N
279	Bubanza	BB	24	\N
280	Bujumbura Rural	BL	24	\N
281	Bujumbura Mairie	BM	24	\N
282	Bururi	BR	24	\N
283	Cankuzo	CA	24	\N
284	Cibitoke	CI	24	\N
285	Gitega	GI	24	\N
286	Kirundo	KI	24	\N
287	Karuzi	KR	24	\N
288	Kayanza	KY	24	\N
289	Makamba	MA	24	\N
290	Muramvya	MU	24	\N
291	Mwaro	MW	24	\N
292	Ngozi	NG	24	\N
293	Rutana	RT	24	\N
294	Ruyigi	RY	24	\N
295	Atakora	AK	25	\N
296	Alibori	AL	25	\N
297	Atlantique	AQ	25	\N
298	Borgou	BO	25	\N
299	Collines	CO	25	\N
300	Donga	DO	25	\N
301	Kouffo	KO	25	\N
302	Littoral	LI	25	\N
303	Mono	MO	25	\N
304	Ouémé	OU	25	\N
305	Plateau	PL	25	\N
306	Zou	ZO	25	\N
307	Belait	BE	28	\N
308	Brunei-Muara	BM	28	\N
309	Temburong	TE	28	\N
310	Tutong	TU	28	\N
311	El Beni	B	29	\N
312	Cochabamba	C	29	\N
313	Chuquisaca	H	29	\N
314	La Paz	L	29	\N
315	Pando	N	29	\N
316	Oruro	O	29	\N
317	Potosí	P	29	\N
318	Santa Cruz	S	29	\N
319	Tarija	T	29	\N
320	Bonaire	BO	30	\N
321	Saba	SA	30	\N
322	Sint Eustatius	SE	30	\N
323	Acre	AC	31	\N
324	Alagoas	AL	31	\N
325	Amazonas	AM	31	\N
326	Amapá	AP	31	\N
327	Bahia	BA	31	\N
328	Ceará	CE	31	\N
329	Distrito Federal	DF	31	\N
330	Espírito Santo	ES	31	\N
331	Fernando de Noronha	FN	31	\N
332	Goiás	GO	31	\N
333	Maranhão	MA	31	\N
334	Minas Gerais	MG	31	\N
335	Mato Grosso do Sul	MS	31	\N
336	Mato Grosso	MT	31	\N
337	Pará	PA	31	\N
338	Paraíba	PB	31	\N
339	Pernambuco	PE	31	\N
340	Piauí	PI	31	\N
341	Paraná	PR	31	\N
342	Rio de Janeiro	RJ	31	\N
343	Rio Grande do Norte	RN	31	\N
344	Rondônia	RO	31	\N
345	Roraima	RR	31	\N
346	Rio Grande do Sul	RS	31	\N
347	Santa Catarina	SC	31	\N
348	Sergipe	SE	31	\N
349	São Paulo	SP	31	\N
350	Tocantins	TO	31	\N
351	Acklins	AK	32	\N
352	Bimini	BI	32	\N
353	Black Point	BP	32	\N
354	Berry Islands	BY	32	\N
355	Central Eleuthera	CE	32	\N
356	Cat Island	CI	32	\N
357	Crooked Island and Long Cay	CK	32	\N
358	Central Abaco	CO	32	\N
359	Central Andros	CS	32	\N
360	East Grand Bahama	EG	32	\N
361	Exuma	EX	32	\N
362	City of Freeport	FP	32	\N
363	Grand Cay	GC	32	\N
364	Harbour Island	HI	32	\N
365	Hope Town	HT	32	\N
366	Inagua	IN	32	\N
367	Long Island	LI	32	\N
368	Mangrove Cay	MC	32	\N
369	Mayaguana	MG	32	\N
370	Moore's Island	MI	32	\N
371	North Eleuthera	NE	32	\N
372	North Abaco	NO	32	\N
373	North Andros	NS	32	\N
374	Rum Cay	RC	32	\N
375	Ragged Island	RI	32	\N
376	South Andros	SA	32	\N
377	South Eleuthera	SE	32	\N
378	South Abaco	SO	32	\N
379	San Salvador	SS	32	\N
380	Spanish Wells	SW	32	\N
381	West Grand Bahama	WG	32	\N
382	Paro	11	33	\N
383	Chhukha	12	33	\N
384	Ha	13	33	\N
385	Samtee	14	33	\N
386	Thimphu	15	33	\N
387	Tsirang	21	33	\N
388	Dagana	22	33	\N
389	Punakha	23	33	\N
390	Wangdue Phodrang	24	33	\N
391	Sarpang	31	33	\N
392	Trongsa	32	33	\N
393	Bumthang	33	33	\N
394	Zhemgang	34	33	\N
395	Trashigang	41	33	\N
396	Monggar	42	33	\N
397	Pemagatshel	43	33	\N
398	Lhuentse	44	33	\N
399	Samdrup Jongkha	45	33	\N
400	Gasa	GA	33	\N
401	Trashi Yangtse	TY	33	\N
402	Central	CE	35	\N
403	Ghanzi	GH	35	\N
404	Kgalagadi	KG	35	\N
405	Kgatleng	KL	35	\N
406	Kweneng	KW	35	\N
407	North-East	NE	35	\N
408	North-West	NW	35	\N
409	South-East	SE	35	\N
410	Southern	SO	35	\N
411	Brèsckaja voblasc'	BR	36	\N
412	Horad Minsk	HM	36	\N
413	Homel'skaja voblasc'	HO	36	\N
414	Hrodzenskaja voblasc'	HR	36	\N
415	Mahilëuskaja voblasc'	MA	36	\N
416	Minskaja voblasc'	MI	36	\N
417	Vicebskaja voblasc'	VI	36	\N
418	Belize	BZ	37	\N
419	Cayo	CY	37	\N
420	Corozal	CZL	37	\N
421	Orange Walk	OW	37	\N
422	Stann Creek	SC	37	\N
423	Toledo	TOL	37	\N
424	Alberta	AB	38	\N
425	British Columbia	BC	38	\N
426	Manitoba	MB	38	\N
427	New Brunswick	NB	38	\N
428	Newfoundland and Labrador	NL	38	\N
429	Nova Scotia	NS	38	\N
430	Northwest Territories	NT	38	\N
431	Nunavut	NU	38	\N
432	Ontario	ON	38	\N
433	Prince Edward Island	PE	38	\N
434	Quebec	QC	38	\N
435	Saskatchewan	SK	38	\N
436	Yukon Territory	YT	38	\N
437	Bas-Congo	BC	40	\N
438	Bandundu	BN	40	\N
439	Équateur	EQ	40	\N
440	Katanga	KA	40	\N
441	Kasai-Oriental	KE	40	\N
442	Kinshasa	KN	40	\N
443	Kasai-Occidental	KW	40	\N
444	Maniema	MA	40	\N
445	Nord-Kivu	NK	40	\N
446	Orientale	OR	40	\N
447	Sud-Kivu	SK	40	\N
448	Ouham	AC	41	\N
449	Bamingui-Bangoran	BB	41	\N
450	Bangui	BGF	41	\N
451	Basse-Kotto	BK	41	\N
452	Haute-Kotto	HK	41	\N
453	Haut-Mbomou	HM	41	\N
454	Haute-Sangha / Mambéré-Kadéï	HS	41	\N
455	Gribingui	KB	41	\N
456	Kémo-Gribingui	KG	41	\N
457	Lobaye	LB	41	\N
458	Mbomou	MB	41	\N
459	Ombella-M'poko	MP	41	\N
460	Nana-Mambéré	NM	41	\N
461	Ouham-Pendé	OP	41	\N
462	Sangha	SE	41	\N
463	Ouaka	UK	41	\N
464	Vakaga	VK	41	\N
465	Bouenza	11	42	\N
466	Pool	12	42	\N
467	Sangha	13	42	\N
468	Plateaux	14	42	\N
469	Cuvette-Ouest	15	42	\N
470	Lékoumou	2	42	\N
471	Kouilou	5	42	\N
472	Likouala	7	42	\N
473	Cuvette	8	42	\N
474	Niari	9	42	\N
475	Brazzaville	BZV	42	\N
476	Aargau	AG	43	\N
477	Appenzell Innerrhoden	AI	43	\N
478	Appenzell Ausserrhoden	AR	43	\N
479	Bern	BE	43	\N
480	Basel-Landschaft	BL	43	\N
481	Basel-Stadt	BS	43	\N
482	Fribourg	FR	43	\N
483	Genève	GE	43	\N
484	Glarus	GL	43	\N
485	Graubünden	GR	43	\N
486	Jura	JU	43	\N
487	Luzern	LU	43	\N
488	Neuchâtel	NE	43	\N
489	Nidwalden	NW	43	\N
490	Obwalden	OW	43	\N
491	Sankt Gallen	SG	43	\N
492	Schaffhausen	SH	43	\N
493	Solothurn	SO	43	\N
494	Schwyz	SZ	43	\N
495	Thurgau	TG	43	\N
496	Ticino	TI	43	\N
497	Uri	UR	43	\N
498	Vaud	VD	43	\N
499	Valais	VS	43	\N
500	Zug	ZG	43	\N
501	Zürich	ZH	43	\N
502	Lagunes (Région des)	01	44	\N
503	Haut-Sassandra (Région du)	02	44	\N
504	Savanes (Région des)	03	44	\N
505	Vallée du Bandama (Région de la)	04	44	\N
506	Moyen-Comoé (Région du)	05	44	\N
507	18 Montagnes (Région des)	06	44	\N
508	Lacs (Région des)	07	44	\N
509	Zanzan (Région du)	08	44	\N
510	Bas-Sassandra (Région du)	09	44	\N
511	Denguélé (Région du)	10	44	\N
512	Nzi-Comoé (Région)	11	44	\N
513	Marahoué (Région de la)	12	44	\N
514	Sud-Comoé (Région du)	13	44	\N
515	Worodouqou (Région du)	14	44	\N
516	Sud-Bandama (Région du)	15	44	\N
517	Agnébi (Région de l')	16	44	\N
518	Bafing (Région du)	17	44	\N
519	Fromager (Région du)	18	44	\N
520	Moyen-Cavally (Région du)	19	44	\N
521	Aisén del General Carlos Ibáñez del Campo	AI	46	\N
522	Antofagasta	AN	46	\N
523	Arica y Parinacota	AP	46	\N
524	Araucanía	AR	46	\N
525	Atacama	AT	46	\N
526	Bío-Bío	BI	46	\N
527	Coquimbo	CO	46	\N
528	Libertador General Bernardo O'Higgins	LI	46	\N
529	Los Lagos	LL	46	\N
530	Los Ríos	LR	46	\N
531	Magallanes y Antártica Chilena	MA	46	\N
532	Maule	ML	46	\N
533	Región Metropolitana de Santiago	RM	46	\N
534	Tarapacá	TA	46	\N
535	Valparaíso	VS	46	\N
536	Adamaoua	AD	47	\N
537	Centre	CE	47	\N
538	Far North	EN	47	\N
539	East	ES	47	\N
540	Littoral	LT	47	\N
541	North	NO	47	\N
542	North-West (Cameroon)	NW	47	\N
543	West	OU	47	\N
544	South	SU	47	\N
545	South-West	SW	47	\N
546	Beijing	11	48	\N
547	Tianjin	12	48	\N
548	Hebei	13	48	\N
549	Shanxi	14	48	\N
550	Nei Mongol	15	48	\N
551	Liaoning	21	48	\N
552	Jilin	22	48	\N
553	Heilongjiang	23	48	\N
554	Shanghai	31	48	\N
555	Jiangsu	32	48	\N
556	Zhejiang	33	48	\N
557	Anhui	34	48	\N
558	Fujian	35	48	\N
559	Jiangxi	36	48	\N
560	Shandong	37	48	\N
561	Henan	41	48	\N
562	Hubei	42	48	\N
563	Hunan	43	48	\N
564	Guangdong	44	48	\N
565	Guangxi	45	48	\N
566	Hainan	46	48	\N
567	Chongqing	50	48	\N
568	Sichuan	51	48	\N
569	Guizhou	52	48	\N
570	Yunnan	53	48	\N
571	Xizang	54	48	\N
572	Shaanxi	61	48	\N
573	Gansu	62	48	\N
574	Qinghai	63	48	\N
575	Ningxia	64	48	\N
576	Xinjiang	65	48	\N
577	Taiwan	71	48	\N
578	Xianggang (Hong-Kong)	91	48	\N
579	Aomen (Macau)	92	48	\N
580	Amazonas	AMA	49	\N
581	Antioquia	ANT	49	\N
582	Arauca	ARA	49	\N
583	Atlántico	ATL	49	\N
584	Bolívar	BOL	49	\N
585	Boyacá	BOY	49	\N
586	Caldas	CAL	49	\N
587	Caquetá	CAQ	49	\N
588	Casanare	CAS	49	\N
589	Cauca	CAU	49	\N
590	Cesar	CES	49	\N
591	Chocó	CHO	49	\N
592	Córdoba	COR	49	\N
593	Cundinamarca	CUN	49	\N
594	Distrito Capital de Bogotá	DC	49	\N
595	Guainía	GUA	49	\N
596	Guaviare	GUV	49	\N
597	Huila	HUI	49	\N
598	La Guajira	LAG	49	\N
599	Magdalena	MAG	49	\N
600	Meta	MET	49	\N
601	Nariño	NAR	49	\N
602	Norte de Santander	NSA	49	\N
603	Putumayo	PUT	49	\N
604	Quindío	QUI	49	\N
605	Risaralda	RIS	49	\N
606	Santander	SAN	49	\N
607	San Andrés, Providencia y Santa Catalina	SAP	49	\N
608	Sucre	SUC	49	\N
609	Tolima	TOL	49	\N
610	Valle del Cauca	VAC	49	\N
611	Vaupés	VAU	49	\N
612	Vichada	VID	49	\N
613	Alajuela	A	50	\N
614	Cartago	C	50	\N
615	Guanacaste	G	50	\N
616	Heredia	H	50	\N
617	Limón	L	50	\N
618	Puntarenas	P	50	\N
619	San José	SJ	50	\N
620	Pinar del Rio	01	51	\N
621	La Habana	02	51	\N
622	Ciudad de La Habana	03	51	\N
623	Matanzas	04	51	\N
624	Villa Clara	05	51	\N
625	Cienfuegos	06	51	\N
626	Sancti Spíritus	07	51	\N
627	Ciego de Ávila	08	51	\N
628	Camagüey	09	51	\N
629	Las Tunas	10	51	\N
630	Holguín	11	51	\N
631	Granma	12	51	\N
632	Santiago de Cuba	13	51	\N
633	Guantánamo	14	51	\N
634	Isla de la Juventud	99	51	\N
635	Ilhas de Barlavento	B	52	\N
636	Ilhas de Sotavento	S	52	\N
637	Lefkosía	01	55	\N
638	Lemesós	02	55	\N
639	Lárnaka	03	55	\N
640	Ammóchostos	04	55	\N
641	Páfos	05	55	\N
642	Kerýneia	06	55	\N
643	Jihočeský kraj	JC	56	\N
644	Jihomoravský kraj	JM	56	\N
645	Karlovarský kraj	KA	56	\N
646	Královéhradecký kraj	KR	56	\N
647	Liberecký kraj	LI	56	\N
648	Moravskoslezský kraj	MO	56	\N
649	Olomoucký kraj	OL	56	\N
650	Pardubický kraj	PA	56	\N
651	Plzeňský kraj	PL	56	\N
652	Praha, hlavní město	PR	56	\N
653	Středočeský kraj	ST	56	\N
654	Ústecký kraj	US	56	\N
655	Vysočina	VY	56	\N
656	Zlínský kraj	ZL	56	\N
657	Brandenburg	BB	57	\N
658	Berlin	BE	57	\N
659	Baden-Württemberg	BW	57	\N
660	Bayern	BY	57	\N
661	Bremen	HB	57	\N
662	Hessen	HE	57	\N
663	Hamburg	HH	57	\N
664	Mecklenburg-Vorpommern	MV	57	\N
665	Niedersachsen	NI	57	\N
666	Nordrhein-Westfalen	NW	57	\N
667	Rheinland-Pfalz	RP	57	\N
668	Schleswig-Holstein	SH	57	\N
669	Saarland	SL	57	\N
670	Sachsen	SN	57	\N
671	Sachsen-Anhalt	ST	57	\N
672	Thüringen	TH	57	\N
673	Arta	AR	58	\N
674	Ali Sabieh	AS	58	\N
675	Dikhil	DI	58	\N
676	Djibouti	DJ	58	\N
677	Obock	OB	58	\N
678	Tadjourah	TA	58	\N
679	Nordjylland	81	59	\N
680	Midtjylland	82	59	\N
681	Syddanmark	83	59	\N
682	Hovedstaden	84	59	\N
683	Sjælland	85	59	\N
684	Saint Peter	01	60	\N
685	Saint Andrew	02	60	\N
686	Saint David	03	60	\N
687	Saint George	04	60	\N
688	Saint John	05	60	\N
689	Saint Joseph	06	60	\N
690	Saint Luke	07	60	\N
691	Saint Mark	08	60	\N
692	Saint Patrick	09	60	\N
693	Saint Paul	10	60	\N
694	Distrito Nacional (Santo Domingo)	01	61	\N
695	Azua	02	61	\N
696	Bahoruco	03	61	\N
697	Barahona	04	61	\N
698	Dajabón	05	61	\N
699	Duarte	06	61	\N
700	La Estrelleta [Elías Piña]	07	61	\N
701	El Seybo [El Seibo]	08	61	\N
702	Espaillat	09	61	\N
703	Independencia	10	61	\N
704	La Altagracia	11	61	\N
705	La Romana	12	61	\N
706	La Vega	13	61	\N
707	María Trinidad Sánchez	14	61	\N
708	Monte Cristi	15	61	\N
709	Pedernales	16	61	\N
710	Peravia	17	61	\N
711	Puerto Plata	18	61	\N
712	Salcedo	19	61	\N
713	Samaná	20	61	\N
714	San Cristóbal	21	61	\N
715	San Juan	22	61	\N
716	San Pedro de Macorís	23	61	\N
717	Sánchez Ramírez	24	61	\N
718	Santiago	25	61	\N
719	Santiago Rodríguez	26	61	\N
720	Valverde	27	61	\N
721	Monseñor Nouel	28	61	\N
722	Monte Plata	29	61	\N
723	Hato Mayor	30	61	\N
724	Adrar	01	62	\N
725	Chlef	02	62	\N
726	Laghouat	03	62	\N
727	Oum el Bouaghi	04	62	\N
728	Batna	05	62	\N
729	Béjaïa	06	62	\N
730	Biskra	07	62	\N
731	Béchar	08	62	\N
732	Blida	09	62	\N
733	Bouira	10	62	\N
734	Tamanghasset	11	62	\N
735	Tébessa	12	62	\N
736	Tlemcen	13	62	\N
737	Tiaret	14	62	\N
738	Tizi Ouzou	15	62	\N
739	Alger	16	62	\N
740	Djelfa	17	62	\N
741	Jijel	18	62	\N
742	Sétif	19	62	\N
743	Saïda	20	62	\N
744	Skikda	21	62	\N
745	Sidi Bel Abbès	22	62	\N
746	Annaba	23	62	\N
747	Guelma	24	62	\N
748	Constantine	25	62	\N
749	Médéa	26	62	\N
750	Mostaganem	27	62	\N
751	Msila	28	62	\N
752	Mascara	29	62	\N
753	Ouargla	30	62	\N
754	Oran	31	62	\N
755	El Bayadh	32	62	\N
756	Illizi	33	62	\N
757	Bordj Bou Arréridj	34	62	\N
758	Boumerdès	35	62	\N
759	El Tarf	36	62	\N
760	Tindouf	37	62	\N
761	Tissemsilt	38	62	\N
762	El Oued	39	62	\N
763	Khenchela	40	62	\N
764	Souk Ahras	41	62	\N
765	Tipaza	42	62	\N
766	Mila	43	62	\N
767	Aïn Defla	44	62	\N
768	Naama	45	62	\N
769	Aïn Témouchent	46	62	\N
770	Ghardaïa	47	62	\N
771	Relizane	48	62	\N
772	Azuay	A	63	\N
773	Bolívar	B	63	\N
774	Carchi	C	63	\N
775	Orellana	D	63	\N
776	Esmeraldas	E	63	\N
777	Cañar	F	63	\N
778	Guayas	G	63	\N
779	Chimborazo	H	63	\N
780	Imbabura	I	63	\N
781	Loja	L	63	\N
782	Manabí	M	63	\N
783	Napo	N	63	\N
784	El Oro	O	63	\N
785	Pichincha	P	63	\N
786	Los Ríos	R	63	\N
787	Morona-Santiago	S	63	\N
788	Santo Domingo de los Tsáchilas	SD	63	\N
789	Santa Elena	SE	63	\N
790	Tungurahua	T	63	\N
791	Sucumbíos	U	63	\N
792	Galápagos	W	63	\N
793	Cotopaxi	X	63	\N
794	Pastaza	Y	63	\N
795	Zamora-Chinchipe	Z	63	\N
796	Harjumaa	37	64	\N
797	Hiiumaa	39	64	\N
798	Ida-Virumaa	44	64	\N
799	Jõgevamaa	49	64	\N
800	Järvamaa	51	64	\N
801	Läänemaa	57	64	\N
802	Lääne-Virumaa	59	64	\N
803	Põlvamaa	65	64	\N
804	Pärnumaa	67	64	\N
805	Raplamaa	70	64	\N
806	Saaremaa	74	64	\N
807	Tartumaa	78	64	\N
808	Valgamaa	82	64	\N
809	Viljandimaa	84	64	\N
810	Võrumaa	86	64	\N
811	Al Iskandarīyah	ALX	65	\N
812	Aswān	ASN	65	\N
813	Asyūt	AST	65	\N
814	Al Bahr al Ahmar	BA	65	\N
815	Al Buhayrah	BH	65	\N
816	Banī Suwayf	BNS	65	\N
817	Al Qāhirah	C	65	\N
818	Ad Daqahlīyah	DK	65	\N
819	Dumyāt	DT	65	\N
820	Al Fayyūm	FYM	65	\N
821	Al Gharbīyah	GH	65	\N
822	Al Jīzah	GZ	65	\N
823	Ḩulwān	HU	65	\N
824	Al Ismā`īlīyah	IS	65	\N
825	Janūb Sīnā'	JS	65	\N
826	Al Qalyūbīyah	KB	65	\N
827	Kafr ash Shaykh	KFS	65	\N
828	Qinā	KN	65	\N
829	Al Minyā	MN	65	\N
830	Al Minūfīyah	MNF	65	\N
831	Matrūh	MT	65	\N
832	Būr Sa`īd	PTS	65	\N
833	Sūhāj	SHG	65	\N
834	Ash Sharqīyah	SHR	65	\N
835	Shamal Sīnā'	SIN	65	\N
836	As Sādis min Uktūbar	SU	65	\N
837	As Suways	SUZ	65	\N
838	Al Wādī al Jadīd	WAD	65	\N
839	Ansabā	AN	67	\N
840	Janūbī al Baḩrī al Aḩmar	DK	67	\N
841	Al Janūbī	DU	67	\N
842	Qāsh-Barkah	GB	67	\N
843	Al Awsaţ	MA	67	\N
844	Shimālī al Baḩrī al Aḩmar	SK	67	\N
845	Andalucía	AN	68	\N
846	Aragón	AR	68	\N
847	Asturias, Principado de	AS	68	\N
848	Cantabria	CB	68	\N
849	Ceuta	CE	68	\N
850	Castilla y León	CL	68	\N
851	Castilla-La Mancha	CM	68	\N
852	Canarias	CN	68	\N
853	Catalunya	CT	68	\N
854	Extremadura	EX	68	\N
855	Galicia	GA	68	\N
856	Illes Balears	IB	68	\N
857	Murcia, Región de	MC	68	\N
858	Madrid, Comunidad de	MD	68	\N
859	Melilla	ML	68	\N
860	Navarra, Comunidad Foral de / Nafarroako Foru Komunitatea	NC	68	\N
861	País Vasco / Euskal Herria	PV	68	\N
862	La Rioja	RI	68	\N
863	Valenciana, Comunidad / Valenciana, Comunitat 	VC	68	\N
864	Ādīs Ābeba	AA	69	\N
865	Āfar	AF	69	\N
866	Āmara	AM	69	\N
867	Bīnshangul Gumuz	BE	69	\N
868	Dirē Dawa	DD	69	\N
869	Gambēla Hizboch	GA	69	\N
870	Hārerī Hizb	HA	69	\N
871	Oromīya	OR	69	\N
872	YeDebub Bihēroch Bihēreseboch na Hizboch	SN	69	\N
873	Sumalē	SO	69	\N
874	Tigray	TI	69	\N
875	Ahvenanmaan maakunta	01	70	\N
876	Etelä-Karjala	02	70	\N
877	Etelä-Pohjanmaa	03	70	\N
878	Etelä-Savo	04	70	\N
879	Kainuu	05	70	\N
880	Kanta-Häme	06	70	\N
881	Keski-Pohjanmaa	07	70	\N
882	Keski-Suomi	08	70	\N
883	Kymenlaakso	09	70	\N
884	Lappi	10	70	\N
885	Pirkanmaa	11	70	\N
886	Pohjanmaa	12	70	\N
887	Pohjois-Karjala	13	70	\N
888	Pohjois-Pohjanmaa	14	70	\N
889	Pohjois-Savo	15	70	\N
890	Päijät-Häme	16	70	\N
891	Satakunta	17	70	\N
892	Uusimaa	18	70	\N
893	Varsinais-Suomi	19	70	\N
894	Central	C	71	\N
895	Eastern	E	71	\N
896	Northern	N	71	\N
897	Rotuma	R	71	\N
898	Western	W	71	\N
899	Kosrae	KSA	73	\N
900	Pohnpei	PNI	73	\N
901	Chuuk	TRK	73	\N
902	Yap	YAP	73	\N
903	Alsace	A	75	\N
904	Aquitaine	B	75	\N
905	Saint-Barthélemy	BL	75	\N
906	Auvergne	C	75	\N
907	Clipperton	CP	75	\N
908	Bourgogne	D	75	\N
909	Bretagne	E	75	\N
910	Centre	F	75	\N
911	Champagne-Ardenne	G	75	\N
912	Guyane	GF	75	\N
913	Guadeloupe	GP	75	\N
914	Corse	H	75	\N
915	Franche-Comté	I	75	\N
916	Île-de-France	J	75	\N
917	Languedoc-Roussillon	K	75	\N
918	Limousin	L	75	\N
919	Lorraine	M	75	\N
920	Saint-Martin	MF	75	\N
921	Martinique	MQ	75	\N
922	Midi-Pyrénées	N	75	\N
923	Nouvelle-Calédonie	NC	75	\N
924	Nord-Pas-de-Calais	O	75	\N
925	Basse-Normandie	P	75	\N
926	Polynésie française	PF	75	\N
927	Saint-Pierre-et-Miquelon	PM	75	\N
928	Haute-Normandie	Q	75	\N
929	Pays de la Loire	R	75	\N
930	La Réunion	RE	75	\N
931	Picardie	S	75	\N
932	Poitou-Charentes	T	75	\N
933	Terres australes françaises	TF	75	\N
934	Provence-Alpes-Côte d'Azur	U	75	\N
935	Rhône-Alpes	V	75	\N
936	Wallis-et-Futuna	WF	75	\N
937	Mayotte	YT	75	\N
938	Estuaire	1	76	\N
939	Haut-Ogooué	2	76	\N
940	Moyen-Ogooué	3	76	\N
941	Ngounié	4	76	\N
942	Nyanga	5	76	\N
943	Ogooué-Ivindo	6	76	\N
944	Ogooué-Lolo	7	76	\N
945	Ogooué-Maritime	8	76	\N
946	Woleu-Ntem	9	76	\N
947	Aberdeenshire	ABD	77	\N
948	Aberdeen City	ABE	77	\N
949	Argyll and Bute	AGB	77	\N
950	Isle of Anglesey;Sir Ynys Môn	AGY	77	\N
951	Angus	ANS	77	\N
952	Antrim	ANT	77	\N
953	Ards	ARD	77	\N
954	Armagh	ARM	77	\N
955	Bath and North East Somerset	BAS	77	\N
956	Blackburn with Darwen	BBD	77	\N
957	Bedford	BDF	77	\N
958	Barking and Dagenham	BDG	77	\N
959	Brent	BEN	77	\N
960	Bexley	BEX	77	\N
961	Belfast	BFS	77	\N
962	Bridgend;Pen-y-bont ar Ogwr	BGE	77	\N
963	Blaenau Gwent	BGW	77	\N
964	Birmingham	BIR	77	\N
965	Buckinghamshire	BKM	77	\N
966	Ballymena	BLA	77	\N
967	Ballymoney	BLY	77	\N
968	Bournemouth	BMH	77	\N
969	Banbridge	BNB	77	\N
970	Barnet	BNE	77	\N
971	Brighton and Hove	BNH	77	\N
972	Barnsley	BNS	77	\N
973	Bolton	BOL	77	\N
974	Blackpool	BPL	77	\N
975	Bracknell Forest	BRC	77	\N
976	Bradford	BRD	77	\N
977	Bromley	BRY	77	\N
978	Bristol, City of	BST	77	\N
979	Bury	BUR	77	\N
980	Cambridgeshire	CAM	77	\N
981	Caerphilly;Caerffili	CAY	77	\N
982	Central Bedfordshire	CBF	77	\N
983	Ceredigion;Sir Ceredigion	CGN	77	\N
984	Craigavon	CGV	77	\N
985	Cheshire East	CHE	77	\N
986	Cheshire West and Chester	CHW	77	\N
987	Carrickfergus	CKF	77	\N
988	Cookstown	CKT	77	\N
989	Calderdale	CLD	77	\N
990	Clackmannanshire	CLK	77	\N
991	Coleraine	CLR	77	\N
992	Cumbria	CMA	77	\N
993	Camden	CMD	77	\N
994	Carmarthenshire;Sir Gaerfyrddin	CMN	77	\N
995	Cornwall	CON	77	\N
996	Coventry	COV	77	\N
997	Cardiff;Caerdydd	CRF	77	\N
998	Croydon	CRY	77	\N
999	Castlereagh	CSR	77	\N
1000	Conwy	CWY	77	\N
1001	Darlington	DAL	77	\N
1002	Derbyshire	DBY	77	\N
1003	Denbighshire;Sir Ddinbych	DEN	77	\N
1004	Derby	DER	77	\N
1005	Devon	DEV	77	\N
1006	Dungannon and South Tyrone	DGN	77	\N
1007	Dumfries and Galloway	DGY	77	\N
1008	Doncaster	DNC	77	\N
1009	Dundee City	DND	77	\N
1010	Dorset	DOR	77	\N
1011	Down	DOW	77	\N
1012	Derry	DRY	77	\N
1013	Dudley	DUD	77	\N
1014	Durham, County	DUR	77	\N
1015	Ealing	EAL	77	\N
1016	England and Wales	EAW	77	\N
1017	East Ayrshire	EAY	77	\N
1018	Edinburgh, City of	EDH	77	\N
1019	East Dunbartonshire	EDU	77	\N
1020	East Lothian	ELN	77	\N
1021	Eilean Siar	ELS	77	\N
1022	Enfield	ENF	77	\N
1023	England	ENG	77	\N
1024	East Renfrewshire	ERW	77	\N
1025	East Riding of Yorkshire	ERY	77	\N
1026	Essex	ESS	77	\N
1027	East Sussex	ESX	77	\N
1028	Falkirk	FAL	77	\N
1029	Fermanagh	FER	77	\N
1030	Fife	FIF	77	\N
1031	Flintshire;Sir y Fflint	FLN	77	\N
1032	Gateshead	GAT	77	\N
1033	Great Britain	GBN	77	\N
1034	Glasgow City	GLG	77	\N
1035	Gloucestershire	GLS	77	\N
1036	Greenwich	GRE	77	\N
1037	Gwynedd	GWN	77	\N
1038	Halton	HAL	77	\N
1039	Hampshire	HAM	77	\N
1040	Havering	HAV	77	\N
1041	Hackney	HCK	77	\N
1042	Herefordshire	HEF	77	\N
1043	Hillingdon	HIL	77	\N
1044	Highland	HLD	77	\N
1045	Hammersmith and Fulham	HMF	77	\N
1046	Hounslow	HNS	77	\N
1047	Hartlepool	HPL	77	\N
1048	Hertfordshire	HRT	77	\N
1049	Harrow	HRW	77	\N
1050	Haringey	HRY	77	\N
1051	Isle of Wight	IOW	77	\N
1052	Islington	ISL	77	\N
1053	Inverclyde	IVC	77	\N
1054	Kensington and Chelsea	KEC	77	\N
1055	Kent	KEN	77	\N
1056	Kingston upon Hull	KHL	77	\N
1057	Kirklees	KIR	77	\N
1058	Kingston upon Thames	KTT	77	\N
1059	Knowsley	KWL	77	\N
1060	Lancashire	LAN	77	\N
1061	Lambeth	LBH	77	\N
1062	Leicester	LCE	77	\N
1063	Leeds	LDS	77	\N
1064	Leicestershire	LEC	77	\N
1065	Lewisham	LEW	77	\N
1066	Lincolnshire	LIN	77	\N
1067	Liverpool	LIV	77	\N
1068	Limavady	LMV	77	\N
1069	London, City of	LND	77	\N
1070	Larne	LRN	77	\N
1071	Lisburn	LSB	77	\N
1072	Luton	LUT	77	\N
1073	Manchester	MAN	77	\N
1074	Middlesbrough	MDB	77	\N
1075	Medway	MDW	77	\N
1076	Magherafelt	MFT	77	\N
1077	Milton Keynes	MIK	77	\N
1078	Midlothian	MLN	77	\N
1079	Monmouthshire;Sir Fynwy	MON	77	\N
1080	Merton	MRT	77	\N
1081	Moray	MRY	77	\N
1082	Merthyr Tydfil;Merthyr Tudful	MTY	77	\N
1083	Moyle	MYL	77	\N
1084	North Ayrshire	NAY	77	\N
1085	Northumberland	NBL	77	\N
1086	North Down	NDN	77	\N
1087	North East Lincolnshire	NEL	77	\N
1088	Newcastle upon Tyne	NET	77	\N
1089	Norfolk	NFK	77	\N
1090	Nottingham	NGM	77	\N
1091	Northern Ireland	NIR	77	\N
1092	North Lanarkshire	NLK	77	\N
1093	North Lincolnshire	NLN	77	\N
1094	North Somerset	NSM	77	\N
1095	Newtownabbey	NTA	77	\N
1096	Northamptonshire	NTH	77	\N
1097	Neath Port Talbot;Castell-nedd Port Talbot	NTL	77	\N
1098	Nottinghamshire	NTT	77	\N
1099	North Tyneside	NTY	77	\N
1100	Newham	NWM	77	\N
1101	Newport;Casnewydd	NWP	77	\N
1102	North Yorkshire	NYK	77	\N
1103	Newry and Mourne	NYM	77	\N
1104	Oldham	OLD	77	\N
1105	Omagh	OMH	77	\N
1106	Orkney Islands	ORK	77	\N
1107	Oxfordshire	OXF	77	\N
1108	Pembrokeshire;Sir Benfro	PEM	77	\N
1109	Perth and Kinross	PKN	77	\N
1110	Plymouth	PLY	77	\N
1111	Poole	POL	77	\N
1112	Portsmouth	POR	77	\N
1113	Powys	POW	77	\N
1114	Peterborough	PTE	77	\N
1115	Redcar and Cleveland	RCC	77	\N
1116	Rochdale	RCH	77	\N
1117	Rhondda, Cynon, Taff;Rhondda, Cynon,Taf	RCT	77	\N
1118	Redbridge	RDB	77	\N
1119	Reading	RDG	77	\N
1120	Renfrewshire	RFW	77	\N
1121	Richmond upon Thames	RIC	77	\N
1122	Rotherham	ROT	77	\N
1123	Rutland	RUT	77	\N
1124	Sandwell	SAW	77	\N
1125	South Ayrshire	SAY	77	\N
1126	Scottish Borders, The	SCB	77	\N
1127	Scotland	SCT	77	\N
1128	Suffolk	SFK	77	\N
1129	Sefton	SFT	77	\N
1130	South Gloucestershire	SGC	77	\N
1131	Sheffield	SHF	77	\N
1132	St. Helens	SHN	77	\N
1133	Shropshire	SHR	77	\N
1134	Stockport	SKP	77	\N
1135	Salford	SLF	77	\N
1136	Slough	SLG	77	\N
1137	South Lanarkshire	SLK	77	\N
1138	Sunderland	SND	77	\N
1139	Solihull	SOL	77	\N
1140	Somerset	SOM	77	\N
1141	Southend-on-Sea	SOS	77	\N
1142	Surrey	SRY	77	\N
1143	Strabane	STB	77	\N
1144	Stoke-on-Trent	STE	77	\N
1145	Stirling	STG	77	\N
1146	Southampton	STH	77	\N
1147	Sutton	STN	77	\N
1148	Staffordshire	STS	77	\N
1149	Stockton-on-Tees	STT	77	\N
1150	South Tyneside	STY	77	\N
1151	Swansea;Abertawe	SWA	77	\N
1152	Swindon	SWD	77	\N
1153	Southwark	SWK	77	\N
1154	Tameside	TAM	77	\N
1155	Telford and Wrekin	TFW	77	\N
1156	Thurrock	THR	77	\N
1157	Torbay	TOB	77	\N
1158	Torfaen;Tor-faen	TOF	77	\N
1159	Trafford	TRF	77	\N
1160	Tower Hamlets	TWH	77	\N
1161	United Kingdom	UKM	77	\N
1162	Vale of Glamorgan, The;Bro Morgannwg	VGL	77	\N
1163	Warwickshire	WAR	77	\N
1164	West Berkshire	WBK	77	\N
1165	West Dunbartonshire	WDU	77	\N
1166	Waltham Forest	WFT	77	\N
1167	Wigan	WGN	77	\N
1168	Wakefield	WKF	77	\N
1169	Walsall	WLL	77	\N
1170	West Lothian	WLN	77	\N
1171	Wales	WLS	77	\N
1172	Wolverhampton	WLV	77	\N
1173	Wandsworth	WND	77	\N
1174	Windsor and Maidenhead	WNM	77	\N
1175	Wokingham	WOK	77	\N
1176	Worcestershire	WOR	77	\N
1177	Wirral	WRL	77	\N
1178	Warrington	WRT	77	\N
1179	Wrexham;Wrecsam	WRX	77	\N
1180	Westminster	WSM	77	\N
1181	West Sussex	WSX	77	\N
1182	York	YOR	77	\N
1183	Shetland Islands	ZET	77	\N
1184	Wiltshire	WIL	77	\N
1185	Saint Andrew	01	78	\N
1186	Saint David	02	78	\N
1187	Saint George	03	78	\N
1188	Saint John	04	78	\N
1189	Saint Mark	05	78	\N
1190	Saint Patrick	06	78	\N
1191	Southern Grenadine Islands	10	78	\N
1192	Abkhazia	AB	79	\N
1193	Ajaria	AJ	79	\N
1194	Guria	GU	79	\N
1195	Imeret’i	IM	79	\N
1196	Kakhet’i	KA	79	\N
1197	K’vemo K’art’li	KK	79	\N
1198	Mts’khet’a-Mt’ianet’i	MM	79	\N
1199	Racha-Lech’khumi-K’vemo Svanet’i	RL	79	\N
1200	Samts’khe-Javakhet’i	SJ	79	\N
1201	Shida K’art’li	SK	79	\N
1202	Samegrelo-Zemo Svanet’i	SZ	79	\N
1203	T’bilisi	TB	79	\N
1204	Greater Accra	AA	82	\N
1205	Ashanti	AH	82	\N
1206	Brong-Ahafo	BA	82	\N
1207	Central	CP	82	\N
1208	Eastern	EP	82	\N
1209	Northern	NP	82	\N
1210	Volta	TV	82	\N
1211	Upper East	UE	82	\N
1212	Upper West	UW	82	\N
1213	Western	WP	82	\N
1214	Kommune Kujalleq	KU	84	\N
1215	Qaasuitsup Kommunia	QA	84	\N
1216	Qeqqata Kommunia	QE	84	\N
1217	Kommuneqarfik Sermersooq	SM	84	\N
1218	Banjul	B	85	\N
1219	Lower River	L	85	\N
1220	Central River	M	85	\N
1221	North Bank	N	85	\N
1222	Upper River	U	85	\N
1223	Western	W	85	\N
1224	Boké	B	86	\N
1225	Conakry	C	86	\N
1226	Kindia	D	86	\N
1227	Faranah	F	86	\N
1228	Kankan	K	86	\N
1229	Labé	L	86	\N
1230	Mamou	M	86	\N
1231	Nzérékoré	N	86	\N
1232	Región Continental	C	88	\N
1233	Región Insular	I	88	\N
1234	Agio Oros	69	89	\N
1235	Anatoliki Makedonia kai Thraki	A	89	\N
1236	Kentriki Makedonia	B	89	\N
1237	Dytiki Makedonia	C	89	\N
1238	Ipeiros	D	89	\N
1239	Thessalia	E	89	\N
1240	Ionia Nisia	F	89	\N
1241	Dytiki Ellada	G	89	\N
1242	Sterea Ellada	H	89	\N
1243	Attiki	I	89	\N
1244	Peloponnisos	J	89	\N
1245	Voreio Aigaio	K	89	\N
1246	Notio Aigaio	L	89	\N
1247	Kriti	M	89	\N
1248	Alta Verapaz	AV	91	\N
1249	Baja Verapaz	BV	91	\N
1250	Chimaltenango	CM	91	\N
1251	Chiquimula	CQ	91	\N
1252	Escuintla	ES	91	\N
1253	Guatemala	GU	91	\N
1254	Huehuetenango	HU	91	\N
1255	Izabal	IZ	91	\N
1256	Jalapa	JA	91	\N
1257	Jutiapa	JU	91	\N
1258	Petén	PE	91	\N
1259	El Progreso	PR	91	\N
1260	Quiché	QC	91	\N
1261	Quetzaltenango	QZ	91	\N
1262	Retalhuleu	RE	91	\N
1263	Sacatepéquez	SA	91	\N
1264	San Marcos	SM	91	\N
1265	Sololá	SO	91	\N
1266	Santa Rosa	SR	91	\N
1267	Suchitepéquez	SU	91	\N
1268	Totonicapán	TO	91	\N
1269	Zacapa	ZA	91	\N
1270	Bissau	BS	93	\N
1271	Leste	L	93	\N
1272	Norte	N	93	\N
1273	Sul	S	93	\N
1274	Barima-Waini	BA	94	\N
1275	Cuyuni-Mazaruni	CU	94	\N
1276	Demerara-Mahaica	DE	94	\N
1277	East Berbice-Corentyne	EB	94	\N
1278	Essequibo Islands-West Demerara	ES	94	\N
1279	Mahaica-Berbice	MA	94	\N
1280	Pomeroon-Supenaam	PM	94	\N
1281	Potaro-Siparuni	PT	94	\N
1282	Upper Demerara-Berbice	UD	94	\N
1283	Upper Takutu-Upper Essequibo	UT	94	\N
1284	Atlántida	AT	97	\N
1285	Choluteca	CH	97	\N
1286	Colón	CL	97	\N
1287	Comayagua	CM	97	\N
1288	Copán	CP	97	\N
1289	Cortés	CR	97	\N
1290	El Paraíso	EP	97	\N
1291	Francisco Morazán	FM	97	\N
1292	Gracias a Dios	GD	97	\N
1293	Islas de la Bahía	IB	97	\N
1294	Intibucá	IN	97	\N
1295	Lempira	LE	97	\N
1296	La Paz	LP	97	\N
1297	Ocotepeque	OC	97	\N
1298	Olancho	OL	97	\N
1299	Santa Bárbara	SB	97	\N
1300	Valle	VA	97	\N
1301	Yoro	YO	97	\N
1302	Zagrebačka županija	01	98	\N
1303	Krapinsko-zagorska županija	02	98	\N
1304	Sisačko-moslavačka županija	03	98	\N
1305	Karlovačka županija	04	98	\N
1306	Varaždinska županija	05	98	\N
1307	Koprivničko-križevačka županija	06	98	\N
1308	Bjelovarsko-bilogorska županija	07	98	\N
1309	Primorsko-goranska županija	08	98	\N
1310	Ličko-senjska županija	09	98	\N
1311	Virovitičko-podravska županija	10	98	\N
1312	Požeško-slavonska županija	11	98	\N
1313	Brodsko-posavska županija	12	98	\N
1314	Zadarska županija	13	98	\N
1315	Osječko-baranjska županija	14	98	\N
1316	Šibensko-kninska županija	15	98	\N
1317	Vukovarsko-srijemska županija	16	98	\N
1318	Splitsko-dalmatinska županija	17	98	\N
1319	Istarska županija	18	98	\N
1320	Dubrovačko-neretvanska županija	19	98	\N
1321	Međimurska županija	20	98	\N
1322	Grad Zagreb	21	98	\N
1323	Artibonite	AR	99	\N
1324	Centre	CE	99	\N
1325	Grande-Anse	GA	99	\N
1326	Nord	ND	99	\N
1327	Nord-Est	NE	99	\N
1328	Nord-Ouest	NO	99	\N
1329	Ouest	OU	99	\N
1330	Sud	SD	99	\N
1331	Sud-Est	SE	99	\N
1332	Baranya	BA	100	\N
1333	Békéscsaba	BC	100	\N
1334	Békés	BE	100	\N
1335	Bács-Kiskun	BK	100	\N
1336	Budapest	BU	100	\N
1337	Borsod-Abaúj-Zemplén	BZ	100	\N
1338	Csongrád	CS	100	\N
1339	Debrecen	DE	100	\N
1340	Dunaújváros	DU	100	\N
1341	Eger	EG	100	\N
1342	Érd	ER	100	\N
1343	Fejér	FE	100	\N
1344	Győr-Moson-Sopron	GS	100	\N
1345	Győr	GY	100	\N
1346	Hajdú-Bihar	HB	100	\N
1347	Heves	HE	100	\N
1348	Hódmezővásárhely	HV	100	\N
1349	Jász-Nagykun-Szolnok	JN	100	\N
1350	Komárom-Esztergom	KE	100	\N
1351	Kecskemét	KM	100	\N
1352	Kaposvár	KV	100	\N
1353	Miskolc	MI	100	\N
1354	Nagykanizsa	NK	100	\N
1355	Nógrád	NO	100	\N
1356	Nyíregyháza	NY	100	\N
1357	Pest	PE	100	\N
1358	Pécs	PS	100	\N
1359	Szeged	SD	100	\N
1360	Székesfehérvár	SF	100	\N
1361	Szombathely	SH	100	\N
1362	Szolnok	SK	100	\N
1363	Sopron	SN	100	\N
1364	Somogy	SO	100	\N
1365	Szekszárd	SS	100	\N
1366	Salgótarján	ST	100	\N
1367	Szabolcs-Szatmár-Bereg	SZ	100	\N
1368	Tatabánya	TB	100	\N
1369	Tolna	TO	100	\N
1370	Vas	VA	100	\N
1371	Veszprém (county)	VE	100	\N
1372	Veszprém	VM	100	\N
1373	Zala	ZA	100	\N
1374	Zalaegerszeg	ZE	100	\N
1375	Papua	IJ	101	\N
1376	Jawa	JW	101	\N
1377	Kalimantan	KA	101	\N
1378	Maluku	ML	101	\N
1379	Nusa Tenggara	NU	101	\N
1380	Sulawesi	SL	101	\N
1381	Sumatera	SM	101	\N
1382	Connacht	C	102	\N
1383	Leinster	L	102	\N
1384	Munster	M	102	\N
1385	Ulster	U	102	\N
1386	HaDarom	D	103	\N
1387	Hefa	HA	103	\N
1388	Yerushalayim Al Quds	JM	103	\N
1389	HaMerkaz	M	103	\N
1390	Tel-Aviv	TA	103	\N
1391	HaZafon	Z	103	\N
1392	Andaman and Nicobar Islands	AN	105	\N
1393	Andhra Pradesh	AP	105	\N
1394	Arunachal Pradesh	AR	105	\N
1395	Assam	AS	105	\N
1396	Bihar	BR	105	\N
1397	Chandigarh	CH	105	\N
1398	Chhattisgarh	CT	105	\N
1399	Damen and Diu	DD	105	\N
1400	Delhi	DL	105	\N
1401	Dadra and Nagar Haveli	DN	105	\N
1402	Goa	GA	105	\N
1403	Gujarat	GJ	105	\N
1404	Himachal Pradesh	HP	105	\N
1405	Haryana	HR	105	\N
1406	Jharkhand	JH	105	\N
1407	Jammu and Kashmir	JK	105	\N
1408	Karnataka	KA	105	\N
1409	Kerala	KL	105	\N
1410	Lakshadweep	LD	105	\N
1411	Maharashtra	MH	105	\N
1412	Meghalaya	ML	105	\N
1413	Manipur	MN	105	\N
1414	Madhya Pradesh	MP	105	\N
1415	Mizoram	MZ	105	\N
1416	Nagaland	NL	105	\N
1417	Orissa	OR	105	\N
1418	Punjab	PB	105	\N
1419	Puducherry	PY	105	\N
1420	Rajasthan	RJ	105	\N
1421	Sikkim	SK	105	\N
1422	Tamil Nadu	TN	105	\N
1423	Tripura	TR	105	\N
1424	Uttar Pradesh	UP	105	\N
1425	Uttarakhand	UT	105	\N
1426	West Bengal	WB	105	\N
1427	Al Anbar	AN	107	\N
1428	Arbil	AR	107	\N
1429	Al Basrah	BA	107	\N
1430	Babil	BB	107	\N
1431	Baghdad	BG	107	\N
1432	Dahuk	DA	107	\N
1433	Diyala	DI	107	\N
1434	Dhi Qar	DQ	107	\N
1435	Karbala'	KA	107	\N
1436	Maysan	MA	107	\N
1437	Al Muthanna	MU	107	\N
1438	An Najef	NA	107	\N
1439	Ninawa	NI	107	\N
1440	Al Qadisiyah	QA	107	\N
1441	Salah ad Din	SD	107	\N
1442	As Sulaymaniyah	SW	107	\N
1443	At Ta'mim	TS	107	\N
1444	Wasit	WA	107	\N
1445	Āzarbāyjān-e Sharqī	01	108	\N
1446	Āzarbāyjān-e Gharbī	02	108	\N
1447	Ardabīl	03	108	\N
1448	Eşfahān	04	108	\N
1449	Īlām	05	108	\N
1450	Būshehr	06	108	\N
1451	Tehrān	07	108	\N
1452	Chahār Mahāll va Bakhtīārī	08	108	\N
1453	Khūzestān	10	108	\N
1454	Zanjān	11	108	\N
1455	Semnān	12	108	\N
1456	Sīstān va Balūchestān	13	108	\N
1457	Fārs	14	108	\N
1458	Kermān	15	108	\N
1459	Kordestān	16	108	\N
1460	Kermānshāh	17	108	\N
1461	Kohgīlūyeh va Būyer Ahmad	18	108	\N
1462	Gīlān	19	108	\N
1463	Lorestān	20	108	\N
1464	Māzandarān	21	108	\N
1465	Markazī	22	108	\N
1466	Hormozgān	23	108	\N
1467	Hamadān	24	108	\N
1468	Yazd	25	108	\N
1469	Qom	26	108	\N
1470	Golestān	27	108	\N
1471	Qazvīn	28	108	\N
1472	Khorāsān-e Janūbī	29	108	\N
1473	Khorāsān-e Razavī	30	108	\N
1474	Khorāsān-e Shemālī	31	108	\N
1475	Reykjavík	0	109	\N
1476	Höfuðborgarsvæðið	1	109	\N
1477	Suðurnes	2	109	\N
1478	Vesturland	3	109	\N
1479	Vestfirðir	4	109	\N
1480	Norðurland vestra	5	109	\N
1481	Norðurland eystra	6	109	\N
1482	Austurland	7	109	\N
1483	Suðurland	8	109	\N
1484	Piemonte	21	110	\N
1485	Valle d'Aosta	23	110	\N
1486	Lombardia	25	110	\N
1487	Trentino-Alto Adige	32	110	\N
1488	Veneto	34	110	\N
1489	Friuli-Venezia Giulia	36	110	\N
1490	Liguria	42	110	\N
1491	Emilia-Romagna	45	110	\N
1492	Toscana	52	110	\N
1493	Umbria	55	110	\N
1494	Marche	57	110	\N
1495	Lazio	62	110	\N
1496	Abruzzo	65	110	\N
1497	Molise	67	110	\N
1498	Campania	72	110	\N
1499	Puglia	75	110	\N
1500	Basilicata	77	110	\N
1501	Calabria	78	110	\N
1502	Sicilia	82	110	\N
1503	Sardegna	88	110	\N
1504	Kingston	01	112	\N
1505	Saint Andrew	02	112	\N
1506	Saint Thomas	03	112	\N
1507	Portland	04	112	\N
1508	Saint Mary	05	112	\N
1509	Saint Ann	06	112	\N
1510	Trelawny	07	112	\N
1511	Saint James	08	112	\N
1512	Hanover	09	112	\N
1513	Westmoreland	10	112	\N
1514	Saint Elizabeth	11	112	\N
1515	Manchester	12	112	\N
1516	Clarendon	13	112	\N
1517	Saint Catherine	14	112	\N
1518	‘Ajlūn	AJ	113	\N
1519	‘Ammān (Al ‘Aşimah)	AM	113	\N
1520	Al ‘Aqabah	AQ	113	\N
1521	Aţ Ţafīlah	AT	113	\N
1522	Az Zarqā'	AZ	113	\N
1523	Al Balqā'	BA	113	\N
1524	Irbid	IR	113	\N
1525	Jarash	JA	113	\N
1526	Al Karak	KA	113	\N
1527	Al Mafraq	MA	113	\N
1528	Mādabā	MD	113	\N
1529	Ma‘ān	MN	113	\N
1530	Hokkaido	01	114	\N
1531	Aomori	02	114	\N
1532	Iwate	03	114	\N
1533	Miyagi	04	114	\N
1534	Akita	05	114	\N
1535	Yamagata	06	114	\N
1536	Fukushima	07	114	\N
1537	Ibaraki	08	114	\N
1538	Tochigi	09	114	\N
1539	Gunma	10	114	\N
1540	Saitama	11	114	\N
1541	Chiba	12	114	\N
1542	Tokyo	13	114	\N
1543	Kanagawa	14	114	\N
1544	Niigata	15	114	\N
1545	Toyama	16	114	\N
1546	Ishikawa	17	114	\N
1547	Fukui	18	114	\N
1548	Yamanashi	19	114	\N
1549	Nagano	20	114	\N
1550	Gifu	21	114	\N
1551	Shizuoka	22	114	\N
1552	Aichi	23	114	\N
1553	Mie	24	114	\N
1554	Shiga	25	114	\N
1555	Kyoto	26	114	\N
1556	Osaka	27	114	\N
1557	Hyogo	28	114	\N
1558	Nara	29	114	\N
1559	Wakayama	30	114	\N
1560	Tottori	31	114	\N
1561	Shimane	32	114	\N
1562	Okayama	33	114	\N
1563	Hiroshima	34	114	\N
1564	Yamaguchi	35	114	\N
1565	Tokushima	36	114	\N
1566	Kagawa	37	114	\N
1567	Ehime	38	114	\N
1568	Kochi	39	114	\N
1569	Fukuoka	40	114	\N
1570	Saga	41	114	\N
1571	Nagasaki	42	114	\N
1572	Kumamoto	43	114	\N
1573	Oita	44	114	\N
1574	Miyazaki	45	114	\N
1575	Kagoshima	46	114	\N
1576	Okinawa	47	114	\N
1577	Nairobi Municipality	110	115	\N
1578	Central	200	115	\N
1579	Coast	300	115	\N
1580	Eastern	400	115	\N
1581	North-Eastern Kaskazini Mashariki	500	115	\N
1582	Rift Valley	700	115	\N
1583	Western Magharibi	800	115	\N
1584	Batken	B	116	\N
1585	Chü	C	116	\N
1586	Bishkek	GB	116	\N
1587	Jalal-Abad	J	116	\N
1588	Naryn	N	116	\N
1589	Osh	O	116	\N
1590	Talas	T	116	\N
1591	Ysyk-Köl	Y	116	\N
1592	Banteay Mean Chey	1	117	\N
1593	Krachoh	10	117	\N
1594	Mondol Kiri	11	117	\N
1595	Phnom Penh	12	117	\N
1596	Preah Vihear	13	117	\N
1597	Prey Veaeng	14	117	\N
1598	Pousaat	15	117	\N
1599	Rotanak Kiri	16	117	\N
1600	Siem Reab	17	117	\N
1601	Krong Preah Sihanouk	18	117	\N
1602	Stueng Traeng	19	117	\N
1603	Battambang	2	117	\N
1604	Svaay Rieng	20	117	\N
1605	Taakaev	21	117	\N
1606	Otdar Mean Chey	22	117	\N
1607	Krong Kaeb	23	117	\N
1608	Krong Pailin	24	117	\N
1609	Kampong Cham	3	117	\N
1610	Kampong Chhnang	4	117	\N
1611	Kampong Speu	5	117	\N
1612	Kampong Thom	6	117	\N
1613	Kampot	7	117	\N
1614	Kandal	8	117	\N
1615	Kach Kong	9	117	\N
1616	Gilbert Islands	G	118	\N
1617	Line Islands	L	118	\N
1618	Phoenix Islands	P	118	\N
1619	Andjouân (Anjwān)	A	119	\N
1620	Andjazîdja (Anjazījah)	G	119	\N
1621	Moûhîlî (Mūhīlī)	M	119	\N
1622	Saint Kitts	K	120	\N
1623	Nevis	N	120	\N
1624	P’yŏngyang	01	121	\N
1625	P’yŏngan-namdo	02	121	\N
1626	P’yŏngan-bukto	03	121	\N
1627	Chagang-do	04	121	\N
1628	Hwanghae-namdo	05	121	\N
1629	Hwanghae-bukto	06	121	\N
1630	Kangwŏn-do	07	121	\N
1631	Hamgyŏng-namdo	08	121	\N
1632	Hamgyŏng-bukto	09	121	\N
1633	Yanggang-do	10	121	\N
1634	Nasŏn (Najin-Sŏnbong)	13	121	\N
1635	Seoul Teugbyeolsi	11	122	\N
1636	Busan Gwang'yeogsi	26	122	\N
1637	Daegu Gwang'yeogsi	27	122	\N
1638	Incheon Gwang'yeogsi	28	122	\N
1639	Gwangju Gwang'yeogsi	29	122	\N
1640	Daejeon Gwang'yeogsi	30	122	\N
1641	Ulsan Gwang'yeogsi	31	122	\N
1642	Gyeonggido	41	122	\N
1643	Gang'weondo	42	122	\N
1644	Chungcheongbukdo	43	122	\N
1645	Chungcheongnamdo	44	122	\N
1646	Jeonrabukdo	45	122	\N
1647	Jeonranamdo	46	122	\N
1648	Gyeongsangbukdo	47	122	\N
1649	Gyeongsangnamdo	48	122	\N
1650	Jejudo	49	122	\N
1651	Al Ahmadi	AH	123	\N
1652	Al Farwānīyah	FA	123	\N
1653	Hawallī	HA	123	\N
1654	Al Jahrrā’	JA	123	\N
1655	Al Kuwayt (Al ‘Āşimah)	KU	123	\N
1656	Mubārak al Kabīr	MU	123	\N
1657	Aqmola oblysy	AKM	125	\N
1658	Aqtöbe oblysy	AKT	125	\N
1659	Almaty	ALA	125	\N
1660	Almaty oblysy	ALM	125	\N
1661	Astana	AST	125	\N
1662	Atyraū oblysy	ATY	125	\N
1663	Qaraghandy oblysy	KAR	125	\N
1664	Qostanay oblysy	KUS	125	\N
1665	Qyzylorda oblysy	KZY	125	\N
1666	Mangghystaū oblysy	MAN	125	\N
1667	Pavlodar oblysy	PAV	125	\N
1668	Soltüstik Quzaqstan oblysy	SEV	125	\N
1669	Shyghys Qazaqstan oblysy	VOS	125	\N
1670	Ongtüstik Qazaqstan oblysy	YUZ	125	\N
1671	Batys Quzaqstan oblysy	ZAP	125	\N
1672	Zhambyl oblysy	ZHA	125	\N
1673	Attapu	AT	126	\N
1674	Bokèo	BK	126	\N
1675	Bolikhamxai	BL	126	\N
1676	Champasak	CH	126	\N
1677	Houaphan	HO	126	\N
1678	Khammouan	KH	126	\N
1679	Louang Namtha	LM	126	\N
1680	Louangphabang	LP	126	\N
1681	Oudômxai	OU	126	\N
1682	Phôngsali	PH	126	\N
1683	Salavan	SL	126	\N
1684	Savannakhét	SV	126	\N
1685	Vientiane	VI	126	\N
1686	Vientiane	VT	126	\N
1687	Xaignabouli	XA	126	\N
1688	Xékong	XE	126	\N
1689	Xiangkhoang	XI	126	\N
1690	Xiasômboun	XN	126	\N
1691	Aakkâr	AK	127	\N
1692	Liban-Nord	AS	127	\N
1693	Beyrouth	BA	127	\N
1694	Baalbek-Hermel	BH	127	\N
1695	Béqaa	BI	127	\N
1696	Liban-Sud	JA	127	\N
1697	Mont-Liban	JL	127	\N
1698	Nabatîyé	NA	127	\N
1699	Balzers	01	129	\N
1700	Eschen	02	129	\N
1701	Gamprin	03	129	\N
1702	Mauren	04	129	\N
1703	Planken	05	129	\N
1704	Ruggell	06	129	\N
1705	Schaan	07	129	\N
1706	Schellenberg	08	129	\N
1707	Triesen	09	129	\N
1708	Triesenberg	10	129	\N
1709	Vaduz	11	129	\N
1710	Basnāhira paḷāta	1	130	\N
1711	Madhyama paḷāta	2	130	\N
1712	Dakuṇu paḷāta	3	130	\N
1713	Uturu paḷāta	4	130	\N
1714	Næ̆gĕnahira paḷāta	5	130	\N
1715	Vayamba paḷāta	6	130	\N
1716	Uturumæ̆da paḷāta	7	130	\N
1717	Ūva paḷāta	8	130	\N
1718	Sabaragamuva paḷāta	9	130	\N
1719	Bong	BG	131	\N
1720	Bomi	BM	131	\N
1721	Grand Cape Mount	CM	131	\N
1722	Grand Bassa	GB	131	\N
1723	Grand Gedeh	GG	131	\N
1724	Grand Kru	GK	131	\N
1725	Lofa	LO	131	\N
1726	Margibi	MG	131	\N
1727	Montserrado	MO	131	\N
1728	Maryland	MY	131	\N
1729	Nimba	NI	131	\N
1730	Rivercess	RI	131	\N
1731	Sinoe	SI	131	\N
1732	Maseru	A	132	\N
1733	Butha-Buthe	B	132	\N
1734	Leribe	C	132	\N
1735	Berea	D	132	\N
1736	Mafeteng	E	132	\N
1737	Mohale's Hoek	F	132	\N
1738	Quthing	G	132	\N
1739	Qacha's Nek	H	132	\N
1740	Mokhotlong	J	132	\N
1741	Thaba-Tseka	K	132	\N
1742	Alytaus Apskritis	AL	133	\N
1743	Klaipėdos Apskritis	KL	133	\N
1744	Kauno Apskritis	KU	133	\N
1745	Marijampolės Apskritis	MR	133	\N
1746	Panevėžio Apskritis	PN	133	\N
1747	Šiaulių Apskritis	SA	133	\N
1748	Tauragés Apskritis	TA	133	\N
1749	Telšių Apskritis	TE	133	\N
1750	Utenos Apskritis	UT	133	\N
1751	Vilniaus Apskritis	VL	133	\N
1752	Diekirch	D	134	\N
1753	Grevenmacher	G	134	\N
1754	Luxembourg	L	134	\N
1755	Aglonas novads	001	135	\N
1756	Aizkraukles novads	002	135	\N
1757	Aizputes novads	003	135	\N
1758	Aknīstes novads	004	135	\N
1759	Alojas novads	005	135	\N
1760	Alsungas novads	006	135	\N
1761	Alūksnes novads	007	135	\N
1762	Amatas novads	008	135	\N
1763	Apes novads	009	135	\N
1764	Auces novads	010	135	\N
1765	Ādažu novads	011	135	\N
1766	Babītes novads	012	135	\N
1767	Baldones novads	013	135	\N
1768	Baltinavas novads	014	135	\N
1769	Balvu novads	015	135	\N
1770	Bauskas novads	016	135	\N
1771	Beverīnas novads	017	135	\N
1772	Brocēnu novads	018	135	\N
1773	Burtnieku novads	019	135	\N
1774	Carnikavas novads	020	135	\N
1775	Cesvaines novads	021	135	\N
1776	Cēsu novads	022	135	\N
1777	Ciblas novads	023	135	\N
1778	Dagdas novads	024	135	\N
1779	Daugavpils novads	025	135	\N
1780	Dobeles novads	026	135	\N
1781	Dundagas novads	027	135	\N
1782	Durbes novads	028	135	\N
1783	Engures novads	029	135	\N
1784	Ērgļu novads	030	135	\N
1785	Garkalnes novads	031	135	\N
1786	Grobiņas novads	032	135	\N
1787	Gulbenes novads	033	135	\N
1788	Iecavas novads	034	135	\N
1789	Ikšķiles novads	035	135	\N
1790	Ilūkstes novads	036	135	\N
1791	Inčukalna novads	037	135	\N
1792	Jaunjelgavas novads	038	135	\N
1793	Jaunpiebalgas novads	039	135	\N
1794	Jaunpils novads	040	135	\N
1795	Jelgavas novads	041	135	\N
1796	Jēkabpils novads	042	135	\N
1797	Kandavas novads	043	135	\N
1798	Kārsavas novads	044	135	\N
1799	Kocēnu novads	045	135	\N
1800	Kokneses novads	046	135	\N
1801	Krāslavas novads	047	135	\N
1802	Krimuldas novads	048	135	\N
1803	Krustpils novads	049	135	\N
1804	Kuldīgas novads	050	135	\N
1805	Ķeguma novads	051	135	\N
1806	Ķekavas novads	052	135	\N
1807	Lielvārdes novads	053	135	\N
1808	Limbažu novads	054	135	\N
1809	Līgatnes novads	055	135	\N
1810	Līvānu novads	056	135	\N
1811	Lubānas novads	057	135	\N
1812	Ludzas novads	058	135	\N
1813	Madonas novads	059	135	\N
1814	Mazsalacas novads	060	135	\N
1815	Mālpils novads	061	135	\N
1816	Mārupes novads	062	135	\N
1817	Mērsraga novads	063	135	\N
1818	Naukšēnu novads	064	135	\N
1819	Neretas novads	065	135	\N
1820	Nīcas novads	066	135	\N
1821	Ogres novads	067	135	\N
1822	Olaines novads	068	135	\N
1823	Ozolnieku novads	069	135	\N
1824	Pārgaujas novads	070	135	\N
1825	Pāvilostas novads	071	135	\N
1826	Pļaviņu novads	072	135	\N
1827	Preiļu novads	073	135	\N
1828	Priekules novads	074	135	\N
1829	Priekuļu novads	075	135	\N
1830	Raunas novads	076	135	\N
1831	Rēzeknes novads	077	135	\N
1832	Riebiņu novads	078	135	\N
1833	Rojas novads	079	135	\N
1834	Ropažu novads	080	135	\N
1835	Rucavas novads	081	135	\N
1836	Rugāju novads	082	135	\N
1837	Rundāles novads	083	135	\N
1838	Rūjienas novads	084	135	\N
1839	Salas novads	085	135	\N
1840	Salacgrīvas novads	086	135	\N
1841	Salaspils novads	087	135	\N
1842	Saldus novads	088	135	\N
1843	Saulkrastu novads	089	135	\N
1844	Sējas novads	090	135	\N
1845	Siguldas novads	091	135	\N
1846	Skrīveru novads	092	135	\N
1847	Skrundas novads	093	135	\N
1848	Smiltenes novads	094	135	\N
1849	Stopiņu novads	095	135	\N
1850	Strenču novads	096	135	\N
1851	Talsu novads	097	135	\N
1852	Tērvetes novads	098	135	\N
1853	Tukuma novads	099	135	\N
1854	Vaiņodes novads	100	135	\N
1855	Valkas novads	101	135	\N
1856	Varakļānu novads	102	135	\N
1857	Vārkavas novads	103	135	\N
1858	Vecpiebalgas novads	104	135	\N
1859	Vecumnieku novads	105	135	\N
1860	Ventspils novads	106	135	\N
1861	Viesītes novads	107	135	\N
1862	Viļakas novads	108	135	\N
1863	Viļānu novads	109	135	\N
1864	Zilupes novads	110	135	\N
1865	Daugavpils	DGV	135	\N
1866	Jelgava	JEL	135	\N
1867	Jēkabpils	JKB	135	\N
1868	Jūrmala	JUR	135	\N
1869	Liepāja	LPX	135	\N
1870	Rēzekne	REZ	135	\N
1871	Rīga	RIX	135	\N
1872	Ventspils	VEN	135	\N
1873	Valmiera	VMR	135	\N
1874	Banghāzī	BA	136	\N
1875	Al Buţnān	BU	136	\N
1876	Darnah	DR	136	\N
1877	Ghāt	GT	136	\N
1878	Al Jabal al Akhḑar	JA	136	\N
1879	Jaghbūb	JB	136	\N
1880	Al Jabal al Gharbī	JG	136	\N
1881	Al Jifārah	JI	136	\N
1882	Al Jufrah	JU	136	\N
1883	Al Kufrah	KF	136	\N
1884	Al Marqab	MB	136	\N
1885	Mişrātah	MI	136	\N
1886	Al Marj	MJ	136	\N
1887	Murzuq	MQ	136	\N
1888	Nālūt	NL	136	\N
1889	An Nuqaţ al Khams	NQ	136	\N
1890	Sabhā	SB	136	\N
1891	Surt	SR	136	\N
1892	Ţarābulus	TB	136	\N
1893	Al Wāḩāt	WA	136	\N
1894	Wādī al Ḩayāt	WD	136	\N
1895	Wādī ash Shāţiʾ	WS	136	\N
1896	Az Zāwiyah	ZA	136	\N
1897	Tanger-Tétouan	01	137	\N
1898	Gharb-Chrarda-Beni Hssen	02	137	\N
1899	Taza-Al Hoceima-Taounate	03	137	\N
1900	L'Oriental	04	137	\N
1901	Fès-Boulemane	05	137	\N
1902	Meknès-Tafilalet	06	137	\N
1903	Rabat-Salé-Zemmour-Zaer	07	137	\N
1904	Grand Casablanca	08	137	\N
1905	Chaouia-Ouardigha	09	137	\N
1906	Doukhala-Abda	10	137	\N
1907	Marrakech-Tensift-Al Haouz	11	137	\N
1908	Tadla-Azilal	12	137	\N
1909	Sous-Massa-Draa	13	137	\N
1910	Guelmim-Es Smara	14	137	\N
1911	Laâyoune-Boujdour-Sakia el Hamra	15	137	\N
1912	Oued ed Dahab-Lagouira	16	137	\N
1913	La Colle	CL	138	\N
1914	La Condamine	CO	138	\N
1915	Fontvieille	FO	138	\N
1916	La Gare	GA	138	\N
1917	Jardin Exotique	JE	138	\N
1918	Larvotto	LA	138	\N
1919	Malbousquet	MA	138	\N
1920	Monte-Carlo	MC	138	\N
1921	Moneghetti	MG	138	\N
1922	Monaco-Ville	MO	138	\N
1923	Moulins	MU	138	\N
1924	Port-Hercule	PH	138	\N
1925	Sainte-Dévote	SD	138	\N
1926	La Source	SO	138	\N
1927	Spélugues	SP	138	\N
1928	Saint-Roman	SR	138	\N
1929	Vallon de la Rousse	VR	138	\N
1930	Anenii Noi	AN	139	\N
1931	Bălți	BA	139	\N
1932	Tighina	BD	139	\N
1933	Briceni	BR	139	\N
1934	Basarabeasca	BS	139	\N
1935	Cahul	CA	139	\N
1936	Călărași	CL	139	\N
1937	Cimișlia	CM	139	\N
1938	Criuleni	CR	139	\N
1939	Căușeni	CS	139	\N
1940	Cantemir	CT	139	\N
1941	Chișinău	CU	139	\N
1942	Dondușeni	DO	139	\N
1943	Drochia	DR	139	\N
1944	Dubăsari	DU	139	\N
1945	Edineț	ED	139	\N
1946	Fălești	FA	139	\N
1947	Florești	FL	139	\N
1948	Găgăuzia, Unitatea teritorială autonomă	GA	139	\N
1949	Glodeni	GL	139	\N
1950	Hîncești	HI	139	\N
1951	Ialoveni	IA	139	\N
1952	Leova	LE	139	\N
1953	Nisporeni	NI	139	\N
1954	Ocnița	OC	139	\N
1955	Orhei	OR	139	\N
1956	Rezina	RE	139	\N
1957	Rîșcani	RI	139	\N
1958	Șoldănești	SD	139	\N
1959	Sîngerei	SI	139	\N
1960	Stînga Nistrului, unitatea teritorială din	SN	139	\N
1961	Soroca	SO	139	\N
1962	Strășeni	ST	139	\N
1963	Ștefan Vodă	SV	139	\N
1964	Taraclia	TA	139	\N
1965	Telenești	TE	139	\N
1966	Ungheni	UN	139	\N
1967	Andrijevica	01	140	\N
1968	Bar	02	140	\N
1969	Berane	03	140	\N
1970	Bijelo Polje	04	140	\N
1971	Budva	05	140	\N
1972	Cetinje	06	140	\N
1973	Danilovgrad	07	140	\N
1974	Herceg-Novi	08	140	\N
1975	Kolašin	09	140	\N
1976	Kotor	10	140	\N
1977	Mojkovac	11	140	\N
1978	Nikšić	12	140	\N
1979	Plav	13	140	\N
1980	Pljevlja	14	140	\N
1981	Plužine	15	140	\N
1982	Podgorica	16	140	\N
1983	Rožaje	17	140	\N
1984	Šavnik	18	140	\N
1985	Tivat	19	140	\N
1986	Ulcinj	20	140	\N
1987	Žabljak	21	140	\N
1988	Toamasina	A	142	\N
1989	Antsiranana	D	142	\N
1990	Fianarantsoa	F	142	\N
1991	Mahajanga	M	142	\N
1992	Antananarivo	T	142	\N
1993	Toliara	U	142	\N
1994	Ralik chain	L	143	\N
1995	Ratak chain	T	143	\N
1996	Aerodrom	01	144	\N
1997	Aračinovo	02	144	\N
1998	Berovo	03	144	\N
1999	Bitola	04	144	\N
2000	Bogdanci	05	144	\N
2001	Bogovinje	06	144	\N
2002	Bosilovo	07	144	\N
2003	Brvenica	08	144	\N
2004	Butel	09	144	\N
2005	Valandovo	10	144	\N
2006	Vasilevo	11	144	\N
2007	Vevčani	12	144	\N
2008	Veles	13	144	\N
2009	Vinica	14	144	\N
2010	Vraneštica	15	144	\N
2011	Vrapčište	16	144	\N
2012	Gazi Baba	17	144	\N
2013	Gevgelija	18	144	\N
2014	Gostivar	19	144	\N
2015	Gradsko	20	144	\N
2016	Debar	21	144	\N
2017	Debarca	22	144	\N
2018	Delčevo	23	144	\N
2019	Demir Kapija	24	144	\N
2020	Demir Hisar	25	144	\N
2021	Dojran	26	144	\N
2022	Dolneni	27	144	\N
2023	Drugovo	28	144	\N
2024	Gjorče Petrov	29	144	\N
2025	Želino	30	144	\N
2026	Zajas	31	144	\N
2027	Zelenikovo	32	144	\N
2028	Zrnovci	33	144	\N
2029	Ilinden	34	144	\N
2030	Jegunovce	35	144	\N
2031	Kavadarci	36	144	\N
2032	Karbinci	37	144	\N
2033	Karpoš	38	144	\N
2034	Kisela Voda	39	144	\N
2035	Kičevo	40	144	\N
2036	Konče	41	144	\N
2037	Kočani	42	144	\N
2038	Kratovo	43	144	\N
2039	Kriva Palanka	44	144	\N
2040	Krivogaštani	45	144	\N
2041	Kruševo	46	144	\N
2042	Kumanovo	47	144	\N
2043	Lipkovo	48	144	\N
2044	Lozovo	49	144	\N
2045	Mavrovo-i-Rostuša	50	144	\N
2046	Makedonska Kamenica	51	144	\N
2047	Makedonski Brod	52	144	\N
2048	Mogila	53	144	\N
2049	Negotino	54	144	\N
2050	Novaci	55	144	\N
2051	Novo Selo	56	144	\N
2052	Oslomej	57	144	\N
2053	Ohrid	58	144	\N
2054	Petrovec	59	144	\N
2055	Pehčevo	60	144	\N
2056	Plasnica	61	144	\N
2057	Prilep	62	144	\N
2058	Probištip	63	144	\N
2059	Radoviš	64	144	\N
2060	Rankovce	65	144	\N
2061	Resen	66	144	\N
2062	Rosoman	67	144	\N
2063	Saraj	68	144	\N
2064	Sveti Nikole	69	144	\N
2065	Sopište	70	144	\N
2066	Staro Nagoričane	71	144	\N
2067	Struga	72	144	\N
2068	Strumica	73	144	\N
2069	Studeničani	74	144	\N
2070	Tearce	75	144	\N
2071	Tetovo	76	144	\N
2072	Centar	77	144	\N
2073	Centar Župa	78	144	\N
2074	Čair	79	144	\N
2075	Čaška	80	144	\N
2076	Češinovo-Obleševo	81	144	\N
2077	Čučer Sandevo	82	144	\N
2078	Štip	83	144	\N
2079	Šuto Orizari	84	144	\N
2080	Kayes	1	145	\N
2081	Koulikoro	2	145	\N
2082	Sikasso	3	145	\N
2083	Ségou	4	145	\N
2084	Mopti	5	145	\N
2085	Tombouctou	6	145	\N
2086	Gao	7	145	\N
2087	Kidal	8	145	\N
2088	Bamako	BK0	145	\N
2089	Sagaing	01	146	\N
2090	Bago	02	146	\N
2091	Magway	03	146	\N
2092	Mandalay	04	146	\N
2093	Tanintharyi	05	146	\N
2094	Yangon	06	146	\N
2095	Ayeyarwady	07	146	\N
2096	Kachin	11	146	\N
2097	Kayah	12	146	\N
2098	Kayin	13	146	\N
2099	Chin	14	146	\N
2100	Mon	15	146	\N
2101	Rakhine	16	146	\N
2102	Shan	17	146	\N
2103	Orhon	035	147	\N
2104	Darhan uul	037	147	\N
2105	Hentiy	039	147	\N
2106	Hövsgöl	041	147	\N
2107	Hovd	043	147	\N
2108	Uvs	046	147	\N
2109	Töv	047	147	\N
2110	Selenge	049	147	\N
2111	Sühbaatar	051	147	\N
2112	Ömnögovi	053	147	\N
2113	Övörhangay	055	147	\N
2114	Dzavhan	057	147	\N
2115	Dundgovi	059	147	\N
2116	Dornod	061	147	\N
2117	Dornogovi	063	147	\N
2118	Govi-Sumber	064	147	\N
2119	Govi-Altay	065	147	\N
2120	Bulgan	067	147	\N
2121	Bayanhongor	069	147	\N
2122	Bayan-Ölgiy	071	147	\N
2123	Arhangay	073	147	\N
2124	Ulanbaatar	1	147	\N
2125	Hodh ech Chargui	01	151	\N
2126	Hodh el Charbi	02	151	\N
2127	Assaba	03	151	\N
2128	Gorgol	04	151	\N
2129	Brakna	05	151	\N
2130	Trarza	06	151	\N
2131	Adrar	07	151	\N
2132	Dakhlet Nouadhibou	08	151	\N
2133	Tagant	09	151	\N
2134	Guidimaka	10	151	\N
2135	Tiris Zemmour	11	151	\N
2136	Inchiri	12	151	\N
2137	Nouakchott	NKC	151	\N
2138	Attard	01	153	\N
2139	Balzan	02	153	\N
2140	Birgu	03	153	\N
2141	Birkirkara	04	153	\N
2142	Birżebbuġa	05	153	\N
2143	Bormla	06	153	\N
2144	Dingli	07	153	\N
2145	Fgura	08	153	\N
2146	Floriana	09	153	\N
2147	Fontana	10	153	\N
2148	Gudja	11	153	\N
2149	Gżira	12	153	\N
2150	Għajnsielem	13	153	\N
2151	Għarb	14	153	\N
2152	Għargħur	15	153	\N
2153	Għasri	16	153	\N
2154	Għaxaq	17	153	\N
2155	Ħamrun	18	153	\N
2156	Iklin	19	153	\N
2157	Isla	20	153	\N
2158	Kalkara	21	153	\N
2159	Kerċem	22	153	\N
2160	Kirkop	23	153	\N
2161	Lija	24	153	\N
2162	Luqa	25	153	\N
2163	Marsa	26	153	\N
2164	Marsaskala	27	153	\N
2165	Marsaxlokk	28	153	\N
2166	Mdina	29	153	\N
2167	Mellieħa	30	153	\N
2168	Mġarr	31	153	\N
2169	Mosta	32	153	\N
2170	Mqabba	33	153	\N
2171	Msida	34	153	\N
2172	Mtarfa	35	153	\N
2173	Munxar	36	153	\N
2174	Nadur	37	153	\N
2175	Naxxar	38	153	\N
2176	Paola	39	153	\N
2177	Pembroke	40	153	\N
2178	Pietà	41	153	\N
2179	Qala	42	153	\N
2180	Qormi	43	153	\N
2181	Qrendi	44	153	\N
2182	Rabat Għawdex	45	153	\N
2183	Rabat Malta	46	153	\N
2184	Safi	47	153	\N
2185	San Ġiljan	48	153	\N
2186	San Ġwann	49	153	\N
2187	San Lawrenz	50	153	\N
2188	San Pawl il-Baħar	51	153	\N
2189	Sannat	52	153	\N
2190	Santa Luċija	53	153	\N
2191	Santa Venera	54	153	\N
2192	Siġġiewi	55	153	\N
2193	Sliema	56	153	\N
2194	Swieqi	57	153	\N
2195	Ta’ Xbiex	58	153	\N
2196	Tarxien	59	153	\N
2197	Valletta	60	153	\N
2198	Xagħra	61	153	\N
2199	Xewkija	62	153	\N
2200	Xgħajra	63	153	\N
2201	Żabbar	64	153	\N
2202	Żebbuġ Għawdex	65	153	\N
2203	Żebbuġ Malta	66	153	\N
2204	Żejtun	67	153	\N
2205	Żurrieq	68	153	\N
2206	Agalega Islands	AG	154	\N
2207	Black River	BL	154	\N
2208	Beau Bassin-Rose Hill	BR	154	\N
2209	Cargados Carajos Shoals	CC	154	\N
2210	Curepipe	CU	154	\N
2211	Flacq	FL	154	\N
2212	Grand Port	GP	154	\N
2213	Moka	MO	154	\N
2214	Pamplemousses	PA	154	\N
2215	Port Louis	PL	154	\N
2216	Port Louis	PU	154	\N
2217	Plaines Wilhems	PW	154	\N
2218	Quatre Bornes	QB	154	\N
2219	Rodrigues Island	RO	154	\N
2220	Rivière du Rempart	RP	154	\N
2221	Savanne	SA	154	\N
2222	Vacoas-Phoenix	VP	154	\N
2223	Central	CE	155	\N
2224	Male	MLE	155	\N
2225	North Central	NC	155	\N
2226	North	NO	155	\N
2227	South Central	SC	155	\N
2228	South	SU	155	\N
2229	Upper North	UN	155	\N
2230	Upper South	US	155	\N
2231	Central Region	C	156	\N
2232	Northern Region	N	156	\N
2233	Southern Region	S	156	\N
2234	Aguascalientes	AGU	157	\N
2235	Baja California	BCN	157	\N
2236	Baja California Sur	BCS	157	\N
2237	Campeche	CAM	157	\N
2238	Chihuahua	CHH	157	\N
2239	Chiapas	CHP	157	\N
2240	Coahuila	COA	157	\N
2241	Colima	COL	157	\N
2242	Distrito Federal	DIF	157	\N
2243	Durango	DUR	157	\N
2244	Guerrero	GRO	157	\N
2245	Guanajuato	GUA	157	\N
2246	Hidalgo	HID	157	\N
2247	Jalisco	JAL	157	\N
2248	México	MEX	157	\N
2249	Michoacán	MIC	157	\N
2250	Morelos	MOR	157	\N
2251	Nayarit	NAY	157	\N
2252	Nuevo León	NLE	157	\N
2253	Oaxaca	OAX	157	\N
2254	Puebla	PUE	157	\N
2255	Querétaro	QUE	157	\N
2256	Quintana Roo	ROO	157	\N
2257	Sinaloa	SIN	157	\N
2258	San Luis Potosí	SLP	157	\N
2259	Sonora	SON	157	\N
2260	Tabasco	TAB	157	\N
2261	Tamaulipas	TAM	157	\N
2262	Tlaxcala	TLA	157	\N
2263	Veracruz	VER	157	\N
2264	Yucatán	YUC	157	\N
2265	Zacatecas	ZAC	157	\N
2266	Johor	01	158	\N
2267	Kedah	02	158	\N
2268	Kelantan	03	158	\N
2269	Melaka	04	158	\N
2270	Negeri Sembilan	05	158	\N
2271	Pahang	06	158	\N
2272	Pulau Pinang	07	158	\N
2273	Perak	08	158	\N
2274	Perlis	09	158	\N
2275	Selangor	10	158	\N
2276	Terengganu	11	158	\N
2277	Sabah	12	158	\N
2278	Sarawak	13	158	\N
2279	Wilayah Persekutuan Kuala Lumpur	14	158	\N
2280	Wilayah Persekutuan Labuan	15	158	\N
2281	Wilayah Persekutuan Putrajaya	16	158	\N
2282	Niassa	A	159	\N
2283	Manica	B	159	\N
2284	Gaza	G	159	\N
2285	Inhambane	I	159	\N
2286	Maputo	L	159	\N
2287	Maputo (city)	MPM	159	\N
2288	Numpula	N	159	\N
2289	Cabo Delgado	P	159	\N
2290	Zambezia	Q	159	\N
2291	Sofala	S	159	\N
2292	Tete	T	159	\N
2293	Caprivi	CA	160	\N
2294	Erongo	ER	160	\N
2295	Hardap	HA	160	\N
2296	Karas	KA	160	\N
2297	Khomas	KH	160	\N
2298	Kunene	KU	160	\N
2299	Otjozondjupa	OD	160	\N
2300	Omaheke	OH	160	\N
2301	Okavango	OK	160	\N
2302	Oshana	ON	160	\N
2303	Omusati	OS	160	\N
2304	Oshikoto	OT	160	\N
2305	Ohangwena	OW	160	\N
2306	Agadez	1	162	\N
2307	Diffa	2	162	\N
2308	Dosso	3	162	\N
2309	Maradi	4	162	\N
2310	Tahoua	5	162	\N
2311	Tillabéri	6	162	\N
2312	Zinder	7	162	\N
2313	Niamey	8	162	\N
2314	Abia	AB	164	\N
2315	Adamawa	AD	164	\N
2316	Akwa Ibom	AK	164	\N
2317	Anambra	AN	164	\N
2318	Bauchi	BA	164	\N
2319	Benue	BE	164	\N
2320	Borno	BO	164	\N
2321	Bayelsa	BY	164	\N
2322	Cross River	CR	164	\N
2323	Delta	DE	164	\N
2324	Ebonyi	EB	164	\N
2325	Edo	ED	164	\N
2326	Ekiti	EK	164	\N
2327	Enugu	EN	164	\N
2328	Abuja Capital Territory	FC	164	\N
2329	Gombe	GO	164	\N
2330	Imo	IM	164	\N
2331	Jigawa	JI	164	\N
2332	Kaduna	KD	164	\N
2333	Kebbi	KE	164	\N
2334	Kano	KN	164	\N
2335	Kogi	KO	164	\N
2336	Katsina	KT	164	\N
2337	Kwara	KW	164	\N
2338	Lagos	LA	164	\N
2339	Nassarawa	NA	164	\N
2340	Niger	NI	164	\N
2341	Ogun	OG	164	\N
2342	Ondo	ON	164	\N
2343	Osun	OS	164	\N
2344	Oyo	OY	164	\N
2345	Plateau	PL	164	\N
2346	Rivers	RI	164	\N
2347	Sokoto	SO	164	\N
2348	Taraba	TA	164	\N
2349	Yobe	YO	164	\N
2350	Zamfara	ZA	164	\N
2351	Atlántico Norte	AN	165	\N
2352	Atlántico Sur	AS	165	\N
2353	Boaco	BO	165	\N
2354	Carazo	CA	165	\N
2355	Chinandega	CI	165	\N
2356	Chontales	CO	165	\N
2357	Estelí	ES	165	\N
2358	Granada	GR	165	\N
2359	Jinotega	JI	165	\N
2360	León	LE	165	\N
2361	Madriz	MD	165	\N
2362	Managua	MN	165	\N
2363	Masaya	MS	165	\N
2364	Matagalpa	MT	165	\N
2365	Nueva Segovia	NS	165	\N
2366	Rivas	RI	165	\N
2367	Río San Juan	SJ	165	\N
2368	Aruba	AW	166	\N
2369	Bonaire	BQ1	166	\N
2370	Saba	BQ2	166	\N
2371	Sint Eustatius	BQ3	166	\N
2372	Curaçao	CW	166	\N
2373	Drenthe	DR	166	\N
2374	Flevoland	FL	166	\N
2375	Friesland	FR	166	\N
2376	Gelderland	GE	166	\N
2377	Groningen	GR	166	\N
2378	Limburg	LI	166	\N
2379	Noord-Brabant	NB	166	\N
2380	Noord-Holland	NH	166	\N
2381	Overijssel	OV	166	\N
2382	Sint Maarten	SX	166	\N
2383	Utrecht	UT	166	\N
2384	Zeeland	ZE	166	\N
2385	Zuid-Holland	ZH	166	\N
2386	Østfold	01	167	\N
2387	Akershus	02	167	\N
2388	Oslo	03	167	\N
2389	Hedmark	04	167	\N
2390	Oppland	05	167	\N
2391	Buskerud	06	167	\N
2392	Vestfold	07	167	\N
2393	Telemark	08	167	\N
2394	Aust-Agder	09	167	\N
2395	Vest-Agder	10	167	\N
2396	Rogaland	11	167	\N
2397	Hordaland	12	167	\N
2398	Sogn og Fjordane	14	167	\N
2399	Møre og Romsdal	15	167	\N
2400	Sør-Trøndelag	16	167	\N
2401	Nord-Trøndelag	17	167	\N
2402	Nordland	18	167	\N
2403	Troms	19	167	\N
2404	Finnmark	20	167	\N
2405	Svalbard (Arctic Region)	21	167	\N
2406	Jan Mayen (Arctic Region)	22	167	\N
2407	Madhyamanchal	1	168	\N
2408	Madhya Pashchimanchal	2	168	\N
2409	Pashchimanchal	3	168	\N
2410	Purwanchal	4	168	\N
2411	Sudur Pashchimanchal	5	168	\N
2412	Aiwo	01	169	\N
2413	Anabar	02	169	\N
2414	Anetan	03	169	\N
2415	Anibare	04	169	\N
2416	Baiti	05	169	\N
2417	Boe	06	169	\N
2418	Buada	07	169	\N
2419	Denigomodu	08	169	\N
2420	Ewa	09	169	\N
2421	Ijuw	10	169	\N
2422	Meneng	11	169	\N
2423	Nibok	12	169	\N
2424	Uaboe	13	169	\N
2425	Yaren	14	169	\N
2426	Chatham Islands Territory	CIT	171	\N
2427	North Island	N	171	\N
2428	South Island	S	171	\N
2429	Al Bāţinah	BA	172	\N
2430	Al Buraymī	BU	172	\N
2431	Ad Dākhilīya	DA	172	\N
2432	Masqaţ	MA	172	\N
2433	Musandam	MU	172	\N
2434	Ash Sharqīyah	SH	172	\N
2435	Al Wusţá	WU	172	\N
2436	Az̧ Z̧āhirah	ZA	172	\N
2437	Z̧ufār	ZU	172	\N
2438	Bocas del Toro	1	173	\N
2439	Coclé	2	173	\N
2440	Colón	3	173	\N
2441	Chiriquí	4	173	\N
2442	Darién	5	173	\N
2443	Herrera	6	173	\N
2444	Los Santos	7	173	\N
2445	Panamá	8	173	\N
2446	Veraguas	9	173	\N
2447	Emberá	EM	173	\N
2448	Kuna Yala	KY	173	\N
2449	Ngöbe-Buglé	NB	173	\N
2450	Amazonas	AMA	174	\N
2451	Ancash	ANC	174	\N
2452	Apurímac	APU	174	\N
2453	Arequipa	ARE	174	\N
2454	Ayacucho	AYA	174	\N
2455	Cajamarca	CAJ	174	\N
2456	El Callao	CAL	174	\N
2457	Cusco [Cuzco]	CUS	174	\N
2458	Huánuco	HUC	174	\N
2459	Huancavelica	HUV	174	\N
2460	Ica	ICA	174	\N
2461	Junín	JUN	174	\N
2462	La Libertad	LAL	174	\N
2463	Lambayeque	LAM	174	\N
2464	Lima	LIM	174	\N
2465	Municipalidad Metropolitana de Lima	LMA	174	\N
2466	Loreto	LOR	174	\N
2467	Madre de Dios	MDD	174	\N
2468	Moquegua	MOQ	174	\N
2469	Pasco	PAS	174	\N
2470	Piura	PIU	174	\N
2471	Puno	PUN	174	\N
2472	San Martín	SAM	174	\N
2473	Tacna	TAC	174	\N
2474	Tumbes	TUM	174	\N
2475	Ucayali	UCA	174	\N
2476	Chimbu	CPK	176	\N
2477	Central	CPM	176	\N
2478	East New Britain	EBR	176	\N
2479	Eastern Highlands	EHG	176	\N
2480	Enga	EPW	176	\N
2481	East Sepik	ESW	176	\N
2482	Gulf	GPK	176	\N
2483	Milne Bay	MBA	176	\N
2484	Morobe	MPL	176	\N
2485	Madang	MPM	176	\N
2486	Manus	MRL	176	\N
2487	National Capital District (Port Moresby)	NCD	176	\N
2488	New Ireland	NIK	176	\N
2489	Northern	NPP	176	\N
2490	Bougainville	NSB	176	\N
2491	Sandaun	SAN	176	\N
2492	Southern Highlands	SHM	176	\N
2493	West New Britain	WBK	176	\N
2494	Western Highlands	WHM	176	\N
2495	Western	WPD	176	\N
2496	National Capital Region	00	177	\N
2497	Ilocos (Region I)	01	177	\N
2498	Cagayan Valley (Region II)	02	177	\N
2499	Central Luzon (Region III)	03	177	\N
2500	Bicol (Region V)	05	177	\N
2501	Western Visayas (Region VI)	06	177	\N
2502	Central Visayas (Region VII)	07	177	\N
2503	Eastern Visayas (Region VIII)	08	177	\N
2504	Zamboanga Peninsula (Region IX)	09	177	\N
2505	Northern Mindanao (Region X)	10	177	\N
2506	Davao (Region XI)	11	177	\N
2507	Soccsksargen (Region XII)	12	177	\N
2508	Caraga (Region XIII)	13	177	\N
2509	Autonomous Region in Muslim Mindanao (ARMM)	14	177	\N
2510	Cordillera Administrative Region (CAR)	15	177	\N
2511	CALABARZON (Region IV-A)	40	177	\N
2512	MIMAROPA (Region IV-B)	41	177	\N
2513	Balochistan	BA	178	\N
2514	Gilgit-Baltistan	GB	178	\N
2515	Islamabad	IS	178	\N
2516	Azad Kashmir	JK	178	\N
2517	Khyber Pakhtunkhwa	KP	178	\N
2518	Punjab	PB	178	\N
2519	Sindh	SD	178	\N
2520	Federally Administered Tribal Areas	TA	178	\N
2521	Dolnośląskie	DS	179	\N
2522	Kujawsko-pomorskie	KP	179	\N
2523	Lubuskie	LB	179	\N
2524	Łódzkie	LD	179	\N
2525	Lubelskie	LU	179	\N
2526	Małopolskie	MA	179	\N
2527	Mazowieckie	MZ	179	\N
2528	Opolskie	OP	179	\N
2529	Podlaskie	PD	179	\N
2530	Podkarpackie	PK	179	\N
2531	Pomorskie	PM	179	\N
2532	Świętokrzyskie	SK	179	\N
2533	Śląskie	SL	179	\N
2534	Warmińsko-mazurskie	WN	179	\N
2535	Wielkopolskie	WP	179	\N
2536	Zachodniopomorskie	ZP	179	\N
2537	Bethlehem	BTH	182	\N
2538	Deir El Balah	DEB	182	\N
2539	Gaza	GZA	182	\N
2540	Hebron	HBN	182	\N
2541	Jerusalem	JEM	182	\N
2542	Jenin	JEN	182	\N
2543	Jericho - Al Aghwar	JRH	182	\N
2544	Khan Yunis	KYS	182	\N
2545	Nablus	NBS	182	\N
2546	North Gaza	NGZ	182	\N
2547	Qalqilya	QQA	182	\N
2548	Ramallah	RBH	182	\N
2549	Rafah	RFH	182	\N
2550	Salfit	SLT	182	\N
2551	Tubas	TBS	182	\N
2552	Tulkarm	TKM	182	\N
2553	Aveiro	01	183	\N
2554	Beja	02	183	\N
2555	Braga	03	183	\N
2556	Bragança	04	183	\N
2557	Castelo Branco	05	183	\N
2558	Coimbra	06	183	\N
2559	Évora	07	183	\N
2560	Faro	08	183	\N
2561	Guarda	09	183	\N
2562	Leiria	10	183	\N
2563	Lisboa	11	183	\N
2564	Portalegre	12	183	\N
2565	Porto	13	183	\N
2566	Santarém	14	183	\N
2567	Setúbal	15	183	\N
2568	Viana do Castelo	16	183	\N
2569	Vila Real	17	183	\N
2570	Viseu	18	183	\N
2571	Região Autónoma dos Açores	20	183	\N
2572	Região Autónoma da Madeira	30	183	\N
2573	Aimeliik	002	184	\N
2574	Airai	004	184	\N
2575	Angaur	010	184	\N
2576	Hatobohei	050	184	\N
2577	Kayangel	100	184	\N
2578	Koror	150	184	\N
2579	Melekeok	212	184	\N
2580	Ngaraard	214	184	\N
2581	Ngarchelong	218	184	\N
2582	Ngardmau	222	184	\N
2583	Ngatpang	224	184	\N
2584	Ngchesar	226	184	\N
2585	Ngeremlengui	227	184	\N
2586	Ngiwal	228	184	\N
2587	Peleliu	350	184	\N
2588	Sonsorol	370	184	\N
2589	Concepción	1	185	\N
2590	Alto Paraná	10	185	\N
2591	Central	11	185	\N
2592	Ñeembucú	12	185	\N
2593	Amambay	13	185	\N
2594	Canindeyú	14	185	\N
2595	Presidente Hayes	15	185	\N
2596	Alto Paraguay	16	185	\N
2597	Boquerón	19	185	\N
2598	San Pedro	2	185	\N
2599	Cordillera	3	185	\N
2600	Guairá	4	185	\N
2601	Caaguazú	5	185	\N
2602	Caazapá	6	185	\N
2603	Itapúa	7	185	\N
2604	Misiones	8	185	\N
2605	Paraguarí	9	185	\N
2606	Asunción	ASU	185	\N
2607	Ad Dawhah	DA	186	\N
2608	Al Khawr wa adh Dhakhīrah	KH	186	\N
2609	Ash Shamal	MS	186	\N
2610	Ar Rayyan	RA	186	\N
2611	Umm Salal	US	186	\N
2612	Al Wakrah	WA	186	\N
2613	Az̧ Z̧a‘āyin	ZA	186	\N
2614	Alba	AB	188	\N
2615	Argeș	AG	188	\N
2616	Arad	AR	188	\N
2617	București	B	188	\N
2618	Bacău	BC	188	\N
2619	Bihor	BH	188	\N
2620	Bistrița-Năsăud	BN	188	\N
2621	Brăila	BR	188	\N
2622	Botoșani	BT	188	\N
2623	Brașov	BV	188	\N
2624	Buzău	BZ	188	\N
2625	Cluj	CJ	188	\N
2626	Călărași	CL	188	\N
2627	Caraș-Severin	CS	188	\N
2628	Constanța	CT	188	\N
2629	Covasna	CV	188	\N
2630	Dâmbovița	DB	188	\N
2631	Dolj	DJ	188	\N
2632	Gorj	GJ	188	\N
2633	Galați	GL	188	\N
2634	Giurgiu	GR	188	\N
2635	Hunedoara	HD	188	\N
2636	Harghita	HR	188	\N
2637	Ilfov	IF	188	\N
2638	Ialomița	IL	188	\N
2639	Iași	IS	188	\N
2640	Mehedinți	MH	188	\N
2641	Maramureș	MM	188	\N
2642	Mureș	MS	188	\N
2643	Neamț	NT	188	\N
2644	Olt	OT	188	\N
2645	Prahova	PH	188	\N
2646	Sibiu	SB	188	\N
2647	Sălaj	SJ	188	\N
2648	Satu Mare	SM	188	\N
2649	Suceava	SV	188	\N
2650	Tulcea	TL	188	\N
2651	Timiș	TM	188	\N
2652	Teleorman	TR	188	\N
2653	Vâlcea	VL	188	\N
2654	Vrancea	VN	188	\N
2655	Vaslui	VS	188	\N
2656	Beograd	00	189	\N
2657	Mačvanski okrug	08	189	\N
2658	Kolubarski okrug	09	189	\N
2659	Podunavski okrug	10	189	\N
2660	Braničevski okrug	11	189	\N
2661	Šumadijski okrug	12	189	\N
2662	Pomoravski okrug	13	189	\N
2663	Borski okrug	14	189	\N
2664	Zaječarski okrug	15	189	\N
2665	Zlatiborski okrug	16	189	\N
2666	Moravički okrug	17	189	\N
2667	Raški okrug	18	189	\N
2668	Rasinski okrug	19	189	\N
2669	Nišavski okrug	20	189	\N
2670	Toplički okrug	21	189	\N
2671	Pirotski okrug	22	189	\N
2672	Jablanički okrug	23	189	\N
2673	Pčinjski okrug	24	189	\N
2674	Kosovo-Metohija	KM	189	\N
2675	Vojvodina	VO	189	\N
2676	Adygeya, Respublika	AD	190	\N
2677	Altay, Respublika	AL	190	\N
2678	Altayskiy kray	ALT	190	\N
2679	Amurskaya oblast'	AMU	190	\N
2680	Arkhangel'skaya oblast'	ARK	190	\N
2681	Astrakhanskaya oblast'	AST	190	\N
2682	Bashkortostan, Respublika	BA	190	\N
2683	Belgorodskaya oblast'	BEL	190	\N
2684	Bryanskaya oblast'	BRY	190	\N
2685	Buryatiya, Respublika	BU	190	\N
2686	Chechenskaya Respublika	CE	190	\N
2687	Chelyabinskaya oblast'	CHE	190	\N
2688	Chukotskiy avtonomnyy okrug	CHU	190	\N
2689	Chuvashskaya Respublika	CU	190	\N
2690	Dagestan, Respublika	DA	190	\N
2691	Respublika Ingushetiya	IN	190	\N
2692	Irkutiskaya oblast'	IRK	190	\N
2693	Ivanovskaya oblast'	IVA	190	\N
2694	Kamchatskiy kray	KAM	190	\N
2695	Kabardino-Balkarskaya Respublika	KB	190	\N
2696	Karachayevo-Cherkesskaya Respublika	KC	190	\N
2697	Krasnodarskiy kray	KDA	190	\N
2698	Kemerovskaya oblast'	KEM	190	\N
2699	Kaliningradskaya oblast'	KGD	190	\N
2700	Kurganskaya oblast'	KGN	190	\N
2701	Khabarovskiy kray	KHA	190	\N
2702	Khanty-Mansiysky avtonomnyy okrug-Yugra	KHM	190	\N
2703	Kirovskaya oblast'	KIR	190	\N
2704	Khakasiya, Respublika	KK	190	\N
2705	Kalmykiya, Respublika	KL	190	\N
2706	Kaluzhskaya oblast'	KLU	190	\N
2707	Komi, Respublika	KO	190	\N
2708	Kostromskaya oblast'	KOS	190	\N
2709	Kareliya, Respublika	KR	190	\N
2710	Kurskaya oblast'	KRS	190	\N
2711	Krasnoyarskiy kray	KYA	190	\N
2712	Leningradskaya oblast'	LEN	190	\N
2713	Lipetskaya oblast'	LIP	190	\N
2714	Magadanskaya oblast'	MAG	190	\N
2715	Mariy El, Respublika	ME	190	\N
2716	Mordoviya, Respublika	MO	190	\N
2717	Moskovskaya oblast'	MOS	190	\N
2718	Moskva	MOW	190	\N
2719	Murmanskaya oblast'	MUR	190	\N
2720	Nenetskiy avtonomnyy okrug	NEN	190	\N
2721	Novgorodskaya oblast'	NGR	190	\N
2722	Nizhegorodskaya oblast'	NIZ	190	\N
2723	Novosibirskaya oblast'	NVS	190	\N
2724	Omskaya oblast'	OMS	190	\N
2725	Orenburgskaya oblast'	ORE	190	\N
2726	Orlovskaya oblast'	ORL	190	\N
2727	Permskiy kray	PER	190	\N
2728	Penzenskaya oblast'	PNZ	190	\N
2729	Primorskiy kray	PRI	190	\N
2730	Pskovskaya oblast'	PSK	190	\N
2731	Rostovskaya oblast'	ROS	190	\N
2732	Ryazanskaya oblast'	RYA	190	\N
2733	Sakha, Respublika [Yakutiya]	SA	190	\N
2734	Sakhalinskaya oblast'	SAK	190	\N
2735	Samaraskaya oblast'	SAM	190	\N
2736	Saratovskaya oblast'	SAR	190	\N
2737	Severnaya Osetiya-Alaniya, Respublika	SE	190	\N
2738	Smolenskaya oblast'	SMO	190	\N
2739	Sankt-Peterburg	SPE	190	\N
2740	Stavropol'skiy kray	STA	190	\N
2741	Sverdlovskaya oblast'	SVE	190	\N
2742	Tatarstan, Respublika	TA	190	\N
2743	Tambovskaya oblast'	TAM	190	\N
2744	Tomskaya oblast'	TOM	190	\N
2745	Tul'skaya oblast'	TUL	190	\N
2746	Tverskaya oblast'	TVE	190	\N
2747	Tyva, Respublika [Tuva]	TY	190	\N
2748	Tyumenskaya oblast'	TYU	190	\N
2749	Udmurtskaya Respublika	UD	190	\N
2750	Ul'yanovskaya oblast'	ULY	190	\N
2751	Volgogradskaya oblast'	VGG	190	\N
2752	Vladimirskaya oblast'	VLA	190	\N
2753	Vologodskaya oblast'	VLG	190	\N
2754	Voronezhskaya oblast'	VOR	190	\N
2755	Yamalo-Nenetskiy avtonomnyy okrug	YAN	190	\N
2756	Yaroslavskaya oblast'	YAR	190	\N
2757	Yevreyskaya avtonomnaya oblast'	YEV	190	\N
2758	Zabajkal'skij kraj	ZAB	190	\N
2759	Ville de Kigali	01	191	\N
2760	Est	02	191	\N
2761	Nord	03	191	\N
2762	Ouest	04	191	\N
2763	Sud	05	191	\N
2764	Ar Riyāḍ	01	192	\N
2765	Makkah	02	192	\N
2766	Al Madīnah	03	192	\N
2767	Ash Sharqīyah	04	192	\N
2768	Al Qaşīm	05	192	\N
2769	Ḥā'il	06	192	\N
2770	Tabūk	07	192	\N
2771	Al Ḥudūd ash Shamāliyah	08	192	\N
2772	Jīzan	09	192	\N
2773	Najrān	10	192	\N
2774	Al Bāhah	11	192	\N
2775	Al Jawf	12	192	\N
2776	`Asīr	14	192	\N
2777	Central	CE	193	\N
2778	Choiseul	CH	193	\N
2779	Capital Territory (Honiara)	CT	193	\N
2780	Guadalcanal	GU	193	\N
2781	Isabel	IS	193	\N
2782	Makira	MK	193	\N
2783	Malaita	ML	193	\N
2784	Rennell and Bellona	RB	193	\N
2785	Temotu	TE	193	\N
2786	Western	WE	193	\N
2787	Anse aux Pins	01	194	\N
2788	Anse Boileau	02	194	\N
2789	Anse Etoile	03	194	\N
2790	Anse Louis	04	194	\N
2791	Anse Royale	05	194	\N
2792	Baie Lazare	06	194	\N
2793	Baie Sainte Anne	07	194	\N
2794	Beau Vallon	08	194	\N
2795	Bel Air	09	194	\N
2796	Bel Ombre	10	194	\N
2797	Cascade	11	194	\N
2798	Glacis	12	194	\N
2799	Grand Anse Mahe	13	194	\N
2800	Grand Anse Praslin	14	194	\N
2801	La Digue	15	194	\N
2802	English River	16	194	\N
2803	Mont Buxton	17	194	\N
2804	Mont Fleuri	18	194	\N
2805	Plaisance	19	194	\N
2806	Pointe Larue	20	194	\N
2807	Port Glaud	21	194	\N
2808	Saint Louis	22	194	\N
2809	Takamaka	23	194	\N
2810	Les Mamelles	24	194	\N
2811	Roche Caiman	25	194	\N
2812	Zalingei	DC	195	\N
2813	Sharq Dārfūr	DE	195	\N
2814	Shamāl Dārfūr	DN	195	\N
2815	Janūb Dārfūr	DS	195	\N
2816	Gharb Dārfūr	DW	195	\N
2817	Al Qaḑārif	GD	195	\N
2818	Al Jazīrah	GZ	195	\N
2819	Kassalā	KA	195	\N
2820	Al Kharţūm	KH	195	\N
2821	Shamāl Kurdufān	KN	195	\N
2822	Janūb Kurdufān	KS	195	\N
2823	An Nīl al Azraq	NB	195	\N
2824	Ash Shamālīyah	NO	195	\N
2825	An Nīl	NR	195	\N
2826	An Nīl al Abyaḑ	NW	195	\N
2827	Al Baḩr al Aḩmar	RS	195	\N
2828	Sinnār	SI	195	\N
2829	Stockholms län	AB	196	\N
2830	Västerbottens län	AC	196	\N
2831	Norrbottens län	BD	196	\N
2832	Uppsala län	C	196	\N
2833	Södermanlands län	D	196	\N
2834	Östergötlands län	E	196	\N
2835	Jönköpings län	F	196	\N
2836	Kronobergs län	G	196	\N
2837	Kalmar län	H	196	\N
2838	Gotlands län	I	196	\N
2839	Blekinge län	K	196	\N
2840	Skåne län	M	196	\N
2841	Hallands län	N	196	\N
2842	Västra Götalands län	O	196	\N
2843	Värmlands län	S	196	\N
2844	Örebro län	T	196	\N
2845	Västmanlands län	U	196	\N
2846	Dalarnas län	W	196	\N
2847	Gävleborgs län	X	196	\N
2848	Västernorrlands län	Y	196	\N
2849	Jämtlands län	Z	196	\N
2850	Central Singapore	01	197	\N
2851	North East	02	197	\N
2852	North West	03	197	\N
2853	South East	04	197	\N
2854	South West	05	197	\N
2855	Ascension	AC	198	\N
2856	Saint Helena	HL	198	\N
2857	Tristan da Cunha	TA	198	\N
2858	Ajdovščina	001	199	\N
2859	Beltinci	002	199	\N
2860	Bled	003	199	\N
2861	Bohinj	004	199	\N
2862	Borovnica	005	199	\N
2863	Bovec	006	199	\N
2864	Brda	007	199	\N
2865	Brezovica	008	199	\N
2866	Brežice	009	199	\N
2867	Tišina	010	199	\N
2868	Celje	011	199	\N
2869	Cerklje na Gorenjskem	012	199	\N
2870	Cerknica	013	199	\N
2871	Cerkno	014	199	\N
2872	Črenšovci	015	199	\N
2873	Črna na Koroškem	016	199	\N
2874	Črnomelj	017	199	\N
2875	Destrnik	018	199	\N
2876	Divača	019	199	\N
2877	Dobrepolje	020	199	\N
2878	Dobrova-Polhov Gradec	021	199	\N
2879	Dol pri Ljubljani	022	199	\N
2880	Domžale	023	199	\N
2881	Dornava	024	199	\N
2882	Dravograd	025	199	\N
2883	Duplek	026	199	\N
2884	Gorenja vas-Poljane	027	199	\N
2885	Gorišnica	028	199	\N
2886	Gornja Radgona	029	199	\N
2887	Gornji Grad	030	199	\N
2888	Gornji Petrovci	031	199	\N
2889	Grosuplje	032	199	\N
2890	Šalovci	033	199	\N
2891	Hrastnik	034	199	\N
2892	Hrpelje-Kozina	035	199	\N
2893	Idrija	036	199	\N
2894	Ig	037	199	\N
2895	Ilirska Bistrica	038	199	\N
2896	Ivančna Gorica	039	199	\N
2897	Izola/Isola	040	199	\N
2898	Jesenice	041	199	\N
2899	Juršinci	042	199	\N
2900	Kamnik	043	199	\N
2901	Kanal	044	199	\N
2902	Kidričevo	045	199	\N
2903	Kobarid	046	199	\N
2904	Kobilje	047	199	\N
2905	Kočevje	048	199	\N
2906	Komen	049	199	\N
2907	Koper/Capodistria	050	199	\N
2908	Kozje	051	199	\N
2909	Kranj	052	199	\N
2910	Kranjska Gora	053	199	\N
2911	Krško	054	199	\N
2912	Kungota	055	199	\N
2913	Kuzma	056	199	\N
2914	Laško	057	199	\N
2915	Lenart	058	199	\N
2916	Lendava/Lendva	059	199	\N
2917	Litija	060	199	\N
2918	Ljubljana	061	199	\N
2919	Ljubno	062	199	\N
2920	Ljutomer	063	199	\N
2921	Logatec	064	199	\N
2922	Loška dolina	065	199	\N
2923	Loški Potok	066	199	\N
2924	Luče	067	199	\N
2925	Lukovica	068	199	\N
2926	Majšperk	069	199	\N
2927	Maribor	070	199	\N
2928	Medvode	071	199	\N
2929	Mengeš	072	199	\N
2930	Metlika	073	199	\N
2931	Mežica	074	199	\N
2932	Miren-Kostanjevica	075	199	\N
2933	Mislinja	076	199	\N
2934	Moravče	077	199	\N
2935	Moravske Toplice	078	199	\N
2936	Mozirje	079	199	\N
2937	Murska Sobota	080	199	\N
2938	Muta	081	199	\N
2939	Naklo	082	199	\N
2940	Nazarje	083	199	\N
2941	Nova Gorica	084	199	\N
2942	Novo mesto	085	199	\N
2943	Odranci	086	199	\N
2944	Ormož	087	199	\N
2945	Osilnica	088	199	\N
2946	Pesnica	089	199	\N
2947	Piran/Pirano	090	199	\N
2948	Pivka	091	199	\N
2949	Podčetrtek	092	199	\N
2950	Podvelka	093	199	\N
2951	Postojna	094	199	\N
2952	Preddvor	095	199	\N
2953	Ptuj	096	199	\N
2954	Puconci	097	199	\N
2955	Rače-Fram	098	199	\N
2956	Radeče	099	199	\N
2957	Radenci	100	199	\N
2958	Radlje ob Dravi	101	199	\N
2959	Radovljica	102	199	\N
2960	Ravne na Koroškem	103	199	\N
2961	Ribnica	104	199	\N
2962	Rogašovci	105	199	\N
2963	Rogaška Slatina	106	199	\N
2964	Rogatec	107	199	\N
2965	Ruše	108	199	\N
2966	Semič	109	199	\N
2967	Sevnica	110	199	\N
2968	Sežana	111	199	\N
2969	Slovenj Gradec	112	199	\N
2970	Slovenska Bistrica	113	199	\N
2971	Slovenske Konjice	114	199	\N
2972	Starče	115	199	\N
2973	Sveti Jurij	116	199	\N
2974	Šenčur	117	199	\N
2975	Šentilj	118	199	\N
2976	Šentjernej	119	199	\N
2977	Šentjur	120	199	\N
2978	Škocjan	121	199	\N
2979	Škofja Loka	122	199	\N
2980	Škofljica	123	199	\N
2981	Šmarje pri Jelšah	124	199	\N
2982	Šmartno ob Paki	125	199	\N
2983	Šoštanj	126	199	\N
2984	Štore	127	199	\N
2985	Tolmin	128	199	\N
2986	Trbovlje	129	199	\N
2987	Trebnje	130	199	\N
2988	Tržič	131	199	\N
2989	Turnišče	132	199	\N
2990	Velenje	133	199	\N
2991	Velike Lašče	134	199	\N
2992	Videm	135	199	\N
2993	Vipava	136	199	\N
2994	Vitanje	137	199	\N
2995	Vodice	138	199	\N
2996	Vojnik	139	199	\N
2997	Vrhnika	140	199	\N
2998	Vuzenica	141	199	\N
2999	Zagorje ob Savi	142	199	\N
3000	Zavrč	143	199	\N
3001	Zreče	144	199	\N
3002	Železniki	146	199	\N
3003	Žiri	147	199	\N
3004	Benedikt	148	199	\N
3005	Bistrica ob Sotli	149	199	\N
3006	Bloke	150	199	\N
3007	Braslovče	151	199	\N
3008	Cankova	152	199	\N
3009	Cerkvenjak	153	199	\N
3010	Dobje	154	199	\N
3011	Dobrna	155	199	\N
3012	Dobrovnik/Dobronak	156	199	\N
3013	Dolenjske Toplice	157	199	\N
3014	Grad	158	199	\N
3015	Hajdina	159	199	\N
3016	Hoče-Slivnica	160	199	\N
3017	Hodoš/Hodos	161	199	\N
3018	Horjul	162	199	\N
3019	Jezersko	163	199	\N
3020	Komenda	164	199	\N
3021	Kostel	165	199	\N
3022	Križevci	166	199	\N
3023	Lovrenc na Pohorju	167	199	\N
3024	Markovci	168	199	\N
3025	Miklavž na Dravskem polju	169	199	\N
3026	Mirna Peč	170	199	\N
3027	Oplotnica	171	199	\N
3028	Podlehnik	172	199	\N
3029	Polzela	173	199	\N
3030	Prebold	174	199	\N
3031	Prevalje	175	199	\N
3032	Razkrižje	176	199	\N
3033	Ribnica na Pohorju	177	199	\N
3034	Selnica ob Dravi	178	199	\N
3035	Sodražica	179	199	\N
3036	Solčava	180	199	\N
3037	Sveta Ana	181	199	\N
3038	Sveta Andraž v Slovenskih Goricah	182	199	\N
3039	Šempeter-Vrtojba	183	199	\N
3040	Tabor	184	199	\N
3041	Trnovska vas	185	199	\N
3042	Trzin	186	199	\N
3043	Velika Polana	187	199	\N
3044	Veržej	188	199	\N
3045	Vransko	189	199	\N
3046	Žalec	190	199	\N
3047	Žetale	191	199	\N
3048	Žirovnica	192	199	\N
3049	Žužemberk	193	199	\N
3050	Šmartno pri Litiji	194	199	\N
3051	Apače	195	199	\N
3052	Cirkulane	196	199	\N
3053	Kosanjevica na Krki	197	199	\N
3054	Makole	198	199	\N
3055	Mokronog-Trebelno	199	199	\N
3056	Poljčane	200	199	\N
3057	Renče-Vogrsko	201	199	\N
3058	Središče ob Dravi	202	199	\N
3059	Straža	203	199	\N
3060	Sveta Trojica v Slovenskih Goricah	204	199	\N
3061	Sveti Tomaž	205	199	\N
3062	Šmarjeske Topliče	206	199	\N
3063	Gorje	207	199	\N
3064	Log-Dragomer	208	199	\N
3065	Rečica ob Savinji	209	199	\N
3066	Sveti Jurij v Slovenskih Goricah	210	199	\N
3067	Šentrupert	211	199	\N
3068	Banskobystrický kraj	BC	201	\N
3069	Bratislavský kraj	BL	201	\N
3070	Košický kraj	KI	201	\N
3071	Nitriansky kraj	NI	201	\N
3072	Prešovský kraj	PV	201	\N
3073	Trnavský kraj	TA	201	\N
3074	Trenčiansky kraj	TC	201	\N
3075	Žilinský kraj	ZI	201	\N
3076	Eastern	E	202	\N
3077	Northern	N	202	\N
3078	Southern (Sierra Leone)	S	202	\N
3079	Western Area (Freetown)	W	202	\N
3080	Acquaviva	01	203	\N
3081	Chiesanuova	02	203	\N
3082	Domagnano	03	203	\N
3083	Faetano	04	203	\N
3084	Fiorentino	05	203	\N
3085	Borgo Maggiore	06	203	\N
3086	San Marino	07	203	\N
3087	Montegiardino	08	203	\N
3088	Serravalle	09	203	\N
3089	Diourbel	DB	204	\N
3090	Dakar	DK	204	\N
3091	Fatick	FK	204	\N
3092	Kaffrine	KA	204	\N
3093	Kolda	KD	204	\N
3094	Kédougou	KE	204	\N
3095	Kaolack	KL	204	\N
3096	Louga	LG	204	\N
3097	Matam	MT	204	\N
3098	Sédhiou	SE	204	\N
3099	Saint-Louis	SL	204	\N
3100	Tambacounda	TC	204	\N
3101	Thiès	TH	204	\N
3102	Ziguinchor	ZG	204	\N
3103	Awdal	AW	205	\N
3104	Bakool	BK	205	\N
3105	Banaadir	BN	205	\N
3106	Bari	BR	205	\N
3107	Bay	BY	205	\N
3108	Galguduud	GA	205	\N
3109	Gedo	GE	205	\N
3110	Hiirsan	HI	205	\N
3111	Jubbada Dhexe	JD	205	\N
3112	Jubbada Hoose	JH	205	\N
3113	Mudug	MU	205	\N
3114	Nugaal	NU	205	\N
3115	Saneag	SA	205	\N
3116	Shabeellaha Dhexe	SD	205	\N
3117	Shabeellaha Hoose	SH	205	\N
3118	Sool	SO	205	\N
3119	Togdheer	TO	205	\N
3120	Woqooyi Galbeed	WO	205	\N
3121	Brokopondo	BR	206	\N
3122	Commewijne	CM	206	\N
3123	Coronie	CR	206	\N
3124	Marowijne	MA	206	\N
3125	Nickerie	NI	206	\N
3126	Paramaribo	PM	206	\N
3127	Para	PR	206	\N
3128	Saramacca	SA	206	\N
3129	Sipaliwini	SI	206	\N
3130	Wanica	WA	206	\N
3131	Northern Bahr el-Ghazal	BN	207	\N
3132	Western Bahr el-Ghazal	BW	207	\N
3133	Central Equatoria	EC	207	\N
3134	Eastern Equatoria	EE8	207	\N
3135	Western Equatoria	EW	207	\N
3136	Jonglei	JG	207	\N
3137	Lakes	LK	207	\N
3138	Upper Nile	NU	207	\N
3139	Unity	UY	207	\N
3140	Warrap	WR	207	\N
3141	Príncipe	P	208	\N
3142	São Tomé	S	208	\N
3143	Ahuachapán	AH	209	\N
3144	Cabañas	CA	209	\N
3145	Chalatenango	CH	209	\N
3146	Cuscatlán	CU	209	\N
3147	La Libertad	LI	209	\N
3148	Morazán	MO	209	\N
3149	La Paz	PA	209	\N
3150	Santa Ana	SA	209	\N
3151	San Miguel	SM	209	\N
3152	Sonsonate	SO	209	\N
3153	San Salvador	SS	209	\N
3154	San Vicente	SV	209	\N
3155	La Unión	UN	209	\N
3156	Usulután	US	209	\N
3157	Dimashq	DI	211	\N
3158	Dar'a	DR	211	\N
3159	Dayr az Zawr	DY	211	\N
3160	Al Hasakah	HA	211	\N
3161	Homs	HI	211	\N
3162	Halab	HL	211	\N
3163	Hamah	HM	211	\N
3164	Idlib	ID	211	\N
3165	Al Ladhiqiyah	LA	211	\N
3166	Al Qunaytirah	QU	211	\N
3167	Ar Raqqah	RA	211	\N
3168	Rif Dimashq	RD	211	\N
3169	As Suwayda'	SU	211	\N
3170	Tartus	TA	211	\N
3171	Hhohho	HH	212	\N
3172	Lubombo	LU	212	\N
3173	Manzini	MA	212	\N
3174	Shiselweni	SH	212	\N
3175	Al Baṭḩah	BA	214	\N
3176	Baḩr al Ghazāl	BG	214	\N
3177	Būrkū	BO	214	\N
3178	Shārī Bāqirmī	CB	214	\N
3179	Innīdī	EN	214	\N
3180	Qīrā	GR	214	\N
3181	Ḥajjar Lamīs	HL	214	\N
3182	Kānim	KA	214	\N
3183	Al Buḩayrah	LC	214	\N
3184	Lūqūn al Gharbī	LO	214	\N
3185	Lūqūn ash Sharqī	LR	214	\N
3186	Māndūl	MA	214	\N
3187	Shārī al Awsaṭ	MC	214	\N
3188	Māyū Kībbī ash Sharqī	ME	214	\N
3189	Māyū Kībbī al Gharbī	MO	214	\N
3190	Madīnat Injamīnā	ND	214	\N
3191	Waddāy	OD	214	\N
3192	Salāmāt	SA	214	\N
3193	Sīlā	SI	214	\N
3194	Tānjilī	TA	214	\N
3195	Tibastī	TI	214	\N
3196	Wādī Fīrā	WF	214	\N
3197	Région du Centre	C	216	\N
3198	Région de la Kara	K	216	\N
3199	Région Maritime	M	216	\N
3200	Région des Plateaux	P	216	\N
3201	Région des Savannes	S	216	\N
3202	Krung Thep Maha Nakhon Bangkok	10	217	\N
3203	Samut Prakan	11	217	\N
3204	Nonthaburi	12	217	\N
3205	Pathum Thani	13	217	\N
3206	Phra Nakhon Si Ayutthaya	14	217	\N
3207	Ang Thong	15	217	\N
3208	Lop Buri	16	217	\N
3209	Sing Buri	17	217	\N
3210	Chai Nat	18	217	\N
3211	Saraburi	19	217	\N
3212	Chon Buri	20	217	\N
3213	Rayong	21	217	\N
3214	Chanthaburi	22	217	\N
3215	Trat	23	217	\N
3216	Chachoengsao	24	217	\N
3217	Prachin Buri	25	217	\N
3218	Nakhon Nayok	26	217	\N
3219	Sa Kaeo	27	217	\N
3220	Nakhon Ratchasima	30	217	\N
3221	Buri Ram	31	217	\N
3222	Surin	32	217	\N
3223	Si Sa Ket	33	217	\N
3224	Ubon Ratchathani	34	217	\N
3225	Yasothon	35	217	\N
3226	Chaiyaphum	36	217	\N
3227	Amnat Charoen	37	217	\N
3228	Nong Bua Lam Phu	39	217	\N
3229	Khon Kaen	40	217	\N
3230	Udon Thani	41	217	\N
3231	Loei	42	217	\N
3232	Nong Khai	43	217	\N
3233	Maha Sarakham	44	217	\N
3234	Roi Et	45	217	\N
3235	Kalasin	46	217	\N
3236	Sakon Nakhon	47	217	\N
3237	Nakhon Phanom	48	217	\N
3238	Mukdahan	49	217	\N
3239	Chiang Mai	50	217	\N
3240	Lamphun	51	217	\N
3241	Lampang	52	217	\N
3242	Uttaradit	53	217	\N
3243	Phrae	54	217	\N
3244	Nan	55	217	\N
3245	Phayao	56	217	\N
3246	Chiang Rai	57	217	\N
3247	Mae Hong Son	58	217	\N
3248	Nakhon Sawan	60	217	\N
3249	Uthai Thani	61	217	\N
3250	Kamphaeng Phet	62	217	\N
3251	Tak	63	217	\N
3252	Sukhothai	64	217	\N
3253	Phitsanulok	65	217	\N
3254	Phichit	66	217	\N
3255	Phetchabun	67	217	\N
3256	Ratchaburi	70	217	\N
3257	Kanchanaburi	71	217	\N
3258	Suphan Buri	72	217	\N
3259	Nakhon Pathom	73	217	\N
3260	Samut Sakhon	74	217	\N
3261	Samut Songkhram	75	217	\N
3262	Phetchaburi	76	217	\N
3263	Prachuap Khiri Khan	77	217	\N
3264	Nakhon Si Thammarat	80	217	\N
3265	Krabi	81	217	\N
3266	Phangnga	82	217	\N
3267	Phuket	83	217	\N
3268	Surat Thani	84	217	\N
3269	Ranong	85	217	\N
3270	Chumphon	86	217	\N
3271	Songkhla	90	217	\N
3272	Satun	91	217	\N
3273	Trang	92	217	\N
3274	Phatthalung	93	217	\N
3275	Pattani	94	217	\N
3276	Yala	95	217	\N
3277	Narathiwat	96	217	\N
3278	Phatthaya	S	217	\N
3279	Gorno-Badakhshan	GB	218	\N
3280	Khatlon	KT	218	\N
3281	Sughd	SU	218	\N
3282	Aileu	AL	220	\N
3283	Ainaro	AN	220	\N
3284	Baucau	BA	220	\N
3285	Bobonaro	BO	220	\N
3286	Cova Lima	CO	220	\N
3287	Díli	DI	220	\N
3288	Ermera	ER	220	\N
3289	Lautem	LA	220	\N
3290	Liquiça	LI	220	\N
3291	Manufahi	MF	220	\N
3292	Manatuto	MT	220	\N
3293	Oecussi	OE	220	\N
3294	Viqueque	VI	220	\N
3295	Ahal	A	221	\N
3296	Balkan	B	221	\N
3297	Daşoguz	D	221	\N
3298	Lebap	L	221	\N
3299	Mary	M	221	\N
3300	Aşgabat	S	221	\N
3301	Tunis	11	222	\N
3302	Ariana	12	222	\N
3303	Ben Arous	13	222	\N
3304	La Manouba	14	222	\N
3305	Nabeul	21	222	\N
3306	Zaghouan	22	222	\N
3307	Bizerte	23	222	\N
3308	Béja	31	222	\N
3309	Jendouba	32	222	\N
3310	Le Kef	33	222	\N
3311	Siliana	34	222	\N
3312	Kairouan	41	222	\N
3313	Kasserine	42	222	\N
3314	Sidi Bouzid	43	222	\N
3315	Sousse	51	222	\N
3316	Monastir	52	222	\N
3317	Mahdia	53	222	\N
3318	Sfax	61	222	\N
3319	Gafsa	71	222	\N
3320	Tozeur	72	222	\N
3321	Kebili	73	222	\N
3322	Gabès	81	222	\N
3323	Medenine	82	222	\N
3324	Tataouine	83	222	\N
3325	'Eua	01	223	\N
3326	Ha'apai	02	223	\N
3327	Niuas	03	223	\N
3328	Tongatapu	04	223	\N
3329	Vava'u	05	223	\N
3330	Adana	01	224	\N
3331	Adıyaman	02	224	\N
3332	Afyonkarahisar	03	224	\N
3333	Ağrı	04	224	\N
3334	Amasya	05	224	\N
3335	Ankara	06	224	\N
3336	Antalya	07	224	\N
3337	Artvin	08	224	\N
3338	Aydın	09	224	\N
3339	Balıkesir	10	224	\N
3340	Bilecik	11	224	\N
3341	Bingöl	12	224	\N
3342	Bitlis	13	224	\N
3343	Bolu	14	224	\N
3344	Burdur	15	224	\N
3345	Bursa	16	224	\N
3346	Çanakkale	17	224	\N
3347	Çankırı	18	224	\N
3348	Çorum	19	224	\N
3349	Denizli	20	224	\N
3350	Diyarbakır	21	224	\N
3351	Edirne	22	224	\N
3352	Elazığ	23	224	\N
3353	Erzincan	24	224	\N
3354	Erzurum	25	224	\N
3355	Eskişehir	26	224	\N
3356	Gaziantep	27	224	\N
3357	Giresun	28	224	\N
3358	Gümüşhane	29	224	\N
3359	Hakkâri	30	224	\N
3360	Hatay	31	224	\N
3361	Isparta	32	224	\N
3362	Mersin	33	224	\N
3363	İstanbul	34	224	\N
3364	İzmir	35	224	\N
3365	Kars	36	224	\N
3366	Kastamonu	37	224	\N
3367	Kayseri	38	224	\N
3368	Kırklareli	39	224	\N
3369	Kırşehir	40	224	\N
3370	Kocaeli	41	224	\N
3371	Konya	42	224	\N
3372	Kütahya	43	224	\N
3373	Malatya	44	224	\N
3374	Manisa	45	224	\N
3375	Kahramanmaraş	46	224	\N
3376	Mardin	47	224	\N
3377	Muğla	48	224	\N
3378	Muş	49	224	\N
3379	Nevşehir	50	224	\N
3380	Niğde	51	224	\N
3381	Ordu	52	224	\N
3382	Rize	53	224	\N
3383	Sakarya	54	224	\N
3384	Samsun	55	224	\N
3385	Siirt	56	224	\N
3386	Sinop	57	224	\N
3387	Sivas	58	224	\N
3388	Tekirdağ	59	224	\N
3389	Tokat	60	224	\N
3390	Trabzon	61	224	\N
3391	Tunceli	62	224	\N
3392	Şanlıurfa	63	224	\N
3393	Uşak	64	224	\N
3394	Van	65	224	\N
3395	Yozgat	66	224	\N
3396	Zonguldak	67	224	\N
3397	Aksaray	68	224	\N
3398	Bayburt	69	224	\N
3399	Karaman	70	224	\N
3400	Kırıkkale	71	224	\N
3401	Batman	72	224	\N
3402	Şırnak	73	224	\N
3403	Bartın	74	224	\N
3404	Ardahan	75	224	\N
3405	Iğdır	76	224	\N
3406	Yalova	77	224	\N
3407	Karabük	78	224	\N
3408	Kilis	79	224	\N
3409	Osmaniye	80	224	\N
3410	Düzce	81	224	\N
3411	Arima	ARI	225	\N
3412	Chaguanas	CHA	225	\N
3413	Couva-Tabaquite-Talparo	CTT	225	\N
3414	Diego Martin	DMN	225	\N
3415	Eastern Tobago	ETO	225	\N
3416	Penal-Debe	PED	225	\N
3417	Port of Spain	POS	225	\N
3418	Princes Town	PRT	225	\N
3419	Point Fortin	PTF	225	\N
3420	Rio Claro-Mayaro	RCM	225	\N
3421	San Fernando	SFO	225	\N
3422	Sangre Grande	SGE	225	\N
3423	Siparia	SIP	225	\N
3424	San Juan-Laventille	SJL	225	\N
3425	Tunapuna-Piarco	TUP	225	\N
3426	Western Tobago	WTO	225	\N
3427	Funafuti	FUN	226	\N
3428	Niutao	NIT	226	\N
3429	Nukufetau	NKF	226	\N
3430	Nukulaelae	NKL	226	\N
3431	Nanumea	NMA	226	\N
3432	Nanumanga	NMG	226	\N
3433	Nui	NUI	226	\N
3434	Vaitupu	VAI	226	\N
3435	Changhua	CHA	227	\N
3436	Chiay City	CYI	227	\N
3437	Chiayi	CYQ	227	\N
3438	Hsinchu	HSQ	227	\N
3439	Hsinchui City	HSZ	227	\N
3440	Hualien	HUA	227	\N
3441	Ilan	ILA	227	\N
3442	Keelung City	KEE	227	\N
3443	Kaohsiung City	KHH	227	\N
3444	Kaohsiung	KHQ	227	\N
3445	Miaoli	MIA	227	\N
3446	Nantou	NAN	227	\N
3447	Penghu	PEN	227	\N
3448	Pingtung	PIF	227	\N
3449	Taoyuan	TAO	227	\N
3450	Tainan City	TNN	227	\N
3451	Tainan	TNQ	227	\N
3452	Taipei City	TPE	227	\N
3453	Taipei	TPQ	227	\N
3454	Taitung	TTT	227	\N
3455	Taichung City	TXG	227	\N
3456	Taichung	TXQ	227	\N
3457	Yunlin	YUN	227	\N
3458	Arusha	01	228	\N
3459	Dar-es-Salaam	02	228	\N
3460	Dodoma	03	228	\N
3461	Iringa	04	228	\N
3462	Kagera	05	228	\N
3463	Kaskazini Pemba	06	228	\N
3464	Kaskazini Unguja	07	228	\N
3465	Kigoma	08	228	\N
3466	Kilimanjaro	09	228	\N
3467	Kusini Pemba	10	228	\N
3468	Kusini Unguja	11	228	\N
3469	Lindi	12	228	\N
3470	Mara	13	228	\N
3471	Mbeya	14	228	\N
3472	Mjini Magharibi	15	228	\N
3473	Morogoro	16	228	\N
3474	Mtwara	17	228	\N
3475	Mwanza	18	228	\N
3476	Pwani	19	228	\N
3477	Rukwa	20	228	\N
3478	Ruvuma	21	228	\N
3479	Shinyanga	22	228	\N
3480	Singida	23	228	\N
3481	Tabora	24	228	\N
3482	Tanga	25	228	\N
3483	Manyara	26	228	\N
3484	Vinnyts'ka Oblast'	05	229	\N
3485	Volyns'ka Oblast'	07	229	\N
3486	Luhans'ka Oblast'	09	229	\N
3487	Dnipropetrovs'ka Oblast'	12	229	\N
3488	Donets'ka Oblast'	14	229	\N
3489	Zhytomyrs'ka Oblast'	18	229	\N
3490	Zakarpats'ka Oblast'	21	229	\N
3491	Zaporiz'ka Oblast'	23	229	\N
3492	Ivano-Frankivs'ka Oblast'	26	229	\N
3493	Kyïvs'ka mis'ka rada	30	229	\N
3494	Kyïvs'ka Oblast'	32	229	\N
3495	Kirovohrads'ka Oblast'	35	229	\N
3496	Sevastopol	40	229	\N
3497	Respublika Krym	43	229	\N
3498	L'vivs'ka Oblast'	46	229	\N
3499	Mykolaïvs'ka Oblast'	48	229	\N
3500	Odes'ka Oblast'	51	229	\N
3501	Poltavs'ka Oblast'	53	229	\N
3502	Rivnens'ka Oblast'	56	229	\N
3503	Sums 'ka Oblast'	59	229	\N
3504	Ternopil's'ka Oblast'	61	229	\N
3505	Kharkivs'ka Oblast'	63	229	\N
3506	Khersons'ka Oblast'	65	229	\N
3507	Khmel'nyts'ka Oblast'	68	229	\N
3508	Cherkas'ka Oblast'	71	229	\N
3509	Chernihivs'ka Oblast'	74	229	\N
3510	Chernivets'ka Oblast'	77	229	\N
3511	Central	C	230	\N
3512	Eastern	E	230	\N
3513	Northern	N	230	\N
3514	Western	W	230	\N
3515	Johnston Atoll	67	231	\N
3516	Midway Islands	71	231	\N
3517	Navassa Island	76	231	\N
3518	Wake Island	79	231	\N
3519	Baker Island	81	231	\N
3520	Howland Island	84	231	\N
3521	Jarvis Island	86	231	\N
3522	Kingman Reef	89	231	\N
3523	Palmyra Atoll	95	231	\N
3524	Alaska	AK	232	\N
3525	Alabama	AL	232	\N
3526	Arkansas	AR	232	\N
3527	American Samoa	AS	232	\N
3528	Arizona	AZ	232	\N
3529	California	CA	232	\N
3530	Colorado	CO	232	\N
3531	Connecticut	CT	232	\N
3532	District of Columbia	DC	232	\N
3533	Delaware	DE	232	\N
3534	Florida	FL	232	\N
3535	Georgia	GA	232	\N
3536	Guam	GU	232	\N
3537	Hawaii	HI	232	\N
3538	Iowa	IA	232	\N
3539	Idaho	ID	232	\N
3540	Illinois	IL	232	\N
3541	Indiana	IN	232	\N
3542	Kansas	KS	232	\N
3543	Kentucky	KY	232	\N
3544	Louisiana	LA	232	\N
3545	Massachusetts	MA	232	\N
3546	Maryland	MD	232	\N
3547	Maine	ME	232	\N
3548	Michigan	MI	232	\N
3549	Minnesota	MN	232	\N
3550	Missouri	MO	232	\N
3551	Northern Mariana Islands	MP	232	\N
3552	Mississippi	MS	232	\N
3553	Montana	MT	232	\N
3554	North Carolina	NC	232	\N
3555	North Dakota	ND	232	\N
3556	Nebraska	NE	232	\N
3557	New Hampshire	NH	232	\N
3558	New Jersey	NJ	232	\N
3559	New Mexico	NM	232	\N
3560	Nevada	NV	232	\N
3561	New York	NY	232	\N
3562	Ohio	OH	232	\N
3563	Oklahoma	OK	232	\N
3564	Oregon	OR	232	\N
3565	Pennsylvania	PA	232	\N
3566	Puerto Rico	PR	232	\N
3567	Rhode Island	RI	232	\N
3568	South Carolina	SC	232	\N
3569	South Dakota	SD	232	\N
3570	Tennessee	TN	232	\N
3571	Texas	TX	232	\N
3572	United States Minor Outlying Islands	UM	232	\N
3573	Utah	UT	232	\N
3574	Virginia	VA	232	\N
3575	Virgin Islands	VI	232	\N
3576	Vermont	VT	232	\N
3577	Washington	WA	232	\N
3578	Wisconsin	WI	232	\N
3579	West Virginia	WV	232	\N
3580	Wyoming	WY	232	\N
3581	Armed Forces Americas (except Canada)	AA	232	\N
3582	Armed Forces Africa, Canada, Europe, Middle East	AE	232	\N
3583	Armed Forces Pacific	AP	232	\N
3584	Artigas	AR	233	\N
3585	Canelones	CA	233	\N
3586	Cerro Largo	CL	233	\N
3587	Colonia	CO	233	\N
3588	Durazno	DU	233	\N
3589	Florida	FD	233	\N
3590	Flores	FS	233	\N
3591	Lavalleja	LA	233	\N
3592	Maldonado	MA	233	\N
3593	Montevideo	MO	233	\N
3594	Paysandú	PA	233	\N
3595	Río Negro	RN	233	\N
3596	Rocha	RO	233	\N
3597	Rivera	RV	233	\N
3598	Salto	SA	233	\N
3599	San José	SJ	233	\N
3600	Soriano	SO	233	\N
3601	Tacuarembó	TA	233	\N
3602	Treinta y Tres	TT	233	\N
3603	Andijon	AN	234	\N
3604	Buxoro	BU	234	\N
3605	Farg'ona	FA	234	\N
3606	Jizzax	JI	234	\N
3607	Namangan	NG	234	\N
3608	Navoiy	NW	234	\N
3609	Qashqadaryo	QA	234	\N
3610	Qoraqalpog'iston Respublikasi	QR	234	\N
3611	Samarqand	SA	234	\N
3612	Sirdaryo	SI	234	\N
3613	Surxondaryo	SU	234	\N
3614	Toshkent	TK	234	\N
3615	Toshkent	TO	234	\N
3616	Xorazm	XO	234	\N
3617	Charlotte	01	236	\N
3618	Saint Andrew	02	236	\N
3619	Saint David	03	236	\N
3620	Saint George	04	236	\N
3621	Saint Patrick	05	236	\N
3622	Grenadines	06	236	\N
3623	Distrito Federal	A	237	\N
3624	Anzoátegui	B	237	\N
3625	Apure	C	237	\N
3626	Aragua	D	237	\N
3627	Barinas	E	237	\N
3628	Bolívar	F	237	\N
3629	Carabobo	G	237	\N
3630	Cojedes	H	237	\N
3631	Falcón	I	237	\N
3632	Guárico	J	237	\N
3633	Lara	K	237	\N
3634	Mérida	L	237	\N
3635	Miranda	M	237	\N
3636	Monagas	N	237	\N
3637	Nueva Esparta	O	237	\N
3638	Portuguesa	P	237	\N
3639	Sucre	R	237	\N
3640	Táchira	S	237	\N
3641	Trujillo	T	237	\N
3642	Yaracuy	U	237	\N
3643	Zulia	V	237	\N
3644	Dependencias Federales	W	237	\N
3645	Vargas	X	237	\N
3646	Delta Amacuro	Y	237	\N
3647	Amazonas	Z	237	\N
3648	Lai Châu	01	240	\N
3649	Lào Cai	02	240	\N
3650	Hà Giang	03	240	\N
3651	Cao Bằng	04	240	\N
3652	Sơn La	05	240	\N
3653	Yên Bái	06	240	\N
3654	Tuyên Quang	07	240	\N
3655	Lạng Sơn	09	240	\N
3656	Quảng Ninh	13	240	\N
3657	Hoà Bình	14	240	\N
3658	Hà Tây	15	240	\N
3659	Ninh Bình	18	240	\N
3660	Thái Bình	20	240	\N
3661	Thanh Hóa	21	240	\N
3662	Nghệ An	22	240	\N
3663	Hà Tỉnh	23	240	\N
3664	Quảng Bình	24	240	\N
3665	Quảng Trị	25	240	\N
3666	Thừa Thiên-Huế	26	240	\N
3667	Quảng Nam	27	240	\N
3668	Kon Tum	28	240	\N
3669	Quảng Ngãi	29	240	\N
3670	Gia Lai	30	240	\N
3671	Bình Định	31	240	\N
3672	Phú Yên	32	240	\N
3673	Đắc Lắk	33	240	\N
3674	Khánh Hòa	34	240	\N
3675	Lâm Đồng	35	240	\N
3676	Ninh Thuận	36	240	\N
3677	Tây Ninh	37	240	\N
3678	Đồng Nai	39	240	\N
3679	Bình Thuận	40	240	\N
3680	Long An	41	240	\N
3681	Bà Rịa-Vũng Tàu	43	240	\N
3682	An Giang	44	240	\N
3683	Đồng Tháp	45	240	\N
3684	Tiền Giang	46	240	\N
3685	Kiên Giang	47	240	\N
3686	Vĩnh Long	49	240	\N
3687	Bến Tre	50	240	\N
3688	Trà Vinh	51	240	\N
3689	Sóc Trăng	52	240	\N
3690	Bắc Kạn	53	240	\N
3691	Bắc Giang	54	240	\N
3692	Bạc Liêu	55	240	\N
3693	Bắc Ninh	56	240	\N
3694	Bình Dương	57	240	\N
3695	Bình Phước	58	240	\N
3696	Cà Mau	59	240	\N
3697	Hải Duong	61	240	\N
3698	Hà Nam	63	240	\N
3699	Hưng Yên	66	240	\N
3700	Nam Định	67	240	\N
3701	Phú Thọ	68	240	\N
3702	Thái Nguyên	69	240	\N
3703	Vĩnh Phúc	70	240	\N
3704	Điện Biên	71	240	\N
3705	Đắk Nông	72	240	\N
3706	Hậu Giang	73	240	\N
3707	Cần Thơ	CT	240	\N
3708	Đà Nẵng	DN	240	\N
3709	Hà Nội	HN	240	\N
3710	Hải Phòng	HP	240	\N
3711	Hồ Chí Minh [Sài Gòn]	SG	240	\N
3712	Malampa	MAP	241	\N
3713	Pénama	PAM	241	\N
3714	Sanma	SAM	241	\N
3715	Shéfa	SEE	241	\N
3716	Taféa	TAE	241	\N
3717	Torba	TOB	241	\N
3718	A'ana	AA	243	\N
3719	Aiga-i-le-Tai	AL	243	\N
3720	Atua	AT	243	\N
3721	Fa'asaleleaga	FA	243	\N
3722	Gaga'emauga	GE	243	\N
3723	Gagaifomauga	GI	243	\N
3724	Palauli	PA	243	\N
3725	Satupa'itea	SA	243	\N
3726	Tuamasaga	TU	243	\N
3727	Va'a-o-Fonoti	VF	243	\N
3728	Vaisigano	VS	243	\N
3729	Abyān	AB	244	\N
3730	'Adan	AD	244	\N
3731	'Amrān	AM	244	\N
3732	Al Bayḑā'	BA	244	\N
3733	Aḑ Ḑāli‘	DA	244	\N
3734	Dhamār	DH	244	\N
3735	Ḩaḑramawt	HD	244	\N
3736	Ḩajjah	HJ	244	\N
3737	Ibb	IB	244	\N
3738	Al Jawf	JA	244	\N
3739	Laḩij	LA	244	\N
3740	Ma'rib	MA	244	\N
3741	Al Mahrah	MR	244	\N
3742	Al Ḩudaydah	MU	244	\N
3743	Al Maḩwīt	MW	244	\N
3744	Raymah	RA	244	\N
3745	Şa'dah	SD	244	\N
3746	Shabwah	SH	244	\N
3747	Şan'ā'	SN	244	\N
3748	Tā'izz	TA	244	\N
3749	Eastern Cape	EC	246	\N
3750	Free State	FS	246	\N
3751	Gauteng	GP	246	\N
3752	Limpopo	LP	246	\N
3753	Mpumalanga	MP	246	\N
3754	Northern Cape	NC	246	\N
3755	North-West (South Africa)	NW	246	\N
3756	Western Cape	WC	246	\N
3757	Kwazulu-Natal	ZN	246	\N
3758	Western	01	247	\N
3759	Central	02	247	\N
3760	Eastern	03	247	\N
3761	Luapula	04	247	\N
3762	Northern	05	247	\N
3763	North-Western	06	247	\N
3764	Southern (Zambia)	07	247	\N
3765	Copperbelt	08	247	\N
3766	Lusaka	09	247	\N
3767	Bulawayo	BU	248	\N
3768	Harare	HA	248	\N
3769	Manicaland	MA	248	\N
3770	Mashonaland Central	MC	248	\N
3771	Mashonaland East	ME	248	\N
3772	Midlands	MI	248	\N
3773	Matabeleland North	MN	248	\N
3774	Matabeleland South	MS	248	\N
3775	Masvingo	MV	248	\N
3776	Mashonaland West	MW	248	\N
3777	Canillo	02	1	\N
3778	Encamp	03	1	\N
3779	La Massana	04	1	\N
3780	Ordino	05	1	\N
3781	Sant Julià de Lòria	06	1	\N
3782	Andorra la Vella	07	1	\N
3783	Escaldes-Engordany	08	1	\N
3784	'Ajmān	AJ	2	\N
3785	Abū Ȥaby [Abu Dhabi]	AZ	2	\N
3786	Dubayy	DU	2	\N
3787	Al Fujayrah	FU	2	\N
3788	Ra’s al Khaymah	RK	2	\N
3789	Ash Shāriqah	SH	2	\N
3790	Umm al Qaywayn	UQ	2	\N
3791	Balkh	BAL	3	\N
3792	Bāmyān	BAM	3	\N
3793	Bādghīs	BDG	3	\N
3794	Badakhshān	BDS	3	\N
3795	Baghlān	BGL	3	\N
3796	Dāykundī	DAY	3	\N
3797	Farāh	FRA	3	\N
3798	Fāryāb	FYB	3	\N
3799	Ghaznī	GHA	3	\N
3800	Ghōr	GHO	3	\N
3801	Helmand	HEL	3	\N
3802	Herāt	HER	3	\N
3803	Jowzjān	JOW	3	\N
3804	Kābul	KAB	3	\N
3805	Kandahār	KAN	3	\N
3806	Kāpīsā	KAP	3	\N
3807	Kunduz	KDZ	3	\N
3808	Khōst	KHO	3	\N
3809	Kunar	KNR	3	\N
3810	Laghmān	LAG	3	\N
3811	Lōgar	LOG	3	\N
3812	Nangarhār	NAN	3	\N
3813	Nīmrōz	NIM	3	\N
3814	Nūristān	NUR	3	\N
3815	Panjshayr	PAN	3	\N
3816	Parwān	PAR	3	\N
3817	Paktiyā	PIA	3	\N
3818	Paktīkā	PKA	3	\N
3819	Samangān	SAM	3	\N
3820	Sar-e Pul	SAR	3	\N
3821	Takhār	TAK	3	\N
3822	Uruzgān	URU	3	\N
3823	Wardak	WAR	3	\N
3824	Zābul	ZAB	3	\N
3825	Saint George	03	4	\N
3826	Saint John	04	4	\N
3827	Saint Mary	05	4	\N
3828	Saint Paul	06	4	\N
3829	Saint Peter	07	4	\N
3830	Saint Philip	08	4	\N
3831	Barbuda	10	4	\N
3832	Redonda	11	4	\N
3833	Berat	01	6	\N
3834	Durrës	02	6	\N
3835	Elbasan	03	6	\N
3836	Fier	04	6	\N
3837	Gjirokastër	05	6	\N
3838	Korçë	06	6	\N
3839	Kukës	07	6	\N
3840	Lezhë	08	6	\N
3841	Dibër	09	6	\N
3842	Shkodër	10	6	\N
3843	Tiranë	11	6	\N
3844	Vlorë	12	6	\N
3845	Aragacotn	AG	7	\N
3846	Ararat	AR	7	\N
3847	Armavir	AV	7	\N
3848	Erevan	ER	7	\N
3849	Gegarkunik'	GR	7	\N
3850	Kotayk'	KT	7	\N
3851	Lory	LO	7	\N
3852	Sirak	SH	7	\N
3853	Syunik'	SU	7	\N
3854	Tavus	TV	7	\N
3855	Vayoc Jor	VD	7	\N
3856	Bengo	BGO	8	\N
3857	Benguela	BGU	8	\N
3858	Bié	BIE	8	\N
3859	Cabinda	CAB	8	\N
3860	Cuando-Cubango	CCU	8	\N
3861	Cunene	CNN	8	\N
3862	Cuanza Norte	CNO	8	\N
3863	Cuanza Sul	CUS	8	\N
3864	Huambo	HUA	8	\N
3865	Huíla	HUI	8	\N
3866	Lunda Norte	LNO	8	\N
3867	Lunda Sul	LSU	8	\N
3868	Luanda	LUA	8	\N
3869	Malange	MAL	8	\N
3870	Moxico	MOX	8	\N
3871	Namibe	NAM	8	\N
3872	Uíge	UIG	8	\N
3873	Zaire	ZAI	8	\N
3874	Salta	A	10	\N
3875	Buenos Aires	B	10	\N
3876	Ciudad Autónoma de Buenos Aires	C	10	\N
3877	San Luis	D	10	\N
3878	Entre Rios	E	10	\N
3879	Santiago del Estero	G	10	\N
3880	Chaco	H	10	\N
3881	San Juan	J	10	\N
3882	Catamarca	K	10	\N
3883	La Pampa	L	10	\N
3884	Mendoza	M	10	\N
3885	Misiones	N	10	\N
3886	Formosa	P	10	\N
3887	Neuquen	Q	10	\N
3888	Rio Negro	R	10	\N
3889	Santa Fe	S	10	\N
3890	Tucuman	T	10	\N
3891	Chubut	U	10	\N
3892	Tierra del Fuego	V	10	\N
3893	Corrientes	W	10	\N
3894	Cordoba	X	10	\N
3895	Jujuy	Y	10	\N
3896	Santa Cruz	Z	10	\N
3897	La Rioja	F	10	\N
3898	Burgenland	1	12	\N
3899	Kärnten	2	12	\N
3900	Niederösterreich	3	12	\N
3901	Oberösterreich	4	12	\N
3902	Salzburg	5	12	\N
3903	Steiermark	6	12	\N
3904	Tirol	7	12	\N
3905	Vorarlberg	8	12	\N
3906	Wien	9	12	\N
3907	Australian Capital Territory	ACT	13	\N
3908	New South Wales	NSW	13	\N
3909	Northern Territory	NT	13	\N
3910	Queensland	QLD	13	\N
3911	South Australia	SA	13	\N
3912	Tasmania	TAS	13	\N
3913	Victoria	VIC	13	\N
3914	Western Australia	WA	13	\N
3915	Abşeron	ABS	16	\N
3916	Ağstafa	AGA	16	\N
3917	Ağcabədi	AGC	16	\N
3918	Ağdam	AGM	16	\N
3919	Ağdaş	AGS	16	\N
3920	Ağsu	AGU	16	\N
3921	Astara	AST	16	\N
3922	Bakı	BA	16	\N
3923	Balakən	BAL	16	\N
3924	Bərdə	BAR	16	\N
3925	Beyləqan	BEY	16	\N
3926	Biləsuvar	BIL	16	\N
3927	Cəbrayıl	CAB	16	\N
3928	Cəlilabab	CAL	16	\N
3929	Daşkəsən	DAS	16	\N
3930	Füzuli	FUZ	16	\N
3931	Gəncə	GA	16	\N
3932	Gədəbəy	GAD	16	\N
3933	Goranboy	GOR	16	\N
3934	Göyçay	GOY	16	\N
3935	Göygöl	GYG	16	\N
3936	Hacıqabul	HAC	16	\N
3937	İmişli	IMI	16	\N
3938	İsmayıllı	ISM	16	\N
3939	Kəlbəcər	KAL	16	\N
3940	Kürdəmir	KUR	16	\N
3941	Lənkəran	LA	16	\N
3942	Laçın	LAC	16	\N
3943	Lənkəran	LAN	16	\N
3944	Lerik	LER	16	\N
3945	Masallı	MAS	16	\N
3946	Mingəçevir	MI	16	\N
3947	Naftalan	NA	16	\N
3948	Neftçala	NEF	16	\N
3949	Naxçıvan	NX	16	\N
3950	Oğuz	OGU	16	\N
3951	Qəbələ	QAB	16	\N
3952	Qax	QAX	16	\N
3953	Qazax	QAZ	16	\N
3954	Quba	QBA	16	\N
3955	Qubadlı	QBI	16	\N
3956	Qobustan	QOB	16	\N
3957	Qusar	QUS	16	\N
3958	Şəki	SA	16	\N
3959	Sabirabad	SAB	16	\N
3960	Şəki	SAK	16	\N
3961	Salyan	SAL	16	\N
3962	Saatlı	SAT	16	\N
3963	Şabran	SBN	16	\N
3964	Siyəzən	SIY	16	\N
3965	Şəmkir	SKR	16	\N
3966	Sumqayıt	SM	16	\N
3967	Şamaxı	SMI	16	\N
3968	Samux	SMX	16	\N
3969	Şirvan	SR	16	\N
3970	Şuşa	SUS	16	\N
3971	Tərtər	TAR	16	\N
3972	Tovuz	TOV	16	\N
3973	Ucar	UCA	16	\N
3974	Xankəndi	XA	16	\N
3975	Xaçmaz	XAC	16	\N
3976	Xocalı	XCI	16	\N
3977	Xızı	XIZ	16	\N
3978	Xocavənd	XVD	16	\N
3979	Yardımlı	YAR	16	\N
3980	Yevlax	YE	16	\N
3981	Yevlax	YEV	16	\N
3982	Zəngilan	ZAN	16	\N
3983	Zaqatala	ZAQ	16	\N
3984	Zərdab	ZAR	16	\N
3985	Federacija Bosne i Hercegovine	BIH	17	\N
3986	Brčko distrikt	BRC	17	\N
3987	Republika Srpska	SRP	17	\N
3988	Christ Church	01	18	\N
3989	Saint Andrew	02	18	\N
3990	Saint George	03	18	\N
3991	Saint James	04	18	\N
3992	Saint John	05	18	\N
3993	Saint Joseph	06	18	\N
3994	Saint Lucy	07	18	\N
3995	Saint Michael	08	18	\N
3996	Saint Peter	09	18	\N
3997	Saint Philip	10	18	\N
3998	Saint Thomas	11	18	\N
3999	Barisal	A	19	\N
4000	Chittagong	B	19	\N
4001	Dhaka	C	19	\N
4002	Khulna	D	19	\N
4003	Rajshahi	E	19	\N
4004	Rangpur	F	19	\N
4005	Sylhet	G	19	\N
4006	Bruxelles-Capitale, Région de;Brussels Hoofdstedelijk Gewest	BRU	20	\N
4007	Vlaams Gewest	VLG	20	\N
4008	wallonne, Région	WAL	20	\N
4009	Boucle du Mouhoun	01	21	\N
4010	Cascades	02	21	\N
4011	Centre	03	21	\N
4012	Centre-Est	04	21	\N
4013	Centre-Nord	05	21	\N
4014	Centre-Ouest	06	21	\N
4015	Centre-Sud	07	21	\N
4016	Est	08	21	\N
4017	Hauts-Bassins	09	21	\N
4018	Nord	10	21	\N
4019	Plateau-Central	11	21	\N
4020	Sahel	12	21	\N
4021	Sud-Ouest	13	21	\N
4022	Blagoevgrad	01	22	\N
4023	Burgas	02	22	\N
4024	Varna	03	22	\N
4025	Veliko Tarnovo	04	22	\N
4026	Vidin	05	22	\N
4027	Vratsa	06	22	\N
4028	Gabrovo	07	22	\N
4029	Dobrich	08	22	\N
4030	Kardzhali	09	22	\N
4031	Kyustendil	10	22	\N
4032	Lovech	11	22	\N
4033	Montana	12	22	\N
4034	Pazardzhik	13	22	\N
4035	Pernik	14	22	\N
4036	Pleven	15	22	\N
4037	Plovdiv	16	22	\N
4038	Razgrad	17	22	\N
4039	Ruse	18	22	\N
4040	Silistra	19	22	\N
4041	Sliven	20	22	\N
4042	Smolyan	21	22	\N
4043	Sofia-Grad	22	22	\N
4044	Sofia	23	22	\N
4045	Stara Zagora	24	22	\N
4046	Targovishte	25	22	\N
4047	Haskovo	26	22	\N
4048	Shumen	27	22	\N
4049	Yambol	28	22	\N
4050	Al Manāmah (Al ‘Āşimah)	13	23	\N
4051	Al Janūbīyah	14	23	\N
4052	Al Muḩarraq	15	23	\N
4053	Al Wusţá	16	23	\N
4054	Ash Shamālīyah	17	23	\N
4055	Bubanza	BB	24	\N
4056	Bujumbura Rural	BL	24	\N
4057	Bujumbura Mairie	BM	24	\N
4058	Bururi	BR	24	\N
4059	Cankuzo	CA	24	\N
4060	Cibitoke	CI	24	\N
4061	Gitega	GI	24	\N
4062	Kirundo	KI	24	\N
4063	Karuzi	KR	24	\N
4064	Kayanza	KY	24	\N
4065	Makamba	MA	24	\N
4066	Muramvya	MU	24	\N
4067	Mwaro	MW	24	\N
4068	Ngozi	NG	24	\N
4069	Rutana	RT	24	\N
4070	Ruyigi	RY	24	\N
4071	Atakora	AK	25	\N
4072	Alibori	AL	25	\N
4073	Atlantique	AQ	25	\N
4074	Borgou	BO	25	\N
4075	Collines	CO	25	\N
4076	Donga	DO	25	\N
4077	Kouffo	KO	25	\N
4078	Littoral	LI	25	\N
4079	Mono	MO	25	\N
4080	Ouémé	OU	25	\N
4081	Plateau	PL	25	\N
4082	Zou	ZO	25	\N
4083	Belait	BE	28	\N
4084	Brunei-Muara	BM	28	\N
4085	Temburong	TE	28	\N
4086	Tutong	TU	28	\N
4087	El Beni	B	29	\N
4088	Cochabamba	C	29	\N
4089	Chuquisaca	H	29	\N
4090	La Paz	L	29	\N
4091	Pando	N	29	\N
4092	Oruro	O	29	\N
4093	Potosí	P	29	\N
4094	Santa Cruz	S	29	\N
4095	Tarija	T	29	\N
4096	Bonaire	BO	30	\N
4097	Saba	SA	30	\N
4098	Sint Eustatius	SE	30	\N
4099	Acre	AC	31	\N
4100	Alagoas	AL	31	\N
4101	Amazonas	AM	31	\N
4102	Amapá	AP	31	\N
4103	Bahia	BA	31	\N
4104	Ceará	CE	31	\N
4105	Distrito Federal	DF	31	\N
4106	Espírito Santo	ES	31	\N
4107	Fernando de Noronha	FN	31	\N
4108	Goiás	GO	31	\N
4109	Maranhão	MA	31	\N
4110	Minas Gerais	MG	31	\N
4111	Mato Grosso do Sul	MS	31	\N
4112	Mato Grosso	MT	31	\N
4113	Pará	PA	31	\N
4114	Paraíba	PB	31	\N
4115	Pernambuco	PE	31	\N
4116	Piauí	PI	31	\N
4117	Paraná	PR	31	\N
4118	Rio de Janeiro	RJ	31	\N
4119	Rio Grande do Norte	RN	31	\N
4120	Rondônia	RO	31	\N
4121	Roraima	RR	31	\N
4122	Rio Grande do Sul	RS	31	\N
4123	Santa Catarina	SC	31	\N
4124	Sergipe	SE	31	\N
4125	São Paulo	SP	31	\N
4126	Tocantins	TO	31	\N
4127	Acklins	AK	32	\N
4128	Bimini	BI	32	\N
4129	Black Point	BP	32	\N
4130	Berry Islands	BY	32	\N
4131	Central Eleuthera	CE	32	\N
4132	Cat Island	CI	32	\N
4133	Crooked Island and Long Cay	CK	32	\N
4134	Central Abaco	CO	32	\N
4135	Central Andros	CS	32	\N
4136	East Grand Bahama	EG	32	\N
4137	Exuma	EX	32	\N
4138	City of Freeport	FP	32	\N
4139	Grand Cay	GC	32	\N
4140	Harbour Island	HI	32	\N
4141	Hope Town	HT	32	\N
4142	Inagua	IN	32	\N
4143	Long Island	LI	32	\N
4144	Mangrove Cay	MC	32	\N
4145	Mayaguana	MG	32	\N
4146	Moore's Island	MI	32	\N
4147	North Eleuthera	NE	32	\N
4148	North Abaco	NO	32	\N
4149	North Andros	NS	32	\N
4150	Rum Cay	RC	32	\N
4151	Ragged Island	RI	32	\N
4152	South Andros	SA	32	\N
4153	South Eleuthera	SE	32	\N
4154	South Abaco	SO	32	\N
4155	San Salvador	SS	32	\N
4156	Spanish Wells	SW	32	\N
4157	West Grand Bahama	WG	32	\N
4158	Paro	11	33	\N
4159	Chhukha	12	33	\N
4160	Ha	13	33	\N
4161	Samtee	14	33	\N
4162	Thimphu	15	33	\N
4163	Tsirang	21	33	\N
4164	Dagana	22	33	\N
4165	Punakha	23	33	\N
4166	Wangdue Phodrang	24	33	\N
4167	Sarpang	31	33	\N
4168	Trongsa	32	33	\N
4169	Bumthang	33	33	\N
4170	Zhemgang	34	33	\N
4171	Trashigang	41	33	\N
4172	Monggar	42	33	\N
4173	Pemagatshel	43	33	\N
4174	Lhuentse	44	33	\N
4175	Samdrup Jongkha	45	33	\N
4176	Gasa	GA	33	\N
4177	Trashi Yangtse	TY	33	\N
4178	Central	CE	35	\N
4179	Ghanzi	GH	35	\N
4180	Kgalagadi	KG	35	\N
4181	Kgatleng	KL	35	\N
4182	Kweneng	KW	35	\N
4183	North-East	NE	35	\N
4184	North-West	NW	35	\N
4185	South-East	SE	35	\N
4186	Southern	SO	35	\N
4187	Brèsckaja voblasc'	BR	36	\N
4188	Horad Minsk	HM	36	\N
4189	Homel'skaja voblasc'	HO	36	\N
4190	Hrodzenskaja voblasc'	HR	36	\N
4191	Mahilëuskaja voblasc'	MA	36	\N
4192	Minskaja voblasc'	MI	36	\N
4193	Vicebskaja voblasc'	VI	36	\N
4194	Belize	BZ	37	\N
4195	Cayo	CY	37	\N
4196	Corozal	CZL	37	\N
4197	Orange Walk	OW	37	\N
4198	Stann Creek	SC	37	\N
4199	Toledo	TOL	37	\N
4200	Alberta	AB	38	\N
4201	British Columbia	BC	38	\N
4202	Manitoba	MB	38	\N
4203	New Brunswick	NB	38	\N
4204	Newfoundland and Labrador	NL	38	\N
4205	Nova Scotia	NS	38	\N
4206	Northwest Territories	NT	38	\N
4207	Nunavut	NU	38	\N
4208	Ontario	ON	38	\N
4209	Prince Edward Island	PE	38	\N
4210	Quebec	QC	38	\N
4211	Saskatchewan	SK	38	\N
4212	Yukon Territory	YT	38	\N
4213	Bas-Congo	BC	40	\N
4214	Bandundu	BN	40	\N
4215	Équateur	EQ	40	\N
4216	Katanga	KA	40	\N
4217	Kasai-Oriental	KE	40	\N
4218	Kinshasa	KN	40	\N
4219	Kasai-Occidental	KW	40	\N
4220	Maniema	MA	40	\N
4221	Nord-Kivu	NK	40	\N
4222	Orientale	OR	40	\N
4223	Sud-Kivu	SK	40	\N
4224	Ouham	AC	41	\N
4225	Bamingui-Bangoran	BB	41	\N
4226	Bangui	BGF	41	\N
4227	Basse-Kotto	BK	41	\N
4228	Haute-Kotto	HK	41	\N
4229	Haut-Mbomou	HM	41	\N
4230	Haute-Sangha / Mambéré-Kadéï	HS	41	\N
4231	Gribingui	KB	41	\N
4232	Kémo-Gribingui	KG	41	\N
4233	Lobaye	LB	41	\N
4234	Mbomou	MB	41	\N
4235	Ombella-M'poko	MP	41	\N
4236	Nana-Mambéré	NM	41	\N
4237	Ouham-Pendé	OP	41	\N
4238	Sangha	SE	41	\N
4239	Ouaka	UK	41	\N
4240	Vakaga	VK	41	\N
4241	Bouenza	11	42	\N
4242	Pool	12	42	\N
4243	Sangha	13	42	\N
4244	Plateaux	14	42	\N
4245	Cuvette-Ouest	15	42	\N
4246	Lékoumou	2	42	\N
4247	Kouilou	5	42	\N
4248	Likouala	7	42	\N
4249	Cuvette	8	42	\N
4250	Niari	9	42	\N
4251	Brazzaville	BZV	42	\N
4252	Aargau	AG	43	\N
4253	Appenzell Innerrhoden	AI	43	\N
4254	Appenzell Ausserrhoden	AR	43	\N
4255	Bern	BE	43	\N
4256	Basel-Landschaft	BL	43	\N
4257	Basel-Stadt	BS	43	\N
4258	Fribourg	FR	43	\N
4259	Genève	GE	43	\N
4260	Glarus	GL	43	\N
4261	Graubünden	GR	43	\N
4262	Jura	JU	43	\N
4263	Luzern	LU	43	\N
4264	Neuchâtel	NE	43	\N
4265	Nidwalden	NW	43	\N
4266	Obwalden	OW	43	\N
4267	Sankt Gallen	SG	43	\N
4268	Schaffhausen	SH	43	\N
4269	Solothurn	SO	43	\N
4270	Schwyz	SZ	43	\N
4271	Thurgau	TG	43	\N
4272	Ticino	TI	43	\N
4273	Uri	UR	43	\N
4274	Vaud	VD	43	\N
4275	Valais	VS	43	\N
4276	Zug	ZG	43	\N
4277	Zürich	ZH	43	\N
4278	Lagunes (Région des)	01	44	\N
4279	Haut-Sassandra (Région du)	02	44	\N
4280	Savanes (Région des)	03	44	\N
4281	Vallée du Bandama (Région de la)	04	44	\N
4282	Moyen-Comoé (Région du)	05	44	\N
4283	18 Montagnes (Région des)	06	44	\N
4284	Lacs (Région des)	07	44	\N
4285	Zanzan (Région du)	08	44	\N
4286	Bas-Sassandra (Région du)	09	44	\N
4287	Denguélé (Région du)	10	44	\N
4288	Nzi-Comoé (Région)	11	44	\N
4289	Marahoué (Région de la)	12	44	\N
4290	Sud-Comoé (Région du)	13	44	\N
4291	Worodouqou (Région du)	14	44	\N
4292	Sud-Bandama (Région du)	15	44	\N
4293	Agnébi (Région de l')	16	44	\N
4294	Bafing (Région du)	17	44	\N
4295	Fromager (Région du)	18	44	\N
4296	Moyen-Cavally (Région du)	19	44	\N
4297	Aisén del General Carlos Ibáñez del Campo	AI	46	\N
4298	Antofagasta	AN	46	\N
4299	Arica y Parinacota	AP	46	\N
4300	Araucanía	AR	46	\N
4301	Atacama	AT	46	\N
4302	Bío-Bío	BI	46	\N
4303	Coquimbo	CO	46	\N
4304	Libertador General Bernardo O'Higgins	LI	46	\N
4305	Los Lagos	LL	46	\N
4306	Los Ríos	LR	46	\N
4307	Magallanes y Antártica Chilena	MA	46	\N
4308	Maule	ML	46	\N
4309	Región Metropolitana de Santiago	RM	46	\N
4310	Tarapacá	TA	46	\N
4311	Valparaíso	VS	46	\N
4312	Adamaoua	AD	47	\N
4313	Centre	CE	47	\N
4314	Far North	EN	47	\N
4315	East	ES	47	\N
4316	Littoral	LT	47	\N
4317	North	NO	47	\N
4318	North-West (Cameroon)	NW	47	\N
4319	West	OU	47	\N
4320	South	SU	47	\N
4321	South-West	SW	47	\N
4322	Beijing	11	48	\N
4323	Tianjin	12	48	\N
4324	Hebei	13	48	\N
4325	Shanxi	14	48	\N
4326	Nei Mongol	15	48	\N
4327	Liaoning	21	48	\N
4328	Jilin	22	48	\N
4329	Heilongjiang	23	48	\N
4330	Shanghai	31	48	\N
4331	Jiangsu	32	48	\N
4332	Zhejiang	33	48	\N
4333	Anhui	34	48	\N
4334	Fujian	35	48	\N
4335	Jiangxi	36	48	\N
4336	Shandong	37	48	\N
4337	Henan	41	48	\N
4338	Hubei	42	48	\N
4339	Hunan	43	48	\N
4340	Guangdong	44	48	\N
4341	Guangxi	45	48	\N
4342	Hainan	46	48	\N
4343	Chongqing	50	48	\N
4344	Sichuan	51	48	\N
4345	Guizhou	52	48	\N
4346	Yunnan	53	48	\N
4347	Xizang	54	48	\N
4348	Shaanxi	61	48	\N
4349	Gansu	62	48	\N
4350	Qinghai	63	48	\N
4351	Ningxia	64	48	\N
4352	Xinjiang	65	48	\N
4353	Taiwan	71	48	\N
4354	Xianggang (Hong-Kong)	91	48	\N
4355	Aomen (Macau)	92	48	\N
4356	Amazonas	AMA	49	\N
4357	Antioquia	ANT	49	\N
4358	Arauca	ARA	49	\N
4359	Atlántico	ATL	49	\N
4360	Bolívar	BOL	49	\N
4361	Boyacá	BOY	49	\N
4362	Caldas	CAL	49	\N
4363	Caquetá	CAQ	49	\N
4364	Casanare	CAS	49	\N
4365	Cauca	CAU	49	\N
4366	Cesar	CES	49	\N
4367	Chocó	CHO	49	\N
4368	Córdoba	COR	49	\N
4369	Cundinamarca	CUN	49	\N
4370	Distrito Capital de Bogotá	DC	49	\N
4371	Guainía	GUA	49	\N
4372	Guaviare	GUV	49	\N
4373	Huila	HUI	49	\N
4374	La Guajira	LAG	49	\N
4375	Magdalena	MAG	49	\N
4376	Meta	MET	49	\N
4377	Nariño	NAR	49	\N
4378	Norte de Santander	NSA	49	\N
4379	Putumayo	PUT	49	\N
4380	Quindío	QUI	49	\N
4381	Risaralda	RIS	49	\N
4382	Santander	SAN	49	\N
4383	San Andrés, Providencia y Santa Catalina	SAP	49	\N
4384	Sucre	SUC	49	\N
4385	Tolima	TOL	49	\N
4386	Valle del Cauca	VAC	49	\N
4387	Vaupés	VAU	49	\N
4388	Vichada	VID	49	\N
4389	Alajuela	A	50	\N
4390	Cartago	C	50	\N
4391	Guanacaste	G	50	\N
4392	Heredia	H	50	\N
4393	Limón	L	50	\N
4394	Puntarenas	P	50	\N
4395	San José	SJ	50	\N
4396	Pinar del Rio	01	51	\N
4397	La Habana	02	51	\N
4398	Ciudad de La Habana	03	51	\N
4399	Matanzas	04	51	\N
4400	Villa Clara	05	51	\N
4401	Cienfuegos	06	51	\N
4402	Sancti Spíritus	07	51	\N
4403	Ciego de Ávila	08	51	\N
4404	Camagüey	09	51	\N
4405	Las Tunas	10	51	\N
4406	Holguín	11	51	\N
4407	Granma	12	51	\N
4408	Santiago de Cuba	13	51	\N
4409	Guantánamo	14	51	\N
4410	Isla de la Juventud	99	51	\N
4411	Ilhas de Barlavento	B	52	\N
4412	Ilhas de Sotavento	S	52	\N
4413	Lefkosía	01	55	\N
4414	Lemesós	02	55	\N
4415	Lárnaka	03	55	\N
4416	Ammóchostos	04	55	\N
4417	Páfos	05	55	\N
4418	Kerýneia	06	55	\N
4419	Jihočeský kraj	JC	56	\N
4420	Jihomoravský kraj	JM	56	\N
4421	Karlovarský kraj	KA	56	\N
4422	Královéhradecký kraj	KR	56	\N
4423	Liberecký kraj	LI	56	\N
4424	Moravskoslezský kraj	MO	56	\N
4425	Olomoucký kraj	OL	56	\N
4426	Pardubický kraj	PA	56	\N
4427	Plzeňský kraj	PL	56	\N
4428	Praha, hlavní město	PR	56	\N
4429	Středočeský kraj	ST	56	\N
4430	Ústecký kraj	US	56	\N
4431	Vysočina	VY	56	\N
4432	Zlínský kraj	ZL	56	\N
4433	Brandenburg	BB	57	\N
4434	Berlin	BE	57	\N
4435	Baden-Württemberg	BW	57	\N
4436	Bayern	BY	57	\N
4437	Bremen	HB	57	\N
4438	Hessen	HE	57	\N
4439	Hamburg	HH	57	\N
4440	Mecklenburg-Vorpommern	MV	57	\N
4441	Niedersachsen	NI	57	\N
4442	Nordrhein-Westfalen	NW	57	\N
4443	Rheinland-Pfalz	RP	57	\N
4444	Schleswig-Holstein	SH	57	\N
4445	Saarland	SL	57	\N
4446	Sachsen	SN	57	\N
4447	Sachsen-Anhalt	ST	57	\N
4448	Thüringen	TH	57	\N
4449	Arta	AR	58	\N
4450	Ali Sabieh	AS	58	\N
4451	Dikhil	DI	58	\N
4452	Djibouti	DJ	58	\N
4453	Obock	OB	58	\N
4454	Tadjourah	TA	58	\N
4455	Nordjylland	81	59	\N
4456	Midtjylland	82	59	\N
4457	Syddanmark	83	59	\N
4458	Hovedstaden	84	59	\N
4459	Sjælland	85	59	\N
4460	Saint Peter	01	60	\N
4461	Saint Andrew	02	60	\N
4462	Saint David	03	60	\N
4463	Saint George	04	60	\N
4464	Saint John	05	60	\N
4465	Saint Joseph	06	60	\N
4466	Saint Luke	07	60	\N
4467	Saint Mark	08	60	\N
4468	Saint Patrick	09	60	\N
4469	Saint Paul	10	60	\N
4763	Carrickfergus	CKF	77	\N
4470	Distrito Nacional (Santo Domingo)	01	61	\N
4471	Azua	02	61	\N
4472	Bahoruco	03	61	\N
4473	Barahona	04	61	\N
4474	Dajabón	05	61	\N
4475	Duarte	06	61	\N
4476	La Estrelleta [Elías Piña]	07	61	\N
4477	El Seybo [El Seibo]	08	61	\N
4478	Espaillat	09	61	\N
4479	Independencia	10	61	\N
4480	La Altagracia	11	61	\N
4481	La Romana	12	61	\N
4482	La Vega	13	61	\N
4483	María Trinidad Sánchez	14	61	\N
4484	Monte Cristi	15	61	\N
4485	Pedernales	16	61	\N
4486	Peravia	17	61	\N
4487	Puerto Plata	18	61	\N
4488	Salcedo	19	61	\N
4489	Samaná	20	61	\N
4490	San Cristóbal	21	61	\N
4491	San Juan	22	61	\N
4492	San Pedro de Macorís	23	61	\N
4493	Sánchez Ramírez	24	61	\N
4494	Santiago	25	61	\N
4495	Santiago Rodríguez	26	61	\N
4496	Valverde	27	61	\N
4497	Monseñor Nouel	28	61	\N
4498	Monte Plata	29	61	\N
4499	Hato Mayor	30	61	\N
4500	Adrar	01	62	\N
4501	Chlef	02	62	\N
4502	Laghouat	03	62	\N
4503	Oum el Bouaghi	04	62	\N
4504	Batna	05	62	\N
4505	Béjaïa	06	62	\N
4506	Biskra	07	62	\N
4507	Béchar	08	62	\N
4508	Blida	09	62	\N
4509	Bouira	10	62	\N
4510	Tamanghasset	11	62	\N
4511	Tébessa	12	62	\N
4512	Tlemcen	13	62	\N
4513	Tiaret	14	62	\N
4514	Tizi Ouzou	15	62	\N
4515	Alger	16	62	\N
4516	Djelfa	17	62	\N
4517	Jijel	18	62	\N
4518	Sétif	19	62	\N
4519	Saïda	20	62	\N
4520	Skikda	21	62	\N
4521	Sidi Bel Abbès	22	62	\N
4522	Annaba	23	62	\N
4523	Guelma	24	62	\N
4524	Constantine	25	62	\N
4525	Médéa	26	62	\N
4526	Mostaganem	27	62	\N
4527	Msila	28	62	\N
4528	Mascara	29	62	\N
4529	Ouargla	30	62	\N
4530	Oran	31	62	\N
4531	El Bayadh	32	62	\N
4532	Illizi	33	62	\N
4533	Bordj Bou Arréridj	34	62	\N
4534	Boumerdès	35	62	\N
4535	El Tarf	36	62	\N
4536	Tindouf	37	62	\N
4537	Tissemsilt	38	62	\N
4538	El Oued	39	62	\N
4539	Khenchela	40	62	\N
4540	Souk Ahras	41	62	\N
4541	Tipaza	42	62	\N
4542	Mila	43	62	\N
4543	Aïn Defla	44	62	\N
4544	Naama	45	62	\N
4545	Aïn Témouchent	46	62	\N
4546	Ghardaïa	47	62	\N
4547	Relizane	48	62	\N
4548	Azuay	A	63	\N
4549	Bolívar	B	63	\N
4550	Carchi	C	63	\N
4551	Orellana	D	63	\N
4552	Esmeraldas	E	63	\N
4553	Cañar	F	63	\N
4554	Guayas	G	63	\N
4555	Chimborazo	H	63	\N
4556	Imbabura	I	63	\N
4557	Loja	L	63	\N
4558	Manabí	M	63	\N
4559	Napo	N	63	\N
4560	El Oro	O	63	\N
4561	Pichincha	P	63	\N
4562	Los Ríos	R	63	\N
4563	Morona-Santiago	S	63	\N
4564	Santo Domingo de los Tsáchilas	SD	63	\N
4565	Santa Elena	SE	63	\N
4566	Tungurahua	T	63	\N
4567	Sucumbíos	U	63	\N
4568	Galápagos	W	63	\N
4569	Cotopaxi	X	63	\N
4570	Pastaza	Y	63	\N
4571	Zamora-Chinchipe	Z	63	\N
4572	Harjumaa	37	64	\N
4573	Hiiumaa	39	64	\N
4574	Ida-Virumaa	44	64	\N
4575	Jõgevamaa	49	64	\N
4576	Järvamaa	51	64	\N
4577	Läänemaa	57	64	\N
4578	Lääne-Virumaa	59	64	\N
4579	Põlvamaa	65	64	\N
4580	Pärnumaa	67	64	\N
4581	Raplamaa	70	64	\N
4582	Saaremaa	74	64	\N
4583	Tartumaa	78	64	\N
4584	Valgamaa	82	64	\N
4585	Viljandimaa	84	64	\N
4586	Võrumaa	86	64	\N
4587	Al Iskandarīyah	ALX	65	\N
4588	Aswān	ASN	65	\N
4589	Asyūt	AST	65	\N
4590	Al Bahr al Ahmar	BA	65	\N
4591	Al Buhayrah	BH	65	\N
4592	Banī Suwayf	BNS	65	\N
4593	Al Qāhirah	C	65	\N
4594	Ad Daqahlīyah	DK	65	\N
4595	Dumyāt	DT	65	\N
4596	Al Fayyūm	FYM	65	\N
4597	Al Gharbīyah	GH	65	\N
4598	Al Jīzah	GZ	65	\N
4599	Ḩulwān	HU	65	\N
4600	Al Ismā`īlīyah	IS	65	\N
4601	Janūb Sīnā'	JS	65	\N
4602	Al Qalyūbīyah	KB	65	\N
4603	Kafr ash Shaykh	KFS	65	\N
4604	Qinā	KN	65	\N
4605	Al Minyā	MN	65	\N
4606	Al Minūfīyah	MNF	65	\N
4607	Matrūh	MT	65	\N
4608	Būr Sa`īd	PTS	65	\N
4609	Sūhāj	SHG	65	\N
4610	Ash Sharqīyah	SHR	65	\N
4611	Shamal Sīnā'	SIN	65	\N
4612	As Sādis min Uktūbar	SU	65	\N
4613	As Suways	SUZ	65	\N
4614	Al Wādī al Jadīd	WAD	65	\N
4615	Ansabā	AN	67	\N
4616	Janūbī al Baḩrī al Aḩmar	DK	67	\N
4617	Al Janūbī	DU	67	\N
4618	Qāsh-Barkah	GB	67	\N
4619	Al Awsaţ	MA	67	\N
4620	Shimālī al Baḩrī al Aḩmar	SK	67	\N
4621	Andalucía	AN	68	\N
4622	Aragón	AR	68	\N
4623	Asturias, Principado de	AS	68	\N
4624	Cantabria	CB	68	\N
4625	Ceuta	CE	68	\N
4626	Castilla y León	CL	68	\N
4627	Castilla-La Mancha	CM	68	\N
4628	Canarias	CN	68	\N
4629	Catalunya	CT	68	\N
4630	Extremadura	EX	68	\N
4631	Galicia	GA	68	\N
4632	Illes Balears	IB	68	\N
4633	Murcia, Región de	MC	68	\N
4634	Madrid, Comunidad de	MD	68	\N
4635	Melilla	ML	68	\N
4636	Navarra, Comunidad Foral de / Nafarroako Foru Komunitatea	NC	68	\N
4637	País Vasco / Euskal Herria	PV	68	\N
4638	La Rioja	RI	68	\N
4639	Valenciana, Comunidad / Valenciana, Comunitat 	VC	68	\N
4640	Ādīs Ābeba	AA	69	\N
4641	Āfar	AF	69	\N
4642	Āmara	AM	69	\N
4643	Bīnshangul Gumuz	BE	69	\N
4644	Dirē Dawa	DD	69	\N
4645	Gambēla Hizboch	GA	69	\N
4646	Hārerī Hizb	HA	69	\N
4647	Oromīya	OR	69	\N
4648	YeDebub Bihēroch Bihēreseboch na Hizboch	SN	69	\N
4649	Sumalē	SO	69	\N
4650	Tigray	TI	69	\N
4651	Ahvenanmaan maakunta	01	70	\N
4652	Etelä-Karjala	02	70	\N
4653	Etelä-Pohjanmaa	03	70	\N
4654	Etelä-Savo	04	70	\N
4655	Kainuu	05	70	\N
4656	Kanta-Häme	06	70	\N
4657	Keski-Pohjanmaa	07	70	\N
4658	Keski-Suomi	08	70	\N
4659	Kymenlaakso	09	70	\N
4660	Lappi	10	70	\N
4661	Pirkanmaa	11	70	\N
4662	Pohjanmaa	12	70	\N
4663	Pohjois-Karjala	13	70	\N
4664	Pohjois-Pohjanmaa	14	70	\N
4665	Pohjois-Savo	15	70	\N
4666	Päijät-Häme	16	70	\N
4667	Satakunta	17	70	\N
4668	Uusimaa	18	70	\N
4669	Varsinais-Suomi	19	70	\N
4670	Central	C	71	\N
4671	Eastern	E	71	\N
4672	Northern	N	71	\N
4673	Rotuma	R	71	\N
4674	Western	W	71	\N
4675	Kosrae	KSA	73	\N
4676	Pohnpei	PNI	73	\N
4677	Chuuk	TRK	73	\N
4678	Yap	YAP	73	\N
4679	Alsace	A	75	\N
4680	Aquitaine	B	75	\N
4681	Saint-Barthélemy	BL	75	\N
4682	Auvergne	C	75	\N
4683	Clipperton	CP	75	\N
4684	Bourgogne	D	75	\N
4685	Bretagne	E	75	\N
4686	Centre	F	75	\N
4687	Champagne-Ardenne	G	75	\N
4688	Guyane	GF	75	\N
4689	Guadeloupe	GP	75	\N
4690	Corse	H	75	\N
4691	Franche-Comté	I	75	\N
4692	Île-de-France	J	75	\N
4693	Languedoc-Roussillon	K	75	\N
4694	Limousin	L	75	\N
4695	Lorraine	M	75	\N
4696	Saint-Martin	MF	75	\N
4697	Martinique	MQ	75	\N
4698	Midi-Pyrénées	N	75	\N
4699	Nouvelle-Calédonie	NC	75	\N
4700	Nord-Pas-de-Calais	O	75	\N
4701	Basse-Normandie	P	75	\N
4702	Polynésie française	PF	75	\N
4703	Saint-Pierre-et-Miquelon	PM	75	\N
4704	Haute-Normandie	Q	75	\N
4705	Pays de la Loire	R	75	\N
4706	La Réunion	RE	75	\N
4707	Picardie	S	75	\N
4708	Poitou-Charentes	T	75	\N
4709	Terres australes françaises	TF	75	\N
4710	Provence-Alpes-Côte d'Azur	U	75	\N
4711	Rhône-Alpes	V	75	\N
4712	Wallis-et-Futuna	WF	75	\N
4713	Mayotte	YT	75	\N
4714	Estuaire	1	76	\N
4715	Haut-Ogooué	2	76	\N
4716	Moyen-Ogooué	3	76	\N
4717	Ngounié	4	76	\N
4718	Nyanga	5	76	\N
4719	Ogooué-Ivindo	6	76	\N
4720	Ogooué-Lolo	7	76	\N
4721	Ogooué-Maritime	8	76	\N
4722	Woleu-Ntem	9	76	\N
4723	Aberdeenshire	ABD	77	\N
4724	Aberdeen City	ABE	77	\N
4725	Argyll and Bute	AGB	77	\N
4726	Isle of Anglesey;Sir Ynys Môn	AGY	77	\N
4727	Angus	ANS	77	\N
4728	Antrim	ANT	77	\N
4729	Ards	ARD	77	\N
4730	Armagh	ARM	77	\N
4731	Bath and North East Somerset	BAS	77	\N
4732	Blackburn with Darwen	BBD	77	\N
4733	Bedford	BDF	77	\N
4734	Barking and Dagenham	BDG	77	\N
4735	Brent	BEN	77	\N
4736	Bexley	BEX	77	\N
4737	Belfast	BFS	77	\N
4738	Bridgend;Pen-y-bont ar Ogwr	BGE	77	\N
4739	Blaenau Gwent	BGW	77	\N
4740	Birmingham	BIR	77	\N
4741	Buckinghamshire	BKM	77	\N
4742	Ballymena	BLA	77	\N
4743	Ballymoney	BLY	77	\N
4744	Bournemouth	BMH	77	\N
4745	Banbridge	BNB	77	\N
4746	Barnet	BNE	77	\N
4747	Brighton and Hove	BNH	77	\N
4748	Barnsley	BNS	77	\N
4749	Bolton	BOL	77	\N
4750	Blackpool	BPL	77	\N
4751	Bracknell Forest	BRC	77	\N
4752	Bradford	BRD	77	\N
4753	Bromley	BRY	77	\N
4754	Bristol, City of	BST	77	\N
4755	Bury	BUR	77	\N
4756	Cambridgeshire	CAM	77	\N
4757	Caerphilly;Caerffili	CAY	77	\N
4758	Central Bedfordshire	CBF	77	\N
4759	Ceredigion;Sir Ceredigion	CGN	77	\N
4760	Craigavon	CGV	77	\N
4761	Cheshire East	CHE	77	\N
4762	Cheshire West and Chester	CHW	77	\N
4764	Cookstown	CKT	77	\N
4765	Calderdale	CLD	77	\N
4766	Clackmannanshire	CLK	77	\N
4767	Coleraine	CLR	77	\N
4768	Cumbria	CMA	77	\N
4769	Camden	CMD	77	\N
4770	Carmarthenshire;Sir Gaerfyrddin	CMN	77	\N
4771	Cornwall	CON	77	\N
4772	Coventry	COV	77	\N
4773	Cardiff;Caerdydd	CRF	77	\N
4774	Croydon	CRY	77	\N
4775	Castlereagh	CSR	77	\N
4776	Conwy	CWY	77	\N
4777	Darlington	DAL	77	\N
4778	Derbyshire	DBY	77	\N
4779	Denbighshire;Sir Ddinbych	DEN	77	\N
4780	Derby	DER	77	\N
4781	Devon	DEV	77	\N
4782	Dungannon and South Tyrone	DGN	77	\N
4783	Dumfries and Galloway	DGY	77	\N
4784	Doncaster	DNC	77	\N
4785	Dundee City	DND	77	\N
4786	Dorset	DOR	77	\N
4787	Down	DOW	77	\N
4788	Derry	DRY	77	\N
4789	Dudley	DUD	77	\N
4790	Durham, County	DUR	77	\N
4791	Ealing	EAL	77	\N
4792	England and Wales	EAW	77	\N
4793	East Ayrshire	EAY	77	\N
4794	Edinburgh, City of	EDH	77	\N
4795	East Dunbartonshire	EDU	77	\N
4796	East Lothian	ELN	77	\N
4797	Eilean Siar	ELS	77	\N
4798	Enfield	ENF	77	\N
4799	England	ENG	77	\N
4800	East Renfrewshire	ERW	77	\N
4801	East Riding of Yorkshire	ERY	77	\N
4802	Essex	ESS	77	\N
4803	East Sussex	ESX	77	\N
4804	Falkirk	FAL	77	\N
4805	Fermanagh	FER	77	\N
4806	Fife	FIF	77	\N
4807	Flintshire;Sir y Fflint	FLN	77	\N
4808	Gateshead	GAT	77	\N
4809	Great Britain	GBN	77	\N
4810	Glasgow City	GLG	77	\N
4811	Gloucestershire	GLS	77	\N
4812	Greenwich	GRE	77	\N
4813	Gwynedd	GWN	77	\N
4814	Halton	HAL	77	\N
4815	Hampshire	HAM	77	\N
4816	Havering	HAV	77	\N
4817	Hackney	HCK	77	\N
4818	Herefordshire	HEF	77	\N
4819	Hillingdon	HIL	77	\N
4820	Highland	HLD	77	\N
4821	Hammersmith and Fulham	HMF	77	\N
4822	Hounslow	HNS	77	\N
4823	Hartlepool	HPL	77	\N
4824	Hertfordshire	HRT	77	\N
4825	Harrow	HRW	77	\N
4826	Haringey	HRY	77	\N
4827	Isle of Wight	IOW	77	\N
4828	Islington	ISL	77	\N
4829	Inverclyde	IVC	77	\N
4830	Kensington and Chelsea	KEC	77	\N
4831	Kent	KEN	77	\N
4832	Kingston upon Hull	KHL	77	\N
4833	Kirklees	KIR	77	\N
4834	Kingston upon Thames	KTT	77	\N
4835	Knowsley	KWL	77	\N
4836	Lancashire	LAN	77	\N
4837	Lambeth	LBH	77	\N
4838	Leicester	LCE	77	\N
4839	Leeds	LDS	77	\N
4840	Leicestershire	LEC	77	\N
4841	Lewisham	LEW	77	\N
4842	Lincolnshire	LIN	77	\N
4843	Liverpool	LIV	77	\N
4844	Limavady	LMV	77	\N
4845	London, City of	LND	77	\N
4846	Larne	LRN	77	\N
4847	Lisburn	LSB	77	\N
4848	Luton	LUT	77	\N
4849	Manchester	MAN	77	\N
4850	Middlesbrough	MDB	77	\N
4851	Medway	MDW	77	\N
4852	Magherafelt	MFT	77	\N
4853	Milton Keynes	MIK	77	\N
4854	Midlothian	MLN	77	\N
4855	Monmouthshire;Sir Fynwy	MON	77	\N
4856	Merton	MRT	77	\N
4857	Moray	MRY	77	\N
4858	Merthyr Tydfil;Merthyr Tudful	MTY	77	\N
4859	Moyle	MYL	77	\N
4860	North Ayrshire	NAY	77	\N
4861	Northumberland	NBL	77	\N
4862	North Down	NDN	77	\N
4863	North East Lincolnshire	NEL	77	\N
4864	Newcastle upon Tyne	NET	77	\N
4865	Norfolk	NFK	77	\N
4866	Nottingham	NGM	77	\N
4867	Northern Ireland	NIR	77	\N
4868	North Lanarkshire	NLK	77	\N
4869	North Lincolnshire	NLN	77	\N
4870	North Somerset	NSM	77	\N
4871	Newtownabbey	NTA	77	\N
4872	Northamptonshire	NTH	77	\N
4873	Neath Port Talbot;Castell-nedd Port Talbot	NTL	77	\N
4874	Nottinghamshire	NTT	77	\N
4875	North Tyneside	NTY	77	\N
4876	Newham	NWM	77	\N
4877	Newport;Casnewydd	NWP	77	\N
4878	North Yorkshire	NYK	77	\N
4879	Newry and Mourne	NYM	77	\N
4880	Oldham	OLD	77	\N
4881	Omagh	OMH	77	\N
4882	Orkney Islands	ORK	77	\N
4883	Oxfordshire	OXF	77	\N
4884	Pembrokeshire;Sir Benfro	PEM	77	\N
4885	Perth and Kinross	PKN	77	\N
4886	Plymouth	PLY	77	\N
4887	Poole	POL	77	\N
4888	Portsmouth	POR	77	\N
4889	Powys	POW	77	\N
4890	Peterborough	PTE	77	\N
4891	Redcar and Cleveland	RCC	77	\N
4892	Rochdale	RCH	77	\N
4893	Rhondda, Cynon, Taff;Rhondda, Cynon,Taf	RCT	77	\N
4894	Redbridge	RDB	77	\N
4895	Reading	RDG	77	\N
4896	Renfrewshire	RFW	77	\N
4897	Richmond upon Thames	RIC	77	\N
4898	Rotherham	ROT	77	\N
4899	Rutland	RUT	77	\N
4900	Sandwell	SAW	77	\N
4901	South Ayrshire	SAY	77	\N
4902	Scottish Borders, The	SCB	77	\N
4903	Scotland	SCT	77	\N
4904	Suffolk	SFK	77	\N
4905	Sefton	SFT	77	\N
4906	South Gloucestershire	SGC	77	\N
4907	Sheffield	SHF	77	\N
4908	St. Helens	SHN	77	\N
4909	Shropshire	SHR	77	\N
4910	Stockport	SKP	77	\N
4911	Salford	SLF	77	\N
4912	Slough	SLG	77	\N
4913	South Lanarkshire	SLK	77	\N
4914	Sunderland	SND	77	\N
4915	Solihull	SOL	77	\N
4916	Somerset	SOM	77	\N
4917	Southend-on-Sea	SOS	77	\N
4918	Surrey	SRY	77	\N
4919	Strabane	STB	77	\N
4920	Stoke-on-Trent	STE	77	\N
4921	Stirling	STG	77	\N
4922	Southampton	STH	77	\N
4923	Sutton	STN	77	\N
4924	Staffordshire	STS	77	\N
4925	Stockton-on-Tees	STT	77	\N
4926	South Tyneside	STY	77	\N
4927	Swansea;Abertawe	SWA	77	\N
4928	Swindon	SWD	77	\N
4929	Southwark	SWK	77	\N
4930	Tameside	TAM	77	\N
4931	Telford and Wrekin	TFW	77	\N
4932	Thurrock	THR	77	\N
4933	Torbay	TOB	77	\N
4934	Torfaen;Tor-faen	TOF	77	\N
4935	Trafford	TRF	77	\N
4936	Tower Hamlets	TWH	77	\N
4937	United Kingdom	UKM	77	\N
4938	Vale of Glamorgan, The;Bro Morgannwg	VGL	77	\N
4939	Warwickshire	WAR	77	\N
4940	West Berkshire	WBK	77	\N
4941	West Dunbartonshire	WDU	77	\N
4942	Waltham Forest	WFT	77	\N
4943	Wigan	WGN	77	\N
4944	Wakefield	WKF	77	\N
4945	Walsall	WLL	77	\N
4946	West Lothian	WLN	77	\N
4947	Wales	WLS	77	\N
4948	Wolverhampton	WLV	77	\N
4949	Wandsworth	WND	77	\N
4950	Windsor and Maidenhead	WNM	77	\N
4951	Wokingham	WOK	77	\N
4952	Worcestershire	WOR	77	\N
4953	Wirral	WRL	77	\N
4954	Warrington	WRT	77	\N
4955	Wrexham;Wrecsam	WRX	77	\N
4956	Westminster	WSM	77	\N
4957	West Sussex	WSX	77	\N
4958	York	YOR	77	\N
4959	Shetland Islands	ZET	77	\N
4960	Wiltshire	WIL	77	\N
4961	Saint Andrew	01	78	\N
4962	Saint David	02	78	\N
4963	Saint George	03	78	\N
4964	Saint John	04	78	\N
4965	Saint Mark	05	78	\N
4966	Saint Patrick	06	78	\N
4967	Southern Grenadine Islands	10	78	\N
4968	Abkhazia	AB	79	\N
4969	Ajaria	AJ	79	\N
4970	Guria	GU	79	\N
4971	Imeret’i	IM	79	\N
4972	Kakhet’i	KA	79	\N
4973	K’vemo K’art’li	KK	79	\N
4974	Mts’khet’a-Mt’ianet’i	MM	79	\N
4975	Racha-Lech’khumi-K’vemo Svanet’i	RL	79	\N
4976	Samts’khe-Javakhet’i	SJ	79	\N
4977	Shida K’art’li	SK	79	\N
4978	Samegrelo-Zemo Svanet’i	SZ	79	\N
4979	T’bilisi	TB	79	\N
4980	Greater Accra	AA	82	\N
4981	Ashanti	AH	82	\N
4982	Brong-Ahafo	BA	82	\N
4983	Central	CP	82	\N
4984	Eastern	EP	82	\N
4985	Northern	NP	82	\N
4986	Volta	TV	82	\N
4987	Upper East	UE	82	\N
4988	Upper West	UW	82	\N
4989	Western	WP	82	\N
4990	Kommune Kujalleq	KU	84	\N
4991	Qaasuitsup Kommunia	QA	84	\N
4992	Qeqqata Kommunia	QE	84	\N
4993	Kommuneqarfik Sermersooq	SM	84	\N
4994	Banjul	B	85	\N
4995	Lower River	L	85	\N
4996	Central River	M	85	\N
4997	North Bank	N	85	\N
4998	Upper River	U	85	\N
4999	Western	W	85	\N
5000	Boké	B	86	\N
5001	Conakry	C	86	\N
5002	Kindia	D	86	\N
5003	Faranah	F	86	\N
5004	Kankan	K	86	\N
5005	Labé	L	86	\N
5006	Mamou	M	86	\N
5007	Nzérékoré	N	86	\N
5008	Región Continental	C	88	\N
5009	Región Insular	I	88	\N
5010	Agio Oros	69	89	\N
5011	Anatoliki Makedonia kai Thraki	A	89	\N
5012	Kentriki Makedonia	B	89	\N
5013	Dytiki Makedonia	C	89	\N
5014	Ipeiros	D	89	\N
5015	Thessalia	E	89	\N
5016	Ionia Nisia	F	89	\N
5017	Dytiki Ellada	G	89	\N
5018	Sterea Ellada	H	89	\N
5019	Attiki	I	89	\N
5020	Peloponnisos	J	89	\N
5021	Voreio Aigaio	K	89	\N
5022	Notio Aigaio	L	89	\N
5023	Kriti	M	89	\N
5024	Alta Verapaz	AV	91	\N
5025	Baja Verapaz	BV	91	\N
5026	Chimaltenango	CM	91	\N
5027	Chiquimula	CQ	91	\N
5028	Escuintla	ES	91	\N
5029	Guatemala	GU	91	\N
5030	Huehuetenango	HU	91	\N
5031	Izabal	IZ	91	\N
5032	Jalapa	JA	91	\N
5033	Jutiapa	JU	91	\N
5034	Petén	PE	91	\N
5035	El Progreso	PR	91	\N
5036	Quiché	QC	91	\N
5037	Quetzaltenango	QZ	91	\N
5038	Retalhuleu	RE	91	\N
5039	Sacatepéquez	SA	91	\N
5040	San Marcos	SM	91	\N
5041	Sololá	SO	91	\N
5042	Santa Rosa	SR	91	\N
5043	Suchitepéquez	SU	91	\N
5044	Totonicapán	TO	91	\N
5045	Zacapa	ZA	91	\N
5046	Bissau	BS	93	\N
5047	Leste	L	93	\N
5048	Norte	N	93	\N
5049	Sul	S	93	\N
5050	Barima-Waini	BA	94	\N
5051	Cuyuni-Mazaruni	CU	94	\N
5052	Demerara-Mahaica	DE	94	\N
5053	East Berbice-Corentyne	EB	94	\N
5054	Essequibo Islands-West Demerara	ES	94	\N
5055	Mahaica-Berbice	MA	94	\N
5056	Pomeroon-Supenaam	PM	94	\N
5057	Potaro-Siparuni	PT	94	\N
5058	Upper Demerara-Berbice	UD	94	\N
5059	Upper Takutu-Upper Essequibo	UT	94	\N
5060	Atlántida	AT	97	\N
5061	Choluteca	CH	97	\N
5062	Colón	CL	97	\N
5063	Comayagua	CM	97	\N
5064	Copán	CP	97	\N
5065	Cortés	CR	97	\N
5066	El Paraíso	EP	97	\N
5067	Francisco Morazán	FM	97	\N
5068	Gracias a Dios	GD	97	\N
5069	Islas de la Bahía	IB	97	\N
5070	Intibucá	IN	97	\N
5071	Lempira	LE	97	\N
5072	La Paz	LP	97	\N
5073	Ocotepeque	OC	97	\N
5074	Olancho	OL	97	\N
5075	Santa Bárbara	SB	97	\N
5076	Valle	VA	97	\N
5077	Yoro	YO	97	\N
5078	Zagrebačka županija	01	98	\N
5079	Krapinsko-zagorska županija	02	98	\N
5080	Sisačko-moslavačka županija	03	98	\N
5081	Karlovačka županija	04	98	\N
5082	Varaždinska županija	05	98	\N
5083	Koprivničko-križevačka županija	06	98	\N
5084	Bjelovarsko-bilogorska županija	07	98	\N
5085	Primorsko-goranska županija	08	98	\N
5086	Ličko-senjska županija	09	98	\N
5087	Virovitičko-podravska županija	10	98	\N
5088	Požeško-slavonska županija	11	98	\N
5089	Brodsko-posavska županija	12	98	\N
5090	Zadarska županija	13	98	\N
5091	Osječko-baranjska županija	14	98	\N
5092	Šibensko-kninska županija	15	98	\N
5093	Vukovarsko-srijemska županija	16	98	\N
5094	Splitsko-dalmatinska županija	17	98	\N
5095	Istarska županija	18	98	\N
5096	Dubrovačko-neretvanska županija	19	98	\N
5097	Međimurska županija	20	98	\N
5098	Grad Zagreb	21	98	\N
5099	Artibonite	AR	99	\N
5100	Centre	CE	99	\N
5101	Grande-Anse	GA	99	\N
5102	Nord	ND	99	\N
5103	Nord-Est	NE	99	\N
5104	Nord-Ouest	NO	99	\N
5105	Ouest	OU	99	\N
5106	Sud	SD	99	\N
5107	Sud-Est	SE	99	\N
5108	Baranya	BA	100	\N
5109	Békéscsaba	BC	100	\N
5110	Békés	BE	100	\N
5111	Bács-Kiskun	BK	100	\N
5112	Budapest	BU	100	\N
5113	Borsod-Abaúj-Zemplén	BZ	100	\N
5114	Csongrád	CS	100	\N
5115	Debrecen	DE	100	\N
5116	Dunaújváros	DU	100	\N
5117	Eger	EG	100	\N
5118	Érd	ER	100	\N
5119	Fejér	FE	100	\N
5120	Győr-Moson-Sopron	GS	100	\N
5121	Győr	GY	100	\N
5122	Hajdú-Bihar	HB	100	\N
5123	Heves	HE	100	\N
5124	Hódmezővásárhely	HV	100	\N
5125	Jász-Nagykun-Szolnok	JN	100	\N
5126	Komárom-Esztergom	KE	100	\N
5127	Kecskemét	KM	100	\N
5128	Kaposvár	KV	100	\N
5129	Miskolc	MI	100	\N
5130	Nagykanizsa	NK	100	\N
5131	Nógrád	NO	100	\N
5132	Nyíregyháza	NY	100	\N
5133	Pest	PE	100	\N
5134	Pécs	PS	100	\N
5135	Szeged	SD	100	\N
5136	Székesfehérvár	SF	100	\N
5137	Szombathely	SH	100	\N
5138	Szolnok	SK	100	\N
5139	Sopron	SN	100	\N
5140	Somogy	SO	100	\N
5141	Szekszárd	SS	100	\N
5142	Salgótarján	ST	100	\N
5143	Szabolcs-Szatmár-Bereg	SZ	100	\N
5144	Tatabánya	TB	100	\N
5145	Tolna	TO	100	\N
5146	Vas	VA	100	\N
5147	Veszprém (county)	VE	100	\N
5148	Veszprém	VM	100	\N
5149	Zala	ZA	100	\N
5150	Zalaegerszeg	ZE	100	\N
5151	Papua	IJ	101	\N
5152	Jawa	JW	101	\N
5153	Kalimantan	KA	101	\N
5154	Maluku	ML	101	\N
5155	Nusa Tenggara	NU	101	\N
5156	Sulawesi	SL	101	\N
5157	Sumatera	SM	101	\N
5158	Connacht	C	102	\N
5159	Leinster	L	102	\N
5160	Munster	M	102	\N
5161	Ulster	U	102	\N
5162	HaDarom	D	103	\N
5163	Hefa	HA	103	\N
5164	Yerushalayim Al Quds	JM	103	\N
5165	HaMerkaz	M	103	\N
5166	Tel-Aviv	TA	103	\N
5167	HaZafon	Z	103	\N
5168	Andaman and Nicobar Islands	AN	105	\N
5169	Andhra Pradesh	AP	105	\N
5170	Arunachal Pradesh	AR	105	\N
5171	Assam	AS	105	\N
5172	Bihar	BR	105	\N
5173	Chandigarh	CH	105	\N
5174	Chhattisgarh	CT	105	\N
5175	Damen and Diu	DD	105	\N
5176	Delhi	DL	105	\N
5177	Dadra and Nagar Haveli	DN	105	\N
5178	Goa	GA	105	\N
5179	Gujarat	GJ	105	\N
5180	Himachal Pradesh	HP	105	\N
5181	Haryana	HR	105	\N
5182	Jharkhand	JH	105	\N
5183	Jammu and Kashmir	JK	105	\N
5184	Karnataka	KA	105	\N
5185	Kerala	KL	105	\N
5186	Lakshadweep	LD	105	\N
5187	Maharashtra	MH	105	\N
5188	Meghalaya	ML	105	\N
5189	Manipur	MN	105	\N
5190	Madhya Pradesh	MP	105	\N
5191	Mizoram	MZ	105	\N
5192	Nagaland	NL	105	\N
5193	Orissa	OR	105	\N
5194	Punjab	PB	105	\N
5195	Puducherry	PY	105	\N
5196	Rajasthan	RJ	105	\N
5197	Sikkim	SK	105	\N
5198	Tamil Nadu	TN	105	\N
5199	Tripura	TR	105	\N
5200	Uttar Pradesh	UP	105	\N
5201	Uttarakhand	UT	105	\N
5202	West Bengal	WB	105	\N
5203	Al Anbar	AN	107	\N
5204	Arbil	AR	107	\N
5205	Al Basrah	BA	107	\N
5206	Babil	BB	107	\N
5207	Baghdad	BG	107	\N
5208	Dahuk	DA	107	\N
5209	Diyala	DI	107	\N
5210	Dhi Qar	DQ	107	\N
5211	Karbala'	KA	107	\N
5212	Maysan	MA	107	\N
5213	Al Muthanna	MU	107	\N
5214	An Najef	NA	107	\N
5215	Ninawa	NI	107	\N
5216	Al Qadisiyah	QA	107	\N
5217	Salah ad Din	SD	107	\N
5218	As Sulaymaniyah	SW	107	\N
5219	At Ta'mim	TS	107	\N
5220	Wasit	WA	107	\N
5221	Āzarbāyjān-e Sharqī	01	108	\N
5222	Āzarbāyjān-e Gharbī	02	108	\N
5223	Ardabīl	03	108	\N
5224	Eşfahān	04	108	\N
5225	Īlām	05	108	\N
5226	Būshehr	06	108	\N
5227	Tehrān	07	108	\N
5228	Chahār Mahāll va Bakhtīārī	08	108	\N
5229	Khūzestān	10	108	\N
5230	Zanjān	11	108	\N
5231	Semnān	12	108	\N
5232	Sīstān va Balūchestān	13	108	\N
5233	Fārs	14	108	\N
5234	Kermān	15	108	\N
5235	Kordestān	16	108	\N
5236	Kermānshāh	17	108	\N
5237	Kohgīlūyeh va Būyer Ahmad	18	108	\N
5238	Gīlān	19	108	\N
5239	Lorestān	20	108	\N
5240	Māzandarān	21	108	\N
5241	Markazī	22	108	\N
5242	Hormozgān	23	108	\N
5243	Hamadān	24	108	\N
5244	Yazd	25	108	\N
5245	Qom	26	108	\N
5246	Golestān	27	108	\N
5247	Qazvīn	28	108	\N
5248	Khorāsān-e Janūbī	29	108	\N
5249	Khorāsān-e Razavī	30	108	\N
5250	Khorāsān-e Shemālī	31	108	\N
5251	Reykjavík	0	109	\N
5252	Höfuðborgarsvæðið	1	109	\N
5253	Suðurnes	2	109	\N
5254	Vesturland	3	109	\N
5255	Vestfirðir	4	109	\N
5256	Norðurland vestra	5	109	\N
5257	Norðurland eystra	6	109	\N
5258	Austurland	7	109	\N
5259	Suðurland	8	109	\N
5260	Piemonte	21	110	\N
5261	Valle d'Aosta	23	110	\N
5262	Lombardia	25	110	\N
5263	Trentino-Alto Adige	32	110	\N
5264	Veneto	34	110	\N
5265	Friuli-Venezia Giulia	36	110	\N
5266	Liguria	42	110	\N
5267	Emilia-Romagna	45	110	\N
5268	Toscana	52	110	\N
5269	Umbria	55	110	\N
5270	Marche	57	110	\N
5271	Lazio	62	110	\N
5272	Abruzzo	65	110	\N
5273	Molise	67	110	\N
5274	Campania	72	110	\N
5275	Puglia	75	110	\N
5276	Basilicata	77	110	\N
5277	Calabria	78	110	\N
5278	Sicilia	82	110	\N
5279	Sardegna	88	110	\N
5280	Kingston	01	112	\N
5281	Saint Andrew	02	112	\N
5282	Saint Thomas	03	112	\N
5283	Portland	04	112	\N
5284	Saint Mary	05	112	\N
5285	Saint Ann	06	112	\N
5286	Trelawny	07	112	\N
5287	Saint James	08	112	\N
5288	Hanover	09	112	\N
5289	Westmoreland	10	112	\N
5290	Saint Elizabeth	11	112	\N
5291	Manchester	12	112	\N
5292	Clarendon	13	112	\N
5293	Saint Catherine	14	112	\N
5294	‘Ajlūn	AJ	113	\N
5295	‘Ammān (Al ‘Aşimah)	AM	113	\N
5296	Al ‘Aqabah	AQ	113	\N
5297	Aţ Ţafīlah	AT	113	\N
5298	Az Zarqā'	AZ	113	\N
5299	Al Balqā'	BA	113	\N
5300	Irbid	IR	113	\N
5301	Jarash	JA	113	\N
5302	Al Karak	KA	113	\N
5303	Al Mafraq	MA	113	\N
5304	Mādabā	MD	113	\N
5305	Ma‘ān	MN	113	\N
5306	Hokkaido	01	114	\N
5307	Aomori	02	114	\N
5308	Iwate	03	114	\N
5309	Miyagi	04	114	\N
5310	Akita	05	114	\N
5311	Yamagata	06	114	\N
5312	Fukushima	07	114	\N
5313	Ibaraki	08	114	\N
5314	Tochigi	09	114	\N
5315	Gunma	10	114	\N
5316	Saitama	11	114	\N
5317	Chiba	12	114	\N
5318	Tokyo	13	114	\N
5319	Kanagawa	14	114	\N
5320	Niigata	15	114	\N
5321	Toyama	16	114	\N
5322	Ishikawa	17	114	\N
5323	Fukui	18	114	\N
5324	Yamanashi	19	114	\N
5325	Nagano	20	114	\N
5326	Gifu	21	114	\N
5327	Shizuoka	22	114	\N
5328	Aichi	23	114	\N
5329	Mie	24	114	\N
5330	Shiga	25	114	\N
5331	Kyoto	26	114	\N
5332	Osaka	27	114	\N
5333	Hyogo	28	114	\N
5334	Nara	29	114	\N
5335	Wakayama	30	114	\N
5336	Tottori	31	114	\N
5337	Shimane	32	114	\N
5338	Okayama	33	114	\N
5339	Hiroshima	34	114	\N
5340	Yamaguchi	35	114	\N
5341	Tokushima	36	114	\N
5342	Kagawa	37	114	\N
5343	Ehime	38	114	\N
5344	Kochi	39	114	\N
5345	Fukuoka	40	114	\N
5346	Saga	41	114	\N
5347	Nagasaki	42	114	\N
5348	Kumamoto	43	114	\N
5349	Oita	44	114	\N
5350	Miyazaki	45	114	\N
5351	Kagoshima	46	114	\N
5352	Okinawa	47	114	\N
5353	Nairobi Municipality	110	115	\N
5354	Central	200	115	\N
5355	Coast	300	115	\N
5356	Eastern	400	115	\N
5357	North-Eastern Kaskazini Mashariki	500	115	\N
5358	Rift Valley	700	115	\N
5359	Western Magharibi	800	115	\N
5360	Batken	B	116	\N
5361	Chü	C	116	\N
5362	Bishkek	GB	116	\N
5363	Jalal-Abad	J	116	\N
5364	Naryn	N	116	\N
5365	Osh	O	116	\N
5366	Talas	T	116	\N
5367	Ysyk-Köl	Y	116	\N
5368	Banteay Mean Chey	1	117	\N
5369	Krachoh	10	117	\N
5370	Mondol Kiri	11	117	\N
5371	Phnom Penh	12	117	\N
5372	Preah Vihear	13	117	\N
5373	Prey Veaeng	14	117	\N
5374	Pousaat	15	117	\N
5375	Rotanak Kiri	16	117	\N
5376	Siem Reab	17	117	\N
5377	Krong Preah Sihanouk	18	117	\N
5378	Stueng Traeng	19	117	\N
5379	Battambang	2	117	\N
5380	Svaay Rieng	20	117	\N
5381	Taakaev	21	117	\N
5382	Otdar Mean Chey	22	117	\N
5383	Krong Kaeb	23	117	\N
5384	Krong Pailin	24	117	\N
5385	Kampong Cham	3	117	\N
5386	Kampong Chhnang	4	117	\N
5387	Kampong Speu	5	117	\N
5388	Kampong Thom	6	117	\N
5389	Kampot	7	117	\N
5390	Kandal	8	117	\N
5391	Kach Kong	9	117	\N
5392	Gilbert Islands	G	118	\N
5393	Line Islands	L	118	\N
5394	Phoenix Islands	P	118	\N
5395	Andjouân (Anjwān)	A	119	\N
5396	Andjazîdja (Anjazījah)	G	119	\N
5397	Moûhîlî (Mūhīlī)	M	119	\N
5398	Saint Kitts	K	120	\N
5399	Nevis	N	120	\N
5400	P’yŏngyang	01	121	\N
5401	P’yŏngan-namdo	02	121	\N
5402	P’yŏngan-bukto	03	121	\N
5403	Chagang-do	04	121	\N
5404	Hwanghae-namdo	05	121	\N
5405	Hwanghae-bukto	06	121	\N
5406	Kangwŏn-do	07	121	\N
5407	Hamgyŏng-namdo	08	121	\N
5408	Hamgyŏng-bukto	09	121	\N
5409	Yanggang-do	10	121	\N
5410	Nasŏn (Najin-Sŏnbong)	13	121	\N
5411	Seoul Teugbyeolsi	11	122	\N
5412	Busan Gwang'yeogsi	26	122	\N
5413	Daegu Gwang'yeogsi	27	122	\N
5414	Incheon Gwang'yeogsi	28	122	\N
5415	Gwangju Gwang'yeogsi	29	122	\N
5416	Daejeon Gwang'yeogsi	30	122	\N
5417	Ulsan Gwang'yeogsi	31	122	\N
5418	Gyeonggido	41	122	\N
5419	Gang'weondo	42	122	\N
5420	Chungcheongbukdo	43	122	\N
5421	Chungcheongnamdo	44	122	\N
5422	Jeonrabukdo	45	122	\N
5423	Jeonranamdo	46	122	\N
5424	Gyeongsangbukdo	47	122	\N
5425	Gyeongsangnamdo	48	122	\N
5426	Jejudo	49	122	\N
5427	Al Ahmadi	AH	123	\N
5428	Al Farwānīyah	FA	123	\N
5429	Hawallī	HA	123	\N
5430	Al Jahrrā’	JA	123	\N
5431	Al Kuwayt (Al ‘Āşimah)	KU	123	\N
5432	Mubārak al Kabīr	MU	123	\N
5433	Aqmola oblysy	AKM	125	\N
5434	Aqtöbe oblysy	AKT	125	\N
5435	Almaty	ALA	125	\N
5436	Almaty oblysy	ALM	125	\N
5437	Astana	AST	125	\N
5438	Atyraū oblysy	ATY	125	\N
5439	Qaraghandy oblysy	KAR	125	\N
5440	Qostanay oblysy	KUS	125	\N
5441	Qyzylorda oblysy	KZY	125	\N
5442	Mangghystaū oblysy	MAN	125	\N
5443	Pavlodar oblysy	PAV	125	\N
5444	Soltüstik Quzaqstan oblysy	SEV	125	\N
5445	Shyghys Qazaqstan oblysy	VOS	125	\N
5446	Ongtüstik Qazaqstan oblysy	YUZ	125	\N
5447	Batys Quzaqstan oblysy	ZAP	125	\N
5448	Zhambyl oblysy	ZHA	125	\N
5449	Attapu	AT	126	\N
5450	Bokèo	BK	126	\N
5451	Bolikhamxai	BL	126	\N
5452	Champasak	CH	126	\N
5453	Houaphan	HO	126	\N
5454	Khammouan	KH	126	\N
5455	Louang Namtha	LM	126	\N
5456	Louangphabang	LP	126	\N
5457	Oudômxai	OU	126	\N
5458	Phôngsali	PH	126	\N
5459	Salavan	SL	126	\N
5460	Savannakhét	SV	126	\N
5461	Vientiane	VI	126	\N
5462	Vientiane	VT	126	\N
5463	Xaignabouli	XA	126	\N
5464	Xékong	XE	126	\N
5465	Xiangkhoang	XI	126	\N
5466	Xiasômboun	XN	126	\N
5467	Aakkâr	AK	127	\N
5468	Liban-Nord	AS	127	\N
5469	Beyrouth	BA	127	\N
5470	Baalbek-Hermel	BH	127	\N
5471	Béqaa	BI	127	\N
5472	Liban-Sud	JA	127	\N
5473	Mont-Liban	JL	127	\N
5474	Nabatîyé	NA	127	\N
5475	Balzers	01	129	\N
5476	Eschen	02	129	\N
5477	Gamprin	03	129	\N
5478	Mauren	04	129	\N
5479	Planken	05	129	\N
5480	Ruggell	06	129	\N
5481	Schaan	07	129	\N
5482	Schellenberg	08	129	\N
5483	Triesen	09	129	\N
5484	Triesenberg	10	129	\N
5485	Vaduz	11	129	\N
5486	Basnāhira paḷāta	1	130	\N
5487	Madhyama paḷāta	2	130	\N
5488	Dakuṇu paḷāta	3	130	\N
5489	Uturu paḷāta	4	130	\N
5490	Næ̆gĕnahira paḷāta	5	130	\N
5491	Vayamba paḷāta	6	130	\N
5492	Uturumæ̆da paḷāta	7	130	\N
5493	Ūva paḷāta	8	130	\N
5494	Sabaragamuva paḷāta	9	130	\N
5495	Bong	BG	131	\N
5496	Bomi	BM	131	\N
5497	Grand Cape Mount	CM	131	\N
5498	Grand Bassa	GB	131	\N
5499	Grand Gedeh	GG	131	\N
5500	Grand Kru	GK	131	\N
5501	Lofa	LO	131	\N
5502	Margibi	MG	131	\N
5503	Montserrado	MO	131	\N
5504	Maryland	MY	131	\N
5505	Nimba	NI	131	\N
5506	Rivercess	RI	131	\N
5507	Sinoe	SI	131	\N
5508	Maseru	A	132	\N
5509	Butha-Buthe	B	132	\N
5510	Leribe	C	132	\N
5511	Berea	D	132	\N
5512	Mafeteng	E	132	\N
5513	Mohale's Hoek	F	132	\N
5514	Quthing	G	132	\N
5515	Qacha's Nek	H	132	\N
5516	Mokhotlong	J	132	\N
5517	Thaba-Tseka	K	132	\N
5518	Alytaus Apskritis	AL	133	\N
5519	Klaipėdos Apskritis	KL	133	\N
5520	Kauno Apskritis	KU	133	\N
5521	Marijampolės Apskritis	MR	133	\N
5522	Panevėžio Apskritis	PN	133	\N
5523	Šiaulių Apskritis	SA	133	\N
5524	Tauragés Apskritis	TA	133	\N
5525	Telšių Apskritis	TE	133	\N
5526	Utenos Apskritis	UT	133	\N
5527	Vilniaus Apskritis	VL	133	\N
5528	Diekirch	D	134	\N
5529	Grevenmacher	G	134	\N
5530	Luxembourg	L	134	\N
5531	Aglonas novads	001	135	\N
5532	Aizkraukles novads	002	135	\N
5533	Aizputes novads	003	135	\N
5534	Aknīstes novads	004	135	\N
5535	Alojas novads	005	135	\N
5536	Alsungas novads	006	135	\N
5537	Alūksnes novads	007	135	\N
5538	Amatas novads	008	135	\N
5539	Apes novads	009	135	\N
5540	Auces novads	010	135	\N
5541	Ādažu novads	011	135	\N
5542	Babītes novads	012	135	\N
5543	Baldones novads	013	135	\N
5544	Baltinavas novads	014	135	\N
5545	Balvu novads	015	135	\N
5546	Bauskas novads	016	135	\N
5547	Beverīnas novads	017	135	\N
5548	Brocēnu novads	018	135	\N
5549	Burtnieku novads	019	135	\N
5550	Carnikavas novads	020	135	\N
5551	Cesvaines novads	021	135	\N
5552	Cēsu novads	022	135	\N
5553	Ciblas novads	023	135	\N
5554	Dagdas novads	024	135	\N
5555	Daugavpils novads	025	135	\N
5556	Dobeles novads	026	135	\N
5557	Dundagas novads	027	135	\N
5558	Durbes novads	028	135	\N
5559	Engures novads	029	135	\N
5560	Ērgļu novads	030	135	\N
5561	Garkalnes novads	031	135	\N
5562	Grobiņas novads	032	135	\N
5563	Gulbenes novads	033	135	\N
5564	Iecavas novads	034	135	\N
5565	Ikšķiles novads	035	135	\N
5566	Ilūkstes novads	036	135	\N
5567	Inčukalna novads	037	135	\N
5568	Jaunjelgavas novads	038	135	\N
5569	Jaunpiebalgas novads	039	135	\N
5570	Jaunpils novads	040	135	\N
5571	Jelgavas novads	041	135	\N
5572	Jēkabpils novads	042	135	\N
5573	Kandavas novads	043	135	\N
5574	Kārsavas novads	044	135	\N
5575	Kocēnu novads	045	135	\N
5576	Kokneses novads	046	135	\N
5577	Krāslavas novads	047	135	\N
5578	Krimuldas novads	048	135	\N
5579	Krustpils novads	049	135	\N
5580	Kuldīgas novads	050	135	\N
5581	Ķeguma novads	051	135	\N
5582	Ķekavas novads	052	135	\N
5583	Lielvārdes novads	053	135	\N
5584	Limbažu novads	054	135	\N
5585	Līgatnes novads	055	135	\N
5586	Līvānu novads	056	135	\N
5587	Lubānas novads	057	135	\N
5588	Ludzas novads	058	135	\N
5589	Madonas novads	059	135	\N
5590	Mazsalacas novads	060	135	\N
5591	Mālpils novads	061	135	\N
5592	Mārupes novads	062	135	\N
5593	Mērsraga novads	063	135	\N
5594	Naukšēnu novads	064	135	\N
5595	Neretas novads	065	135	\N
5596	Nīcas novads	066	135	\N
5597	Ogres novads	067	135	\N
5598	Olaines novads	068	135	\N
5599	Ozolnieku novads	069	135	\N
5600	Pārgaujas novads	070	135	\N
5601	Pāvilostas novads	071	135	\N
5602	Pļaviņu novads	072	135	\N
5603	Preiļu novads	073	135	\N
5604	Priekules novads	074	135	\N
5605	Priekuļu novads	075	135	\N
5606	Raunas novads	076	135	\N
5607	Rēzeknes novads	077	135	\N
5608	Riebiņu novads	078	135	\N
5609	Rojas novads	079	135	\N
5610	Ropažu novads	080	135	\N
5611	Rucavas novads	081	135	\N
5612	Rugāju novads	082	135	\N
5613	Rundāles novads	083	135	\N
5614	Rūjienas novads	084	135	\N
5615	Salas novads	085	135	\N
5616	Salacgrīvas novads	086	135	\N
5617	Salaspils novads	087	135	\N
5618	Saldus novads	088	135	\N
5619	Saulkrastu novads	089	135	\N
5620	Sējas novads	090	135	\N
5621	Siguldas novads	091	135	\N
5622	Skrīveru novads	092	135	\N
5623	Skrundas novads	093	135	\N
5624	Smiltenes novads	094	135	\N
5625	Stopiņu novads	095	135	\N
5626	Strenču novads	096	135	\N
5627	Talsu novads	097	135	\N
5628	Tērvetes novads	098	135	\N
5629	Tukuma novads	099	135	\N
5630	Vaiņodes novads	100	135	\N
5631	Valkas novads	101	135	\N
5632	Varakļānu novads	102	135	\N
5633	Vārkavas novads	103	135	\N
5634	Vecpiebalgas novads	104	135	\N
5635	Vecumnieku novads	105	135	\N
5636	Ventspils novads	106	135	\N
5637	Viesītes novads	107	135	\N
5638	Viļakas novads	108	135	\N
5639	Viļānu novads	109	135	\N
5640	Zilupes novads	110	135	\N
5641	Daugavpils	DGV	135	\N
5642	Jelgava	JEL	135	\N
5643	Jēkabpils	JKB	135	\N
5644	Jūrmala	JUR	135	\N
5645	Liepāja	LPX	135	\N
5646	Rēzekne	REZ	135	\N
5647	Rīga	RIX	135	\N
5648	Ventspils	VEN	135	\N
5649	Valmiera	VMR	135	\N
5650	Banghāzī	BA	136	\N
5651	Al Buţnān	BU	136	\N
5652	Darnah	DR	136	\N
5653	Ghāt	GT	136	\N
5654	Al Jabal al Akhḑar	JA	136	\N
5655	Jaghbūb	JB	136	\N
5656	Al Jabal al Gharbī	JG	136	\N
5657	Al Jifārah	JI	136	\N
5658	Al Jufrah	JU	136	\N
5659	Al Kufrah	KF	136	\N
5660	Al Marqab	MB	136	\N
5661	Mişrātah	MI	136	\N
5662	Al Marj	MJ	136	\N
5663	Murzuq	MQ	136	\N
5664	Nālūt	NL	136	\N
5665	An Nuqaţ al Khams	NQ	136	\N
5666	Sabhā	SB	136	\N
5667	Surt	SR	136	\N
5668	Ţarābulus	TB	136	\N
5669	Al Wāḩāt	WA	136	\N
5670	Wādī al Ḩayāt	WD	136	\N
5671	Wādī ash Shāţiʾ	WS	136	\N
5672	Az Zāwiyah	ZA	136	\N
5673	Tanger-Tétouan	01	137	\N
5674	Gharb-Chrarda-Beni Hssen	02	137	\N
5675	Taza-Al Hoceima-Taounate	03	137	\N
5676	L'Oriental	04	137	\N
5677	Fès-Boulemane	05	137	\N
5678	Meknès-Tafilalet	06	137	\N
5679	Rabat-Salé-Zemmour-Zaer	07	137	\N
5680	Grand Casablanca	08	137	\N
5681	Chaouia-Ouardigha	09	137	\N
5682	Doukhala-Abda	10	137	\N
5683	Marrakech-Tensift-Al Haouz	11	137	\N
5684	Tadla-Azilal	12	137	\N
5685	Sous-Massa-Draa	13	137	\N
5686	Guelmim-Es Smara	14	137	\N
5687	Laâyoune-Boujdour-Sakia el Hamra	15	137	\N
5688	Oued ed Dahab-Lagouira	16	137	\N
5689	La Colle	CL	138	\N
5690	La Condamine	CO	138	\N
5691	Fontvieille	FO	138	\N
5692	La Gare	GA	138	\N
5693	Jardin Exotique	JE	138	\N
5694	Larvotto	LA	138	\N
5695	Malbousquet	MA	138	\N
5696	Monte-Carlo	MC	138	\N
5697	Moneghetti	MG	138	\N
5698	Monaco-Ville	MO	138	\N
5699	Moulins	MU	138	\N
5700	Port-Hercule	PH	138	\N
5701	Sainte-Dévote	SD	138	\N
5702	La Source	SO	138	\N
5703	Spélugues	SP	138	\N
5704	Saint-Roman	SR	138	\N
5705	Vallon de la Rousse	VR	138	\N
5706	Anenii Noi	AN	139	\N
5707	Bălți	BA	139	\N
5708	Tighina	BD	139	\N
5709	Briceni	BR	139	\N
5710	Basarabeasca	BS	139	\N
5711	Cahul	CA	139	\N
5712	Călărași	CL	139	\N
5713	Cimișlia	CM	139	\N
5714	Criuleni	CR	139	\N
5715	Căușeni	CS	139	\N
5716	Cantemir	CT	139	\N
5717	Chișinău	CU	139	\N
5718	Dondușeni	DO	139	\N
5719	Drochia	DR	139	\N
5720	Dubăsari	DU	139	\N
5721	Edineț	ED	139	\N
5722	Fălești	FA	139	\N
5723	Florești	FL	139	\N
5724	Găgăuzia, Unitatea teritorială autonomă	GA	139	\N
5725	Glodeni	GL	139	\N
5726	Hîncești	HI	139	\N
5727	Ialoveni	IA	139	\N
5728	Leova	LE	139	\N
5729	Nisporeni	NI	139	\N
5730	Ocnița	OC	139	\N
5731	Orhei	OR	139	\N
5732	Rezina	RE	139	\N
5733	Rîșcani	RI	139	\N
5734	Șoldănești	SD	139	\N
5735	Sîngerei	SI	139	\N
5736	Stînga Nistrului, unitatea teritorială din	SN	139	\N
5737	Soroca	SO	139	\N
5738	Strășeni	ST	139	\N
5739	Ștefan Vodă	SV	139	\N
5740	Taraclia	TA	139	\N
5741	Telenești	TE	139	\N
5742	Ungheni	UN	139	\N
5743	Andrijevica	01	140	\N
5744	Bar	02	140	\N
5745	Berane	03	140	\N
5746	Bijelo Polje	04	140	\N
5747	Budva	05	140	\N
5748	Cetinje	06	140	\N
5749	Danilovgrad	07	140	\N
5750	Herceg-Novi	08	140	\N
5751	Kolašin	09	140	\N
5752	Kotor	10	140	\N
5753	Mojkovac	11	140	\N
5754	Nikšić	12	140	\N
5755	Plav	13	140	\N
5756	Pljevlja	14	140	\N
5757	Plužine	15	140	\N
5758	Podgorica	16	140	\N
5759	Rožaje	17	140	\N
5760	Šavnik	18	140	\N
5761	Tivat	19	140	\N
5762	Ulcinj	20	140	\N
5763	Žabljak	21	140	\N
5764	Toamasina	A	142	\N
5765	Antsiranana	D	142	\N
5766	Fianarantsoa	F	142	\N
5767	Mahajanga	M	142	\N
5768	Antananarivo	T	142	\N
5769	Toliara	U	142	\N
5770	Ralik chain	L	143	\N
5771	Ratak chain	T	143	\N
5772	Aerodrom	01	144	\N
5773	Aračinovo	02	144	\N
5774	Berovo	03	144	\N
5775	Bitola	04	144	\N
5776	Bogdanci	05	144	\N
5777	Bogovinje	06	144	\N
5778	Bosilovo	07	144	\N
5779	Brvenica	08	144	\N
5780	Butel	09	144	\N
5781	Valandovo	10	144	\N
5782	Vasilevo	11	144	\N
5783	Vevčani	12	144	\N
5784	Veles	13	144	\N
5785	Vinica	14	144	\N
5786	Vraneštica	15	144	\N
5787	Vrapčište	16	144	\N
5788	Gazi Baba	17	144	\N
5789	Gevgelija	18	144	\N
5790	Gostivar	19	144	\N
5791	Gradsko	20	144	\N
5792	Debar	21	144	\N
5793	Debarca	22	144	\N
5794	Delčevo	23	144	\N
5795	Demir Kapija	24	144	\N
5796	Demir Hisar	25	144	\N
5797	Dojran	26	144	\N
5798	Dolneni	27	144	\N
5799	Drugovo	28	144	\N
5800	Gjorče Petrov	29	144	\N
5801	Želino	30	144	\N
5802	Zajas	31	144	\N
5803	Zelenikovo	32	144	\N
5804	Zrnovci	33	144	\N
5805	Ilinden	34	144	\N
5806	Jegunovce	35	144	\N
5807	Kavadarci	36	144	\N
5808	Karbinci	37	144	\N
5809	Karpoš	38	144	\N
5810	Kisela Voda	39	144	\N
5811	Kičevo	40	144	\N
5812	Konče	41	144	\N
5813	Kočani	42	144	\N
5814	Kratovo	43	144	\N
5815	Kriva Palanka	44	144	\N
5816	Krivogaštani	45	144	\N
5817	Kruševo	46	144	\N
5818	Kumanovo	47	144	\N
5819	Lipkovo	48	144	\N
5820	Lozovo	49	144	\N
5821	Mavrovo-i-Rostuša	50	144	\N
5822	Makedonska Kamenica	51	144	\N
5823	Makedonski Brod	52	144	\N
5824	Mogila	53	144	\N
5825	Negotino	54	144	\N
5826	Novaci	55	144	\N
5827	Novo Selo	56	144	\N
5828	Oslomej	57	144	\N
5829	Ohrid	58	144	\N
5830	Petrovec	59	144	\N
5831	Pehčevo	60	144	\N
5832	Plasnica	61	144	\N
5833	Prilep	62	144	\N
5834	Probištip	63	144	\N
5835	Radoviš	64	144	\N
5836	Rankovce	65	144	\N
5837	Resen	66	144	\N
5838	Rosoman	67	144	\N
5839	Saraj	68	144	\N
5840	Sveti Nikole	69	144	\N
5841	Sopište	70	144	\N
5842	Staro Nagoričane	71	144	\N
5843	Struga	72	144	\N
5844	Strumica	73	144	\N
5845	Studeničani	74	144	\N
5846	Tearce	75	144	\N
5847	Tetovo	76	144	\N
5848	Centar	77	144	\N
5849	Centar Župa	78	144	\N
5850	Čair	79	144	\N
5851	Čaška	80	144	\N
5852	Češinovo-Obleševo	81	144	\N
5853	Čučer Sandevo	82	144	\N
5854	Štip	83	144	\N
5855	Šuto Orizari	84	144	\N
5856	Kayes	1	145	\N
5857	Koulikoro	2	145	\N
5858	Sikasso	3	145	\N
5859	Ségou	4	145	\N
5860	Mopti	5	145	\N
5861	Tombouctou	6	145	\N
5862	Gao	7	145	\N
5863	Kidal	8	145	\N
5864	Bamako	BK0	145	\N
5865	Sagaing	01	146	\N
5866	Bago	02	146	\N
5867	Magway	03	146	\N
5868	Mandalay	04	146	\N
5869	Tanintharyi	05	146	\N
5870	Yangon	06	146	\N
5871	Ayeyarwady	07	146	\N
5872	Kachin	11	146	\N
5873	Kayah	12	146	\N
5874	Kayin	13	146	\N
5875	Chin	14	146	\N
5876	Mon	15	146	\N
5877	Rakhine	16	146	\N
5878	Shan	17	146	\N
5879	Orhon	035	147	\N
5880	Darhan uul	037	147	\N
5881	Hentiy	039	147	\N
5882	Hövsgöl	041	147	\N
5883	Hovd	043	147	\N
5884	Uvs	046	147	\N
5885	Töv	047	147	\N
5886	Selenge	049	147	\N
5887	Sühbaatar	051	147	\N
5888	Ömnögovi	053	147	\N
5889	Övörhangay	055	147	\N
5890	Dzavhan	057	147	\N
5891	Dundgovi	059	147	\N
5892	Dornod	061	147	\N
5893	Dornogovi	063	147	\N
5894	Govi-Sumber	064	147	\N
5895	Govi-Altay	065	147	\N
5896	Bulgan	067	147	\N
5897	Bayanhongor	069	147	\N
5898	Bayan-Ölgiy	071	147	\N
5899	Arhangay	073	147	\N
5900	Ulanbaatar	1	147	\N
5901	Hodh ech Chargui	01	151	\N
5902	Hodh el Charbi	02	151	\N
5903	Assaba	03	151	\N
5904	Gorgol	04	151	\N
5905	Brakna	05	151	\N
5906	Trarza	06	151	\N
5907	Adrar	07	151	\N
5908	Dakhlet Nouadhibou	08	151	\N
5909	Tagant	09	151	\N
5910	Guidimaka	10	151	\N
5911	Tiris Zemmour	11	151	\N
5912	Inchiri	12	151	\N
5913	Nouakchott	NKC	151	\N
5914	Attard	01	153	\N
5915	Balzan	02	153	\N
5916	Birgu	03	153	\N
5917	Birkirkara	04	153	\N
5918	Birżebbuġa	05	153	\N
5919	Bormla	06	153	\N
5920	Dingli	07	153	\N
5921	Fgura	08	153	\N
5922	Floriana	09	153	\N
5923	Fontana	10	153	\N
5924	Gudja	11	153	\N
5925	Gżira	12	153	\N
5926	Għajnsielem	13	153	\N
5927	Għarb	14	153	\N
5928	Għargħur	15	153	\N
5929	Għasri	16	153	\N
5930	Għaxaq	17	153	\N
5931	Ħamrun	18	153	\N
5932	Iklin	19	153	\N
5933	Isla	20	153	\N
5934	Kalkara	21	153	\N
5935	Kerċem	22	153	\N
5936	Kirkop	23	153	\N
5937	Lija	24	153	\N
5938	Luqa	25	153	\N
5939	Marsa	26	153	\N
5940	Marsaskala	27	153	\N
5941	Marsaxlokk	28	153	\N
5942	Mdina	29	153	\N
5943	Mellieħa	30	153	\N
5944	Mġarr	31	153	\N
5945	Mosta	32	153	\N
5946	Mqabba	33	153	\N
5947	Msida	34	153	\N
5948	Mtarfa	35	153	\N
5949	Munxar	36	153	\N
5950	Nadur	37	153	\N
5951	Naxxar	38	153	\N
5952	Paola	39	153	\N
5953	Pembroke	40	153	\N
5954	Pietà	41	153	\N
5955	Qala	42	153	\N
5956	Qormi	43	153	\N
5957	Qrendi	44	153	\N
5958	Rabat Għawdex	45	153	\N
5959	Rabat Malta	46	153	\N
5960	Safi	47	153	\N
5961	San Ġiljan	48	153	\N
5962	San Ġwann	49	153	\N
5963	San Lawrenz	50	153	\N
5964	San Pawl il-Baħar	51	153	\N
5965	Sannat	52	153	\N
5966	Santa Luċija	53	153	\N
5967	Santa Venera	54	153	\N
5968	Siġġiewi	55	153	\N
5969	Sliema	56	153	\N
5970	Swieqi	57	153	\N
5971	Ta’ Xbiex	58	153	\N
5972	Tarxien	59	153	\N
5973	Valletta	60	153	\N
5974	Xagħra	61	153	\N
5975	Xewkija	62	153	\N
5976	Xgħajra	63	153	\N
5977	Żabbar	64	153	\N
5978	Żebbuġ Għawdex	65	153	\N
5979	Żebbuġ Malta	66	153	\N
5980	Żejtun	67	153	\N
5981	Żurrieq	68	153	\N
5982	Agalega Islands	AG	154	\N
5983	Black River	BL	154	\N
5984	Beau Bassin-Rose Hill	BR	154	\N
5985	Cargados Carajos Shoals	CC	154	\N
5986	Curepipe	CU	154	\N
5987	Flacq	FL	154	\N
5988	Grand Port	GP	154	\N
5989	Moka	MO	154	\N
5990	Pamplemousses	PA	154	\N
5991	Port Louis	PL	154	\N
5992	Port Louis	PU	154	\N
5993	Plaines Wilhems	PW	154	\N
5994	Quatre Bornes	QB	154	\N
5995	Rodrigues Island	RO	154	\N
5996	Rivière du Rempart	RP	154	\N
5997	Savanne	SA	154	\N
5998	Vacoas-Phoenix	VP	154	\N
5999	Central	CE	155	\N
6000	Male	MLE	155	\N
6001	North Central	NC	155	\N
6002	North	NO	155	\N
6003	South Central	SC	155	\N
6004	South	SU	155	\N
6005	Upper North	UN	155	\N
6006	Upper South	US	155	\N
6007	Central Region	C	156	\N
6008	Northern Region	N	156	\N
6009	Southern Region	S	156	\N
6010	Aguascalientes	AGU	157	\N
6011	Baja California	BCN	157	\N
6012	Baja California Sur	BCS	157	\N
6013	Campeche	CAM	157	\N
6014	Chihuahua	CHH	157	\N
6015	Chiapas	CHP	157	\N
6016	Coahuila	COA	157	\N
6017	Colima	COL	157	\N
6018	Distrito Federal	DIF	157	\N
6019	Durango	DUR	157	\N
6020	Guerrero	GRO	157	\N
6021	Guanajuato	GUA	157	\N
6022	Hidalgo	HID	157	\N
6023	Jalisco	JAL	157	\N
6024	México	MEX	157	\N
6025	Michoacán	MIC	157	\N
6026	Morelos	MOR	157	\N
6027	Nayarit	NAY	157	\N
6028	Nuevo León	NLE	157	\N
6029	Oaxaca	OAX	157	\N
6030	Puebla	PUE	157	\N
6031	Querétaro	QUE	157	\N
6032	Quintana Roo	ROO	157	\N
6033	Sinaloa	SIN	157	\N
6034	San Luis Potosí	SLP	157	\N
6035	Sonora	SON	157	\N
6036	Tabasco	TAB	157	\N
6037	Tamaulipas	TAM	157	\N
6038	Tlaxcala	TLA	157	\N
6039	Veracruz	VER	157	\N
6040	Yucatán	YUC	157	\N
6041	Zacatecas	ZAC	157	\N
6042	Johor	01	158	\N
6043	Kedah	02	158	\N
6044	Kelantan	03	158	\N
6045	Melaka	04	158	\N
6046	Negeri Sembilan	05	158	\N
6047	Pahang	06	158	\N
6048	Pulau Pinang	07	158	\N
6049	Perak	08	158	\N
6050	Perlis	09	158	\N
6051	Selangor	10	158	\N
6052	Terengganu	11	158	\N
6053	Sabah	12	158	\N
6054	Sarawak	13	158	\N
6055	Wilayah Persekutuan Kuala Lumpur	14	158	\N
6056	Wilayah Persekutuan Labuan	15	158	\N
6057	Wilayah Persekutuan Putrajaya	16	158	\N
6058	Niassa	A	159	\N
6059	Manica	B	159	\N
6060	Gaza	G	159	\N
6061	Inhambane	I	159	\N
6062	Maputo	L	159	\N
6063	Maputo (city)	MPM	159	\N
6064	Numpula	N	159	\N
6065	Cabo Delgado	P	159	\N
6066	Zambezia	Q	159	\N
6067	Sofala	S	159	\N
6068	Tete	T	159	\N
6069	Caprivi	CA	160	\N
6070	Erongo	ER	160	\N
6071	Hardap	HA	160	\N
6072	Karas	KA	160	\N
6073	Khomas	KH	160	\N
6074	Kunene	KU	160	\N
6075	Otjozondjupa	OD	160	\N
6076	Omaheke	OH	160	\N
6077	Okavango	OK	160	\N
6078	Oshana	ON	160	\N
6079	Omusati	OS	160	\N
6080	Oshikoto	OT	160	\N
6081	Ohangwena	OW	160	\N
6082	Agadez	1	162	\N
6083	Diffa	2	162	\N
6084	Dosso	3	162	\N
6085	Maradi	4	162	\N
6086	Tahoua	5	162	\N
6087	Tillabéri	6	162	\N
6088	Zinder	7	162	\N
6089	Niamey	8	162	\N
6090	Abia	AB	164	\N
6091	Adamawa	AD	164	\N
6092	Akwa Ibom	AK	164	\N
6093	Anambra	AN	164	\N
6094	Bauchi	BA	164	\N
6095	Benue	BE	164	\N
6096	Borno	BO	164	\N
6097	Bayelsa	BY	164	\N
6098	Cross River	CR	164	\N
6099	Delta	DE	164	\N
6100	Ebonyi	EB	164	\N
6101	Edo	ED	164	\N
6102	Ekiti	EK	164	\N
6103	Enugu	EN	164	\N
6104	Abuja Capital Territory	FC	164	\N
6105	Gombe	GO	164	\N
6106	Imo	IM	164	\N
6107	Jigawa	JI	164	\N
6108	Kaduna	KD	164	\N
6109	Kebbi	KE	164	\N
6110	Kano	KN	164	\N
6111	Kogi	KO	164	\N
6112	Katsina	KT	164	\N
6113	Kwara	KW	164	\N
6114	Lagos	LA	164	\N
6115	Nassarawa	NA	164	\N
6116	Niger	NI	164	\N
6117	Ogun	OG	164	\N
6118	Ondo	ON	164	\N
6119	Osun	OS	164	\N
6120	Oyo	OY	164	\N
6121	Plateau	PL	164	\N
6122	Rivers	RI	164	\N
6123	Sokoto	SO	164	\N
6124	Taraba	TA	164	\N
6125	Yobe	YO	164	\N
6126	Zamfara	ZA	164	\N
6127	Atlántico Norte	AN	165	\N
6128	Atlántico Sur	AS	165	\N
6129	Boaco	BO	165	\N
6130	Carazo	CA	165	\N
6131	Chinandega	CI	165	\N
6132	Chontales	CO	165	\N
6133	Estelí	ES	165	\N
6134	Granada	GR	165	\N
6135	Jinotega	JI	165	\N
6136	León	LE	165	\N
6137	Madriz	MD	165	\N
6138	Managua	MN	165	\N
6139	Masaya	MS	165	\N
6140	Matagalpa	MT	165	\N
6141	Nueva Segovia	NS	165	\N
6142	Rivas	RI	165	\N
6143	Río San Juan	SJ	165	\N
6144	Aruba	AW	166	\N
6145	Bonaire	BQ1	166	\N
6146	Saba	BQ2	166	\N
6147	Sint Eustatius	BQ3	166	\N
6148	Curaçao	CW	166	\N
6149	Drenthe	DR	166	\N
6150	Flevoland	FL	166	\N
6151	Friesland	FR	166	\N
6152	Gelderland	GE	166	\N
6153	Groningen	GR	166	\N
6154	Limburg	LI	166	\N
6155	Noord-Brabant	NB	166	\N
6156	Noord-Holland	NH	166	\N
6157	Overijssel	OV	166	\N
6158	Sint Maarten	SX	166	\N
6159	Utrecht	UT	166	\N
6160	Zeeland	ZE	166	\N
6161	Zuid-Holland	ZH	166	\N
6162	Østfold	01	167	\N
6163	Akershus	02	167	\N
6164	Oslo	03	167	\N
6165	Hedmark	04	167	\N
6166	Oppland	05	167	\N
6167	Buskerud	06	167	\N
6168	Vestfold	07	167	\N
6169	Telemark	08	167	\N
6170	Aust-Agder	09	167	\N
6171	Vest-Agder	10	167	\N
6172	Rogaland	11	167	\N
6173	Hordaland	12	167	\N
6174	Sogn og Fjordane	14	167	\N
6175	Møre og Romsdal	15	167	\N
6176	Sør-Trøndelag	16	167	\N
6177	Nord-Trøndelag	17	167	\N
6178	Nordland	18	167	\N
6179	Troms	19	167	\N
6180	Finnmark	20	167	\N
6181	Svalbard (Arctic Region)	21	167	\N
6182	Jan Mayen (Arctic Region)	22	167	\N
6183	Madhyamanchal	1	168	\N
6184	Madhya Pashchimanchal	2	168	\N
6185	Pashchimanchal	3	168	\N
6186	Purwanchal	4	168	\N
6187	Sudur Pashchimanchal	5	168	\N
6188	Aiwo	01	169	\N
6189	Anabar	02	169	\N
6190	Anetan	03	169	\N
6191	Anibare	04	169	\N
6192	Baiti	05	169	\N
6193	Boe	06	169	\N
6194	Buada	07	169	\N
6195	Denigomodu	08	169	\N
6196	Ewa	09	169	\N
6197	Ijuw	10	169	\N
6198	Meneng	11	169	\N
6199	Nibok	12	169	\N
6200	Uaboe	13	169	\N
6201	Yaren	14	169	\N
6202	Chatham Islands Territory	CIT	171	\N
6203	North Island	N	171	\N
6204	South Island	S	171	\N
6205	Al Bāţinah	BA	172	\N
6206	Al Buraymī	BU	172	\N
6207	Ad Dākhilīya	DA	172	\N
6208	Masqaţ	MA	172	\N
6209	Musandam	MU	172	\N
6210	Ash Sharqīyah	SH	172	\N
6211	Al Wusţá	WU	172	\N
6212	Az̧ Z̧āhirah	ZA	172	\N
6213	Z̧ufār	ZU	172	\N
6214	Bocas del Toro	1	173	\N
6215	Coclé	2	173	\N
6216	Colón	3	173	\N
6217	Chiriquí	4	173	\N
6218	Darién	5	173	\N
6219	Herrera	6	173	\N
6220	Los Santos	7	173	\N
6221	Panamá	8	173	\N
6222	Veraguas	9	173	\N
6223	Emberá	EM	173	\N
6224	Kuna Yala	KY	173	\N
6225	Ngöbe-Buglé	NB	173	\N
6226	Amazonas	AMA	174	\N
6227	Ancash	ANC	174	\N
6228	Apurímac	APU	174	\N
6229	Arequipa	ARE	174	\N
6230	Ayacucho	AYA	174	\N
6231	Cajamarca	CAJ	174	\N
6232	El Callao	CAL	174	\N
6233	Cusco [Cuzco]	CUS	174	\N
6234	Huánuco	HUC	174	\N
6235	Huancavelica	HUV	174	\N
6236	Ica	ICA	174	\N
6237	Junín	JUN	174	\N
6238	La Libertad	LAL	174	\N
6239	Lambayeque	LAM	174	\N
6240	Lima	LIM	174	\N
6241	Municipalidad Metropolitana de Lima	LMA	174	\N
6242	Loreto	LOR	174	\N
6243	Madre de Dios	MDD	174	\N
6244	Moquegua	MOQ	174	\N
6245	Pasco	PAS	174	\N
6246	Piura	PIU	174	\N
6247	Puno	PUN	174	\N
6248	San Martín	SAM	174	\N
6249	Tacna	TAC	174	\N
6250	Tumbes	TUM	174	\N
6251	Ucayali	UCA	174	\N
6252	Chimbu	CPK	176	\N
6253	Central	CPM	176	\N
6254	East New Britain	EBR	176	\N
6255	Eastern Highlands	EHG	176	\N
6256	Enga	EPW	176	\N
6257	East Sepik	ESW	176	\N
6258	Gulf	GPK	176	\N
6259	Milne Bay	MBA	176	\N
6260	Morobe	MPL	176	\N
6261	Madang	MPM	176	\N
6262	Manus	MRL	176	\N
6263	National Capital District (Port Moresby)	NCD	176	\N
6264	New Ireland	NIK	176	\N
6265	Northern	NPP	176	\N
6266	Bougainville	NSB	176	\N
6267	Sandaun	SAN	176	\N
6268	Southern Highlands	SHM	176	\N
6269	West New Britain	WBK	176	\N
6270	Western Highlands	WHM	176	\N
6271	Western	WPD	176	\N
6272	National Capital Region	00	177	\N
6273	Ilocos (Region I)	01	177	\N
6274	Cagayan Valley (Region II)	02	177	\N
6275	Central Luzon (Region III)	03	177	\N
6276	Bicol (Region V)	05	177	\N
6277	Western Visayas (Region VI)	06	177	\N
6278	Central Visayas (Region VII)	07	177	\N
6279	Eastern Visayas (Region VIII)	08	177	\N
6280	Zamboanga Peninsula (Region IX)	09	177	\N
6281	Northern Mindanao (Region X)	10	177	\N
6282	Davao (Region XI)	11	177	\N
6283	Soccsksargen (Region XII)	12	177	\N
6284	Caraga (Region XIII)	13	177	\N
6285	Autonomous Region in Muslim Mindanao (ARMM)	14	177	\N
6286	Cordillera Administrative Region (CAR)	15	177	\N
6287	CALABARZON (Region IV-A)	40	177	\N
6288	MIMAROPA (Region IV-B)	41	177	\N
6289	Balochistan	BA	178	\N
6290	Gilgit-Baltistan	GB	178	\N
6291	Islamabad	IS	178	\N
6292	Azad Kashmir	JK	178	\N
6293	Khyber Pakhtunkhwa	KP	178	\N
6294	Punjab	PB	178	\N
6295	Sindh	SD	178	\N
6296	Federally Administered Tribal Areas	TA	178	\N
6297	Dolnośląskie	DS	179	\N
6298	Kujawsko-pomorskie	KP	179	\N
6299	Lubuskie	LB	179	\N
6300	Łódzkie	LD	179	\N
6301	Lubelskie	LU	179	\N
6302	Małopolskie	MA	179	\N
6303	Mazowieckie	MZ	179	\N
6304	Opolskie	OP	179	\N
6305	Podlaskie	PD	179	\N
6306	Podkarpackie	PK	179	\N
6307	Pomorskie	PM	179	\N
6308	Świętokrzyskie	SK	179	\N
6309	Śląskie	SL	179	\N
6310	Warmińsko-mazurskie	WN	179	\N
6311	Wielkopolskie	WP	179	\N
6312	Zachodniopomorskie	ZP	179	\N
6313	Bethlehem	BTH	182	\N
6314	Deir El Balah	DEB	182	\N
6315	Gaza	GZA	182	\N
6316	Hebron	HBN	182	\N
6317	Jerusalem	JEM	182	\N
6318	Jenin	JEN	182	\N
6319	Jericho - Al Aghwar	JRH	182	\N
6320	Khan Yunis	KYS	182	\N
6321	Nablus	NBS	182	\N
6322	North Gaza	NGZ	182	\N
6323	Qalqilya	QQA	182	\N
6324	Ramallah	RBH	182	\N
6325	Rafah	RFH	182	\N
6326	Salfit	SLT	182	\N
6327	Tubas	TBS	182	\N
6328	Tulkarm	TKM	182	\N
6329	Aveiro	01	183	\N
6330	Beja	02	183	\N
6331	Braga	03	183	\N
6332	Bragança	04	183	\N
6333	Castelo Branco	05	183	\N
6334	Coimbra	06	183	\N
6335	Évora	07	183	\N
6336	Faro	08	183	\N
6337	Guarda	09	183	\N
6338	Leiria	10	183	\N
6339	Lisboa	11	183	\N
6340	Portalegre	12	183	\N
6341	Porto	13	183	\N
6342	Santarém	14	183	\N
6343	Setúbal	15	183	\N
6344	Viana do Castelo	16	183	\N
6345	Vila Real	17	183	\N
6346	Viseu	18	183	\N
6347	Região Autónoma dos Açores	20	183	\N
6348	Região Autónoma da Madeira	30	183	\N
6349	Aimeliik	002	184	\N
6350	Airai	004	184	\N
6351	Angaur	010	184	\N
6352	Hatobohei	050	184	\N
6353	Kayangel	100	184	\N
6354	Koror	150	184	\N
6355	Melekeok	212	184	\N
6356	Ngaraard	214	184	\N
6357	Ngarchelong	218	184	\N
6358	Ngardmau	222	184	\N
6359	Ngatpang	224	184	\N
6360	Ngchesar	226	184	\N
6361	Ngeremlengui	227	184	\N
6362	Ngiwal	228	184	\N
6363	Peleliu	350	184	\N
6364	Sonsorol	370	184	\N
6365	Concepción	1	185	\N
6366	Alto Paraná	10	185	\N
6367	Central	11	185	\N
6368	Ñeembucú	12	185	\N
6369	Amambay	13	185	\N
6370	Canindeyú	14	185	\N
6371	Presidente Hayes	15	185	\N
6372	Alto Paraguay	16	185	\N
6373	Boquerón	19	185	\N
6374	San Pedro	2	185	\N
6375	Cordillera	3	185	\N
6376	Guairá	4	185	\N
6377	Caaguazú	5	185	\N
6378	Caazapá	6	185	\N
6379	Itapúa	7	185	\N
6380	Misiones	8	185	\N
6381	Paraguarí	9	185	\N
6382	Asunción	ASU	185	\N
6383	Ad Dawhah	DA	186	\N
6384	Al Khawr wa adh Dhakhīrah	KH	186	\N
6385	Ash Shamal	MS	186	\N
6386	Ar Rayyan	RA	186	\N
6387	Umm Salal	US	186	\N
6388	Al Wakrah	WA	186	\N
6389	Az̧ Z̧a‘āyin	ZA	186	\N
6390	Alba	AB	188	\N
6391	Argeș	AG	188	\N
6392	Arad	AR	188	\N
6393	București	B	188	\N
6394	Bacău	BC	188	\N
6395	Bihor	BH	188	\N
6396	Bistrița-Năsăud	BN	188	\N
6397	Brăila	BR	188	\N
6398	Botoșani	BT	188	\N
6399	Brașov	BV	188	\N
6400	Buzău	BZ	188	\N
6401	Cluj	CJ	188	\N
6402	Călărași	CL	188	\N
6403	Caraș-Severin	CS	188	\N
6404	Constanța	CT	188	\N
6405	Covasna	CV	188	\N
6406	Dâmbovița	DB	188	\N
6407	Dolj	DJ	188	\N
6408	Gorj	GJ	188	\N
6409	Galați	GL	188	\N
6410	Giurgiu	GR	188	\N
6411	Hunedoara	HD	188	\N
6412	Harghita	HR	188	\N
6413	Ilfov	IF	188	\N
6414	Ialomița	IL	188	\N
6415	Iași	IS	188	\N
6416	Mehedinți	MH	188	\N
6417	Maramureș	MM	188	\N
6418	Mureș	MS	188	\N
6419	Neamț	NT	188	\N
6420	Olt	OT	188	\N
6421	Prahova	PH	188	\N
6422	Sibiu	SB	188	\N
6423	Sălaj	SJ	188	\N
6424	Satu Mare	SM	188	\N
6425	Suceava	SV	188	\N
6426	Tulcea	TL	188	\N
6427	Timiș	TM	188	\N
6428	Teleorman	TR	188	\N
6429	Vâlcea	VL	188	\N
6430	Vrancea	VN	188	\N
6431	Vaslui	VS	188	\N
6432	Beograd	00	189	\N
6433	Mačvanski okrug	08	189	\N
6434	Kolubarski okrug	09	189	\N
6435	Podunavski okrug	10	189	\N
6436	Braničevski okrug	11	189	\N
6437	Šumadijski okrug	12	189	\N
6438	Pomoravski okrug	13	189	\N
6439	Borski okrug	14	189	\N
6440	Zaječarski okrug	15	189	\N
6441	Zlatiborski okrug	16	189	\N
6442	Moravički okrug	17	189	\N
6443	Raški okrug	18	189	\N
6444	Rasinski okrug	19	189	\N
6445	Nišavski okrug	20	189	\N
6446	Toplički okrug	21	189	\N
6447	Pirotski okrug	22	189	\N
6448	Jablanički okrug	23	189	\N
6449	Pčinjski okrug	24	189	\N
6450	Kosovo-Metohija	KM	189	\N
6451	Vojvodina	VO	189	\N
6452	Adygeya, Respublika	AD	190	\N
6453	Altay, Respublika	AL	190	\N
6454	Altayskiy kray	ALT	190	\N
6455	Amurskaya oblast'	AMU	190	\N
6456	Arkhangel'skaya oblast'	ARK	190	\N
6457	Astrakhanskaya oblast'	AST	190	\N
6458	Bashkortostan, Respublika	BA	190	\N
6459	Belgorodskaya oblast'	BEL	190	\N
6460	Bryanskaya oblast'	BRY	190	\N
6461	Buryatiya, Respublika	BU	190	\N
6462	Chechenskaya Respublika	CE	190	\N
6463	Chelyabinskaya oblast'	CHE	190	\N
6464	Chukotskiy avtonomnyy okrug	CHU	190	\N
6465	Chuvashskaya Respublika	CU	190	\N
6466	Dagestan, Respublika	DA	190	\N
6467	Respublika Ingushetiya	IN	190	\N
6468	Irkutiskaya oblast'	IRK	190	\N
6469	Ivanovskaya oblast'	IVA	190	\N
6470	Kamchatskiy kray	KAM	190	\N
6471	Kabardino-Balkarskaya Respublika	KB	190	\N
6472	Karachayevo-Cherkesskaya Respublika	KC	190	\N
6473	Krasnodarskiy kray	KDA	190	\N
6474	Kemerovskaya oblast'	KEM	190	\N
6475	Kaliningradskaya oblast'	KGD	190	\N
6476	Kurganskaya oblast'	KGN	190	\N
6477	Khabarovskiy kray	KHA	190	\N
6478	Khanty-Mansiysky avtonomnyy okrug-Yugra	KHM	190	\N
6479	Kirovskaya oblast'	KIR	190	\N
6480	Khakasiya, Respublika	KK	190	\N
6481	Kalmykiya, Respublika	KL	190	\N
6482	Kaluzhskaya oblast'	KLU	190	\N
6483	Komi, Respublika	KO	190	\N
6484	Kostromskaya oblast'	KOS	190	\N
6485	Kareliya, Respublika	KR	190	\N
6486	Kurskaya oblast'	KRS	190	\N
6487	Krasnoyarskiy kray	KYA	190	\N
6488	Leningradskaya oblast'	LEN	190	\N
6489	Lipetskaya oblast'	LIP	190	\N
6490	Magadanskaya oblast'	MAG	190	\N
6491	Mariy El, Respublika	ME	190	\N
6492	Mordoviya, Respublika	MO	190	\N
6493	Moskovskaya oblast'	MOS	190	\N
6494	Moskva	MOW	190	\N
6495	Murmanskaya oblast'	MUR	190	\N
6496	Nenetskiy avtonomnyy okrug	NEN	190	\N
6497	Novgorodskaya oblast'	NGR	190	\N
6498	Nizhegorodskaya oblast'	NIZ	190	\N
6499	Novosibirskaya oblast'	NVS	190	\N
6500	Omskaya oblast'	OMS	190	\N
6501	Orenburgskaya oblast'	ORE	190	\N
6502	Orlovskaya oblast'	ORL	190	\N
6503	Permskiy kray	PER	190	\N
6504	Penzenskaya oblast'	PNZ	190	\N
6505	Primorskiy kray	PRI	190	\N
6506	Pskovskaya oblast'	PSK	190	\N
6507	Rostovskaya oblast'	ROS	190	\N
6508	Ryazanskaya oblast'	RYA	190	\N
6509	Sakha, Respublika [Yakutiya]	SA	190	\N
6510	Sakhalinskaya oblast'	SAK	190	\N
6511	Samaraskaya oblast'	SAM	190	\N
6512	Saratovskaya oblast'	SAR	190	\N
6513	Severnaya Osetiya-Alaniya, Respublika	SE	190	\N
6514	Smolenskaya oblast'	SMO	190	\N
6515	Sankt-Peterburg	SPE	190	\N
6516	Stavropol'skiy kray	STA	190	\N
6517	Sverdlovskaya oblast'	SVE	190	\N
6518	Tatarstan, Respublika	TA	190	\N
6519	Tambovskaya oblast'	TAM	190	\N
6520	Tomskaya oblast'	TOM	190	\N
6521	Tul'skaya oblast'	TUL	190	\N
6522	Tverskaya oblast'	TVE	190	\N
6523	Tyva, Respublika [Tuva]	TY	190	\N
6524	Tyumenskaya oblast'	TYU	190	\N
6525	Udmurtskaya Respublika	UD	190	\N
6526	Ul'yanovskaya oblast'	ULY	190	\N
6527	Volgogradskaya oblast'	VGG	190	\N
6528	Vladimirskaya oblast'	VLA	190	\N
6529	Vologodskaya oblast'	VLG	190	\N
6530	Voronezhskaya oblast'	VOR	190	\N
6531	Yamalo-Nenetskiy avtonomnyy okrug	YAN	190	\N
6532	Yaroslavskaya oblast'	YAR	190	\N
6533	Yevreyskaya avtonomnaya oblast'	YEV	190	\N
6534	Zabajkal'skij kraj	ZAB	190	\N
6535	Ville de Kigali	01	191	\N
6536	Est	02	191	\N
6537	Nord	03	191	\N
6538	Ouest	04	191	\N
6539	Sud	05	191	\N
6540	Ar Riyāḍ	01	192	\N
6541	Makkah	02	192	\N
6542	Al Madīnah	03	192	\N
6543	Ash Sharqīyah	04	192	\N
6544	Al Qaşīm	05	192	\N
6545	Ḥā'il	06	192	\N
6546	Tabūk	07	192	\N
6547	Al Ḥudūd ash Shamāliyah	08	192	\N
6548	Jīzan	09	192	\N
6549	Najrān	10	192	\N
6550	Al Bāhah	11	192	\N
6551	Al Jawf	12	192	\N
6552	`Asīr	14	192	\N
6553	Central	CE	193	\N
6554	Choiseul	CH	193	\N
6555	Capital Territory (Honiara)	CT	193	\N
6556	Guadalcanal	GU	193	\N
6557	Isabel	IS	193	\N
6558	Makira	MK	193	\N
6559	Malaita	ML	193	\N
6560	Rennell and Bellona	RB	193	\N
6561	Temotu	TE	193	\N
6562	Western	WE	193	\N
6563	Anse aux Pins	01	194	\N
6564	Anse Boileau	02	194	\N
6565	Anse Etoile	03	194	\N
6566	Anse Louis	04	194	\N
6567	Anse Royale	05	194	\N
6568	Baie Lazare	06	194	\N
6569	Baie Sainte Anne	07	194	\N
6570	Beau Vallon	08	194	\N
6571	Bel Air	09	194	\N
6572	Bel Ombre	10	194	\N
6573	Cascade	11	194	\N
6574	Glacis	12	194	\N
6575	Grand Anse Mahe	13	194	\N
6576	Grand Anse Praslin	14	194	\N
6577	La Digue	15	194	\N
6578	English River	16	194	\N
6579	Mont Buxton	17	194	\N
6580	Mont Fleuri	18	194	\N
6581	Plaisance	19	194	\N
6582	Pointe Larue	20	194	\N
6583	Port Glaud	21	194	\N
6584	Saint Louis	22	194	\N
6585	Takamaka	23	194	\N
6586	Les Mamelles	24	194	\N
6587	Roche Caiman	25	194	\N
6588	Zalingei	DC	195	\N
6589	Sharq Dārfūr	DE	195	\N
6590	Shamāl Dārfūr	DN	195	\N
6591	Janūb Dārfūr	DS	195	\N
6592	Gharb Dārfūr	DW	195	\N
6593	Al Qaḑārif	GD	195	\N
6594	Al Jazīrah	GZ	195	\N
6595	Kassalā	KA	195	\N
6596	Al Kharţūm	KH	195	\N
6597	Shamāl Kurdufān	KN	195	\N
6598	Janūb Kurdufān	KS	195	\N
6599	An Nīl al Azraq	NB	195	\N
6600	Ash Shamālīyah	NO	195	\N
6601	An Nīl	NR	195	\N
6602	An Nīl al Abyaḑ	NW	195	\N
6603	Al Baḩr al Aḩmar	RS	195	\N
6604	Sinnār	SI	195	\N
6605	Stockholms län	AB	196	\N
6606	Västerbottens län	AC	196	\N
6607	Norrbottens län	BD	196	\N
6608	Uppsala län	C	196	\N
6609	Södermanlands län	D	196	\N
6610	Östergötlands län	E	196	\N
6611	Jönköpings län	F	196	\N
6612	Kronobergs län	G	196	\N
6613	Kalmar län	H	196	\N
6614	Gotlands län	I	196	\N
6615	Blekinge län	K	196	\N
6616	Skåne län	M	196	\N
6617	Hallands län	N	196	\N
6618	Västra Götalands län	O	196	\N
6619	Värmlands län	S	196	\N
6620	Örebro län	T	196	\N
6621	Västmanlands län	U	196	\N
6622	Dalarnas län	W	196	\N
6623	Gävleborgs län	X	196	\N
6624	Västernorrlands län	Y	196	\N
6625	Jämtlands län	Z	196	\N
6626	Central Singapore	01	197	\N
6627	North East	02	197	\N
6628	North West	03	197	\N
6629	South East	04	197	\N
6630	South West	05	197	\N
6631	Ascension	AC	198	\N
6632	Saint Helena	HL	198	\N
6633	Tristan da Cunha	TA	198	\N
6634	Ajdovščina	001	199	\N
6635	Beltinci	002	199	\N
6636	Bled	003	199	\N
6637	Bohinj	004	199	\N
6638	Borovnica	005	199	\N
6639	Bovec	006	199	\N
6640	Brda	007	199	\N
6641	Brezovica	008	199	\N
6642	Brežice	009	199	\N
6643	Tišina	010	199	\N
6644	Celje	011	199	\N
6645	Cerklje na Gorenjskem	012	199	\N
6646	Cerknica	013	199	\N
6647	Cerkno	014	199	\N
6648	Črenšovci	015	199	\N
6649	Črna na Koroškem	016	199	\N
6650	Črnomelj	017	199	\N
6651	Destrnik	018	199	\N
6652	Divača	019	199	\N
6653	Dobrepolje	020	199	\N
6654	Dobrova-Polhov Gradec	021	199	\N
6655	Dol pri Ljubljani	022	199	\N
6656	Domžale	023	199	\N
6657	Dornava	024	199	\N
6658	Dravograd	025	199	\N
6659	Duplek	026	199	\N
6660	Gorenja vas-Poljane	027	199	\N
6661	Gorišnica	028	199	\N
6662	Gornja Radgona	029	199	\N
6663	Gornji Grad	030	199	\N
6664	Gornji Petrovci	031	199	\N
6665	Grosuplje	032	199	\N
6666	Šalovci	033	199	\N
6667	Hrastnik	034	199	\N
6668	Hrpelje-Kozina	035	199	\N
6669	Idrija	036	199	\N
6670	Ig	037	199	\N
6671	Ilirska Bistrica	038	199	\N
6672	Ivančna Gorica	039	199	\N
6673	Izola/Isola	040	199	\N
6674	Jesenice	041	199	\N
6675	Juršinci	042	199	\N
6676	Kamnik	043	199	\N
6677	Kanal	044	199	\N
6678	Kidričevo	045	199	\N
6679	Kobarid	046	199	\N
6680	Kobilje	047	199	\N
6681	Kočevje	048	199	\N
6682	Komen	049	199	\N
6683	Koper/Capodistria	050	199	\N
6684	Kozje	051	199	\N
6685	Kranj	052	199	\N
6686	Kranjska Gora	053	199	\N
6687	Krško	054	199	\N
6688	Kungota	055	199	\N
6689	Kuzma	056	199	\N
6690	Laško	057	199	\N
6691	Lenart	058	199	\N
6692	Lendava/Lendva	059	199	\N
6693	Litija	060	199	\N
6694	Ljubljana	061	199	\N
6695	Ljubno	062	199	\N
6696	Ljutomer	063	199	\N
6697	Logatec	064	199	\N
6698	Loška dolina	065	199	\N
6699	Loški Potok	066	199	\N
6700	Luče	067	199	\N
6701	Lukovica	068	199	\N
6702	Majšperk	069	199	\N
6703	Maribor	070	199	\N
6704	Medvode	071	199	\N
6705	Mengeš	072	199	\N
6706	Metlika	073	199	\N
6707	Mežica	074	199	\N
6708	Miren-Kostanjevica	075	199	\N
6709	Mislinja	076	199	\N
6710	Moravče	077	199	\N
6711	Moravske Toplice	078	199	\N
6712	Mozirje	079	199	\N
6713	Murska Sobota	080	199	\N
6714	Muta	081	199	\N
6715	Naklo	082	199	\N
6716	Nazarje	083	199	\N
6717	Nova Gorica	084	199	\N
6718	Novo mesto	085	199	\N
6719	Odranci	086	199	\N
6720	Ormož	087	199	\N
6721	Osilnica	088	199	\N
6722	Pesnica	089	199	\N
6723	Piran/Pirano	090	199	\N
6724	Pivka	091	199	\N
6725	Podčetrtek	092	199	\N
6726	Podvelka	093	199	\N
6727	Postojna	094	199	\N
6728	Preddvor	095	199	\N
6729	Ptuj	096	199	\N
6730	Puconci	097	199	\N
6731	Rače-Fram	098	199	\N
6732	Radeče	099	199	\N
6733	Radenci	100	199	\N
6734	Radlje ob Dravi	101	199	\N
6735	Radovljica	102	199	\N
6736	Ravne na Koroškem	103	199	\N
6737	Ribnica	104	199	\N
6738	Rogašovci	105	199	\N
6739	Rogaška Slatina	106	199	\N
6740	Rogatec	107	199	\N
6741	Ruše	108	199	\N
6742	Semič	109	199	\N
6743	Sevnica	110	199	\N
6744	Sežana	111	199	\N
6745	Slovenj Gradec	112	199	\N
6746	Slovenska Bistrica	113	199	\N
6747	Slovenske Konjice	114	199	\N
6748	Starče	115	199	\N
6749	Sveti Jurij	116	199	\N
6750	Šenčur	117	199	\N
6751	Šentilj	118	199	\N
6752	Šentjernej	119	199	\N
6753	Šentjur	120	199	\N
6754	Škocjan	121	199	\N
6755	Škofja Loka	122	199	\N
6756	Škofljica	123	199	\N
6757	Šmarje pri Jelšah	124	199	\N
6758	Šmartno ob Paki	125	199	\N
6759	Šoštanj	126	199	\N
6760	Štore	127	199	\N
6761	Tolmin	128	199	\N
6762	Trbovlje	129	199	\N
6763	Trebnje	130	199	\N
6764	Tržič	131	199	\N
6765	Turnišče	132	199	\N
6766	Velenje	133	199	\N
6767	Velike Lašče	134	199	\N
6768	Videm	135	199	\N
6769	Vipava	136	199	\N
6770	Vitanje	137	199	\N
6771	Vodice	138	199	\N
6772	Vojnik	139	199	\N
6773	Vrhnika	140	199	\N
6774	Vuzenica	141	199	\N
6775	Zagorje ob Savi	142	199	\N
6776	Zavrč	143	199	\N
6777	Zreče	144	199	\N
6778	Železniki	146	199	\N
6779	Žiri	147	199	\N
6780	Benedikt	148	199	\N
6781	Bistrica ob Sotli	149	199	\N
6782	Bloke	150	199	\N
6783	Braslovče	151	199	\N
6784	Cankova	152	199	\N
6785	Cerkvenjak	153	199	\N
6786	Dobje	154	199	\N
6787	Dobrna	155	199	\N
6788	Dobrovnik/Dobronak	156	199	\N
6789	Dolenjske Toplice	157	199	\N
6790	Grad	158	199	\N
6791	Hajdina	159	199	\N
6792	Hoče-Slivnica	160	199	\N
6793	Hodoš/Hodos	161	199	\N
6794	Horjul	162	199	\N
6795	Jezersko	163	199	\N
6796	Komenda	164	199	\N
6797	Kostel	165	199	\N
6798	Križevci	166	199	\N
6799	Lovrenc na Pohorju	167	199	\N
6800	Markovci	168	199	\N
6801	Miklavž na Dravskem polju	169	199	\N
6802	Mirna Peč	170	199	\N
6803	Oplotnica	171	199	\N
6804	Podlehnik	172	199	\N
6805	Polzela	173	199	\N
6806	Prebold	174	199	\N
6807	Prevalje	175	199	\N
6808	Razkrižje	176	199	\N
6809	Ribnica na Pohorju	177	199	\N
6810	Selnica ob Dravi	178	199	\N
6811	Sodražica	179	199	\N
6812	Solčava	180	199	\N
6813	Sveta Ana	181	199	\N
6814	Sveta Andraž v Slovenskih Goricah	182	199	\N
6815	Šempeter-Vrtojba	183	199	\N
6816	Tabor	184	199	\N
6817	Trnovska vas	185	199	\N
6818	Trzin	186	199	\N
6819	Velika Polana	187	199	\N
6820	Veržej	188	199	\N
6821	Vransko	189	199	\N
6822	Žalec	190	199	\N
6823	Žetale	191	199	\N
6824	Žirovnica	192	199	\N
6825	Žužemberk	193	199	\N
6826	Šmartno pri Litiji	194	199	\N
6827	Apače	195	199	\N
6828	Cirkulane	196	199	\N
6829	Kosanjevica na Krki	197	199	\N
6830	Makole	198	199	\N
6831	Mokronog-Trebelno	199	199	\N
6832	Poljčane	200	199	\N
6833	Renče-Vogrsko	201	199	\N
6834	Središče ob Dravi	202	199	\N
6835	Straža	203	199	\N
6836	Sveta Trojica v Slovenskih Goricah	204	199	\N
6837	Sveti Tomaž	205	199	\N
6838	Šmarjeske Topliče	206	199	\N
6839	Gorje	207	199	\N
6840	Log-Dragomer	208	199	\N
6841	Rečica ob Savinji	209	199	\N
6842	Sveti Jurij v Slovenskih Goricah	210	199	\N
6843	Šentrupert	211	199	\N
6844	Banskobystrický kraj	BC	201	\N
6845	Bratislavský kraj	BL	201	\N
6846	Košický kraj	KI	201	\N
6847	Nitriansky kraj	NI	201	\N
6848	Prešovský kraj	PV	201	\N
6849	Trnavský kraj	TA	201	\N
6850	Trenčiansky kraj	TC	201	\N
6851	Žilinský kraj	ZI	201	\N
6852	Eastern	E	202	\N
6853	Northern	N	202	\N
6854	Southern (Sierra Leone)	S	202	\N
6855	Western Area (Freetown)	W	202	\N
6856	Acquaviva	01	203	\N
6857	Chiesanuova	02	203	\N
6858	Domagnano	03	203	\N
6859	Faetano	04	203	\N
6860	Fiorentino	05	203	\N
6861	Borgo Maggiore	06	203	\N
6862	San Marino	07	203	\N
6863	Montegiardino	08	203	\N
6864	Serravalle	09	203	\N
6865	Diourbel	DB	204	\N
6866	Dakar	DK	204	\N
6867	Fatick	FK	204	\N
6868	Kaffrine	KA	204	\N
6869	Kolda	KD	204	\N
6870	Kédougou	KE	204	\N
6871	Kaolack	KL	204	\N
6872	Louga	LG	204	\N
6873	Matam	MT	204	\N
6874	Sédhiou	SE	204	\N
6875	Saint-Louis	SL	204	\N
6876	Tambacounda	TC	204	\N
6877	Thiès	TH	204	\N
6878	Ziguinchor	ZG	204	\N
6879	Awdal	AW	205	\N
6880	Bakool	BK	205	\N
6881	Banaadir	BN	205	\N
6882	Bari	BR	205	\N
6883	Bay	BY	205	\N
6884	Galguduud	GA	205	\N
6885	Gedo	GE	205	\N
6886	Hiirsan	HI	205	\N
6887	Jubbada Dhexe	JD	205	\N
6888	Jubbada Hoose	JH	205	\N
6889	Mudug	MU	205	\N
6890	Nugaal	NU	205	\N
6891	Saneag	SA	205	\N
6892	Shabeellaha Dhexe	SD	205	\N
6893	Shabeellaha Hoose	SH	205	\N
6894	Sool	SO	205	\N
6895	Togdheer	TO	205	\N
6896	Woqooyi Galbeed	WO	205	\N
6897	Brokopondo	BR	206	\N
6898	Commewijne	CM	206	\N
6899	Coronie	CR	206	\N
6900	Marowijne	MA	206	\N
6901	Nickerie	NI	206	\N
6902	Paramaribo	PM	206	\N
6903	Para	PR	206	\N
6904	Saramacca	SA	206	\N
6905	Sipaliwini	SI	206	\N
6906	Wanica	WA	206	\N
6907	Northern Bahr el-Ghazal	BN	207	\N
6908	Western Bahr el-Ghazal	BW	207	\N
6909	Central Equatoria	EC	207	\N
6910	Eastern Equatoria	EE8	207	\N
6911	Western Equatoria	EW	207	\N
6912	Jonglei	JG	207	\N
6913	Lakes	LK	207	\N
6914	Upper Nile	NU	207	\N
6915	Unity	UY	207	\N
6916	Warrap	WR	207	\N
6917	Príncipe	P	208	\N
6918	São Tomé	S	208	\N
6919	Ahuachapán	AH	209	\N
6920	Cabañas	CA	209	\N
6921	Chalatenango	CH	209	\N
6922	Cuscatlán	CU	209	\N
6923	La Libertad	LI	209	\N
6924	Morazán	MO	209	\N
6925	La Paz	PA	209	\N
6926	Santa Ana	SA	209	\N
6927	San Miguel	SM	209	\N
6928	Sonsonate	SO	209	\N
6929	San Salvador	SS	209	\N
6930	San Vicente	SV	209	\N
6931	La Unión	UN	209	\N
6932	Usulután	US	209	\N
6933	Dimashq	DI	211	\N
6934	Dar'a	DR	211	\N
6935	Dayr az Zawr	DY	211	\N
6936	Al Hasakah	HA	211	\N
6937	Homs	HI	211	\N
6938	Halab	HL	211	\N
6939	Hamah	HM	211	\N
6940	Idlib	ID	211	\N
6941	Al Ladhiqiyah	LA	211	\N
6942	Al Qunaytirah	QU	211	\N
6943	Ar Raqqah	RA	211	\N
6944	Rif Dimashq	RD	211	\N
6945	As Suwayda'	SU	211	\N
6946	Tartus	TA	211	\N
6947	Hhohho	HH	212	\N
6948	Lubombo	LU	212	\N
6949	Manzini	MA	212	\N
6950	Shiselweni	SH	212	\N
6951	Al Baṭḩah	BA	214	\N
6952	Baḩr al Ghazāl	BG	214	\N
6953	Būrkū	BO	214	\N
6954	Shārī Bāqirmī	CB	214	\N
6955	Innīdī	EN	214	\N
6956	Qīrā	GR	214	\N
6957	Ḥajjar Lamīs	HL	214	\N
6958	Kānim	KA	214	\N
6959	Al Buḩayrah	LC	214	\N
6960	Lūqūn al Gharbī	LO	214	\N
6961	Lūqūn ash Sharqī	LR	214	\N
6962	Māndūl	MA	214	\N
6963	Shārī al Awsaṭ	MC	214	\N
6964	Māyū Kībbī ash Sharqī	ME	214	\N
6965	Māyū Kībbī al Gharbī	MO	214	\N
6966	Madīnat Injamīnā	ND	214	\N
6967	Waddāy	OD	214	\N
6968	Salāmāt	SA	214	\N
6969	Sīlā	SI	214	\N
6970	Tānjilī	TA	214	\N
6971	Tibastī	TI	214	\N
6972	Wādī Fīrā	WF	214	\N
6973	Région du Centre	C	216	\N
6974	Région de la Kara	K	216	\N
6975	Région Maritime	M	216	\N
6976	Région des Plateaux	P	216	\N
6977	Région des Savannes	S	216	\N
6978	Krung Thep Maha Nakhon Bangkok	10	217	\N
6979	Samut Prakan	11	217	\N
6980	Nonthaburi	12	217	\N
6981	Pathum Thani	13	217	\N
6982	Phra Nakhon Si Ayutthaya	14	217	\N
6983	Ang Thong	15	217	\N
6984	Lop Buri	16	217	\N
6985	Sing Buri	17	217	\N
6986	Chai Nat	18	217	\N
6987	Saraburi	19	217	\N
6988	Chon Buri	20	217	\N
6989	Rayong	21	217	\N
6990	Chanthaburi	22	217	\N
6991	Trat	23	217	\N
6992	Chachoengsao	24	217	\N
6993	Prachin Buri	25	217	\N
6994	Nakhon Nayok	26	217	\N
6995	Sa Kaeo	27	217	\N
6996	Nakhon Ratchasima	30	217	\N
6997	Buri Ram	31	217	\N
6998	Surin	32	217	\N
6999	Si Sa Ket	33	217	\N
7000	Ubon Ratchathani	34	217	\N
7001	Yasothon	35	217	\N
7002	Chaiyaphum	36	217	\N
7003	Amnat Charoen	37	217	\N
7004	Nong Bua Lam Phu	39	217	\N
7005	Khon Kaen	40	217	\N
7006	Udon Thani	41	217	\N
7007	Loei	42	217	\N
7008	Nong Khai	43	217	\N
7009	Maha Sarakham	44	217	\N
7010	Roi Et	45	217	\N
7011	Kalasin	46	217	\N
7012	Sakon Nakhon	47	217	\N
7013	Nakhon Phanom	48	217	\N
7014	Mukdahan	49	217	\N
7015	Chiang Mai	50	217	\N
7016	Lamphun	51	217	\N
7017	Lampang	52	217	\N
7018	Uttaradit	53	217	\N
7019	Phrae	54	217	\N
7020	Nan	55	217	\N
7021	Phayao	56	217	\N
7022	Chiang Rai	57	217	\N
7023	Mae Hong Son	58	217	\N
7024	Nakhon Sawan	60	217	\N
7025	Uthai Thani	61	217	\N
7026	Kamphaeng Phet	62	217	\N
7027	Tak	63	217	\N
7028	Sukhothai	64	217	\N
7029	Phitsanulok	65	217	\N
7030	Phichit	66	217	\N
7031	Phetchabun	67	217	\N
7032	Ratchaburi	70	217	\N
7033	Kanchanaburi	71	217	\N
7034	Suphan Buri	72	217	\N
7035	Nakhon Pathom	73	217	\N
7036	Samut Sakhon	74	217	\N
7037	Samut Songkhram	75	217	\N
7038	Phetchaburi	76	217	\N
7039	Prachuap Khiri Khan	77	217	\N
7040	Nakhon Si Thammarat	80	217	\N
7041	Krabi	81	217	\N
7042	Phangnga	82	217	\N
7043	Phuket	83	217	\N
7044	Surat Thani	84	217	\N
7045	Ranong	85	217	\N
7046	Chumphon	86	217	\N
7047	Songkhla	90	217	\N
7048	Satun	91	217	\N
7049	Trang	92	217	\N
7050	Phatthalung	93	217	\N
7051	Pattani	94	217	\N
7052	Yala	95	217	\N
7053	Narathiwat	96	217	\N
7054	Phatthaya	S	217	\N
7055	Gorno-Badakhshan	GB	218	\N
7056	Khatlon	KT	218	\N
7057	Sughd	SU	218	\N
7058	Aileu	AL	220	\N
7059	Ainaro	AN	220	\N
7060	Baucau	BA	220	\N
7061	Bobonaro	BO	220	\N
7062	Cova Lima	CO	220	\N
7063	Díli	DI	220	\N
7064	Ermera	ER	220	\N
7065	Lautem	LA	220	\N
7066	Liquiça	LI	220	\N
7067	Manufahi	MF	220	\N
7068	Manatuto	MT	220	\N
7069	Oecussi	OE	220	\N
7070	Viqueque	VI	220	\N
7071	Ahal	A	221	\N
7072	Balkan	B	221	\N
7073	Daşoguz	D	221	\N
7074	Lebap	L	221	\N
7075	Mary	M	221	\N
7076	Aşgabat	S	221	\N
7077	Tunis	11	222	\N
7078	Ariana	12	222	\N
7079	Ben Arous	13	222	\N
7080	La Manouba	14	222	\N
7081	Nabeul	21	222	\N
7082	Zaghouan	22	222	\N
7083	Bizerte	23	222	\N
7084	Béja	31	222	\N
7085	Jendouba	32	222	\N
7086	Le Kef	33	222	\N
7087	Siliana	34	222	\N
7088	Kairouan	41	222	\N
7089	Kasserine	42	222	\N
7090	Sidi Bouzid	43	222	\N
7091	Sousse	51	222	\N
7092	Monastir	52	222	\N
7093	Mahdia	53	222	\N
7094	Sfax	61	222	\N
7095	Gafsa	71	222	\N
7096	Tozeur	72	222	\N
7097	Kebili	73	222	\N
7098	Gabès	81	222	\N
7099	Medenine	82	222	\N
7100	Tataouine	83	222	\N
7101	'Eua	01	223	\N
7102	Ha'apai	02	223	\N
7103	Niuas	03	223	\N
7104	Tongatapu	04	223	\N
7105	Vava'u	05	223	\N
7106	Adana	01	224	\N
7107	Adıyaman	02	224	\N
7108	Afyonkarahisar	03	224	\N
7109	Ağrı	04	224	\N
7110	Amasya	05	224	\N
7111	Ankara	06	224	\N
7112	Antalya	07	224	\N
7113	Artvin	08	224	\N
7114	Aydın	09	224	\N
7115	Balıkesir	10	224	\N
7116	Bilecik	11	224	\N
7117	Bingöl	12	224	\N
7118	Bitlis	13	224	\N
7119	Bolu	14	224	\N
7120	Burdur	15	224	\N
7121	Bursa	16	224	\N
7122	Çanakkale	17	224	\N
7123	Çankırı	18	224	\N
7124	Çorum	19	224	\N
7125	Denizli	20	224	\N
7126	Diyarbakır	21	224	\N
7127	Edirne	22	224	\N
7128	Elazığ	23	224	\N
7129	Erzincan	24	224	\N
7130	Erzurum	25	224	\N
7131	Eskişehir	26	224	\N
7132	Gaziantep	27	224	\N
7133	Giresun	28	224	\N
7134	Gümüşhane	29	224	\N
7135	Hakkâri	30	224	\N
7136	Hatay	31	224	\N
7137	Isparta	32	224	\N
7138	Mersin	33	224	\N
7139	İstanbul	34	224	\N
7140	İzmir	35	224	\N
7141	Kars	36	224	\N
7142	Kastamonu	37	224	\N
7143	Kayseri	38	224	\N
7144	Kırklareli	39	224	\N
7145	Kırşehir	40	224	\N
7146	Kocaeli	41	224	\N
7147	Konya	42	224	\N
7148	Kütahya	43	224	\N
7149	Malatya	44	224	\N
7150	Manisa	45	224	\N
7151	Kahramanmaraş	46	224	\N
7152	Mardin	47	224	\N
7153	Muğla	48	224	\N
7154	Muş	49	224	\N
7155	Nevşehir	50	224	\N
7156	Niğde	51	224	\N
7157	Ordu	52	224	\N
7158	Rize	53	224	\N
7159	Sakarya	54	224	\N
7160	Samsun	55	224	\N
7161	Siirt	56	224	\N
7162	Sinop	57	224	\N
7163	Sivas	58	224	\N
7164	Tekirdağ	59	224	\N
7165	Tokat	60	224	\N
7166	Trabzon	61	224	\N
7167	Tunceli	62	224	\N
7168	Şanlıurfa	63	224	\N
7169	Uşak	64	224	\N
7170	Van	65	224	\N
7171	Yozgat	66	224	\N
7172	Zonguldak	67	224	\N
7173	Aksaray	68	224	\N
7174	Bayburt	69	224	\N
7175	Karaman	70	224	\N
7176	Kırıkkale	71	224	\N
7177	Batman	72	224	\N
7178	Şırnak	73	224	\N
7179	Bartın	74	224	\N
7180	Ardahan	75	224	\N
7181	Iğdır	76	224	\N
7182	Yalova	77	224	\N
7183	Karabük	78	224	\N
7184	Kilis	79	224	\N
7185	Osmaniye	80	224	\N
7186	Düzce	81	224	\N
7187	Arima	ARI	225	\N
7188	Chaguanas	CHA	225	\N
7189	Couva-Tabaquite-Talparo	CTT	225	\N
7190	Diego Martin	DMN	225	\N
7191	Eastern Tobago	ETO	225	\N
7192	Penal-Debe	PED	225	\N
7193	Port of Spain	POS	225	\N
7194	Princes Town	PRT	225	\N
7195	Point Fortin	PTF	225	\N
7196	Rio Claro-Mayaro	RCM	225	\N
7197	San Fernando	SFO	225	\N
7198	Sangre Grande	SGE	225	\N
7199	Siparia	SIP	225	\N
7200	San Juan-Laventille	SJL	225	\N
7201	Tunapuna-Piarco	TUP	225	\N
7202	Western Tobago	WTO	225	\N
7203	Funafuti	FUN	226	\N
7204	Niutao	NIT	226	\N
7205	Nukufetau	NKF	226	\N
7206	Nukulaelae	NKL	226	\N
7207	Nanumea	NMA	226	\N
7208	Nanumanga	NMG	226	\N
7209	Nui	NUI	226	\N
7210	Vaitupu	VAI	226	\N
7211	Changhua	CHA	227	\N
7212	Chiay City	CYI	227	\N
7213	Chiayi	CYQ	227	\N
7214	Hsinchu	HSQ	227	\N
7215	Hsinchui City	HSZ	227	\N
7216	Hualien	HUA	227	\N
7217	Ilan	ILA	227	\N
7218	Keelung City	KEE	227	\N
7219	Kaohsiung City	KHH	227	\N
7220	Kaohsiung	KHQ	227	\N
7221	Miaoli	MIA	227	\N
7222	Nantou	NAN	227	\N
7223	Penghu	PEN	227	\N
7224	Pingtung	PIF	227	\N
7225	Taoyuan	TAO	227	\N
7226	Tainan City	TNN	227	\N
7227	Tainan	TNQ	227	\N
7228	Taipei City	TPE	227	\N
7229	Taipei	TPQ	227	\N
7230	Taitung	TTT	227	\N
7231	Taichung City	TXG	227	\N
7232	Taichung	TXQ	227	\N
7233	Yunlin	YUN	227	\N
7234	Arusha	01	228	\N
7235	Dar-es-Salaam	02	228	\N
7236	Dodoma	03	228	\N
7237	Iringa	04	228	\N
7238	Kagera	05	228	\N
7239	Kaskazini Pemba	06	228	\N
7240	Kaskazini Unguja	07	228	\N
7241	Kigoma	08	228	\N
7242	Kilimanjaro	09	228	\N
7243	Kusini Pemba	10	228	\N
7244	Kusini Unguja	11	228	\N
7245	Lindi	12	228	\N
7246	Mara	13	228	\N
7247	Mbeya	14	228	\N
7248	Mjini Magharibi	15	228	\N
7249	Morogoro	16	228	\N
7250	Mtwara	17	228	\N
7251	Mwanza	18	228	\N
7252	Pwani	19	228	\N
7253	Rukwa	20	228	\N
7254	Ruvuma	21	228	\N
7255	Shinyanga	22	228	\N
7256	Singida	23	228	\N
7257	Tabora	24	228	\N
7258	Tanga	25	228	\N
7259	Manyara	26	228	\N
7260	Vinnyts'ka Oblast'	05	229	\N
7261	Volyns'ka Oblast'	07	229	\N
7262	Luhans'ka Oblast'	09	229	\N
7263	Dnipropetrovs'ka Oblast'	12	229	\N
7264	Donets'ka Oblast'	14	229	\N
7265	Zhytomyrs'ka Oblast'	18	229	\N
7266	Zakarpats'ka Oblast'	21	229	\N
7267	Zaporiz'ka Oblast'	23	229	\N
7268	Ivano-Frankivs'ka Oblast'	26	229	\N
7269	Kyïvs'ka mis'ka rada	30	229	\N
7270	Kyïvs'ka Oblast'	32	229	\N
7271	Kirovohrads'ka Oblast'	35	229	\N
7272	Sevastopol	40	229	\N
7273	Respublika Krym	43	229	\N
7274	L'vivs'ka Oblast'	46	229	\N
7275	Mykolaïvs'ka Oblast'	48	229	\N
7276	Odes'ka Oblast'	51	229	\N
7277	Poltavs'ka Oblast'	53	229	\N
7278	Rivnens'ka Oblast'	56	229	\N
7279	Sums 'ka Oblast'	59	229	\N
7280	Ternopil's'ka Oblast'	61	229	\N
7281	Kharkivs'ka Oblast'	63	229	\N
7282	Khersons'ka Oblast'	65	229	\N
7283	Khmel'nyts'ka Oblast'	68	229	\N
7284	Cherkas'ka Oblast'	71	229	\N
7285	Chernihivs'ka Oblast'	74	229	\N
7286	Chernivets'ka Oblast'	77	229	\N
7287	Central	C	230	\N
7288	Eastern	E	230	\N
7289	Northern	N	230	\N
7290	Western	W	230	\N
7291	Johnston Atoll	67	231	\N
7292	Midway Islands	71	231	\N
7293	Navassa Island	76	231	\N
7294	Wake Island	79	231	\N
7295	Baker Island	81	231	\N
7296	Howland Island	84	231	\N
7297	Jarvis Island	86	231	\N
7298	Kingman Reef	89	231	\N
7299	Palmyra Atoll	95	231	\N
7300	Alaska	AK	232	\N
7301	Alabama	AL	232	\N
7302	Arkansas	AR	232	\N
7303	American Samoa	AS	232	\N
7304	Arizona	AZ	232	\N
7305	California	CA	232	\N
7306	Colorado	CO	232	\N
7307	Connecticut	CT	232	\N
7308	District of Columbia	DC	232	\N
7309	Delaware	DE	232	\N
7310	Florida	FL	232	\N
7311	Georgia	GA	232	\N
7312	Guam	GU	232	\N
7313	Hawaii	HI	232	\N
7314	Iowa	IA	232	\N
7315	Idaho	ID	232	\N
7316	Illinois	IL	232	\N
7317	Indiana	IN	232	\N
7318	Kansas	KS	232	\N
7319	Kentucky	KY	232	\N
7320	Louisiana	LA	232	\N
7321	Massachusetts	MA	232	\N
7322	Maryland	MD	232	\N
7323	Maine	ME	232	\N
7324	Michigan	MI	232	\N
7325	Minnesota	MN	232	\N
7326	Missouri	MO	232	\N
7327	Northern Mariana Islands	MP	232	\N
7328	Mississippi	MS	232	\N
7329	Montana	MT	232	\N
7330	North Carolina	NC	232	\N
7331	North Dakota	ND	232	\N
7332	Nebraska	NE	232	\N
7333	New Hampshire	NH	232	\N
7334	New Jersey	NJ	232	\N
7335	New Mexico	NM	232	\N
7336	Nevada	NV	232	\N
7337	New York	NY	232	\N
7338	Ohio	OH	232	\N
7339	Oklahoma	OK	232	\N
7340	Oregon	OR	232	\N
7341	Pennsylvania	PA	232	\N
7342	Puerto Rico	PR	232	\N
7343	Rhode Island	RI	232	\N
7344	South Carolina	SC	232	\N
7345	South Dakota	SD	232	\N
7346	Tennessee	TN	232	\N
7347	Texas	TX	232	\N
7348	United States Minor Outlying Islands	UM	232	\N
7349	Utah	UT	232	\N
7350	Virginia	VA	232	\N
7351	Virgin Islands	VI	232	\N
7352	Vermont	VT	232	\N
7353	Washington	WA	232	\N
7354	Wisconsin	WI	232	\N
7355	West Virginia	WV	232	\N
7356	Wyoming	WY	232	\N
7357	Armed Forces Americas (except Canada)	AA	232	\N
7358	Armed Forces Africa, Canada, Europe, Middle East	AE	232	\N
7359	Armed Forces Pacific	AP	232	\N
7360	Artigas	AR	233	\N
7361	Canelones	CA	233	\N
7362	Cerro Largo	CL	233	\N
7363	Colonia	CO	233	\N
7364	Durazno	DU	233	\N
7365	Florida	FD	233	\N
7366	Flores	FS	233	\N
7367	Lavalleja	LA	233	\N
7368	Maldonado	MA	233	\N
7369	Montevideo	MO	233	\N
7370	Paysandú	PA	233	\N
7371	Río Negro	RN	233	\N
7372	Rocha	RO	233	\N
7373	Rivera	RV	233	\N
7374	Salto	SA	233	\N
7375	San José	SJ	233	\N
7376	Soriano	SO	233	\N
7377	Tacuarembó	TA	233	\N
7378	Treinta y Tres	TT	233	\N
7379	Andijon	AN	234	\N
7380	Buxoro	BU	234	\N
7381	Farg'ona	FA	234	\N
7382	Jizzax	JI	234	\N
7383	Namangan	NG	234	\N
7384	Navoiy	NW	234	\N
7385	Qashqadaryo	QA	234	\N
7386	Qoraqalpog'iston Respublikasi	QR	234	\N
7387	Samarqand	SA	234	\N
7388	Sirdaryo	SI	234	\N
7389	Surxondaryo	SU	234	\N
7390	Toshkent	TK	234	\N
7391	Toshkent	TO	234	\N
7392	Xorazm	XO	234	\N
7393	Charlotte	01	236	\N
7394	Saint Andrew	02	236	\N
7395	Saint David	03	236	\N
7396	Saint George	04	236	\N
7397	Saint Patrick	05	236	\N
7398	Grenadines	06	236	\N
7399	Distrito Federal	A	237	\N
7400	Anzoátegui	B	237	\N
7401	Apure	C	237	\N
7402	Aragua	D	237	\N
7403	Barinas	E	237	\N
7404	Bolívar	F	237	\N
7405	Carabobo	G	237	\N
7406	Cojedes	H	237	\N
7407	Falcón	I	237	\N
7408	Guárico	J	237	\N
7409	Lara	K	237	\N
7410	Mérida	L	237	\N
7411	Miranda	M	237	\N
7412	Monagas	N	237	\N
7413	Nueva Esparta	O	237	\N
7414	Portuguesa	P	237	\N
7415	Sucre	R	237	\N
7416	Táchira	S	237	\N
7417	Trujillo	T	237	\N
7418	Yaracuy	U	237	\N
7419	Zulia	V	237	\N
7420	Dependencias Federales	W	237	\N
7421	Vargas	X	237	\N
7422	Delta Amacuro	Y	237	\N
7423	Amazonas	Z	237	\N
7424	Lai Châu	01	240	\N
7425	Lào Cai	02	240	\N
7426	Hà Giang	03	240	\N
7427	Cao Bằng	04	240	\N
7428	Sơn La	05	240	\N
7429	Yên Bái	06	240	\N
7430	Tuyên Quang	07	240	\N
7431	Lạng Sơn	09	240	\N
7432	Quảng Ninh	13	240	\N
7433	Hoà Bình	14	240	\N
7434	Hà Tây	15	240	\N
7435	Ninh Bình	18	240	\N
7436	Thái Bình	20	240	\N
7437	Thanh Hóa	21	240	\N
7438	Nghệ An	22	240	\N
7439	Hà Tỉnh	23	240	\N
7440	Quảng Bình	24	240	\N
7441	Quảng Trị	25	240	\N
7442	Thừa Thiên-Huế	26	240	\N
7443	Quảng Nam	27	240	\N
7444	Kon Tum	28	240	\N
7445	Quảng Ngãi	29	240	\N
7446	Gia Lai	30	240	\N
7447	Bình Định	31	240	\N
7448	Phú Yên	32	240	\N
7449	Đắc Lắk	33	240	\N
7450	Khánh Hòa	34	240	\N
7451	Lâm Đồng	35	240	\N
7452	Ninh Thuận	36	240	\N
7453	Tây Ninh	37	240	\N
7454	Đồng Nai	39	240	\N
7455	Bình Thuận	40	240	\N
7456	Long An	41	240	\N
7457	Bà Rịa-Vũng Tàu	43	240	\N
7458	An Giang	44	240	\N
7459	Đồng Tháp	45	240	\N
7460	Tiền Giang	46	240	\N
7461	Kiên Giang	47	240	\N
7462	Vĩnh Long	49	240	\N
7463	Bến Tre	50	240	\N
7464	Trà Vinh	51	240	\N
7465	Sóc Trăng	52	240	\N
7466	Bắc Kạn	53	240	\N
7467	Bắc Giang	54	240	\N
7468	Bạc Liêu	55	240	\N
7469	Bắc Ninh	56	240	\N
7470	Bình Dương	57	240	\N
7471	Bình Phước	58	240	\N
7472	Cà Mau	59	240	\N
7473	Hải Duong	61	240	\N
7474	Hà Nam	63	240	\N
7475	Hưng Yên	66	240	\N
7476	Nam Định	67	240	\N
7477	Phú Thọ	68	240	\N
7478	Thái Nguyên	69	240	\N
7479	Vĩnh Phúc	70	240	\N
7480	Điện Biên	71	240	\N
7481	Đắk Nông	72	240	\N
7482	Hậu Giang	73	240	\N
7483	Cần Thơ	CT	240	\N
7484	Đà Nẵng	DN	240	\N
7485	Hà Nội	HN	240	\N
7486	Hải Phòng	HP	240	\N
7487	Hồ Chí Minh [Sài Gòn]	SG	240	\N
7488	Malampa	MAP	241	\N
7489	Pénama	PAM	241	\N
7490	Sanma	SAM	241	\N
7491	Shéfa	SEE	241	\N
7492	Taféa	TAE	241	\N
7493	Torba	TOB	241	\N
7494	A'ana	AA	243	\N
7495	Aiga-i-le-Tai	AL	243	\N
7496	Atua	AT	243	\N
7497	Fa'asaleleaga	FA	243	\N
7498	Gaga'emauga	GE	243	\N
7499	Gagaifomauga	GI	243	\N
7500	Palauli	PA	243	\N
7501	Satupa'itea	SA	243	\N
7502	Tuamasaga	TU	243	\N
7503	Va'a-o-Fonoti	VF	243	\N
7504	Vaisigano	VS	243	\N
7505	Abyān	AB	244	\N
7506	'Adan	AD	244	\N
7507	'Amrān	AM	244	\N
7508	Al Bayḑā'	BA	244	\N
7509	Aḑ Ḑāli‘	DA	244	\N
7510	Dhamār	DH	244	\N
7511	Ḩaḑramawt	HD	244	\N
7512	Ḩajjah	HJ	244	\N
7513	Ibb	IB	244	\N
7514	Al Jawf	JA	244	\N
7515	Laḩij	LA	244	\N
7516	Ma'rib	MA	244	\N
7517	Al Mahrah	MR	244	\N
7518	Al Ḩudaydah	MU	244	\N
7519	Al Maḩwīt	MW	244	\N
7520	Raymah	RA	244	\N
7521	Şa'dah	SD	244	\N
7522	Shabwah	SH	244	\N
7523	Şan'ā'	SN	244	\N
7524	Tā'izz	TA	244	\N
7525	Eastern Cape	EC	246	\N
7526	Free State	FS	246	\N
7527	Gauteng	GP	246	\N
7528	Limpopo	LP	246	\N
7529	Mpumalanga	MP	246	\N
7530	Northern Cape	NC	246	\N
7531	North-West (South Africa)	NW	246	\N
7532	Western Cape	WC	246	\N
7533	Kwazulu-Natal	ZN	246	\N
7534	Western	01	247	\N
7535	Central	02	247	\N
7536	Eastern	03	247	\N
7537	Luapula	04	247	\N
7538	Northern	05	247	\N
7539	North-Western	06	247	\N
7540	Southern (Zambia)	07	247	\N
7541	Copperbelt	08	247	\N
7542	Lusaka	09	247	\N
7543	Bulawayo	BU	248	\N
7544	Harare	HA	248	\N
7545	Manicaland	MA	248	\N
7546	Mashonaland Central	MC	248	\N
7547	Mashonaland East	ME	248	\N
7548	Midlands	MI	248	\N
7549	Matabeleland North	MN	248	\N
7550	Matabeleland South	MS	248	\N
7551	Masvingo	MV	248	\N
7552	Mashonaland West	MW	248	\N
7553	Canillo	02	249	\N
7554	Encamp	03	249	\N
7555	La Massana	04	249	\N
7556	Ordino	05	249	\N
7557	Sant Julià de Lòria	06	249	\N
7558	Andorra la Vella	07	249	\N
7559	Escaldes-Engordany	08	249	\N
7560	'Ajmān	AJ	250	\N
7561	Abū Ȥaby [Abu Dhabi]	AZ	250	\N
7562	Dubayy	DU	250	\N
7563	Al Fujayrah	FU	250	\N
7564	Ra’s al Khaymah	RK	250	\N
7565	Ash Shāriqah	SH	250	\N
7566	Umm al Qaywayn	UQ	250	\N
7567	Balkh	BAL	251	\N
7568	Bāmyān	BAM	251	\N
7569	Bādghīs	BDG	251	\N
7570	Badakhshān	BDS	251	\N
7571	Baghlān	BGL	251	\N
7572	Dāykundī	DAY	251	\N
7573	Farāh	FRA	251	\N
7574	Fāryāb	FYB	251	\N
7575	Ghaznī	GHA	251	\N
7576	Ghōr	GHO	251	\N
7577	Helmand	HEL	251	\N
7578	Herāt	HER	251	\N
7579	Jowzjān	JOW	251	\N
7580	Kābul	KAB	251	\N
7581	Kandahār	KAN	251	\N
7582	Kāpīsā	KAP	251	\N
7583	Kunduz	KDZ	251	\N
7584	Khōst	KHO	251	\N
7585	Kunar	KNR	251	\N
7586	Laghmān	LAG	251	\N
7587	Lōgar	LOG	251	\N
7588	Nangarhār	NAN	251	\N
7589	Nīmrōz	NIM	251	\N
7590	Nūristān	NUR	251	\N
7591	Panjshayr	PAN	251	\N
7592	Parwān	PAR	251	\N
7593	Paktiyā	PIA	251	\N
7594	Paktīkā	PKA	251	\N
7595	Samangān	SAM	251	\N
7596	Sar-e Pul	SAR	251	\N
7597	Takhār	TAK	251	\N
7598	Uruzgān	URU	251	\N
7599	Wardak	WAR	251	\N
7600	Zābul	ZAB	251	\N
7601	Saint George	03	252	\N
7602	Saint John	04	252	\N
7603	Saint Mary	05	252	\N
7604	Saint Paul	06	252	\N
7605	Saint Peter	07	252	\N
7606	Saint Philip	08	252	\N
7607	Barbuda	10	252	\N
7608	Redonda	11	252	\N
7609	Berat	01	254	\N
7610	Durrës	02	254	\N
7611	Elbasan	03	254	\N
7612	Fier	04	254	\N
7613	Gjirokastër	05	254	\N
7614	Korçë	06	254	\N
7615	Kukës	07	254	\N
7616	Lezhë	08	254	\N
7617	Dibër	09	254	\N
7618	Shkodër	10	254	\N
7619	Tiranë	11	254	\N
7620	Vlorë	12	254	\N
7621	Aragacotn	AG	255	\N
7622	Ararat	AR	255	\N
7623	Armavir	AV	255	\N
7624	Erevan	ER	255	\N
7625	Gegarkunik'	GR	255	\N
7626	Kotayk'	KT	255	\N
7627	Lory	LO	255	\N
7628	Sirak	SH	255	\N
7629	Syunik'	SU	255	\N
7630	Tavus	TV	255	\N
7631	Vayoc Jor	VD	255	\N
7632	Bengo	BGO	256	\N
7633	Benguela	BGU	256	\N
7634	Bié	BIE	256	\N
7635	Cabinda	CAB	256	\N
7636	Cuando-Cubango	CCU	256	\N
7637	Cunene	CNN	256	\N
7638	Cuanza Norte	CNO	256	\N
7639	Cuanza Sul	CUS	256	\N
7640	Huambo	HUA	256	\N
7641	Huíla	HUI	256	\N
7642	Lunda Norte	LNO	256	\N
7643	Lunda Sul	LSU	256	\N
7644	Luanda	LUA	256	\N
7645	Malange	MAL	256	\N
7646	Moxico	MOX	256	\N
7647	Namibe	NAM	256	\N
7648	Uíge	UIG	256	\N
7649	Zaire	ZAI	256	\N
7650	Salta	A	258	\N
7651	Buenos Aires	B	258	\N
7652	Ciudad Autónoma de Buenos Aires	C	258	\N
7653	San Luis	D	258	\N
7654	Entre Rios	E	258	\N
7655	Santiago del Estero	G	258	\N
7656	Chaco	H	258	\N
7657	San Juan	J	258	\N
7658	Catamarca	K	258	\N
7659	La Pampa	L	258	\N
7660	Mendoza	M	258	\N
7661	Misiones	N	258	\N
7662	Formosa	P	258	\N
7663	Neuquen	Q	258	\N
7664	Rio Negro	R	258	\N
7665	Santa Fe	S	258	\N
7666	Tucuman	T	258	\N
7667	Chubut	U	258	\N
7668	Tierra del Fuego	V	258	\N
7669	Corrientes	W	258	\N
7670	Cordoba	X	258	\N
7671	Jujuy	Y	258	\N
7672	Santa Cruz	Z	258	\N
7673	La Rioja	F	258	\N
7674	Burgenland	1	260	\N
7675	Kärnten	2	260	\N
7676	Niederösterreich	3	260	\N
7677	Oberösterreich	4	260	\N
7678	Salzburg	5	260	\N
7679	Steiermark	6	260	\N
7680	Tirol	7	260	\N
7681	Vorarlberg	8	260	\N
7682	Wien	9	260	\N
7683	Australian Capital Territory	ACT	261	\N
7684	New South Wales	NSW	261	\N
7685	Northern Territory	NT	261	\N
7686	Queensland	QLD	261	\N
7687	South Australia	SA	261	\N
7688	Tasmania	TAS	261	\N
7689	Victoria	VIC	261	\N
7690	Western Australia	WA	261	\N
7691	Abşeron	ABS	264	\N
7692	Ağstafa	AGA	264	\N
7693	Ağcabədi	AGC	264	\N
7694	Ağdam	AGM	264	\N
7695	Ağdaş	AGS	264	\N
7696	Ağsu	AGU	264	\N
7697	Astara	AST	264	\N
7698	Bakı	BA	264	\N
7699	Balakən	BAL	264	\N
7700	Bərdə	BAR	264	\N
7701	Beyləqan	BEY	264	\N
7702	Biləsuvar	BIL	264	\N
7703	Cəbrayıl	CAB	264	\N
7704	Cəlilabab	CAL	264	\N
7705	Daşkəsən	DAS	264	\N
7706	Füzuli	FUZ	264	\N
7707	Gəncə	GA	264	\N
7708	Gədəbəy	GAD	264	\N
7709	Goranboy	GOR	264	\N
7710	Göyçay	GOY	264	\N
7711	Göygöl	GYG	264	\N
7712	Hacıqabul	HAC	264	\N
7713	İmişli	IMI	264	\N
7714	İsmayıllı	ISM	264	\N
7715	Kəlbəcər	KAL	264	\N
7716	Kürdəmir	KUR	264	\N
7717	Lənkəran	LA	264	\N
7718	Laçın	LAC	264	\N
7719	Lənkəran	LAN	264	\N
7720	Lerik	LER	264	\N
7721	Masallı	MAS	264	\N
7722	Mingəçevir	MI	264	\N
7723	Naftalan	NA	264	\N
7724	Neftçala	NEF	264	\N
7725	Naxçıvan	NX	264	\N
7726	Oğuz	OGU	264	\N
7727	Qəbələ	QAB	264	\N
7728	Qax	QAX	264	\N
7729	Qazax	QAZ	264	\N
7730	Quba	QBA	264	\N
7731	Qubadlı	QBI	264	\N
7732	Qobustan	QOB	264	\N
7733	Qusar	QUS	264	\N
7734	Şəki	SA	264	\N
7735	Sabirabad	SAB	264	\N
7736	Şəki	SAK	264	\N
7737	Salyan	SAL	264	\N
7738	Saatlı	SAT	264	\N
7739	Şabran	SBN	264	\N
7740	Siyəzən	SIY	264	\N
7741	Şəmkir	SKR	264	\N
7742	Sumqayıt	SM	264	\N
7743	Şamaxı	SMI	264	\N
7744	Samux	SMX	264	\N
7745	Şirvan	SR	264	\N
7746	Şuşa	SUS	264	\N
7747	Tərtər	TAR	264	\N
7748	Tovuz	TOV	264	\N
7749	Ucar	UCA	264	\N
7750	Xankəndi	XA	264	\N
7751	Xaçmaz	XAC	264	\N
7752	Xocalı	XCI	264	\N
7753	Xızı	XIZ	264	\N
7754	Xocavənd	XVD	264	\N
7755	Yardımlı	YAR	264	\N
7756	Yevlax	YE	264	\N
7757	Yevlax	YEV	264	\N
7758	Zəngilan	ZAN	264	\N
7759	Zaqatala	ZAQ	264	\N
7760	Zərdab	ZAR	264	\N
7761	Federacija Bosne i Hercegovine	BIH	265	\N
7762	Brčko distrikt	BRC	265	\N
7763	Republika Srpska	SRP	265	\N
7764	Christ Church	01	266	\N
7765	Saint Andrew	02	266	\N
7766	Saint George	03	266	\N
7767	Saint James	04	266	\N
7768	Saint John	05	266	\N
7769	Saint Joseph	06	266	\N
7770	Saint Lucy	07	266	\N
7771	Saint Michael	08	266	\N
7772	Saint Peter	09	266	\N
7773	Saint Philip	10	266	\N
7774	Saint Thomas	11	266	\N
7775	Barisal	A	267	\N
7776	Chittagong	B	267	\N
7777	Dhaka	C	267	\N
7778	Khulna	D	267	\N
7779	Rajshahi	E	267	\N
7780	Rangpur	F	267	\N
7781	Sylhet	G	267	\N
7782	Bruxelles-Capitale, Région de;Brussels Hoofdstedelijk Gewest	BRU	268	\N
7783	Vlaams Gewest	VLG	268	\N
7784	wallonne, Région	WAL	268	\N
7785	Boucle du Mouhoun	01	269	\N
7786	Cascades	02	269	\N
7787	Centre	03	269	\N
7788	Centre-Est	04	269	\N
7789	Centre-Nord	05	269	\N
7790	Centre-Ouest	06	269	\N
7791	Centre-Sud	07	269	\N
7792	Est	08	269	\N
7793	Hauts-Bassins	09	269	\N
7794	Nord	10	269	\N
7795	Plateau-Central	11	269	\N
7796	Sahel	12	269	\N
7797	Sud-Ouest	13	269	\N
7798	Blagoevgrad	01	270	\N
7799	Burgas	02	270	\N
7800	Varna	03	270	\N
7801	Veliko Tarnovo	04	270	\N
7802	Vidin	05	270	\N
7803	Vratsa	06	270	\N
7804	Gabrovo	07	270	\N
7805	Dobrich	08	270	\N
7806	Kardzhali	09	270	\N
7807	Kyustendil	10	270	\N
7808	Lovech	11	270	\N
7809	Montana	12	270	\N
7810	Pazardzhik	13	270	\N
7811	Pernik	14	270	\N
7812	Pleven	15	270	\N
7813	Plovdiv	16	270	\N
7814	Razgrad	17	270	\N
7815	Ruse	18	270	\N
7816	Silistra	19	270	\N
7817	Sliven	20	270	\N
7818	Smolyan	21	270	\N
7819	Sofia-Grad	22	270	\N
7820	Sofia	23	270	\N
7821	Stara Zagora	24	270	\N
7822	Targovishte	25	270	\N
7823	Haskovo	26	270	\N
7824	Shumen	27	270	\N
7825	Yambol	28	270	\N
7826	Al Manāmah (Al ‘Āşimah)	13	271	\N
7827	Al Janūbīyah	14	271	\N
7828	Al Muḩarraq	15	271	\N
7829	Al Wusţá	16	271	\N
7830	Ash Shamālīyah	17	271	\N
7831	Bubanza	BB	272	\N
7832	Bujumbura Rural	BL	272	\N
7833	Bujumbura Mairie	BM	272	\N
7834	Bururi	BR	272	\N
7835	Cankuzo	CA	272	\N
7836	Cibitoke	CI	272	\N
7837	Gitega	GI	272	\N
7838	Kirundo	KI	272	\N
7839	Karuzi	KR	272	\N
7840	Kayanza	KY	272	\N
7841	Makamba	MA	272	\N
7842	Muramvya	MU	272	\N
7843	Mwaro	MW	272	\N
7844	Ngozi	NG	272	\N
7845	Rutana	RT	272	\N
7846	Ruyigi	RY	272	\N
7847	Atakora	AK	273	\N
7848	Alibori	AL	273	\N
7849	Atlantique	AQ	273	\N
7850	Borgou	BO	273	\N
7851	Collines	CO	273	\N
7852	Donga	DO	273	\N
7853	Kouffo	KO	273	\N
7854	Littoral	LI	273	\N
7855	Mono	MO	273	\N
7856	Ouémé	OU	273	\N
7857	Plateau	PL	273	\N
7858	Zou	ZO	273	\N
7859	Belait	BE	276	\N
7860	Brunei-Muara	BM	276	\N
7861	Temburong	TE	276	\N
7862	Tutong	TU	276	\N
7863	El Beni	B	277	\N
7864	Cochabamba	C	277	\N
7865	Chuquisaca	H	277	\N
7866	La Paz	L	277	\N
7867	Pando	N	277	\N
7868	Oruro	O	277	\N
7869	Potosí	P	277	\N
7870	Santa Cruz	S	277	\N
7871	Tarija	T	277	\N
7872	Bonaire	BO	278	\N
7873	Saba	SA	278	\N
7874	Sint Eustatius	SE	278	\N
7875	Acre	AC	279	\N
7876	Alagoas	AL	279	\N
7877	Amazonas	AM	279	\N
7878	Amapá	AP	279	\N
7879	Bahia	BA	279	\N
7880	Ceará	CE	279	\N
7881	Distrito Federal	DF	279	\N
7882	Espírito Santo	ES	279	\N
7883	Fernando de Noronha	FN	279	\N
7884	Goiás	GO	279	\N
7885	Maranhão	MA	279	\N
7886	Minas Gerais	MG	279	\N
7887	Mato Grosso do Sul	MS	279	\N
7888	Mato Grosso	MT	279	\N
7889	Pará	PA	279	\N
7890	Paraíba	PB	279	\N
7891	Pernambuco	PE	279	\N
7892	Piauí	PI	279	\N
7893	Paraná	PR	279	\N
7894	Rio de Janeiro	RJ	279	\N
7895	Rio Grande do Norte	RN	279	\N
7896	Rondônia	RO	279	\N
7897	Roraima	RR	279	\N
7898	Rio Grande do Sul	RS	279	\N
7899	Santa Catarina	SC	279	\N
7900	Sergipe	SE	279	\N
7901	São Paulo	SP	279	\N
7902	Tocantins	TO	279	\N
7903	Acklins	AK	280	\N
7904	Bimini	BI	280	\N
7905	Black Point	BP	280	\N
7906	Berry Islands	BY	280	\N
7907	Central Eleuthera	CE	280	\N
7908	Cat Island	CI	280	\N
7909	Crooked Island and Long Cay	CK	280	\N
7910	Central Abaco	CO	280	\N
7911	Central Andros	CS	280	\N
7912	East Grand Bahama	EG	280	\N
7913	Exuma	EX	280	\N
7914	City of Freeport	FP	280	\N
7915	Grand Cay	GC	280	\N
7916	Harbour Island	HI	280	\N
7917	Hope Town	HT	280	\N
7918	Inagua	IN	280	\N
7919	Long Island	LI	280	\N
7920	Mangrove Cay	MC	280	\N
7921	Mayaguana	MG	280	\N
7922	Moore's Island	MI	280	\N
7923	North Eleuthera	NE	280	\N
7924	North Abaco	NO	280	\N
7925	North Andros	NS	280	\N
7926	Rum Cay	RC	280	\N
7927	Ragged Island	RI	280	\N
7928	South Andros	SA	280	\N
7929	South Eleuthera	SE	280	\N
7930	South Abaco	SO	280	\N
7931	San Salvador	SS	280	\N
7932	Spanish Wells	SW	280	\N
7933	West Grand Bahama	WG	280	\N
7934	Paro	11	281	\N
7935	Chhukha	12	281	\N
7936	Ha	13	281	\N
7937	Samtee	14	281	\N
7938	Thimphu	15	281	\N
7939	Tsirang	21	281	\N
7940	Dagana	22	281	\N
7941	Punakha	23	281	\N
7942	Wangdue Phodrang	24	281	\N
7943	Sarpang	31	281	\N
7944	Trongsa	32	281	\N
7945	Bumthang	33	281	\N
7946	Zhemgang	34	281	\N
7947	Trashigang	41	281	\N
7948	Monggar	42	281	\N
7949	Pemagatshel	43	281	\N
7950	Lhuentse	44	281	\N
7951	Samdrup Jongkha	45	281	\N
7952	Gasa	GA	281	\N
7953	Trashi Yangtse	TY	281	\N
7954	Central	CE	283	\N
7955	Ghanzi	GH	283	\N
7956	Kgalagadi	KG	283	\N
7957	Kgatleng	KL	283	\N
7958	Kweneng	KW	283	\N
7959	North-East	NE	283	\N
7960	North-West	NW	283	\N
7961	South-East	SE	283	\N
7962	Southern	SO	283	\N
7963	Brèsckaja voblasc'	BR	284	\N
7964	Horad Minsk	HM	284	\N
7965	Homel'skaja voblasc'	HO	284	\N
7966	Hrodzenskaja voblasc'	HR	284	\N
7967	Mahilëuskaja voblasc'	MA	284	\N
7968	Minskaja voblasc'	MI	284	\N
7969	Vicebskaja voblasc'	VI	284	\N
7970	Belize	BZ	285	\N
7971	Cayo	CY	285	\N
7972	Corozal	CZL	285	\N
7973	Orange Walk	OW	285	\N
7974	Stann Creek	SC	285	\N
7975	Toledo	TOL	285	\N
7976	Alberta	AB	286	\N
7977	British Columbia	BC	286	\N
7978	Manitoba	MB	286	\N
7979	New Brunswick	NB	286	\N
7980	Newfoundland and Labrador	NL	286	\N
7981	Nova Scotia	NS	286	\N
7982	Northwest Territories	NT	286	\N
7983	Nunavut	NU	286	\N
7984	Ontario	ON	286	\N
7985	Prince Edward Island	PE	286	\N
7986	Quebec	QC	286	\N
7987	Saskatchewan	SK	286	\N
7988	Yukon Territory	YT	286	\N
7989	Bas-Congo	BC	288	\N
7990	Bandundu	BN	288	\N
7991	Équateur	EQ	288	\N
7992	Katanga	KA	288	\N
7993	Kasai-Oriental	KE	288	\N
7994	Kinshasa	KN	288	\N
7995	Kasai-Occidental	KW	288	\N
7996	Maniema	MA	288	\N
7997	Nord-Kivu	NK	288	\N
7998	Orientale	OR	288	\N
7999	Sud-Kivu	SK	288	\N
8000	Ouham	AC	289	\N
8001	Bamingui-Bangoran	BB	289	\N
8002	Bangui	BGF	289	\N
8003	Basse-Kotto	BK	289	\N
8004	Haute-Kotto	HK	289	\N
8005	Haut-Mbomou	HM	289	\N
8006	Haute-Sangha / Mambéré-Kadéï	HS	289	\N
8007	Gribingui	KB	289	\N
8008	Kémo-Gribingui	KG	289	\N
8009	Lobaye	LB	289	\N
8010	Mbomou	MB	289	\N
8011	Ombella-M'poko	MP	289	\N
8012	Nana-Mambéré	NM	289	\N
8013	Ouham-Pendé	OP	289	\N
8014	Sangha	SE	289	\N
8015	Ouaka	UK	289	\N
8016	Vakaga	VK	289	\N
8017	Bouenza	11	290	\N
8018	Pool	12	290	\N
8019	Sangha	13	290	\N
8020	Plateaux	14	290	\N
8021	Cuvette-Ouest	15	290	\N
8022	Lékoumou	2	290	\N
8023	Kouilou	5	290	\N
8024	Likouala	7	290	\N
8025	Cuvette	8	290	\N
8026	Niari	9	290	\N
8027	Brazzaville	BZV	290	\N
8028	Aargau	AG	291	\N
8029	Appenzell Innerrhoden	AI	291	\N
8030	Appenzell Ausserrhoden	AR	291	\N
8031	Bern	BE	291	\N
8032	Basel-Landschaft	BL	291	\N
8033	Basel-Stadt	BS	291	\N
8034	Fribourg	FR	291	\N
8035	Genève	GE	291	\N
8036	Glarus	GL	291	\N
8037	Graubünden	GR	291	\N
8038	Jura	JU	291	\N
8039	Luzern	LU	291	\N
8040	Neuchâtel	NE	291	\N
8041	Nidwalden	NW	291	\N
8042	Obwalden	OW	291	\N
8043	Sankt Gallen	SG	291	\N
8044	Schaffhausen	SH	291	\N
8045	Solothurn	SO	291	\N
8046	Schwyz	SZ	291	\N
8047	Thurgau	TG	291	\N
8048	Ticino	TI	291	\N
8049	Uri	UR	291	\N
8050	Vaud	VD	291	\N
8051	Valais	VS	291	\N
8052	Zug	ZG	291	\N
8053	Zürich	ZH	291	\N
8054	Lagunes (Région des)	01	292	\N
8055	Haut-Sassandra (Région du)	02	292	\N
8056	Savanes (Région des)	03	292	\N
8057	Vallée du Bandama (Région de la)	04	292	\N
8058	Moyen-Comoé (Région du)	05	292	\N
8059	18 Montagnes (Région des)	06	292	\N
8060	Lacs (Région des)	07	292	\N
8061	Zanzan (Région du)	08	292	\N
8062	Bas-Sassandra (Région du)	09	292	\N
8063	Denguélé (Région du)	10	292	\N
8064	Nzi-Comoé (Région)	11	292	\N
8065	Marahoué (Région de la)	12	292	\N
8066	Sud-Comoé (Région du)	13	292	\N
8067	Worodouqou (Région du)	14	292	\N
8068	Sud-Bandama (Région du)	15	292	\N
8069	Agnébi (Région de l')	16	292	\N
8070	Bafing (Région du)	17	292	\N
8071	Fromager (Région du)	18	292	\N
8072	Moyen-Cavally (Région du)	19	292	\N
8073	Aisén del General Carlos Ibáñez del Campo	AI	294	\N
8074	Antofagasta	AN	294	\N
8075	Arica y Parinacota	AP	294	\N
8076	Araucanía	AR	294	\N
8077	Atacama	AT	294	\N
8078	Bío-Bío	BI	294	\N
8079	Coquimbo	CO	294	\N
8080	Libertador General Bernardo O'Higgins	LI	294	\N
8081	Los Lagos	LL	294	\N
8082	Los Ríos	LR	294	\N
8083	Magallanes y Antártica Chilena	MA	294	\N
8084	Maule	ML	294	\N
8085	Región Metropolitana de Santiago	RM	294	\N
8086	Tarapacá	TA	294	\N
8087	Valparaíso	VS	294	\N
8088	Adamaoua	AD	295	\N
8089	Centre	CE	295	\N
8090	Far North	EN	295	\N
8091	East	ES	295	\N
8092	Littoral	LT	295	\N
8093	North	NO	295	\N
8094	North-West (Cameroon)	NW	295	\N
8095	West	OU	295	\N
8096	South	SU	295	\N
8097	South-West	SW	295	\N
8098	Beijing	11	296	\N
8099	Tianjin	12	296	\N
8100	Hebei	13	296	\N
8101	Shanxi	14	296	\N
8102	Nei Mongol	15	296	\N
8103	Liaoning	21	296	\N
8104	Jilin	22	296	\N
8105	Heilongjiang	23	296	\N
8106	Shanghai	31	296	\N
8107	Jiangsu	32	296	\N
8108	Zhejiang	33	296	\N
8109	Anhui	34	296	\N
8110	Fujian	35	296	\N
8111	Jiangxi	36	296	\N
8112	Shandong	37	296	\N
8113	Henan	41	296	\N
8114	Hubei	42	296	\N
8115	Hunan	43	296	\N
8116	Guangdong	44	296	\N
8117	Guangxi	45	296	\N
8118	Hainan	46	296	\N
8119	Chongqing	50	296	\N
8120	Sichuan	51	296	\N
8121	Guizhou	52	296	\N
8122	Yunnan	53	296	\N
8123	Xizang	54	296	\N
8124	Shaanxi	61	296	\N
8125	Gansu	62	296	\N
8126	Qinghai	63	296	\N
8127	Ningxia	64	296	\N
8128	Xinjiang	65	296	\N
8129	Taiwan	71	296	\N
8130	Xianggang (Hong-Kong)	91	296	\N
8131	Aomen (Macau)	92	296	\N
8132	Amazonas	AMA	297	\N
8133	Antioquia	ANT	297	\N
8134	Arauca	ARA	297	\N
8135	Atlántico	ATL	297	\N
8136	Bolívar	BOL	297	\N
8137	Boyacá	BOY	297	\N
8138	Caldas	CAL	297	\N
8139	Caquetá	CAQ	297	\N
8140	Casanare	CAS	297	\N
8141	Cauca	CAU	297	\N
8142	Cesar	CES	297	\N
8143	Chocó	CHO	297	\N
8144	Córdoba	COR	297	\N
8145	Cundinamarca	CUN	297	\N
8146	Distrito Capital de Bogotá	DC	297	\N
8147	Guainía	GUA	297	\N
8148	Guaviare	GUV	297	\N
8149	Huila	HUI	297	\N
8150	La Guajira	LAG	297	\N
8151	Magdalena	MAG	297	\N
8152	Meta	MET	297	\N
8153	Nariño	NAR	297	\N
8154	Norte de Santander	NSA	297	\N
8155	Putumayo	PUT	297	\N
8156	Quindío	QUI	297	\N
8157	Risaralda	RIS	297	\N
8158	Santander	SAN	297	\N
8159	San Andrés, Providencia y Santa Catalina	SAP	297	\N
8160	Sucre	SUC	297	\N
8161	Tolima	TOL	297	\N
8162	Valle del Cauca	VAC	297	\N
8163	Vaupés	VAU	297	\N
8164	Vichada	VID	297	\N
8165	Alajuela	A	298	\N
8166	Cartago	C	298	\N
8167	Guanacaste	G	298	\N
8168	Heredia	H	298	\N
8169	Limón	L	298	\N
8170	Puntarenas	P	298	\N
8171	San José	SJ	298	\N
8172	Pinar del Rio	01	299	\N
8173	La Habana	02	299	\N
8174	Ciudad de La Habana	03	299	\N
8175	Matanzas	04	299	\N
8176	Villa Clara	05	299	\N
8177	Cienfuegos	06	299	\N
8178	Sancti Spíritus	07	299	\N
8179	Ciego de Ávila	08	299	\N
8180	Camagüey	09	299	\N
8181	Las Tunas	10	299	\N
8182	Holguín	11	299	\N
8183	Granma	12	299	\N
8184	Santiago de Cuba	13	299	\N
8185	Guantánamo	14	299	\N
8186	Isla de la Juventud	99	299	\N
8187	Ilhas de Barlavento	B	300	\N
8188	Ilhas de Sotavento	S	300	\N
8189	Lefkosía	01	303	\N
8190	Lemesós	02	303	\N
8191	Lárnaka	03	303	\N
8192	Ammóchostos	04	303	\N
8193	Páfos	05	303	\N
8194	Kerýneia	06	303	\N
8195	Jihočeský kraj	JC	304	\N
8196	Jihomoravský kraj	JM	304	\N
8197	Karlovarský kraj	KA	304	\N
8198	Královéhradecký kraj	KR	304	\N
8199	Liberecký kraj	LI	304	\N
8200	Moravskoslezský kraj	MO	304	\N
8201	Olomoucký kraj	OL	304	\N
8202	Pardubický kraj	PA	304	\N
8203	Plzeňský kraj	PL	304	\N
8204	Praha, hlavní město	PR	304	\N
8205	Středočeský kraj	ST	304	\N
8206	Ústecký kraj	US	304	\N
8207	Vysočina	VY	304	\N
8208	Zlínský kraj	ZL	304	\N
8209	Brandenburg	BB	305	\N
8210	Berlin	BE	305	\N
8211	Baden-Württemberg	BW	305	\N
8212	Bayern	BY	305	\N
8213	Bremen	HB	305	\N
8214	Hessen	HE	305	\N
8215	Hamburg	HH	305	\N
8216	Mecklenburg-Vorpommern	MV	305	\N
8217	Niedersachsen	NI	305	\N
8218	Nordrhein-Westfalen	NW	305	\N
8219	Rheinland-Pfalz	RP	305	\N
8220	Schleswig-Holstein	SH	305	\N
8221	Saarland	SL	305	\N
8222	Sachsen	SN	305	\N
8223	Sachsen-Anhalt	ST	305	\N
8224	Thüringen	TH	305	\N
8225	Arta	AR	306	\N
8226	Ali Sabieh	AS	306	\N
8227	Dikhil	DI	306	\N
8228	Djibouti	DJ	306	\N
8229	Obock	OB	306	\N
8230	Tadjourah	TA	306	\N
8231	Nordjylland	81	307	\N
8232	Midtjylland	82	307	\N
8233	Syddanmark	83	307	\N
8234	Hovedstaden	84	307	\N
8235	Sjælland	85	307	\N
8236	Saint Peter	01	308	\N
8237	Saint Andrew	02	308	\N
8238	Saint David	03	308	\N
8239	Saint George	04	308	\N
8240	Saint John	05	308	\N
8241	Saint Joseph	06	308	\N
8242	Saint Luke	07	308	\N
8243	Saint Mark	08	308	\N
8244	Saint Patrick	09	308	\N
8245	Saint Paul	10	308	\N
8246	Distrito Nacional (Santo Domingo)	01	309	\N
8247	Azua	02	309	\N
8248	Bahoruco	03	309	\N
8249	Barahona	04	309	\N
8250	Dajabón	05	309	\N
8251	Duarte	06	309	\N
8252	La Estrelleta [Elías Piña]	07	309	\N
8253	El Seybo [El Seibo]	08	309	\N
8254	Espaillat	09	309	\N
8255	Independencia	10	309	\N
8256	La Altagracia	11	309	\N
8257	La Romana	12	309	\N
8258	La Vega	13	309	\N
8259	María Trinidad Sánchez	14	309	\N
8260	Monte Cristi	15	309	\N
8261	Pedernales	16	309	\N
8262	Peravia	17	309	\N
8263	Puerto Plata	18	309	\N
8264	Salcedo	19	309	\N
8265	Samaná	20	309	\N
8266	San Cristóbal	21	309	\N
8267	San Juan	22	309	\N
8268	San Pedro de Macorís	23	309	\N
8269	Sánchez Ramírez	24	309	\N
8270	Santiago	25	309	\N
8271	Santiago Rodríguez	26	309	\N
8272	Valverde	27	309	\N
8273	Monseñor Nouel	28	309	\N
8274	Monte Plata	29	309	\N
8275	Hato Mayor	30	309	\N
8276	Adrar	01	310	\N
8277	Chlef	02	310	\N
8278	Laghouat	03	310	\N
8279	Oum el Bouaghi	04	310	\N
8280	Batna	05	310	\N
8281	Béjaïa	06	310	\N
8282	Biskra	07	310	\N
8283	Béchar	08	310	\N
8284	Blida	09	310	\N
8285	Bouira	10	310	\N
8286	Tamanghasset	11	310	\N
8287	Tébessa	12	310	\N
8288	Tlemcen	13	310	\N
8289	Tiaret	14	310	\N
8290	Tizi Ouzou	15	310	\N
8291	Alger	16	310	\N
8292	Djelfa	17	310	\N
8293	Jijel	18	310	\N
8294	Sétif	19	310	\N
8295	Saïda	20	310	\N
8296	Skikda	21	310	\N
8297	Sidi Bel Abbès	22	310	\N
8298	Annaba	23	310	\N
8299	Guelma	24	310	\N
8300	Constantine	25	310	\N
8301	Médéa	26	310	\N
8302	Mostaganem	27	310	\N
8303	Msila	28	310	\N
8304	Mascara	29	310	\N
8305	Ouargla	30	310	\N
8306	Oran	31	310	\N
8307	El Bayadh	32	310	\N
8308	Illizi	33	310	\N
8309	Bordj Bou Arréridj	34	310	\N
8310	Boumerdès	35	310	\N
8311	El Tarf	36	310	\N
8312	Tindouf	37	310	\N
8313	Tissemsilt	38	310	\N
8314	El Oued	39	310	\N
8315	Khenchela	40	310	\N
8316	Souk Ahras	41	310	\N
8317	Tipaza	42	310	\N
8318	Mila	43	310	\N
8319	Aïn Defla	44	310	\N
8320	Naama	45	310	\N
8321	Aïn Témouchent	46	310	\N
8322	Ghardaïa	47	310	\N
8323	Relizane	48	310	\N
8324	Azuay	A	311	\N
8325	Bolívar	B	311	\N
8326	Carchi	C	311	\N
8327	Orellana	D	311	\N
8328	Esmeraldas	E	311	\N
8329	Cañar	F	311	\N
8330	Guayas	G	311	\N
8331	Chimborazo	H	311	\N
8332	Imbabura	I	311	\N
8333	Loja	L	311	\N
8334	Manabí	M	311	\N
8335	Napo	N	311	\N
8336	El Oro	O	311	\N
8337	Pichincha	P	311	\N
8338	Los Ríos	R	311	\N
8339	Morona-Santiago	S	311	\N
8340	Santo Domingo de los Tsáchilas	SD	311	\N
8341	Santa Elena	SE	311	\N
8342	Tungurahua	T	311	\N
8343	Sucumbíos	U	311	\N
8344	Galápagos	W	311	\N
8345	Cotopaxi	X	311	\N
8346	Pastaza	Y	311	\N
8347	Zamora-Chinchipe	Z	311	\N
8348	Harjumaa	37	312	\N
8349	Hiiumaa	39	312	\N
8350	Ida-Virumaa	44	312	\N
8351	Jõgevamaa	49	312	\N
8352	Järvamaa	51	312	\N
8353	Läänemaa	57	312	\N
8354	Lääne-Virumaa	59	312	\N
8355	Põlvamaa	65	312	\N
8356	Pärnumaa	67	312	\N
8357	Raplamaa	70	312	\N
8358	Saaremaa	74	312	\N
8359	Tartumaa	78	312	\N
8360	Valgamaa	82	312	\N
8361	Viljandimaa	84	312	\N
8362	Võrumaa	86	312	\N
8363	Al Iskandarīyah	ALX	313	\N
8364	Aswān	ASN	313	\N
8365	Asyūt	AST	313	\N
8366	Al Bahr al Ahmar	BA	313	\N
8367	Al Buhayrah	BH	313	\N
8368	Banī Suwayf	BNS	313	\N
8369	Al Qāhirah	C	313	\N
8370	Ad Daqahlīyah	DK	313	\N
8371	Dumyāt	DT	313	\N
8372	Al Fayyūm	FYM	313	\N
8373	Al Gharbīyah	GH	313	\N
8374	Al Jīzah	GZ	313	\N
8375	Ḩulwān	HU	313	\N
8376	Al Ismā`īlīyah	IS	313	\N
8377	Janūb Sīnā'	JS	313	\N
8378	Al Qalyūbīyah	KB	313	\N
8379	Kafr ash Shaykh	KFS	313	\N
8380	Qinā	KN	313	\N
8381	Al Minyā	MN	313	\N
8382	Al Minūfīyah	MNF	313	\N
8383	Matrūh	MT	313	\N
8384	Būr Sa`īd	PTS	313	\N
8385	Sūhāj	SHG	313	\N
8386	Ash Sharqīyah	SHR	313	\N
8387	Shamal Sīnā'	SIN	313	\N
8388	As Sādis min Uktūbar	SU	313	\N
8389	As Suways	SUZ	313	\N
8390	Al Wādī al Jadīd	WAD	313	\N
8391	Ansabā	AN	315	\N
8392	Janūbī al Baḩrī al Aḩmar	DK	315	\N
8393	Al Janūbī	DU	315	\N
8394	Qāsh-Barkah	GB	315	\N
8395	Al Awsaţ	MA	315	\N
8396	Shimālī al Baḩrī al Aḩmar	SK	315	\N
8397	Andalucía	AN	316	\N
8398	Aragón	AR	316	\N
8399	Asturias, Principado de	AS	316	\N
8400	Cantabria	CB	316	\N
8401	Ceuta	CE	316	\N
8402	Castilla y León	CL	316	\N
8403	Castilla-La Mancha	CM	316	\N
8404	Canarias	CN	316	\N
8405	Catalunya	CT	316	\N
8406	Extremadura	EX	316	\N
8407	Galicia	GA	316	\N
8408	Illes Balears	IB	316	\N
8409	Murcia, Región de	MC	316	\N
8410	Madrid, Comunidad de	MD	316	\N
8411	Melilla	ML	316	\N
8412	Navarra, Comunidad Foral de / Nafarroako Foru Komunitatea	NC	316	\N
8413	País Vasco / Euskal Herria	PV	316	\N
8414	La Rioja	RI	316	\N
8415	Valenciana, Comunidad / Valenciana, Comunitat 	VC	316	\N
8416	Ādīs Ābeba	AA	317	\N
8417	Āfar	AF	317	\N
8418	Āmara	AM	317	\N
8419	Bīnshangul Gumuz	BE	317	\N
8420	Dirē Dawa	DD	317	\N
8421	Gambēla Hizboch	GA	317	\N
8422	Hārerī Hizb	HA	317	\N
8423	Oromīya	OR	317	\N
8424	YeDebub Bihēroch Bihēreseboch na Hizboch	SN	317	\N
8425	Sumalē	SO	317	\N
8426	Tigray	TI	317	\N
8427	Ahvenanmaan maakunta	01	318	\N
8428	Etelä-Karjala	02	318	\N
8429	Etelä-Pohjanmaa	03	318	\N
8430	Etelä-Savo	04	318	\N
8431	Kainuu	05	318	\N
8432	Kanta-Häme	06	318	\N
8433	Keski-Pohjanmaa	07	318	\N
8434	Keski-Suomi	08	318	\N
8435	Kymenlaakso	09	318	\N
8436	Lappi	10	318	\N
8437	Pirkanmaa	11	318	\N
8438	Pohjanmaa	12	318	\N
8439	Pohjois-Karjala	13	318	\N
8440	Pohjois-Pohjanmaa	14	318	\N
8441	Pohjois-Savo	15	318	\N
8442	Päijät-Häme	16	318	\N
8443	Satakunta	17	318	\N
8444	Uusimaa	18	318	\N
8445	Varsinais-Suomi	19	318	\N
8446	Central	C	319	\N
8447	Eastern	E	319	\N
8448	Northern	N	319	\N
8449	Rotuma	R	319	\N
8450	Western	W	319	\N
8451	Kosrae	KSA	321	\N
8452	Pohnpei	PNI	321	\N
8453	Chuuk	TRK	321	\N
8454	Yap	YAP	321	\N
8455	Alsace	A	323	\N
8456	Aquitaine	B	323	\N
8457	Saint-Barthélemy	BL	323	\N
8458	Auvergne	C	323	\N
8459	Clipperton	CP	323	\N
8460	Bourgogne	D	323	\N
8461	Bretagne	E	323	\N
8462	Centre	F	323	\N
8463	Champagne-Ardenne	G	323	\N
8464	Guyane	GF	323	\N
8465	Guadeloupe	GP	323	\N
8466	Corse	H	323	\N
8467	Franche-Comté	I	323	\N
8468	Île-de-France	J	323	\N
8469	Languedoc-Roussillon	K	323	\N
8470	Limousin	L	323	\N
8471	Lorraine	M	323	\N
8472	Saint-Martin	MF	323	\N
8473	Martinique	MQ	323	\N
8474	Midi-Pyrénées	N	323	\N
8475	Nouvelle-Calédonie	NC	323	\N
8476	Nord-Pas-de-Calais	O	323	\N
8477	Basse-Normandie	P	323	\N
8478	Polynésie française	PF	323	\N
8479	Saint-Pierre-et-Miquelon	PM	323	\N
8480	Haute-Normandie	Q	323	\N
8481	Pays de la Loire	R	323	\N
8482	La Réunion	RE	323	\N
8483	Picardie	S	323	\N
8484	Poitou-Charentes	T	323	\N
8485	Terres australes françaises	TF	323	\N
8486	Provence-Alpes-Côte d'Azur	U	323	\N
8487	Rhône-Alpes	V	323	\N
8488	Wallis-et-Futuna	WF	323	\N
8489	Mayotte	YT	323	\N
8490	Estuaire	1	324	\N
8491	Haut-Ogooué	2	324	\N
8492	Moyen-Ogooué	3	324	\N
8493	Ngounié	4	324	\N
8494	Nyanga	5	324	\N
8495	Ogooué-Ivindo	6	324	\N
8496	Ogooué-Lolo	7	324	\N
8497	Ogooué-Maritime	8	324	\N
8498	Woleu-Ntem	9	324	\N
8499	Aberdeenshire	ABD	325	\N
8500	Aberdeen City	ABE	325	\N
8501	Argyll and Bute	AGB	325	\N
8502	Isle of Anglesey;Sir Ynys Môn	AGY	325	\N
8503	Angus	ANS	325	\N
8504	Antrim	ANT	325	\N
8505	Ards	ARD	325	\N
8506	Armagh	ARM	325	\N
8507	Bath and North East Somerset	BAS	325	\N
8508	Blackburn with Darwen	BBD	325	\N
8509	Bedford	BDF	325	\N
8510	Barking and Dagenham	BDG	325	\N
8511	Brent	BEN	325	\N
8512	Bexley	BEX	325	\N
8513	Belfast	BFS	325	\N
8514	Bridgend;Pen-y-bont ar Ogwr	BGE	325	\N
8515	Blaenau Gwent	BGW	325	\N
8516	Birmingham	BIR	325	\N
8517	Buckinghamshire	BKM	325	\N
8518	Ballymena	BLA	325	\N
8519	Ballymoney	BLY	325	\N
8520	Bournemouth	BMH	325	\N
8521	Banbridge	BNB	325	\N
8522	Barnet	BNE	325	\N
8523	Brighton and Hove	BNH	325	\N
8524	Barnsley	BNS	325	\N
8525	Bolton	BOL	325	\N
8526	Blackpool	BPL	325	\N
8527	Bracknell Forest	BRC	325	\N
8528	Bradford	BRD	325	\N
8529	Bromley	BRY	325	\N
8530	Bristol, City of	BST	325	\N
8531	Bury	BUR	325	\N
8532	Cambridgeshire	CAM	325	\N
8533	Caerphilly;Caerffili	CAY	325	\N
8534	Central Bedfordshire	CBF	325	\N
8535	Ceredigion;Sir Ceredigion	CGN	325	\N
8536	Craigavon	CGV	325	\N
8537	Cheshire East	CHE	325	\N
8538	Cheshire West and Chester	CHW	325	\N
8539	Carrickfergus	CKF	325	\N
8540	Cookstown	CKT	325	\N
8541	Calderdale	CLD	325	\N
8542	Clackmannanshire	CLK	325	\N
8543	Coleraine	CLR	325	\N
8544	Cumbria	CMA	325	\N
8545	Camden	CMD	325	\N
8546	Carmarthenshire;Sir Gaerfyrddin	CMN	325	\N
8547	Cornwall	CON	325	\N
8548	Coventry	COV	325	\N
8549	Cardiff;Caerdydd	CRF	325	\N
8550	Croydon	CRY	325	\N
8551	Castlereagh	CSR	325	\N
8552	Conwy	CWY	325	\N
8553	Darlington	DAL	325	\N
8554	Derbyshire	DBY	325	\N
8555	Denbighshire;Sir Ddinbych	DEN	325	\N
8556	Derby	DER	325	\N
8557	Devon	DEV	325	\N
8558	Dungannon and South Tyrone	DGN	325	\N
8559	Dumfries and Galloway	DGY	325	\N
8560	Doncaster	DNC	325	\N
8561	Dundee City	DND	325	\N
8562	Dorset	DOR	325	\N
8563	Down	DOW	325	\N
8564	Derry	DRY	325	\N
8565	Dudley	DUD	325	\N
8566	Durham, County	DUR	325	\N
8567	Ealing	EAL	325	\N
8568	England and Wales	EAW	325	\N
8569	East Ayrshire	EAY	325	\N
8570	Edinburgh, City of	EDH	325	\N
8571	East Dunbartonshire	EDU	325	\N
8572	East Lothian	ELN	325	\N
8573	Eilean Siar	ELS	325	\N
8574	Enfield	ENF	325	\N
8575	England	ENG	325	\N
8576	East Renfrewshire	ERW	325	\N
8577	East Riding of Yorkshire	ERY	325	\N
8578	Essex	ESS	325	\N
8579	East Sussex	ESX	325	\N
8580	Falkirk	FAL	325	\N
8581	Fermanagh	FER	325	\N
8582	Fife	FIF	325	\N
8583	Flintshire;Sir y Fflint	FLN	325	\N
8584	Gateshead	GAT	325	\N
8585	Great Britain	GBN	325	\N
8586	Glasgow City	GLG	325	\N
8587	Gloucestershire	GLS	325	\N
8588	Greenwich	GRE	325	\N
8589	Gwynedd	GWN	325	\N
8590	Halton	HAL	325	\N
8591	Hampshire	HAM	325	\N
8592	Havering	HAV	325	\N
8593	Hackney	HCK	325	\N
8594	Herefordshire	HEF	325	\N
8595	Hillingdon	HIL	325	\N
8596	Highland	HLD	325	\N
8597	Hammersmith and Fulham	HMF	325	\N
8598	Hounslow	HNS	325	\N
8599	Hartlepool	HPL	325	\N
8600	Hertfordshire	HRT	325	\N
8601	Harrow	HRW	325	\N
8602	Haringey	HRY	325	\N
8603	Isle of Wight	IOW	325	\N
8604	Islington	ISL	325	\N
8605	Inverclyde	IVC	325	\N
8606	Kensington and Chelsea	KEC	325	\N
8607	Kent	KEN	325	\N
8608	Kingston upon Hull	KHL	325	\N
8609	Kirklees	KIR	325	\N
8610	Kingston upon Thames	KTT	325	\N
8611	Knowsley	KWL	325	\N
8612	Lancashire	LAN	325	\N
8613	Lambeth	LBH	325	\N
8614	Leicester	LCE	325	\N
8615	Leeds	LDS	325	\N
8616	Leicestershire	LEC	325	\N
8617	Lewisham	LEW	325	\N
8618	Lincolnshire	LIN	325	\N
8619	Liverpool	LIV	325	\N
8620	Limavady	LMV	325	\N
8621	London, City of	LND	325	\N
8622	Larne	LRN	325	\N
8623	Lisburn	LSB	325	\N
8624	Luton	LUT	325	\N
8625	Manchester	MAN	325	\N
8626	Middlesbrough	MDB	325	\N
8627	Medway	MDW	325	\N
8628	Magherafelt	MFT	325	\N
8629	Milton Keynes	MIK	325	\N
8630	Midlothian	MLN	325	\N
8631	Monmouthshire;Sir Fynwy	MON	325	\N
8632	Merton	MRT	325	\N
8633	Moray	MRY	325	\N
8634	Merthyr Tydfil;Merthyr Tudful	MTY	325	\N
8635	Moyle	MYL	325	\N
8636	North Ayrshire	NAY	325	\N
8637	Northumberland	NBL	325	\N
8638	North Down	NDN	325	\N
8639	North East Lincolnshire	NEL	325	\N
8640	Newcastle upon Tyne	NET	325	\N
8641	Norfolk	NFK	325	\N
8642	Nottingham	NGM	325	\N
8643	Northern Ireland	NIR	325	\N
8644	North Lanarkshire	NLK	325	\N
8645	North Lincolnshire	NLN	325	\N
8646	North Somerset	NSM	325	\N
8647	Newtownabbey	NTA	325	\N
8648	Northamptonshire	NTH	325	\N
8649	Neath Port Talbot;Castell-nedd Port Talbot	NTL	325	\N
8650	Nottinghamshire	NTT	325	\N
8651	North Tyneside	NTY	325	\N
8652	Newham	NWM	325	\N
8653	Newport;Casnewydd	NWP	325	\N
8654	North Yorkshire	NYK	325	\N
8655	Newry and Mourne	NYM	325	\N
8656	Oldham	OLD	325	\N
8657	Omagh	OMH	325	\N
8658	Orkney Islands	ORK	325	\N
8659	Oxfordshire	OXF	325	\N
8660	Pembrokeshire;Sir Benfro	PEM	325	\N
8661	Perth and Kinross	PKN	325	\N
8662	Plymouth	PLY	325	\N
8663	Poole	POL	325	\N
8664	Portsmouth	POR	325	\N
8665	Powys	POW	325	\N
8666	Peterborough	PTE	325	\N
8667	Redcar and Cleveland	RCC	325	\N
8668	Rochdale	RCH	325	\N
8669	Rhondda, Cynon, Taff;Rhondda, Cynon,Taf	RCT	325	\N
8670	Redbridge	RDB	325	\N
8671	Reading	RDG	325	\N
8672	Renfrewshire	RFW	325	\N
8673	Richmond upon Thames	RIC	325	\N
8674	Rotherham	ROT	325	\N
8675	Rutland	RUT	325	\N
8676	Sandwell	SAW	325	\N
8677	South Ayrshire	SAY	325	\N
8678	Scottish Borders, The	SCB	325	\N
8679	Scotland	SCT	325	\N
8680	Suffolk	SFK	325	\N
8681	Sefton	SFT	325	\N
8682	South Gloucestershire	SGC	325	\N
8683	Sheffield	SHF	325	\N
8684	St. Helens	SHN	325	\N
8685	Shropshire	SHR	325	\N
8686	Stockport	SKP	325	\N
8687	Salford	SLF	325	\N
8688	Slough	SLG	325	\N
8689	South Lanarkshire	SLK	325	\N
8690	Sunderland	SND	325	\N
8691	Solihull	SOL	325	\N
8692	Somerset	SOM	325	\N
8693	Southend-on-Sea	SOS	325	\N
8694	Surrey	SRY	325	\N
8695	Strabane	STB	325	\N
8696	Stoke-on-Trent	STE	325	\N
8697	Stirling	STG	325	\N
8698	Southampton	STH	325	\N
8699	Sutton	STN	325	\N
8700	Staffordshire	STS	325	\N
8701	Stockton-on-Tees	STT	325	\N
8702	South Tyneside	STY	325	\N
8703	Swansea;Abertawe	SWA	325	\N
8704	Swindon	SWD	325	\N
8705	Southwark	SWK	325	\N
8706	Tameside	TAM	325	\N
8707	Telford and Wrekin	TFW	325	\N
8708	Thurrock	THR	325	\N
8709	Torbay	TOB	325	\N
8710	Torfaen;Tor-faen	TOF	325	\N
8711	Trafford	TRF	325	\N
8712	Tower Hamlets	TWH	325	\N
8713	United Kingdom	UKM	325	\N
8714	Vale of Glamorgan, The;Bro Morgannwg	VGL	325	\N
8715	Warwickshire	WAR	325	\N
8716	West Berkshire	WBK	325	\N
8717	West Dunbartonshire	WDU	325	\N
8718	Waltham Forest	WFT	325	\N
8719	Wigan	WGN	325	\N
8720	Wakefield	WKF	325	\N
8721	Walsall	WLL	325	\N
8722	West Lothian	WLN	325	\N
8723	Wales	WLS	325	\N
8724	Wolverhampton	WLV	325	\N
8725	Wandsworth	WND	325	\N
8726	Windsor and Maidenhead	WNM	325	\N
8727	Wokingham	WOK	325	\N
8728	Worcestershire	WOR	325	\N
8729	Wirral	WRL	325	\N
8730	Warrington	WRT	325	\N
8731	Wrexham;Wrecsam	WRX	325	\N
8732	Westminster	WSM	325	\N
8733	West Sussex	WSX	325	\N
8734	York	YOR	325	\N
8735	Shetland Islands	ZET	325	\N
8736	Wiltshire	WIL	325	\N
8737	Saint Andrew	01	326	\N
8738	Saint David	02	326	\N
8739	Saint George	03	326	\N
8740	Saint John	04	326	\N
8741	Saint Mark	05	326	\N
8742	Saint Patrick	06	326	\N
8743	Southern Grenadine Islands	10	326	\N
8744	Abkhazia	AB	327	\N
8745	Ajaria	AJ	327	\N
8746	Guria	GU	327	\N
8747	Imeret’i	IM	327	\N
8748	Kakhet’i	KA	327	\N
8749	K’vemo K’art’li	KK	327	\N
8750	Mts’khet’a-Mt’ianet’i	MM	327	\N
8751	Racha-Lech’khumi-K’vemo Svanet’i	RL	327	\N
8752	Samts’khe-Javakhet’i	SJ	327	\N
8753	Shida K’art’li	SK	327	\N
8754	Samegrelo-Zemo Svanet’i	SZ	327	\N
8755	T’bilisi	TB	327	\N
8756	Greater Accra	AA	330	\N
8757	Ashanti	AH	330	\N
8758	Brong-Ahafo	BA	330	\N
8759	Central	CP	330	\N
8760	Eastern	EP	330	\N
8761	Northern	NP	330	\N
8762	Volta	TV	330	\N
8763	Upper East	UE	330	\N
8764	Upper West	UW	330	\N
8765	Western	WP	330	\N
8766	Kommune Kujalleq	KU	332	\N
8767	Qaasuitsup Kommunia	QA	332	\N
8768	Qeqqata Kommunia	QE	332	\N
8769	Kommuneqarfik Sermersooq	SM	332	\N
8770	Banjul	B	333	\N
8771	Lower River	L	333	\N
8772	Central River	M	333	\N
8773	North Bank	N	333	\N
8774	Upper River	U	333	\N
8775	Western	W	333	\N
8776	Boké	B	334	\N
8777	Conakry	C	334	\N
8778	Kindia	D	334	\N
8779	Faranah	F	334	\N
8780	Kankan	K	334	\N
8781	Labé	L	334	\N
8782	Mamou	M	334	\N
8783	Nzérékoré	N	334	\N
8784	Región Continental	C	336	\N
8785	Región Insular	I	336	\N
8786	Agio Oros	69	337	\N
8787	Anatoliki Makedonia kai Thraki	A	337	\N
8788	Kentriki Makedonia	B	337	\N
8789	Dytiki Makedonia	C	337	\N
8790	Ipeiros	D	337	\N
8791	Thessalia	E	337	\N
8792	Ionia Nisia	F	337	\N
8793	Dytiki Ellada	G	337	\N
8794	Sterea Ellada	H	337	\N
8795	Attiki	I	337	\N
8796	Peloponnisos	J	337	\N
8797	Voreio Aigaio	K	337	\N
8798	Notio Aigaio	L	337	\N
8799	Kriti	M	337	\N
8800	Alta Verapaz	AV	339	\N
8801	Baja Verapaz	BV	339	\N
8802	Chimaltenango	CM	339	\N
8803	Chiquimula	CQ	339	\N
8804	Escuintla	ES	339	\N
8805	Guatemala	GU	339	\N
8806	Huehuetenango	HU	339	\N
8807	Izabal	IZ	339	\N
8808	Jalapa	JA	339	\N
8809	Jutiapa	JU	339	\N
8810	Petén	PE	339	\N
8811	El Progreso	PR	339	\N
8812	Quiché	QC	339	\N
8813	Quetzaltenango	QZ	339	\N
8814	Retalhuleu	RE	339	\N
8815	Sacatepéquez	SA	339	\N
8816	San Marcos	SM	339	\N
8817	Sololá	SO	339	\N
8818	Santa Rosa	SR	339	\N
8819	Suchitepéquez	SU	339	\N
8820	Totonicapán	TO	339	\N
8821	Zacapa	ZA	339	\N
8822	Bissau	BS	341	\N
8823	Leste	L	341	\N
8824	Norte	N	341	\N
8825	Sul	S	341	\N
8826	Barima-Waini	BA	342	\N
8827	Cuyuni-Mazaruni	CU	342	\N
8828	Demerara-Mahaica	DE	342	\N
8829	East Berbice-Corentyne	EB	342	\N
8830	Essequibo Islands-West Demerara	ES	342	\N
8831	Mahaica-Berbice	MA	342	\N
8832	Pomeroon-Supenaam	PM	342	\N
8833	Potaro-Siparuni	PT	342	\N
8834	Upper Demerara-Berbice	UD	342	\N
8835	Upper Takutu-Upper Essequibo	UT	342	\N
8836	Atlántida	AT	345	\N
8837	Choluteca	CH	345	\N
8838	Colón	CL	345	\N
8839	Comayagua	CM	345	\N
8840	Copán	CP	345	\N
8841	Cortés	CR	345	\N
8842	El Paraíso	EP	345	\N
8843	Francisco Morazán	FM	345	\N
8844	Gracias a Dios	GD	345	\N
8845	Islas de la Bahía	IB	345	\N
8846	Intibucá	IN	345	\N
8847	Lempira	LE	345	\N
8848	La Paz	LP	345	\N
8849	Ocotepeque	OC	345	\N
8850	Olancho	OL	345	\N
8851	Santa Bárbara	SB	345	\N
8852	Valle	VA	345	\N
8853	Yoro	YO	345	\N
8854	Zagrebačka županija	01	346	\N
8855	Krapinsko-zagorska županija	02	346	\N
8856	Sisačko-moslavačka županija	03	346	\N
8857	Karlovačka županija	04	346	\N
8858	Varaždinska županija	05	346	\N
8859	Koprivničko-križevačka županija	06	346	\N
8860	Bjelovarsko-bilogorska županija	07	346	\N
8861	Primorsko-goranska županija	08	346	\N
8862	Ličko-senjska županija	09	346	\N
8863	Virovitičko-podravska županija	10	346	\N
8864	Požeško-slavonska županija	11	346	\N
8865	Brodsko-posavska županija	12	346	\N
8866	Zadarska županija	13	346	\N
8867	Osječko-baranjska županija	14	346	\N
8868	Šibensko-kninska županija	15	346	\N
8869	Vukovarsko-srijemska županija	16	346	\N
8870	Splitsko-dalmatinska županija	17	346	\N
8871	Istarska županija	18	346	\N
8872	Dubrovačko-neretvanska županija	19	346	\N
8873	Međimurska županija	20	346	\N
8874	Grad Zagreb	21	346	\N
8875	Artibonite	AR	347	\N
8876	Centre	CE	347	\N
8877	Grande-Anse	GA	347	\N
8878	Nord	ND	347	\N
8879	Nord-Est	NE	347	\N
8880	Nord-Ouest	NO	347	\N
8881	Ouest	OU	347	\N
8882	Sud	SD	347	\N
8883	Sud-Est	SE	347	\N
8884	Baranya	BA	348	\N
8885	Békéscsaba	BC	348	\N
8886	Békés	BE	348	\N
8887	Bács-Kiskun	BK	348	\N
8888	Budapest	BU	348	\N
8889	Borsod-Abaúj-Zemplén	BZ	348	\N
8890	Csongrád	CS	348	\N
8891	Debrecen	DE	348	\N
8892	Dunaújváros	DU	348	\N
8893	Eger	EG	348	\N
8894	Érd	ER	348	\N
8895	Fejér	FE	348	\N
8896	Győr-Moson-Sopron	GS	348	\N
8897	Győr	GY	348	\N
8898	Hajdú-Bihar	HB	348	\N
8899	Heves	HE	348	\N
8900	Hódmezővásárhely	HV	348	\N
8901	Jász-Nagykun-Szolnok	JN	348	\N
8902	Komárom-Esztergom	KE	348	\N
8903	Kecskemét	KM	348	\N
8904	Kaposvár	KV	348	\N
8905	Miskolc	MI	348	\N
8906	Nagykanizsa	NK	348	\N
8907	Nógrád	NO	348	\N
8908	Nyíregyháza	NY	348	\N
8909	Pest	PE	348	\N
8910	Pécs	PS	348	\N
8911	Szeged	SD	348	\N
8912	Székesfehérvár	SF	348	\N
8913	Szombathely	SH	348	\N
8914	Szolnok	SK	348	\N
8915	Sopron	SN	348	\N
8916	Somogy	SO	348	\N
8917	Szekszárd	SS	348	\N
8918	Salgótarján	ST	348	\N
8919	Szabolcs-Szatmár-Bereg	SZ	348	\N
8920	Tatabánya	TB	348	\N
8921	Tolna	TO	348	\N
8922	Vas	VA	348	\N
8923	Veszprém (county)	VE	348	\N
8924	Veszprém	VM	348	\N
8925	Zala	ZA	348	\N
8926	Zalaegerszeg	ZE	348	\N
8927	Papua	IJ	349	\N
8928	Jawa	JW	349	\N
8929	Kalimantan	KA	349	\N
8930	Maluku	ML	349	\N
8931	Nusa Tenggara	NU	349	\N
8932	Sulawesi	SL	349	\N
8933	Sumatera	SM	349	\N
8934	Connacht	C	350	\N
8935	Leinster	L	350	\N
8936	Munster	M	350	\N
8937	Ulster	U	350	\N
8938	HaDarom	D	351	\N
8939	Hefa	HA	351	\N
8940	Yerushalayim Al Quds	JM	351	\N
8941	HaMerkaz	M	351	\N
8942	Tel-Aviv	TA	351	\N
8943	HaZafon	Z	351	\N
8944	Andaman and Nicobar Islands	AN	353	\N
8945	Andhra Pradesh	AP	353	\N
8946	Arunachal Pradesh	AR	353	\N
8947	Assam	AS	353	\N
8948	Bihar	BR	353	\N
8949	Chandigarh	CH	353	\N
8950	Chhattisgarh	CT	353	\N
8951	Damen and Diu	DD	353	\N
8952	Delhi	DL	353	\N
8953	Dadra and Nagar Haveli	DN	353	\N
8954	Goa	GA	353	\N
8955	Gujarat	GJ	353	\N
8956	Himachal Pradesh	HP	353	\N
8957	Haryana	HR	353	\N
8958	Jharkhand	JH	353	\N
8959	Jammu and Kashmir	JK	353	\N
8960	Karnataka	KA	353	\N
8961	Kerala	KL	353	\N
8962	Lakshadweep	LD	353	\N
8963	Maharashtra	MH	353	\N
8964	Meghalaya	ML	353	\N
8965	Manipur	MN	353	\N
8966	Madhya Pradesh	MP	353	\N
8967	Mizoram	MZ	353	\N
8968	Nagaland	NL	353	\N
8969	Orissa	OR	353	\N
8970	Punjab	PB	353	\N
8971	Puducherry	PY	353	\N
8972	Rajasthan	RJ	353	\N
8973	Sikkim	SK	353	\N
8974	Tamil Nadu	TN	353	\N
8975	Tripura	TR	353	\N
8976	Uttar Pradesh	UP	353	\N
8977	Uttarakhand	UT	353	\N
8978	West Bengal	WB	353	\N
8979	Al Anbar	AN	355	\N
8980	Arbil	AR	355	\N
8981	Al Basrah	BA	355	\N
8982	Babil	BB	355	\N
8983	Baghdad	BG	355	\N
8984	Dahuk	DA	355	\N
8985	Diyala	DI	355	\N
8986	Dhi Qar	DQ	355	\N
8987	Karbala'	KA	355	\N
8988	Maysan	MA	355	\N
8989	Al Muthanna	MU	355	\N
8990	An Najef	NA	355	\N
8991	Ninawa	NI	355	\N
8992	Al Qadisiyah	QA	355	\N
8993	Salah ad Din	SD	355	\N
8994	As Sulaymaniyah	SW	355	\N
8995	At Ta'mim	TS	355	\N
8996	Wasit	WA	355	\N
8997	Āzarbāyjān-e Sharqī	01	356	\N
8998	Āzarbāyjān-e Gharbī	02	356	\N
8999	Ardabīl	03	356	\N
9000	Eşfahān	04	356	\N
9001	Īlām	05	356	\N
9002	Būshehr	06	356	\N
9003	Tehrān	07	356	\N
9004	Chahār Mahāll va Bakhtīārī	08	356	\N
9005	Khūzestān	10	356	\N
9006	Zanjān	11	356	\N
9007	Semnān	12	356	\N
9008	Sīstān va Balūchestān	13	356	\N
9009	Fārs	14	356	\N
9010	Kermān	15	356	\N
9011	Kordestān	16	356	\N
9012	Kermānshāh	17	356	\N
9013	Kohgīlūyeh va Būyer Ahmad	18	356	\N
9014	Gīlān	19	356	\N
9015	Lorestān	20	356	\N
9016	Māzandarān	21	356	\N
9017	Markazī	22	356	\N
9018	Hormozgān	23	356	\N
9019	Hamadān	24	356	\N
9020	Yazd	25	356	\N
9021	Qom	26	356	\N
9022	Golestān	27	356	\N
9023	Qazvīn	28	356	\N
9024	Khorāsān-e Janūbī	29	356	\N
9025	Khorāsān-e Razavī	30	356	\N
9026	Khorāsān-e Shemālī	31	356	\N
9027	Reykjavík	0	357	\N
9028	Höfuðborgarsvæðið	1	357	\N
9029	Suðurnes	2	357	\N
9030	Vesturland	3	357	\N
9031	Vestfirðir	4	357	\N
9032	Norðurland vestra	5	357	\N
9033	Norðurland eystra	6	357	\N
9034	Austurland	7	357	\N
9035	Suðurland	8	357	\N
9036	Piemonte	21	358	\N
9037	Valle d'Aosta	23	358	\N
9038	Lombardia	25	358	\N
9039	Trentino-Alto Adige	32	358	\N
9040	Veneto	34	358	\N
9041	Friuli-Venezia Giulia	36	358	\N
9042	Liguria	42	358	\N
9043	Emilia-Romagna	45	358	\N
9044	Toscana	52	358	\N
9045	Umbria	55	358	\N
9046	Marche	57	358	\N
9047	Lazio	62	358	\N
9048	Abruzzo	65	358	\N
9049	Molise	67	358	\N
9050	Campania	72	358	\N
9051	Puglia	75	358	\N
9052	Basilicata	77	358	\N
9053	Calabria	78	358	\N
9054	Sicilia	82	358	\N
9055	Sardegna	88	358	\N
9056	Kingston	01	360	\N
9057	Saint Andrew	02	360	\N
9058	Saint Thomas	03	360	\N
9059	Portland	04	360	\N
9060	Saint Mary	05	360	\N
9061	Saint Ann	06	360	\N
9062	Trelawny	07	360	\N
9063	Saint James	08	360	\N
9064	Hanover	09	360	\N
9065	Westmoreland	10	360	\N
9066	Saint Elizabeth	11	360	\N
9067	Manchester	12	360	\N
9068	Clarendon	13	360	\N
9069	Saint Catherine	14	360	\N
9070	‘Ajlūn	AJ	361	\N
9071	‘Ammān (Al ‘Aşimah)	AM	361	\N
9072	Al ‘Aqabah	AQ	361	\N
9073	Aţ Ţafīlah	AT	361	\N
9074	Az Zarqā'	AZ	361	\N
9075	Al Balqā'	BA	361	\N
9076	Irbid	IR	361	\N
9077	Jarash	JA	361	\N
9078	Al Karak	KA	361	\N
9079	Al Mafraq	MA	361	\N
9080	Mādabā	MD	361	\N
9081	Ma‘ān	MN	361	\N
9082	Hokkaido	01	362	\N
9083	Aomori	02	362	\N
9084	Iwate	03	362	\N
9085	Miyagi	04	362	\N
9086	Akita	05	362	\N
9087	Yamagata	06	362	\N
9088	Fukushima	07	362	\N
9089	Ibaraki	08	362	\N
9090	Tochigi	09	362	\N
9091	Gunma	10	362	\N
9092	Saitama	11	362	\N
9093	Chiba	12	362	\N
9094	Tokyo	13	362	\N
9095	Kanagawa	14	362	\N
9096	Niigata	15	362	\N
9097	Toyama	16	362	\N
9098	Ishikawa	17	362	\N
9099	Fukui	18	362	\N
9100	Yamanashi	19	362	\N
9101	Nagano	20	362	\N
9102	Gifu	21	362	\N
9103	Shizuoka	22	362	\N
9104	Aichi	23	362	\N
9105	Mie	24	362	\N
9106	Shiga	25	362	\N
9107	Kyoto	26	362	\N
9108	Osaka	27	362	\N
9109	Hyogo	28	362	\N
9110	Nara	29	362	\N
9111	Wakayama	30	362	\N
9112	Tottori	31	362	\N
9113	Shimane	32	362	\N
9114	Okayama	33	362	\N
9115	Hiroshima	34	362	\N
9116	Yamaguchi	35	362	\N
9117	Tokushima	36	362	\N
9118	Kagawa	37	362	\N
9119	Ehime	38	362	\N
9120	Kochi	39	362	\N
9121	Fukuoka	40	362	\N
9122	Saga	41	362	\N
9123	Nagasaki	42	362	\N
9124	Kumamoto	43	362	\N
9125	Oita	44	362	\N
9126	Miyazaki	45	362	\N
9127	Kagoshima	46	362	\N
9128	Okinawa	47	362	\N
9129	Nairobi Municipality	110	363	\N
9130	Central	200	363	\N
9131	Coast	300	363	\N
9132	Eastern	400	363	\N
9133	North-Eastern Kaskazini Mashariki	500	363	\N
9134	Rift Valley	700	363	\N
9135	Western Magharibi	800	363	\N
9136	Batken	B	364	\N
9137	Chü	C	364	\N
9138	Bishkek	GB	364	\N
9139	Jalal-Abad	J	364	\N
9140	Naryn	N	364	\N
9141	Osh	O	364	\N
9142	Talas	T	364	\N
9143	Ysyk-Köl	Y	364	\N
9144	Banteay Mean Chey	1	365	\N
9145	Krachoh	10	365	\N
9146	Mondol Kiri	11	365	\N
9147	Phnom Penh	12	365	\N
9148	Preah Vihear	13	365	\N
9149	Prey Veaeng	14	365	\N
9150	Pousaat	15	365	\N
9151	Rotanak Kiri	16	365	\N
9152	Siem Reab	17	365	\N
9153	Krong Preah Sihanouk	18	365	\N
9154	Stueng Traeng	19	365	\N
9155	Battambang	2	365	\N
9156	Svaay Rieng	20	365	\N
9157	Taakaev	21	365	\N
9158	Otdar Mean Chey	22	365	\N
9159	Krong Kaeb	23	365	\N
9160	Krong Pailin	24	365	\N
9161	Kampong Cham	3	365	\N
9162	Kampong Chhnang	4	365	\N
9163	Kampong Speu	5	365	\N
9164	Kampong Thom	6	365	\N
9165	Kampot	7	365	\N
9166	Kandal	8	365	\N
9167	Kach Kong	9	365	\N
9168	Gilbert Islands	G	366	\N
9169	Line Islands	L	366	\N
9170	Phoenix Islands	P	366	\N
9171	Andjouân (Anjwān)	A	367	\N
9172	Andjazîdja (Anjazījah)	G	367	\N
9173	Moûhîlî (Mūhīlī)	M	367	\N
9174	Saint Kitts	K	368	\N
9175	Nevis	N	368	\N
9176	P’yŏngyang	01	369	\N
9177	P’yŏngan-namdo	02	369	\N
9178	P’yŏngan-bukto	03	369	\N
9179	Chagang-do	04	369	\N
9180	Hwanghae-namdo	05	369	\N
9181	Hwanghae-bukto	06	369	\N
9182	Kangwŏn-do	07	369	\N
9183	Hamgyŏng-namdo	08	369	\N
9184	Hamgyŏng-bukto	09	369	\N
9185	Yanggang-do	10	369	\N
9186	Nasŏn (Najin-Sŏnbong)	13	369	\N
9187	Seoul Teugbyeolsi	11	370	\N
9188	Busan Gwang'yeogsi	26	370	\N
9189	Daegu Gwang'yeogsi	27	370	\N
9190	Incheon Gwang'yeogsi	28	370	\N
9191	Gwangju Gwang'yeogsi	29	370	\N
9192	Daejeon Gwang'yeogsi	30	370	\N
9193	Ulsan Gwang'yeogsi	31	370	\N
9194	Gyeonggido	41	370	\N
9195	Gang'weondo	42	370	\N
9196	Chungcheongbukdo	43	370	\N
9197	Chungcheongnamdo	44	370	\N
9198	Jeonrabukdo	45	370	\N
9199	Jeonranamdo	46	370	\N
9200	Gyeongsangbukdo	47	370	\N
9201	Gyeongsangnamdo	48	370	\N
9202	Jejudo	49	370	\N
9203	Al Ahmadi	AH	371	\N
9204	Al Farwānīyah	FA	371	\N
9205	Hawallī	HA	371	\N
9206	Al Jahrrā’	JA	371	\N
9207	Al Kuwayt (Al ‘Āşimah)	KU	371	\N
9208	Mubārak al Kabīr	MU	371	\N
9209	Aqmola oblysy	AKM	373	\N
9210	Aqtöbe oblysy	AKT	373	\N
9211	Almaty	ALA	373	\N
9212	Almaty oblysy	ALM	373	\N
9213	Astana	AST	373	\N
9214	Atyraū oblysy	ATY	373	\N
9215	Qaraghandy oblysy	KAR	373	\N
9216	Qostanay oblysy	KUS	373	\N
9217	Qyzylorda oblysy	KZY	373	\N
9218	Mangghystaū oblysy	MAN	373	\N
9219	Pavlodar oblysy	PAV	373	\N
9220	Soltüstik Quzaqstan oblysy	SEV	373	\N
9221	Shyghys Qazaqstan oblysy	VOS	373	\N
9222	Ongtüstik Qazaqstan oblysy	YUZ	373	\N
9223	Batys Quzaqstan oblysy	ZAP	373	\N
9224	Zhambyl oblysy	ZHA	373	\N
9225	Attapu	AT	374	\N
9226	Bokèo	BK	374	\N
9227	Bolikhamxai	BL	374	\N
9228	Champasak	CH	374	\N
9229	Houaphan	HO	374	\N
9230	Khammouan	KH	374	\N
9231	Louang Namtha	LM	374	\N
9232	Louangphabang	LP	374	\N
9233	Oudômxai	OU	374	\N
9234	Phôngsali	PH	374	\N
9235	Salavan	SL	374	\N
9236	Savannakhét	SV	374	\N
9237	Vientiane	VI	374	\N
9238	Vientiane	VT	374	\N
9239	Xaignabouli	XA	374	\N
9240	Xékong	XE	374	\N
9241	Xiangkhoang	XI	374	\N
9242	Xiasômboun	XN	374	\N
9243	Aakkâr	AK	375	\N
9244	Liban-Nord	AS	375	\N
9245	Beyrouth	BA	375	\N
9246	Baalbek-Hermel	BH	375	\N
9247	Béqaa	BI	375	\N
9248	Liban-Sud	JA	375	\N
9249	Mont-Liban	JL	375	\N
9250	Nabatîyé	NA	375	\N
9251	Balzers	01	377	\N
9252	Eschen	02	377	\N
9253	Gamprin	03	377	\N
9254	Mauren	04	377	\N
9255	Planken	05	377	\N
9256	Ruggell	06	377	\N
9257	Schaan	07	377	\N
9258	Schellenberg	08	377	\N
9259	Triesen	09	377	\N
9260	Triesenberg	10	377	\N
9261	Vaduz	11	377	\N
9262	Basnāhira paḷāta	1	378	\N
9263	Madhyama paḷāta	2	378	\N
9264	Dakuṇu paḷāta	3	378	\N
9265	Uturu paḷāta	4	378	\N
9266	Næ̆gĕnahira paḷāta	5	378	\N
9267	Vayamba paḷāta	6	378	\N
9268	Uturumæ̆da paḷāta	7	378	\N
9269	Ūva paḷāta	8	378	\N
9270	Sabaragamuva paḷāta	9	378	\N
9271	Bong	BG	379	\N
9272	Bomi	BM	379	\N
9273	Grand Cape Mount	CM	379	\N
9274	Grand Bassa	GB	379	\N
9275	Grand Gedeh	GG	379	\N
9276	Grand Kru	GK	379	\N
9277	Lofa	LO	379	\N
9278	Margibi	MG	379	\N
9279	Montserrado	MO	379	\N
9280	Maryland	MY	379	\N
9281	Nimba	NI	379	\N
9282	Rivercess	RI	379	\N
9283	Sinoe	SI	379	\N
9284	Maseru	A	380	\N
9285	Butha-Buthe	B	380	\N
9286	Leribe	C	380	\N
9287	Berea	D	380	\N
9288	Mafeteng	E	380	\N
9289	Mohale's Hoek	F	380	\N
9290	Quthing	G	380	\N
9291	Qacha's Nek	H	380	\N
9292	Mokhotlong	J	380	\N
9293	Thaba-Tseka	K	380	\N
9294	Alytaus Apskritis	AL	381	\N
9295	Klaipėdos Apskritis	KL	381	\N
9296	Kauno Apskritis	KU	381	\N
9297	Marijampolės Apskritis	MR	381	\N
9298	Panevėžio Apskritis	PN	381	\N
9299	Šiaulių Apskritis	SA	381	\N
9300	Tauragés Apskritis	TA	381	\N
9301	Telšių Apskritis	TE	381	\N
9302	Utenos Apskritis	UT	381	\N
9303	Vilniaus Apskritis	VL	381	\N
9304	Diekirch	D	382	\N
9305	Grevenmacher	G	382	\N
9306	Luxembourg	L	382	\N
9307	Aglonas novads	001	383	\N
9308	Aizkraukles novads	002	383	\N
9309	Aizputes novads	003	383	\N
9310	Aknīstes novads	004	383	\N
9311	Alojas novads	005	383	\N
9312	Alsungas novads	006	383	\N
9313	Alūksnes novads	007	383	\N
9314	Amatas novads	008	383	\N
9315	Apes novads	009	383	\N
9316	Auces novads	010	383	\N
9317	Ādažu novads	011	383	\N
9318	Babītes novads	012	383	\N
9319	Baldones novads	013	383	\N
9320	Baltinavas novads	014	383	\N
9321	Balvu novads	015	383	\N
9322	Bauskas novads	016	383	\N
9323	Beverīnas novads	017	383	\N
9324	Brocēnu novads	018	383	\N
9325	Burtnieku novads	019	383	\N
9326	Carnikavas novads	020	383	\N
9327	Cesvaines novads	021	383	\N
9328	Cēsu novads	022	383	\N
9329	Ciblas novads	023	383	\N
9330	Dagdas novads	024	383	\N
9331	Daugavpils novads	025	383	\N
9332	Dobeles novads	026	383	\N
9333	Dundagas novads	027	383	\N
9334	Durbes novads	028	383	\N
9335	Engures novads	029	383	\N
9336	Ērgļu novads	030	383	\N
9337	Garkalnes novads	031	383	\N
9338	Grobiņas novads	032	383	\N
9339	Gulbenes novads	033	383	\N
9340	Iecavas novads	034	383	\N
9341	Ikšķiles novads	035	383	\N
9342	Ilūkstes novads	036	383	\N
9343	Inčukalna novads	037	383	\N
9344	Jaunjelgavas novads	038	383	\N
9345	Jaunpiebalgas novads	039	383	\N
9346	Jaunpils novads	040	383	\N
9347	Jelgavas novads	041	383	\N
9348	Jēkabpils novads	042	383	\N
9349	Kandavas novads	043	383	\N
9350	Kārsavas novads	044	383	\N
9351	Kocēnu novads	045	383	\N
9352	Kokneses novads	046	383	\N
9353	Krāslavas novads	047	383	\N
9354	Krimuldas novads	048	383	\N
9355	Krustpils novads	049	383	\N
9356	Kuldīgas novads	050	383	\N
9357	Ķeguma novads	051	383	\N
9358	Ķekavas novads	052	383	\N
9359	Lielvārdes novads	053	383	\N
9360	Limbažu novads	054	383	\N
9361	Līgatnes novads	055	383	\N
9362	Līvānu novads	056	383	\N
9363	Lubānas novads	057	383	\N
9364	Ludzas novads	058	383	\N
9365	Madonas novads	059	383	\N
9366	Mazsalacas novads	060	383	\N
9367	Mālpils novads	061	383	\N
9368	Mārupes novads	062	383	\N
9369	Mērsraga novads	063	383	\N
9370	Naukšēnu novads	064	383	\N
9371	Neretas novads	065	383	\N
9372	Nīcas novads	066	383	\N
9373	Ogres novads	067	383	\N
9374	Olaines novads	068	383	\N
9375	Ozolnieku novads	069	383	\N
9376	Pārgaujas novads	070	383	\N
9377	Pāvilostas novads	071	383	\N
9378	Pļaviņu novads	072	383	\N
9379	Preiļu novads	073	383	\N
9380	Priekules novads	074	383	\N
9381	Priekuļu novads	075	383	\N
9382	Raunas novads	076	383	\N
9383	Rēzeknes novads	077	383	\N
9384	Riebiņu novads	078	383	\N
9385	Rojas novads	079	383	\N
9386	Ropažu novads	080	383	\N
9387	Rucavas novads	081	383	\N
9388	Rugāju novads	082	383	\N
9389	Rundāles novads	083	383	\N
9390	Rūjienas novads	084	383	\N
9391	Salas novads	085	383	\N
9392	Salacgrīvas novads	086	383	\N
9393	Salaspils novads	087	383	\N
9394	Saldus novads	088	383	\N
9395	Saulkrastu novads	089	383	\N
9396	Sējas novads	090	383	\N
9397	Siguldas novads	091	383	\N
9398	Skrīveru novads	092	383	\N
9399	Skrundas novads	093	383	\N
9400	Smiltenes novads	094	383	\N
9401	Stopiņu novads	095	383	\N
9402	Strenču novads	096	383	\N
9403	Talsu novads	097	383	\N
9404	Tērvetes novads	098	383	\N
9405	Tukuma novads	099	383	\N
9406	Vaiņodes novads	100	383	\N
9407	Valkas novads	101	383	\N
9408	Varakļānu novads	102	383	\N
9409	Vārkavas novads	103	383	\N
9410	Vecpiebalgas novads	104	383	\N
9411	Vecumnieku novads	105	383	\N
9412	Ventspils novads	106	383	\N
9413	Viesītes novads	107	383	\N
9414	Viļakas novads	108	383	\N
9415	Viļānu novads	109	383	\N
9416	Zilupes novads	110	383	\N
9417	Daugavpils	DGV	383	\N
9418	Jelgava	JEL	383	\N
9419	Jēkabpils	JKB	383	\N
9420	Jūrmala	JUR	383	\N
9421	Liepāja	LPX	383	\N
9422	Rēzekne	REZ	383	\N
9423	Rīga	RIX	383	\N
9424	Ventspils	VEN	383	\N
9425	Valmiera	VMR	383	\N
9426	Banghāzī	BA	384	\N
9427	Al Buţnān	BU	384	\N
9428	Darnah	DR	384	\N
9429	Ghāt	GT	384	\N
9430	Al Jabal al Akhḑar	JA	384	\N
9431	Jaghbūb	JB	384	\N
9432	Al Jabal al Gharbī	JG	384	\N
9433	Al Jifārah	JI	384	\N
9434	Al Jufrah	JU	384	\N
9435	Al Kufrah	KF	384	\N
9436	Al Marqab	MB	384	\N
9437	Mişrātah	MI	384	\N
9438	Al Marj	MJ	384	\N
9439	Murzuq	MQ	384	\N
9440	Nālūt	NL	384	\N
9441	An Nuqaţ al Khams	NQ	384	\N
9442	Sabhā	SB	384	\N
9443	Surt	SR	384	\N
9444	Ţarābulus	TB	384	\N
9445	Al Wāḩāt	WA	384	\N
9446	Wādī al Ḩayāt	WD	384	\N
9447	Wādī ash Shāţiʾ	WS	384	\N
9448	Az Zāwiyah	ZA	384	\N
9449	Tanger-Tétouan	01	385	\N
9450	Gharb-Chrarda-Beni Hssen	02	385	\N
9451	Taza-Al Hoceima-Taounate	03	385	\N
9452	L'Oriental	04	385	\N
9453	Fès-Boulemane	05	385	\N
9454	Meknès-Tafilalet	06	385	\N
9455	Rabat-Salé-Zemmour-Zaer	07	385	\N
9456	Grand Casablanca	08	385	\N
9457	Chaouia-Ouardigha	09	385	\N
9458	Doukhala-Abda	10	385	\N
9459	Marrakech-Tensift-Al Haouz	11	385	\N
9460	Tadla-Azilal	12	385	\N
9461	Sous-Massa-Draa	13	385	\N
9462	Guelmim-Es Smara	14	385	\N
9463	Laâyoune-Boujdour-Sakia el Hamra	15	385	\N
9464	Oued ed Dahab-Lagouira	16	385	\N
9465	La Colle	CL	386	\N
9466	La Condamine	CO	386	\N
9467	Fontvieille	FO	386	\N
9468	La Gare	GA	386	\N
9469	Jardin Exotique	JE	386	\N
9470	Larvotto	LA	386	\N
9471	Malbousquet	MA	386	\N
9472	Monte-Carlo	MC	386	\N
9473	Moneghetti	MG	386	\N
9474	Monaco-Ville	MO	386	\N
9475	Moulins	MU	386	\N
9476	Port-Hercule	PH	386	\N
9477	Sainte-Dévote	SD	386	\N
9478	La Source	SO	386	\N
9479	Spélugues	SP	386	\N
9480	Saint-Roman	SR	386	\N
9481	Vallon de la Rousse	VR	386	\N
9482	Anenii Noi	AN	387	\N
9483	Bălți	BA	387	\N
9484	Tighina	BD	387	\N
9485	Briceni	BR	387	\N
9486	Basarabeasca	BS	387	\N
9487	Cahul	CA	387	\N
9488	Călărași	CL	387	\N
9489	Cimișlia	CM	387	\N
9490	Criuleni	CR	387	\N
9491	Căușeni	CS	387	\N
9492	Cantemir	CT	387	\N
9493	Chișinău	CU	387	\N
9494	Dondușeni	DO	387	\N
9495	Drochia	DR	387	\N
9496	Dubăsari	DU	387	\N
9497	Edineț	ED	387	\N
9498	Fălești	FA	387	\N
9499	Florești	FL	387	\N
9500	Găgăuzia, Unitatea teritorială autonomă	GA	387	\N
9501	Glodeni	GL	387	\N
9502	Hîncești	HI	387	\N
9503	Ialoveni	IA	387	\N
9504	Leova	LE	387	\N
9505	Nisporeni	NI	387	\N
9506	Ocnița	OC	387	\N
9507	Orhei	OR	387	\N
9508	Rezina	RE	387	\N
9509	Rîșcani	RI	387	\N
9510	Șoldănești	SD	387	\N
9511	Sîngerei	SI	387	\N
9512	Stînga Nistrului, unitatea teritorială din	SN	387	\N
9513	Soroca	SO	387	\N
9514	Strășeni	ST	387	\N
9515	Ștefan Vodă	SV	387	\N
9516	Taraclia	TA	387	\N
9517	Telenești	TE	387	\N
9518	Ungheni	UN	387	\N
9519	Andrijevica	01	388	\N
9520	Bar	02	388	\N
9521	Berane	03	388	\N
9522	Bijelo Polje	04	388	\N
9523	Budva	05	388	\N
9524	Cetinje	06	388	\N
9525	Danilovgrad	07	388	\N
9526	Herceg-Novi	08	388	\N
9527	Kolašin	09	388	\N
9528	Kotor	10	388	\N
9529	Mojkovac	11	388	\N
9530	Nikšić	12	388	\N
9531	Plav	13	388	\N
9532	Pljevlja	14	388	\N
9533	Plužine	15	388	\N
9534	Podgorica	16	388	\N
9535	Rožaje	17	388	\N
9536	Šavnik	18	388	\N
9537	Tivat	19	388	\N
9538	Ulcinj	20	388	\N
9539	Žabljak	21	388	\N
9540	Toamasina	A	390	\N
9541	Antsiranana	D	390	\N
9542	Fianarantsoa	F	390	\N
9543	Mahajanga	M	390	\N
9544	Antananarivo	T	390	\N
9545	Toliara	U	390	\N
9546	Ralik chain	L	391	\N
9547	Ratak chain	T	391	\N
9548	Aerodrom	01	392	\N
9549	Aračinovo	02	392	\N
9550	Berovo	03	392	\N
9551	Bitola	04	392	\N
9552	Bogdanci	05	392	\N
9553	Bogovinje	06	392	\N
9554	Bosilovo	07	392	\N
9555	Brvenica	08	392	\N
9556	Butel	09	392	\N
9557	Valandovo	10	392	\N
9558	Vasilevo	11	392	\N
9559	Vevčani	12	392	\N
9560	Veles	13	392	\N
9561	Vinica	14	392	\N
9562	Vraneštica	15	392	\N
9563	Vrapčište	16	392	\N
9564	Gazi Baba	17	392	\N
9565	Gevgelija	18	392	\N
9566	Gostivar	19	392	\N
9567	Gradsko	20	392	\N
9568	Debar	21	392	\N
9569	Debarca	22	392	\N
9570	Delčevo	23	392	\N
9571	Demir Kapija	24	392	\N
9572	Demir Hisar	25	392	\N
9573	Dojran	26	392	\N
9574	Dolneni	27	392	\N
9575	Drugovo	28	392	\N
9576	Gjorče Petrov	29	392	\N
9577	Želino	30	392	\N
9578	Zajas	31	392	\N
9579	Zelenikovo	32	392	\N
9580	Zrnovci	33	392	\N
9581	Ilinden	34	392	\N
9582	Jegunovce	35	392	\N
9583	Kavadarci	36	392	\N
9584	Karbinci	37	392	\N
9585	Karpoš	38	392	\N
9586	Kisela Voda	39	392	\N
9587	Kičevo	40	392	\N
9588	Konče	41	392	\N
9589	Kočani	42	392	\N
9590	Kratovo	43	392	\N
9591	Kriva Palanka	44	392	\N
9592	Krivogaštani	45	392	\N
9593	Kruševo	46	392	\N
9594	Kumanovo	47	392	\N
9595	Lipkovo	48	392	\N
9596	Lozovo	49	392	\N
9597	Mavrovo-i-Rostuša	50	392	\N
9598	Makedonska Kamenica	51	392	\N
9599	Makedonski Brod	52	392	\N
9600	Mogila	53	392	\N
9601	Negotino	54	392	\N
9602	Novaci	55	392	\N
9603	Novo Selo	56	392	\N
9604	Oslomej	57	392	\N
9605	Ohrid	58	392	\N
9606	Petrovec	59	392	\N
9607	Pehčevo	60	392	\N
9608	Plasnica	61	392	\N
9609	Prilep	62	392	\N
9610	Probištip	63	392	\N
9611	Radoviš	64	392	\N
9612	Rankovce	65	392	\N
9613	Resen	66	392	\N
9614	Rosoman	67	392	\N
9615	Saraj	68	392	\N
9616	Sveti Nikole	69	392	\N
9617	Sopište	70	392	\N
9618	Staro Nagoričane	71	392	\N
9619	Struga	72	392	\N
9620	Strumica	73	392	\N
9621	Studeničani	74	392	\N
9622	Tearce	75	392	\N
9623	Tetovo	76	392	\N
9624	Centar	77	392	\N
9625	Centar Župa	78	392	\N
9626	Čair	79	392	\N
9627	Čaška	80	392	\N
9628	Češinovo-Obleševo	81	392	\N
9629	Čučer Sandevo	82	392	\N
9630	Štip	83	392	\N
9631	Šuto Orizari	84	392	\N
9632	Kayes	1	393	\N
9633	Koulikoro	2	393	\N
9634	Sikasso	3	393	\N
9635	Ségou	4	393	\N
9636	Mopti	5	393	\N
9637	Tombouctou	6	393	\N
9638	Gao	7	393	\N
9639	Kidal	8	393	\N
9640	Bamako	BK0	393	\N
9641	Sagaing	01	394	\N
9642	Bago	02	394	\N
9643	Magway	03	394	\N
9644	Mandalay	04	394	\N
9645	Tanintharyi	05	394	\N
9646	Yangon	06	394	\N
9647	Ayeyarwady	07	394	\N
9648	Kachin	11	394	\N
9649	Kayah	12	394	\N
9650	Kayin	13	394	\N
9651	Chin	14	394	\N
9652	Mon	15	394	\N
9653	Rakhine	16	394	\N
9654	Shan	17	394	\N
9655	Orhon	035	395	\N
9656	Darhan uul	037	395	\N
9657	Hentiy	039	395	\N
9658	Hövsgöl	041	395	\N
9659	Hovd	043	395	\N
9660	Uvs	046	395	\N
9661	Töv	047	395	\N
9662	Selenge	049	395	\N
9663	Sühbaatar	051	395	\N
9664	Ömnögovi	053	395	\N
9665	Övörhangay	055	395	\N
9666	Dzavhan	057	395	\N
9667	Dundgovi	059	395	\N
9668	Dornod	061	395	\N
9669	Dornogovi	063	395	\N
9670	Govi-Sumber	064	395	\N
9671	Govi-Altay	065	395	\N
9672	Bulgan	067	395	\N
9673	Bayanhongor	069	395	\N
9674	Bayan-Ölgiy	071	395	\N
9675	Arhangay	073	395	\N
9676	Ulanbaatar	1	395	\N
9677	Hodh ech Chargui	01	399	\N
9678	Hodh el Charbi	02	399	\N
9679	Assaba	03	399	\N
9680	Gorgol	04	399	\N
9681	Brakna	05	399	\N
9682	Trarza	06	399	\N
9683	Adrar	07	399	\N
9684	Dakhlet Nouadhibou	08	399	\N
9685	Tagant	09	399	\N
9686	Guidimaka	10	399	\N
9687	Tiris Zemmour	11	399	\N
9688	Inchiri	12	399	\N
9689	Nouakchott	NKC	399	\N
9690	Attard	01	401	\N
9691	Balzan	02	401	\N
9692	Birgu	03	401	\N
9693	Birkirkara	04	401	\N
9694	Birżebbuġa	05	401	\N
9695	Bormla	06	401	\N
9696	Dingli	07	401	\N
9697	Fgura	08	401	\N
9698	Floriana	09	401	\N
9699	Fontana	10	401	\N
9700	Gudja	11	401	\N
9701	Gżira	12	401	\N
9702	Għajnsielem	13	401	\N
9703	Għarb	14	401	\N
9704	Għargħur	15	401	\N
9705	Għasri	16	401	\N
9706	Għaxaq	17	401	\N
9707	Ħamrun	18	401	\N
9708	Iklin	19	401	\N
9709	Isla	20	401	\N
9710	Kalkara	21	401	\N
9711	Kerċem	22	401	\N
9712	Kirkop	23	401	\N
9713	Lija	24	401	\N
9714	Luqa	25	401	\N
9715	Marsa	26	401	\N
9716	Marsaskala	27	401	\N
9717	Marsaxlokk	28	401	\N
9718	Mdina	29	401	\N
9719	Mellieħa	30	401	\N
9720	Mġarr	31	401	\N
9721	Mosta	32	401	\N
9722	Mqabba	33	401	\N
9723	Msida	34	401	\N
9724	Mtarfa	35	401	\N
9725	Munxar	36	401	\N
9726	Nadur	37	401	\N
9727	Naxxar	38	401	\N
9728	Paola	39	401	\N
9729	Pembroke	40	401	\N
9730	Pietà	41	401	\N
9731	Qala	42	401	\N
9732	Qormi	43	401	\N
9733	Qrendi	44	401	\N
9734	Rabat Għawdex	45	401	\N
9735	Rabat Malta	46	401	\N
9736	Safi	47	401	\N
9737	San Ġiljan	48	401	\N
9738	San Ġwann	49	401	\N
9739	San Lawrenz	50	401	\N
9740	San Pawl il-Baħar	51	401	\N
9741	Sannat	52	401	\N
9742	Santa Luċija	53	401	\N
9743	Santa Venera	54	401	\N
9744	Siġġiewi	55	401	\N
9745	Sliema	56	401	\N
9746	Swieqi	57	401	\N
9747	Ta’ Xbiex	58	401	\N
9748	Tarxien	59	401	\N
9749	Valletta	60	401	\N
9750	Xagħra	61	401	\N
9751	Xewkija	62	401	\N
9752	Xgħajra	63	401	\N
9753	Żabbar	64	401	\N
9754	Żebbuġ Għawdex	65	401	\N
9755	Żebbuġ Malta	66	401	\N
9756	Żejtun	67	401	\N
9757	Żurrieq	68	401	\N
9758	Agalega Islands	AG	402	\N
9759	Black River	BL	402	\N
9760	Beau Bassin-Rose Hill	BR	402	\N
9761	Cargados Carajos Shoals	CC	402	\N
9762	Curepipe	CU	402	\N
9763	Flacq	FL	402	\N
9764	Grand Port	GP	402	\N
9765	Moka	MO	402	\N
9766	Pamplemousses	PA	402	\N
9767	Port Louis	PL	402	\N
9768	Port Louis	PU	402	\N
9769	Plaines Wilhems	PW	402	\N
9770	Quatre Bornes	QB	402	\N
9771	Rodrigues Island	RO	402	\N
9772	Rivière du Rempart	RP	402	\N
9773	Savanne	SA	402	\N
9774	Vacoas-Phoenix	VP	402	\N
9775	Central	CE	403	\N
9776	Male	MLE	403	\N
9777	North Central	NC	403	\N
9778	North	NO	403	\N
9779	South Central	SC	403	\N
9780	South	SU	403	\N
9781	Upper North	UN	403	\N
9782	Upper South	US	403	\N
9783	Central Region	C	404	\N
9784	Northern Region	N	404	\N
9785	Southern Region	S	404	\N
9786	Aguascalientes	AGU	405	\N
9787	Baja California	BCN	405	\N
9788	Baja California Sur	BCS	405	\N
9789	Campeche	CAM	405	\N
9790	Chihuahua	CHH	405	\N
9791	Chiapas	CHP	405	\N
9792	Coahuila	COA	405	\N
9793	Colima	COL	405	\N
9794	Distrito Federal	DIF	405	\N
9795	Durango	DUR	405	\N
9796	Guerrero	GRO	405	\N
9797	Guanajuato	GUA	405	\N
9798	Hidalgo	HID	405	\N
9799	Jalisco	JAL	405	\N
9800	México	MEX	405	\N
9801	Michoacán	MIC	405	\N
9802	Morelos	MOR	405	\N
9803	Nayarit	NAY	405	\N
9804	Nuevo León	NLE	405	\N
9805	Oaxaca	OAX	405	\N
9806	Puebla	PUE	405	\N
9807	Querétaro	QUE	405	\N
9808	Quintana Roo	ROO	405	\N
9809	Sinaloa	SIN	405	\N
9810	San Luis Potosí	SLP	405	\N
9811	Sonora	SON	405	\N
9812	Tabasco	TAB	405	\N
9813	Tamaulipas	TAM	405	\N
9814	Tlaxcala	TLA	405	\N
9815	Veracruz	VER	405	\N
9816	Yucatán	YUC	405	\N
9817	Zacatecas	ZAC	405	\N
9818	Johor	01	406	\N
9819	Kedah	02	406	\N
9820	Kelantan	03	406	\N
9821	Melaka	04	406	\N
9822	Negeri Sembilan	05	406	\N
9823	Pahang	06	406	\N
9824	Pulau Pinang	07	406	\N
9825	Perak	08	406	\N
9826	Perlis	09	406	\N
9827	Selangor	10	406	\N
9828	Terengganu	11	406	\N
9829	Sabah	12	406	\N
9830	Sarawak	13	406	\N
9831	Wilayah Persekutuan Kuala Lumpur	14	406	\N
9832	Wilayah Persekutuan Labuan	15	406	\N
9833	Wilayah Persekutuan Putrajaya	16	406	\N
9834	Niassa	A	407	\N
9835	Manica	B	407	\N
9836	Gaza	G	407	\N
9837	Inhambane	I	407	\N
9838	Maputo	L	407	\N
9839	Maputo (city)	MPM	407	\N
9840	Numpula	N	407	\N
9841	Cabo Delgado	P	407	\N
9842	Zambezia	Q	407	\N
9843	Sofala	S	407	\N
9844	Tete	T	407	\N
9845	Caprivi	CA	408	\N
9846	Erongo	ER	408	\N
9847	Hardap	HA	408	\N
9848	Karas	KA	408	\N
9849	Khomas	KH	408	\N
9850	Kunene	KU	408	\N
9851	Otjozondjupa	OD	408	\N
9852	Omaheke	OH	408	\N
9853	Okavango	OK	408	\N
9854	Oshana	ON	408	\N
9855	Omusati	OS	408	\N
9856	Oshikoto	OT	408	\N
9857	Ohangwena	OW	408	\N
9858	Agadez	1	410	\N
9859	Diffa	2	410	\N
9860	Dosso	3	410	\N
9861	Maradi	4	410	\N
9862	Tahoua	5	410	\N
9863	Tillabéri	6	410	\N
9864	Zinder	7	410	\N
9865	Niamey	8	410	\N
9866	Abia	AB	412	\N
9867	Adamawa	AD	412	\N
9868	Akwa Ibom	AK	412	\N
9869	Anambra	AN	412	\N
9870	Bauchi	BA	412	\N
9871	Benue	BE	412	\N
9872	Borno	BO	412	\N
9873	Bayelsa	BY	412	\N
9874	Cross River	CR	412	\N
9875	Delta	DE	412	\N
9876	Ebonyi	EB	412	\N
9877	Edo	ED	412	\N
9878	Ekiti	EK	412	\N
9879	Enugu	EN	412	\N
9880	Abuja Capital Territory	FC	412	\N
9881	Gombe	GO	412	\N
9882	Imo	IM	412	\N
9883	Jigawa	JI	412	\N
9884	Kaduna	KD	412	\N
9885	Kebbi	KE	412	\N
9886	Kano	KN	412	\N
9887	Kogi	KO	412	\N
9888	Katsina	KT	412	\N
9889	Kwara	KW	412	\N
9890	Lagos	LA	412	\N
9891	Nassarawa	NA	412	\N
9892	Niger	NI	412	\N
9893	Ogun	OG	412	\N
9894	Ondo	ON	412	\N
9895	Osun	OS	412	\N
9896	Oyo	OY	412	\N
9897	Plateau	PL	412	\N
9898	Rivers	RI	412	\N
9899	Sokoto	SO	412	\N
9900	Taraba	TA	412	\N
9901	Yobe	YO	412	\N
9902	Zamfara	ZA	412	\N
9903	Atlántico Norte	AN	413	\N
9904	Atlántico Sur	AS	413	\N
9905	Boaco	BO	413	\N
9906	Carazo	CA	413	\N
9907	Chinandega	CI	413	\N
9908	Chontales	CO	413	\N
9909	Estelí	ES	413	\N
9910	Granada	GR	413	\N
9911	Jinotega	JI	413	\N
9912	León	LE	413	\N
9913	Madriz	MD	413	\N
9914	Managua	MN	413	\N
9915	Masaya	MS	413	\N
9916	Matagalpa	MT	413	\N
9917	Nueva Segovia	NS	413	\N
9918	Rivas	RI	413	\N
9919	Río San Juan	SJ	413	\N
9920	Aruba	AW	414	\N
9921	Bonaire	BQ1	414	\N
9922	Saba	BQ2	414	\N
9923	Sint Eustatius	BQ3	414	\N
9924	Curaçao	CW	414	\N
9925	Drenthe	DR	414	\N
9926	Flevoland	FL	414	\N
9927	Friesland	FR	414	\N
9928	Gelderland	GE	414	\N
9929	Groningen	GR	414	\N
9930	Limburg	LI	414	\N
9931	Noord-Brabant	NB	414	\N
9932	Noord-Holland	NH	414	\N
9933	Overijssel	OV	414	\N
9934	Sint Maarten	SX	414	\N
9935	Utrecht	UT	414	\N
9936	Zeeland	ZE	414	\N
9937	Zuid-Holland	ZH	414	\N
9938	Østfold	01	415	\N
9939	Akershus	02	415	\N
9940	Oslo	03	415	\N
9941	Hedmark	04	415	\N
9942	Oppland	05	415	\N
9943	Buskerud	06	415	\N
9944	Vestfold	07	415	\N
9945	Telemark	08	415	\N
9946	Aust-Agder	09	415	\N
9947	Vest-Agder	10	415	\N
9948	Rogaland	11	415	\N
9949	Hordaland	12	415	\N
9950	Sogn og Fjordane	14	415	\N
9951	Møre og Romsdal	15	415	\N
9952	Sør-Trøndelag	16	415	\N
9953	Nord-Trøndelag	17	415	\N
9954	Nordland	18	415	\N
9955	Troms	19	415	\N
9956	Finnmark	20	415	\N
9957	Svalbard (Arctic Region)	21	415	\N
9958	Jan Mayen (Arctic Region)	22	415	\N
9959	Madhyamanchal	1	416	\N
9960	Madhya Pashchimanchal	2	416	\N
9961	Pashchimanchal	3	416	\N
9962	Purwanchal	4	416	\N
9963	Sudur Pashchimanchal	5	416	\N
9964	Aiwo	01	417	\N
9965	Anabar	02	417	\N
9966	Anetan	03	417	\N
9967	Anibare	04	417	\N
9968	Baiti	05	417	\N
9969	Boe	06	417	\N
9970	Buada	07	417	\N
9971	Denigomodu	08	417	\N
9972	Ewa	09	417	\N
9973	Ijuw	10	417	\N
9974	Meneng	11	417	\N
9975	Nibok	12	417	\N
9976	Uaboe	13	417	\N
9977	Yaren	14	417	\N
9978	Chatham Islands Territory	CIT	419	\N
9979	North Island	N	419	\N
9980	South Island	S	419	\N
9981	Al Bāţinah	BA	420	\N
9982	Al Buraymī	BU	420	\N
9983	Ad Dākhilīya	DA	420	\N
9984	Masqaţ	MA	420	\N
9985	Musandam	MU	420	\N
9986	Ash Sharqīyah	SH	420	\N
9987	Al Wusţá	WU	420	\N
9988	Az̧ Z̧āhirah	ZA	420	\N
9989	Z̧ufār	ZU	420	\N
9990	Bocas del Toro	1	421	\N
9991	Coclé	2	421	\N
9992	Colón	3	421	\N
9993	Chiriquí	4	421	\N
9994	Darién	5	421	\N
9995	Herrera	6	421	\N
9996	Los Santos	7	421	\N
9997	Panamá	8	421	\N
9998	Veraguas	9	421	\N
9999	Emberá	EM	421	\N
10000	Kuna Yala	KY	421	\N
10001	Ngöbe-Buglé	NB	421	\N
10002	Amazonas	AMA	422	\N
10003	Ancash	ANC	422	\N
10004	Apurímac	APU	422	\N
10005	Arequipa	ARE	422	\N
10006	Ayacucho	AYA	422	\N
10007	Cajamarca	CAJ	422	\N
10008	El Callao	CAL	422	\N
10009	Cusco [Cuzco]	CUS	422	\N
10010	Huánuco	HUC	422	\N
10011	Huancavelica	HUV	422	\N
10012	Ica	ICA	422	\N
10013	Junín	JUN	422	\N
10014	La Libertad	LAL	422	\N
10015	Lambayeque	LAM	422	\N
10016	Lima	LIM	422	\N
10017	Municipalidad Metropolitana de Lima	LMA	422	\N
10018	Loreto	LOR	422	\N
10019	Madre de Dios	MDD	422	\N
10020	Moquegua	MOQ	422	\N
10021	Pasco	PAS	422	\N
10022	Piura	PIU	422	\N
10023	Puno	PUN	422	\N
10024	San Martín	SAM	422	\N
10025	Tacna	TAC	422	\N
10026	Tumbes	TUM	422	\N
10027	Ucayali	UCA	422	\N
10028	Chimbu	CPK	424	\N
10029	Central	CPM	424	\N
10030	East New Britain	EBR	424	\N
10031	Eastern Highlands	EHG	424	\N
10032	Enga	EPW	424	\N
10033	East Sepik	ESW	424	\N
10034	Gulf	GPK	424	\N
10035	Milne Bay	MBA	424	\N
10036	Morobe	MPL	424	\N
10037	Madang	MPM	424	\N
10038	Manus	MRL	424	\N
10039	National Capital District (Port Moresby)	NCD	424	\N
10040	New Ireland	NIK	424	\N
10041	Northern	NPP	424	\N
10042	Bougainville	NSB	424	\N
10043	Sandaun	SAN	424	\N
10044	Southern Highlands	SHM	424	\N
10045	West New Britain	WBK	424	\N
10046	Western Highlands	WHM	424	\N
10047	Western	WPD	424	\N
10048	National Capital Region	00	425	\N
10049	Ilocos (Region I)	01	425	\N
10050	Cagayan Valley (Region II)	02	425	\N
10051	Central Luzon (Region III)	03	425	\N
10052	Bicol (Region V)	05	425	\N
10053	Western Visayas (Region VI)	06	425	\N
10054	Central Visayas (Region VII)	07	425	\N
10055	Eastern Visayas (Region VIII)	08	425	\N
10056	Zamboanga Peninsula (Region IX)	09	425	\N
10057	Northern Mindanao (Region X)	10	425	\N
10058	Davao (Region XI)	11	425	\N
10059	Soccsksargen (Region XII)	12	425	\N
10060	Caraga (Region XIII)	13	425	\N
10061	Autonomous Region in Muslim Mindanao (ARMM)	14	425	\N
10062	Cordillera Administrative Region (CAR)	15	425	\N
10063	CALABARZON (Region IV-A)	40	425	\N
10064	MIMAROPA (Region IV-B)	41	425	\N
10065	Balochistan	BA	426	\N
10066	Gilgit-Baltistan	GB	426	\N
10067	Islamabad	IS	426	\N
10068	Azad Kashmir	JK	426	\N
10069	Khyber Pakhtunkhwa	KP	426	\N
10070	Punjab	PB	426	\N
10071	Sindh	SD	426	\N
10072	Federally Administered Tribal Areas	TA	426	\N
10073	Dolnośląskie	DS	427	\N
10074	Kujawsko-pomorskie	KP	427	\N
10075	Lubuskie	LB	427	\N
10076	Łódzkie	LD	427	\N
10077	Lubelskie	LU	427	\N
10078	Małopolskie	MA	427	\N
10079	Mazowieckie	MZ	427	\N
10080	Opolskie	OP	427	\N
10081	Podlaskie	PD	427	\N
10082	Podkarpackie	PK	427	\N
10083	Pomorskie	PM	427	\N
10084	Świętokrzyskie	SK	427	\N
10085	Śląskie	SL	427	\N
10086	Warmińsko-mazurskie	WN	427	\N
10087	Wielkopolskie	WP	427	\N
10088	Zachodniopomorskie	ZP	427	\N
10089	Bethlehem	BTH	430	\N
10090	Deir El Balah	DEB	430	\N
10091	Gaza	GZA	430	\N
10092	Hebron	HBN	430	\N
10093	Jerusalem	JEM	430	\N
10094	Jenin	JEN	430	\N
10095	Jericho - Al Aghwar	JRH	430	\N
10096	Khan Yunis	KYS	430	\N
10097	Nablus	NBS	430	\N
10098	North Gaza	NGZ	430	\N
10099	Qalqilya	QQA	430	\N
10100	Ramallah	RBH	430	\N
10101	Rafah	RFH	430	\N
10102	Salfit	SLT	430	\N
10103	Tubas	TBS	430	\N
10104	Tulkarm	TKM	430	\N
10105	Aveiro	01	431	\N
10106	Beja	02	431	\N
10107	Braga	03	431	\N
10108	Bragança	04	431	\N
10109	Castelo Branco	05	431	\N
10110	Coimbra	06	431	\N
10111	Évora	07	431	\N
10112	Faro	08	431	\N
10113	Guarda	09	431	\N
10114	Leiria	10	431	\N
10115	Lisboa	11	431	\N
10116	Portalegre	12	431	\N
10117	Porto	13	431	\N
10118	Santarém	14	431	\N
10119	Setúbal	15	431	\N
10120	Viana do Castelo	16	431	\N
10121	Vila Real	17	431	\N
10122	Viseu	18	431	\N
10123	Região Autónoma dos Açores	20	431	\N
10124	Região Autónoma da Madeira	30	431	\N
10125	Aimeliik	002	432	\N
10126	Airai	004	432	\N
10127	Angaur	010	432	\N
10128	Hatobohei	050	432	\N
10129	Kayangel	100	432	\N
10130	Koror	150	432	\N
10131	Melekeok	212	432	\N
10132	Ngaraard	214	432	\N
10133	Ngarchelong	218	432	\N
10134	Ngardmau	222	432	\N
10135	Ngatpang	224	432	\N
10136	Ngchesar	226	432	\N
10137	Ngeremlengui	227	432	\N
10138	Ngiwal	228	432	\N
10139	Peleliu	350	432	\N
10140	Sonsorol	370	432	\N
10141	Concepción	1	433	\N
10142	Alto Paraná	10	433	\N
10143	Central	11	433	\N
10144	Ñeembucú	12	433	\N
10145	Amambay	13	433	\N
10146	Canindeyú	14	433	\N
10147	Presidente Hayes	15	433	\N
10148	Alto Paraguay	16	433	\N
10149	Boquerón	19	433	\N
10150	San Pedro	2	433	\N
10151	Cordillera	3	433	\N
10152	Guairá	4	433	\N
10153	Caaguazú	5	433	\N
10154	Caazapá	6	433	\N
10155	Itapúa	7	433	\N
10156	Misiones	8	433	\N
10157	Paraguarí	9	433	\N
10158	Asunción	ASU	433	\N
10159	Ad Dawhah	DA	434	\N
10160	Al Khawr wa adh Dhakhīrah	KH	434	\N
10161	Ash Shamal	MS	434	\N
10162	Ar Rayyan	RA	434	\N
10163	Umm Salal	US	434	\N
10164	Al Wakrah	WA	434	\N
10165	Az̧ Z̧a‘āyin	ZA	434	\N
10166	Alba	AB	436	\N
10167	Argeș	AG	436	\N
10168	Arad	AR	436	\N
10169	București	B	436	\N
10170	Bacău	BC	436	\N
10171	Bihor	BH	436	\N
10172	Bistrița-Năsăud	BN	436	\N
10173	Brăila	BR	436	\N
10174	Botoșani	BT	436	\N
10175	Brașov	BV	436	\N
10176	Buzău	BZ	436	\N
10177	Cluj	CJ	436	\N
10178	Călărași	CL	436	\N
10179	Caraș-Severin	CS	436	\N
10180	Constanța	CT	436	\N
10181	Covasna	CV	436	\N
10182	Dâmbovița	DB	436	\N
10183	Dolj	DJ	436	\N
10184	Gorj	GJ	436	\N
10185	Galați	GL	436	\N
10186	Giurgiu	GR	436	\N
10187	Hunedoara	HD	436	\N
10188	Harghita	HR	436	\N
10189	Ilfov	IF	436	\N
10190	Ialomița	IL	436	\N
10191	Iași	IS	436	\N
10192	Mehedinți	MH	436	\N
10193	Maramureș	MM	436	\N
10194	Mureș	MS	436	\N
10195	Neamț	NT	436	\N
10196	Olt	OT	436	\N
10197	Prahova	PH	436	\N
10198	Sibiu	SB	436	\N
10199	Sălaj	SJ	436	\N
10200	Satu Mare	SM	436	\N
10201	Suceava	SV	436	\N
10202	Tulcea	TL	436	\N
10203	Timiș	TM	436	\N
10204	Teleorman	TR	436	\N
10205	Vâlcea	VL	436	\N
10206	Vrancea	VN	436	\N
10207	Vaslui	VS	436	\N
10208	Beograd	00	437	\N
10209	Mačvanski okrug	08	437	\N
10210	Kolubarski okrug	09	437	\N
10211	Podunavski okrug	10	437	\N
10212	Braničevski okrug	11	437	\N
10213	Šumadijski okrug	12	437	\N
10214	Pomoravski okrug	13	437	\N
10215	Borski okrug	14	437	\N
10216	Zaječarski okrug	15	437	\N
10217	Zlatiborski okrug	16	437	\N
10218	Moravički okrug	17	437	\N
10219	Raški okrug	18	437	\N
10220	Rasinski okrug	19	437	\N
10221	Nišavski okrug	20	437	\N
10222	Toplički okrug	21	437	\N
10223	Pirotski okrug	22	437	\N
10224	Jablanički okrug	23	437	\N
10225	Pčinjski okrug	24	437	\N
10226	Kosovo-Metohija	KM	437	\N
10227	Vojvodina	VO	437	\N
10228	Adygeya, Respublika	AD	438	\N
10229	Altay, Respublika	AL	438	\N
10230	Altayskiy kray	ALT	438	\N
10231	Amurskaya oblast'	AMU	438	\N
10232	Arkhangel'skaya oblast'	ARK	438	\N
10233	Astrakhanskaya oblast'	AST	438	\N
10234	Bashkortostan, Respublika	BA	438	\N
10235	Belgorodskaya oblast'	BEL	438	\N
10236	Bryanskaya oblast'	BRY	438	\N
10237	Buryatiya, Respublika	BU	438	\N
10238	Chechenskaya Respublika	CE	438	\N
10239	Chelyabinskaya oblast'	CHE	438	\N
10240	Chukotskiy avtonomnyy okrug	CHU	438	\N
10241	Chuvashskaya Respublika	CU	438	\N
10242	Dagestan, Respublika	DA	438	\N
10243	Respublika Ingushetiya	IN	438	\N
10244	Irkutiskaya oblast'	IRK	438	\N
10245	Ivanovskaya oblast'	IVA	438	\N
10246	Kamchatskiy kray	KAM	438	\N
10247	Kabardino-Balkarskaya Respublika	KB	438	\N
10248	Karachayevo-Cherkesskaya Respublika	KC	438	\N
10249	Krasnodarskiy kray	KDA	438	\N
10250	Kemerovskaya oblast'	KEM	438	\N
10251	Kaliningradskaya oblast'	KGD	438	\N
10252	Kurganskaya oblast'	KGN	438	\N
10253	Khabarovskiy kray	KHA	438	\N
10254	Khanty-Mansiysky avtonomnyy okrug-Yugra	KHM	438	\N
10255	Kirovskaya oblast'	KIR	438	\N
10256	Khakasiya, Respublika	KK	438	\N
10257	Kalmykiya, Respublika	KL	438	\N
10258	Kaluzhskaya oblast'	KLU	438	\N
10259	Komi, Respublika	KO	438	\N
10260	Kostromskaya oblast'	KOS	438	\N
10261	Kareliya, Respublika	KR	438	\N
10262	Kurskaya oblast'	KRS	438	\N
10263	Krasnoyarskiy kray	KYA	438	\N
10264	Leningradskaya oblast'	LEN	438	\N
10265	Lipetskaya oblast'	LIP	438	\N
10266	Magadanskaya oblast'	MAG	438	\N
10267	Mariy El, Respublika	ME	438	\N
10268	Mordoviya, Respublika	MO	438	\N
10269	Moskovskaya oblast'	MOS	438	\N
10270	Moskva	MOW	438	\N
10271	Murmanskaya oblast'	MUR	438	\N
10272	Nenetskiy avtonomnyy okrug	NEN	438	\N
10273	Novgorodskaya oblast'	NGR	438	\N
10274	Nizhegorodskaya oblast'	NIZ	438	\N
10275	Novosibirskaya oblast'	NVS	438	\N
10276	Omskaya oblast'	OMS	438	\N
10277	Orenburgskaya oblast'	ORE	438	\N
10278	Orlovskaya oblast'	ORL	438	\N
10279	Permskiy kray	PER	438	\N
10280	Penzenskaya oblast'	PNZ	438	\N
10281	Primorskiy kray	PRI	438	\N
10282	Pskovskaya oblast'	PSK	438	\N
10283	Rostovskaya oblast'	ROS	438	\N
10284	Ryazanskaya oblast'	RYA	438	\N
10285	Sakha, Respublika [Yakutiya]	SA	438	\N
10286	Sakhalinskaya oblast'	SAK	438	\N
10287	Samaraskaya oblast'	SAM	438	\N
10288	Saratovskaya oblast'	SAR	438	\N
10289	Severnaya Osetiya-Alaniya, Respublika	SE	438	\N
10290	Smolenskaya oblast'	SMO	438	\N
10291	Sankt-Peterburg	SPE	438	\N
10292	Stavropol'skiy kray	STA	438	\N
10293	Sverdlovskaya oblast'	SVE	438	\N
10294	Tatarstan, Respublika	TA	438	\N
10295	Tambovskaya oblast'	TAM	438	\N
10296	Tomskaya oblast'	TOM	438	\N
10297	Tul'skaya oblast'	TUL	438	\N
10298	Tverskaya oblast'	TVE	438	\N
10299	Tyva, Respublika [Tuva]	TY	438	\N
10300	Tyumenskaya oblast'	TYU	438	\N
10301	Udmurtskaya Respublika	UD	438	\N
10302	Ul'yanovskaya oblast'	ULY	438	\N
10303	Volgogradskaya oblast'	VGG	438	\N
10304	Vladimirskaya oblast'	VLA	438	\N
10305	Vologodskaya oblast'	VLG	438	\N
10306	Voronezhskaya oblast'	VOR	438	\N
10307	Yamalo-Nenetskiy avtonomnyy okrug	YAN	438	\N
10308	Yaroslavskaya oblast'	YAR	438	\N
10309	Yevreyskaya avtonomnaya oblast'	YEV	438	\N
10310	Zabajkal'skij kraj	ZAB	438	\N
10311	Ville de Kigali	01	439	\N
10312	Est	02	439	\N
10313	Nord	03	439	\N
10314	Ouest	04	439	\N
10315	Sud	05	439	\N
10316	Ar Riyāḍ	01	440	\N
10317	Makkah	02	440	\N
10318	Al Madīnah	03	440	\N
10319	Ash Sharqīyah	04	440	\N
10320	Al Qaşīm	05	440	\N
10321	Ḥā'il	06	440	\N
10322	Tabūk	07	440	\N
10323	Al Ḥudūd ash Shamāliyah	08	440	\N
10324	Jīzan	09	440	\N
10325	Najrān	10	440	\N
10326	Al Bāhah	11	440	\N
10327	Al Jawf	12	440	\N
10328	`Asīr	14	440	\N
10329	Central	CE	441	\N
10330	Choiseul	CH	441	\N
10331	Capital Territory (Honiara)	CT	441	\N
10332	Guadalcanal	GU	441	\N
10333	Isabel	IS	441	\N
10334	Makira	MK	441	\N
10335	Malaita	ML	441	\N
10336	Rennell and Bellona	RB	441	\N
10337	Temotu	TE	441	\N
10338	Western	WE	441	\N
10339	Anse aux Pins	01	442	\N
10340	Anse Boileau	02	442	\N
10341	Anse Etoile	03	442	\N
10342	Anse Louis	04	442	\N
10343	Anse Royale	05	442	\N
10344	Baie Lazare	06	442	\N
10345	Baie Sainte Anne	07	442	\N
10346	Beau Vallon	08	442	\N
10347	Bel Air	09	442	\N
10348	Bel Ombre	10	442	\N
10349	Cascade	11	442	\N
10350	Glacis	12	442	\N
10351	Grand Anse Mahe	13	442	\N
10352	Grand Anse Praslin	14	442	\N
10353	La Digue	15	442	\N
10354	English River	16	442	\N
10355	Mont Buxton	17	442	\N
10356	Mont Fleuri	18	442	\N
10357	Plaisance	19	442	\N
10358	Pointe Larue	20	442	\N
10359	Port Glaud	21	442	\N
10360	Saint Louis	22	442	\N
10361	Takamaka	23	442	\N
10362	Les Mamelles	24	442	\N
10363	Roche Caiman	25	442	\N
10364	Zalingei	DC	443	\N
10365	Sharq Dārfūr	DE	443	\N
10366	Shamāl Dārfūr	DN	443	\N
10367	Janūb Dārfūr	DS	443	\N
10368	Gharb Dārfūr	DW	443	\N
10369	Al Qaḑārif	GD	443	\N
10370	Al Jazīrah	GZ	443	\N
10371	Kassalā	KA	443	\N
10372	Al Kharţūm	KH	443	\N
10373	Shamāl Kurdufān	KN	443	\N
10374	Janūb Kurdufān	KS	443	\N
10375	An Nīl al Azraq	NB	443	\N
10376	Ash Shamālīyah	NO	443	\N
10377	An Nīl	NR	443	\N
10378	An Nīl al Abyaḑ	NW	443	\N
10379	Al Baḩr al Aḩmar	RS	443	\N
10380	Sinnār	SI	443	\N
10381	Stockholms län	AB	444	\N
10382	Västerbottens län	AC	444	\N
10383	Norrbottens län	BD	444	\N
10384	Uppsala län	C	444	\N
10385	Södermanlands län	D	444	\N
10386	Östergötlands län	E	444	\N
10387	Jönköpings län	F	444	\N
10388	Kronobergs län	G	444	\N
10389	Kalmar län	H	444	\N
10390	Gotlands län	I	444	\N
10391	Blekinge län	K	444	\N
10392	Skåne län	M	444	\N
10393	Hallands län	N	444	\N
10394	Västra Götalands län	O	444	\N
10395	Värmlands län	S	444	\N
10396	Örebro län	T	444	\N
10397	Västmanlands län	U	444	\N
10398	Dalarnas län	W	444	\N
10399	Gävleborgs län	X	444	\N
10400	Västernorrlands län	Y	444	\N
10401	Jämtlands län	Z	444	\N
10402	Central Singapore	01	445	\N
10403	North East	02	445	\N
10404	North West	03	445	\N
10405	South East	04	445	\N
10406	South West	05	445	\N
10407	Ascension	AC	446	\N
10408	Saint Helena	HL	446	\N
10409	Tristan da Cunha	TA	446	\N
10410	Ajdovščina	001	447	\N
10411	Beltinci	002	447	\N
10412	Bled	003	447	\N
10413	Bohinj	004	447	\N
10414	Borovnica	005	447	\N
10415	Bovec	006	447	\N
10416	Brda	007	447	\N
10417	Brezovica	008	447	\N
10418	Brežice	009	447	\N
10419	Tišina	010	447	\N
10420	Celje	011	447	\N
10421	Cerklje na Gorenjskem	012	447	\N
10422	Cerknica	013	447	\N
10423	Cerkno	014	447	\N
10424	Črenšovci	015	447	\N
10425	Črna na Koroškem	016	447	\N
10426	Črnomelj	017	447	\N
10427	Destrnik	018	447	\N
10428	Divača	019	447	\N
10429	Dobrepolje	020	447	\N
10430	Dobrova-Polhov Gradec	021	447	\N
10431	Dol pri Ljubljani	022	447	\N
10432	Domžale	023	447	\N
10433	Dornava	024	447	\N
10434	Dravograd	025	447	\N
10435	Duplek	026	447	\N
10436	Gorenja vas-Poljane	027	447	\N
10437	Gorišnica	028	447	\N
10438	Gornja Radgona	029	447	\N
10439	Gornji Grad	030	447	\N
10440	Gornji Petrovci	031	447	\N
10441	Grosuplje	032	447	\N
10442	Šalovci	033	447	\N
10443	Hrastnik	034	447	\N
10444	Hrpelje-Kozina	035	447	\N
10445	Idrija	036	447	\N
10446	Ig	037	447	\N
10447	Ilirska Bistrica	038	447	\N
10448	Ivančna Gorica	039	447	\N
10449	Izola/Isola	040	447	\N
10450	Jesenice	041	447	\N
10451	Juršinci	042	447	\N
10452	Kamnik	043	447	\N
10453	Kanal	044	447	\N
10454	Kidričevo	045	447	\N
10455	Kobarid	046	447	\N
10456	Kobilje	047	447	\N
10457	Kočevje	048	447	\N
10458	Komen	049	447	\N
10459	Koper/Capodistria	050	447	\N
10460	Kozje	051	447	\N
10461	Kranj	052	447	\N
10462	Kranjska Gora	053	447	\N
10463	Krško	054	447	\N
10464	Kungota	055	447	\N
10465	Kuzma	056	447	\N
10466	Laško	057	447	\N
10467	Lenart	058	447	\N
10468	Lendava/Lendva	059	447	\N
10469	Litija	060	447	\N
10470	Ljubljana	061	447	\N
10471	Ljubno	062	447	\N
10472	Ljutomer	063	447	\N
10473	Logatec	064	447	\N
10474	Loška dolina	065	447	\N
10475	Loški Potok	066	447	\N
10476	Luče	067	447	\N
10477	Lukovica	068	447	\N
10478	Majšperk	069	447	\N
10479	Maribor	070	447	\N
10480	Medvode	071	447	\N
10481	Mengeš	072	447	\N
10482	Metlika	073	447	\N
10483	Mežica	074	447	\N
10484	Miren-Kostanjevica	075	447	\N
10485	Mislinja	076	447	\N
10486	Moravče	077	447	\N
10487	Moravske Toplice	078	447	\N
10488	Mozirje	079	447	\N
10489	Murska Sobota	080	447	\N
10490	Muta	081	447	\N
10491	Naklo	082	447	\N
10492	Nazarje	083	447	\N
10493	Nova Gorica	084	447	\N
10494	Novo mesto	085	447	\N
10495	Odranci	086	447	\N
10496	Ormož	087	447	\N
10497	Osilnica	088	447	\N
10498	Pesnica	089	447	\N
10499	Piran/Pirano	090	447	\N
10500	Pivka	091	447	\N
10501	Podčetrtek	092	447	\N
10502	Podvelka	093	447	\N
10503	Postojna	094	447	\N
10504	Preddvor	095	447	\N
10505	Ptuj	096	447	\N
10506	Puconci	097	447	\N
10507	Rače-Fram	098	447	\N
10508	Radeče	099	447	\N
10509	Radenci	100	447	\N
10510	Radlje ob Dravi	101	447	\N
10511	Radovljica	102	447	\N
10512	Ravne na Koroškem	103	447	\N
10513	Ribnica	104	447	\N
10514	Rogašovci	105	447	\N
10515	Rogaška Slatina	106	447	\N
10516	Rogatec	107	447	\N
10517	Ruše	108	447	\N
10518	Semič	109	447	\N
10519	Sevnica	110	447	\N
10520	Sežana	111	447	\N
10521	Slovenj Gradec	112	447	\N
10522	Slovenska Bistrica	113	447	\N
10523	Slovenske Konjice	114	447	\N
10524	Starče	115	447	\N
10525	Sveti Jurij	116	447	\N
10526	Šenčur	117	447	\N
10527	Šentilj	118	447	\N
10528	Šentjernej	119	447	\N
10529	Šentjur	120	447	\N
10530	Škocjan	121	447	\N
10531	Škofja Loka	122	447	\N
10532	Škofljica	123	447	\N
10533	Šmarje pri Jelšah	124	447	\N
10534	Šmartno ob Paki	125	447	\N
10535	Šoštanj	126	447	\N
10536	Štore	127	447	\N
10537	Tolmin	128	447	\N
10538	Trbovlje	129	447	\N
10539	Trebnje	130	447	\N
10540	Tržič	131	447	\N
10541	Turnišče	132	447	\N
10542	Velenje	133	447	\N
10543	Velike Lašče	134	447	\N
10544	Videm	135	447	\N
10545	Vipava	136	447	\N
10546	Vitanje	137	447	\N
10547	Vodice	138	447	\N
10548	Vojnik	139	447	\N
10549	Vrhnika	140	447	\N
10550	Vuzenica	141	447	\N
10551	Zagorje ob Savi	142	447	\N
10552	Zavrč	143	447	\N
10553	Zreče	144	447	\N
10554	Železniki	146	447	\N
10555	Žiri	147	447	\N
10556	Benedikt	148	447	\N
10557	Bistrica ob Sotli	149	447	\N
10558	Bloke	150	447	\N
10559	Braslovče	151	447	\N
10560	Cankova	152	447	\N
10561	Cerkvenjak	153	447	\N
10562	Dobje	154	447	\N
10563	Dobrna	155	447	\N
10564	Dobrovnik/Dobronak	156	447	\N
10565	Dolenjske Toplice	157	447	\N
10566	Grad	158	447	\N
10567	Hajdina	159	447	\N
10568	Hoče-Slivnica	160	447	\N
10569	Hodoš/Hodos	161	447	\N
10570	Horjul	162	447	\N
10571	Jezersko	163	447	\N
10572	Komenda	164	447	\N
10573	Kostel	165	447	\N
10574	Križevci	166	447	\N
10575	Lovrenc na Pohorju	167	447	\N
10576	Markovci	168	447	\N
10577	Miklavž na Dravskem polju	169	447	\N
10578	Mirna Peč	170	447	\N
10579	Oplotnica	171	447	\N
10580	Podlehnik	172	447	\N
10581	Polzela	173	447	\N
10582	Prebold	174	447	\N
10583	Prevalje	175	447	\N
10584	Razkrižje	176	447	\N
10585	Ribnica na Pohorju	177	447	\N
10586	Selnica ob Dravi	178	447	\N
10587	Sodražica	179	447	\N
10588	Solčava	180	447	\N
10589	Sveta Ana	181	447	\N
10590	Sveta Andraž v Slovenskih Goricah	182	447	\N
10591	Šempeter-Vrtojba	183	447	\N
10592	Tabor	184	447	\N
10593	Trnovska vas	185	447	\N
10594	Trzin	186	447	\N
10595	Velika Polana	187	447	\N
10596	Veržej	188	447	\N
10597	Vransko	189	447	\N
10598	Žalec	190	447	\N
10599	Žetale	191	447	\N
10600	Žirovnica	192	447	\N
10601	Žužemberk	193	447	\N
10602	Šmartno pri Litiji	194	447	\N
10603	Apače	195	447	\N
10604	Cirkulane	196	447	\N
10605	Kosanjevica na Krki	197	447	\N
10606	Makole	198	447	\N
10607	Mokronog-Trebelno	199	447	\N
10608	Poljčane	200	447	\N
10609	Renče-Vogrsko	201	447	\N
10610	Središče ob Dravi	202	447	\N
10611	Straža	203	447	\N
10612	Sveta Trojica v Slovenskih Goricah	204	447	\N
10613	Sveti Tomaž	205	447	\N
10614	Šmarjeske Topliče	206	447	\N
10615	Gorje	207	447	\N
10616	Log-Dragomer	208	447	\N
10617	Rečica ob Savinji	209	447	\N
10618	Sveti Jurij v Slovenskih Goricah	210	447	\N
10619	Šentrupert	211	447	\N
10620	Banskobystrický kraj	BC	449	\N
10621	Bratislavský kraj	BL	449	\N
10622	Košický kraj	KI	449	\N
10623	Nitriansky kraj	NI	449	\N
10624	Prešovský kraj	PV	449	\N
10625	Trnavský kraj	TA	449	\N
10626	Trenčiansky kraj	TC	449	\N
10627	Žilinský kraj	ZI	449	\N
10628	Eastern	E	450	\N
10629	Northern	N	450	\N
10630	Southern (Sierra Leone)	S	450	\N
10631	Western Area (Freetown)	W	450	\N
10632	Acquaviva	01	451	\N
10633	Chiesanuova	02	451	\N
10634	Domagnano	03	451	\N
10635	Faetano	04	451	\N
10636	Fiorentino	05	451	\N
10637	Borgo Maggiore	06	451	\N
10638	San Marino	07	451	\N
10639	Montegiardino	08	451	\N
10640	Serravalle	09	451	\N
10641	Diourbel	DB	452	\N
10642	Dakar	DK	452	\N
10643	Fatick	FK	452	\N
10644	Kaffrine	KA	452	\N
10645	Kolda	KD	452	\N
10646	Kédougou	KE	452	\N
10647	Kaolack	KL	452	\N
10648	Louga	LG	452	\N
10649	Matam	MT	452	\N
10650	Sédhiou	SE	452	\N
10651	Saint-Louis	SL	452	\N
10652	Tambacounda	TC	452	\N
10653	Thiès	TH	452	\N
10654	Ziguinchor	ZG	452	\N
10655	Awdal	AW	453	\N
10656	Bakool	BK	453	\N
10657	Banaadir	BN	453	\N
10658	Bari	BR	453	\N
10659	Bay	BY	453	\N
10660	Galguduud	GA	453	\N
10661	Gedo	GE	453	\N
10662	Hiirsan	HI	453	\N
10663	Jubbada Dhexe	JD	453	\N
10664	Jubbada Hoose	JH	453	\N
10665	Mudug	MU	453	\N
10666	Nugaal	NU	453	\N
10667	Saneag	SA	453	\N
10668	Shabeellaha Dhexe	SD	453	\N
10669	Shabeellaha Hoose	SH	453	\N
10670	Sool	SO	453	\N
10671	Togdheer	TO	453	\N
10672	Woqooyi Galbeed	WO	453	\N
10673	Brokopondo	BR	454	\N
10674	Commewijne	CM	454	\N
10675	Coronie	CR	454	\N
10676	Marowijne	MA	454	\N
10677	Nickerie	NI	454	\N
10678	Paramaribo	PM	454	\N
10679	Para	PR	454	\N
10680	Saramacca	SA	454	\N
10681	Sipaliwini	SI	454	\N
10682	Wanica	WA	454	\N
10683	Northern Bahr el-Ghazal	BN	455	\N
10684	Western Bahr el-Ghazal	BW	455	\N
10685	Central Equatoria	EC	455	\N
10686	Eastern Equatoria	EE8	455	\N
10687	Western Equatoria	EW	455	\N
10688	Jonglei	JG	455	\N
10689	Lakes	LK	455	\N
10690	Upper Nile	NU	455	\N
10691	Unity	UY	455	\N
10692	Warrap	WR	455	\N
10693	Príncipe	P	456	\N
10694	São Tomé	S	456	\N
10695	Ahuachapán	AH	457	\N
10696	Cabañas	CA	457	\N
10697	Chalatenango	CH	457	\N
10698	Cuscatlán	CU	457	\N
10699	La Libertad	LI	457	\N
10700	Morazán	MO	457	\N
10701	La Paz	PA	457	\N
10702	Santa Ana	SA	457	\N
10703	San Miguel	SM	457	\N
10704	Sonsonate	SO	457	\N
10705	San Salvador	SS	457	\N
10706	San Vicente	SV	457	\N
10707	La Unión	UN	457	\N
10708	Usulután	US	457	\N
10709	Dimashq	DI	459	\N
10710	Dar'a	DR	459	\N
10711	Dayr az Zawr	DY	459	\N
10712	Al Hasakah	HA	459	\N
10713	Homs	HI	459	\N
10714	Halab	HL	459	\N
10715	Hamah	HM	459	\N
10716	Idlib	ID	459	\N
10717	Al Ladhiqiyah	LA	459	\N
10718	Al Qunaytirah	QU	459	\N
10719	Ar Raqqah	RA	459	\N
10720	Rif Dimashq	RD	459	\N
10721	As Suwayda'	SU	459	\N
10722	Tartus	TA	459	\N
10723	Hhohho	HH	460	\N
10724	Lubombo	LU	460	\N
10725	Manzini	MA	460	\N
10726	Shiselweni	SH	460	\N
10727	Al Baṭḩah	BA	462	\N
10728	Baḩr al Ghazāl	BG	462	\N
10729	Būrkū	BO	462	\N
10730	Shārī Bāqirmī	CB	462	\N
10731	Innīdī	EN	462	\N
10732	Qīrā	GR	462	\N
10733	Ḥajjar Lamīs	HL	462	\N
10734	Kānim	KA	462	\N
10735	Al Buḩayrah	LC	462	\N
10736	Lūqūn al Gharbī	LO	462	\N
10737	Lūqūn ash Sharqī	LR	462	\N
10738	Māndūl	MA	462	\N
10739	Shārī al Awsaṭ	MC	462	\N
10740	Māyū Kībbī ash Sharqī	ME	462	\N
10741	Māyū Kībbī al Gharbī	MO	462	\N
10742	Madīnat Injamīnā	ND	462	\N
10743	Waddāy	OD	462	\N
10744	Salāmāt	SA	462	\N
10745	Sīlā	SI	462	\N
10746	Tānjilī	TA	462	\N
10747	Tibastī	TI	462	\N
10748	Wādī Fīrā	WF	462	\N
10749	Région du Centre	C	464	\N
10750	Région de la Kara	K	464	\N
10751	Région Maritime	M	464	\N
10752	Région des Plateaux	P	464	\N
10753	Région des Savannes	S	464	\N
10754	Krung Thep Maha Nakhon Bangkok	10	465	\N
10755	Samut Prakan	11	465	\N
10756	Nonthaburi	12	465	\N
10757	Pathum Thani	13	465	\N
10758	Phra Nakhon Si Ayutthaya	14	465	\N
10759	Ang Thong	15	465	\N
10760	Lop Buri	16	465	\N
10761	Sing Buri	17	465	\N
10762	Chai Nat	18	465	\N
10763	Saraburi	19	465	\N
10764	Chon Buri	20	465	\N
10765	Rayong	21	465	\N
10766	Chanthaburi	22	465	\N
10767	Trat	23	465	\N
10768	Chachoengsao	24	465	\N
10769	Prachin Buri	25	465	\N
10770	Nakhon Nayok	26	465	\N
10771	Sa Kaeo	27	465	\N
10772	Nakhon Ratchasima	30	465	\N
10773	Buri Ram	31	465	\N
10774	Surin	32	465	\N
10775	Si Sa Ket	33	465	\N
10776	Ubon Ratchathani	34	465	\N
10777	Yasothon	35	465	\N
10778	Chaiyaphum	36	465	\N
10779	Amnat Charoen	37	465	\N
10780	Nong Bua Lam Phu	39	465	\N
10781	Khon Kaen	40	465	\N
10782	Udon Thani	41	465	\N
10783	Loei	42	465	\N
10784	Nong Khai	43	465	\N
10785	Maha Sarakham	44	465	\N
10786	Roi Et	45	465	\N
10787	Kalasin	46	465	\N
10788	Sakon Nakhon	47	465	\N
10789	Nakhon Phanom	48	465	\N
10790	Mukdahan	49	465	\N
10791	Chiang Mai	50	465	\N
10792	Lamphun	51	465	\N
10793	Lampang	52	465	\N
10794	Uttaradit	53	465	\N
10795	Phrae	54	465	\N
10796	Nan	55	465	\N
10797	Phayao	56	465	\N
10798	Chiang Rai	57	465	\N
10799	Mae Hong Son	58	465	\N
10800	Nakhon Sawan	60	465	\N
10801	Uthai Thani	61	465	\N
10802	Kamphaeng Phet	62	465	\N
10803	Tak	63	465	\N
10804	Sukhothai	64	465	\N
10805	Phitsanulok	65	465	\N
10806	Phichit	66	465	\N
10807	Phetchabun	67	465	\N
10808	Ratchaburi	70	465	\N
10809	Kanchanaburi	71	465	\N
10810	Suphan Buri	72	465	\N
10811	Nakhon Pathom	73	465	\N
10812	Samut Sakhon	74	465	\N
10813	Samut Songkhram	75	465	\N
10814	Phetchaburi	76	465	\N
10815	Prachuap Khiri Khan	77	465	\N
10816	Nakhon Si Thammarat	80	465	\N
10817	Krabi	81	465	\N
10818	Phangnga	82	465	\N
10819	Phuket	83	465	\N
10820	Surat Thani	84	465	\N
10821	Ranong	85	465	\N
10822	Chumphon	86	465	\N
10823	Songkhla	90	465	\N
10824	Satun	91	465	\N
10825	Trang	92	465	\N
10826	Phatthalung	93	465	\N
10827	Pattani	94	465	\N
10828	Yala	95	465	\N
10829	Narathiwat	96	465	\N
10830	Phatthaya	S	465	\N
10831	Gorno-Badakhshan	GB	466	\N
10832	Khatlon	KT	466	\N
10833	Sughd	SU	466	\N
10834	Aileu	AL	468	\N
10835	Ainaro	AN	468	\N
10836	Baucau	BA	468	\N
10837	Bobonaro	BO	468	\N
10838	Cova Lima	CO	468	\N
10839	Díli	DI	468	\N
10840	Ermera	ER	468	\N
10841	Lautem	LA	468	\N
10842	Liquiça	LI	468	\N
10843	Manufahi	MF	468	\N
10844	Manatuto	MT	468	\N
10845	Oecussi	OE	468	\N
10846	Viqueque	VI	468	\N
10847	Ahal	A	469	\N
10848	Balkan	B	469	\N
10849	Daşoguz	D	469	\N
10850	Lebap	L	469	\N
10851	Mary	M	469	\N
10852	Aşgabat	S	469	\N
10853	Tunis	11	470	\N
10854	Ariana	12	470	\N
10855	Ben Arous	13	470	\N
10856	La Manouba	14	470	\N
10857	Nabeul	21	470	\N
10858	Zaghouan	22	470	\N
10859	Bizerte	23	470	\N
10860	Béja	31	470	\N
10861	Jendouba	32	470	\N
10862	Le Kef	33	470	\N
10863	Siliana	34	470	\N
10864	Kairouan	41	470	\N
10865	Kasserine	42	470	\N
10866	Sidi Bouzid	43	470	\N
10867	Sousse	51	470	\N
10868	Monastir	52	470	\N
10869	Mahdia	53	470	\N
10870	Sfax	61	470	\N
10871	Gafsa	71	470	\N
10872	Tozeur	72	470	\N
10873	Kebili	73	470	\N
10874	Gabès	81	470	\N
10875	Medenine	82	470	\N
10876	Tataouine	83	470	\N
10877	'Eua	01	471	\N
10878	Ha'apai	02	471	\N
10879	Niuas	03	471	\N
10880	Tongatapu	04	471	\N
10881	Vava'u	05	471	\N
10882	Adana	01	472	\N
10883	Adıyaman	02	472	\N
10884	Afyonkarahisar	03	472	\N
10885	Ağrı	04	472	\N
10886	Amasya	05	472	\N
10887	Ankara	06	472	\N
10888	Antalya	07	472	\N
10889	Artvin	08	472	\N
10890	Aydın	09	472	\N
10891	Balıkesir	10	472	\N
10892	Bilecik	11	472	\N
10893	Bingöl	12	472	\N
10894	Bitlis	13	472	\N
10895	Bolu	14	472	\N
10896	Burdur	15	472	\N
10897	Bursa	16	472	\N
10898	Çanakkale	17	472	\N
10899	Çankırı	18	472	\N
10900	Çorum	19	472	\N
10901	Denizli	20	472	\N
10902	Diyarbakır	21	472	\N
10903	Edirne	22	472	\N
10904	Elazığ	23	472	\N
10905	Erzincan	24	472	\N
10906	Erzurum	25	472	\N
10907	Eskişehir	26	472	\N
10908	Gaziantep	27	472	\N
10909	Giresun	28	472	\N
10910	Gümüşhane	29	472	\N
10911	Hakkâri	30	472	\N
10912	Hatay	31	472	\N
10913	Isparta	32	472	\N
10914	Mersin	33	472	\N
10915	İstanbul	34	472	\N
10916	İzmir	35	472	\N
10917	Kars	36	472	\N
10918	Kastamonu	37	472	\N
10919	Kayseri	38	472	\N
10920	Kırklareli	39	472	\N
10921	Kırşehir	40	472	\N
10922	Kocaeli	41	472	\N
10923	Konya	42	472	\N
10924	Kütahya	43	472	\N
10925	Malatya	44	472	\N
10926	Manisa	45	472	\N
10927	Kahramanmaraş	46	472	\N
10928	Mardin	47	472	\N
10929	Muğla	48	472	\N
10930	Muş	49	472	\N
10931	Nevşehir	50	472	\N
10932	Niğde	51	472	\N
10933	Ordu	52	472	\N
10934	Rize	53	472	\N
10935	Sakarya	54	472	\N
10936	Samsun	55	472	\N
10937	Siirt	56	472	\N
10938	Sinop	57	472	\N
10939	Sivas	58	472	\N
10940	Tekirdağ	59	472	\N
10941	Tokat	60	472	\N
10942	Trabzon	61	472	\N
10943	Tunceli	62	472	\N
10944	Şanlıurfa	63	472	\N
10945	Uşak	64	472	\N
10946	Van	65	472	\N
10947	Yozgat	66	472	\N
10948	Zonguldak	67	472	\N
10949	Aksaray	68	472	\N
10950	Bayburt	69	472	\N
10951	Karaman	70	472	\N
10952	Kırıkkale	71	472	\N
10953	Batman	72	472	\N
10954	Şırnak	73	472	\N
10955	Bartın	74	472	\N
10956	Ardahan	75	472	\N
10957	Iğdır	76	472	\N
10958	Yalova	77	472	\N
10959	Karabük	78	472	\N
10960	Kilis	79	472	\N
10961	Osmaniye	80	472	\N
10962	Düzce	81	472	\N
10963	Arima	ARI	473	\N
10964	Chaguanas	CHA	473	\N
10965	Couva-Tabaquite-Talparo	CTT	473	\N
10966	Diego Martin	DMN	473	\N
10967	Eastern Tobago	ETO	473	\N
10968	Penal-Debe	PED	473	\N
10969	Port of Spain	POS	473	\N
10970	Princes Town	PRT	473	\N
10971	Point Fortin	PTF	473	\N
10972	Rio Claro-Mayaro	RCM	473	\N
10973	San Fernando	SFO	473	\N
10974	Sangre Grande	SGE	473	\N
10975	Siparia	SIP	473	\N
10976	San Juan-Laventille	SJL	473	\N
10977	Tunapuna-Piarco	TUP	473	\N
10978	Western Tobago	WTO	473	\N
10979	Funafuti	FUN	474	\N
10980	Niutao	NIT	474	\N
10981	Nukufetau	NKF	474	\N
10982	Nukulaelae	NKL	474	\N
10983	Nanumea	NMA	474	\N
10984	Nanumanga	NMG	474	\N
10985	Nui	NUI	474	\N
10986	Vaitupu	VAI	474	\N
10987	Changhua	CHA	475	\N
10988	Chiay City	CYI	475	\N
10989	Chiayi	CYQ	475	\N
10990	Hsinchu	HSQ	475	\N
10991	Hsinchui City	HSZ	475	\N
10992	Hualien	HUA	475	\N
10993	Ilan	ILA	475	\N
10994	Keelung City	KEE	475	\N
10995	Kaohsiung City	KHH	475	\N
10996	Kaohsiung	KHQ	475	\N
10997	Miaoli	MIA	475	\N
10998	Nantou	NAN	475	\N
10999	Penghu	PEN	475	\N
11000	Pingtung	PIF	475	\N
11001	Taoyuan	TAO	475	\N
11002	Tainan City	TNN	475	\N
11003	Tainan	TNQ	475	\N
11004	Taipei City	TPE	475	\N
11005	Taipei	TPQ	475	\N
11006	Taitung	TTT	475	\N
11007	Taichung City	TXG	475	\N
11008	Taichung	TXQ	475	\N
11009	Yunlin	YUN	475	\N
11010	Arusha	01	476	\N
11011	Dar-es-Salaam	02	476	\N
11012	Dodoma	03	476	\N
11013	Iringa	04	476	\N
11014	Kagera	05	476	\N
11015	Kaskazini Pemba	06	476	\N
11016	Kaskazini Unguja	07	476	\N
11017	Kigoma	08	476	\N
11018	Kilimanjaro	09	476	\N
11019	Kusini Pemba	10	476	\N
11020	Kusini Unguja	11	476	\N
11021	Lindi	12	476	\N
11022	Mara	13	476	\N
11023	Mbeya	14	476	\N
11024	Mjini Magharibi	15	476	\N
11025	Morogoro	16	476	\N
11026	Mtwara	17	476	\N
11027	Mwanza	18	476	\N
11028	Pwani	19	476	\N
11029	Rukwa	20	476	\N
11030	Ruvuma	21	476	\N
11031	Shinyanga	22	476	\N
11032	Singida	23	476	\N
11033	Tabora	24	476	\N
11034	Tanga	25	476	\N
11035	Manyara	26	476	\N
11036	Vinnyts'ka Oblast'	05	477	\N
11037	Volyns'ka Oblast'	07	477	\N
11038	Luhans'ka Oblast'	09	477	\N
11039	Dnipropetrovs'ka Oblast'	12	477	\N
11040	Donets'ka Oblast'	14	477	\N
11041	Zhytomyrs'ka Oblast'	18	477	\N
11042	Zakarpats'ka Oblast'	21	477	\N
11043	Zaporiz'ka Oblast'	23	477	\N
11044	Ivano-Frankivs'ka Oblast'	26	477	\N
11045	Kyïvs'ka mis'ka rada	30	477	\N
11046	Kyïvs'ka Oblast'	32	477	\N
11047	Kirovohrads'ka Oblast'	35	477	\N
11048	Sevastopol	40	477	\N
11049	Respublika Krym	43	477	\N
11050	L'vivs'ka Oblast'	46	477	\N
11051	Mykolaïvs'ka Oblast'	48	477	\N
11052	Odes'ka Oblast'	51	477	\N
11053	Poltavs'ka Oblast'	53	477	\N
11054	Rivnens'ka Oblast'	56	477	\N
11055	Sums 'ka Oblast'	59	477	\N
11056	Ternopil's'ka Oblast'	61	477	\N
11057	Kharkivs'ka Oblast'	63	477	\N
11058	Khersons'ka Oblast'	65	477	\N
11059	Khmel'nyts'ka Oblast'	68	477	\N
11060	Cherkas'ka Oblast'	71	477	\N
11061	Chernihivs'ka Oblast'	74	477	\N
11062	Chernivets'ka Oblast'	77	477	\N
11063	Central	C	478	\N
11064	Eastern	E	478	\N
11065	Northern	N	478	\N
11066	Western	W	478	\N
11067	Johnston Atoll	67	479	\N
11068	Midway Islands	71	479	\N
11069	Navassa Island	76	479	\N
11070	Wake Island	79	479	\N
11071	Baker Island	81	479	\N
11072	Howland Island	84	479	\N
11073	Jarvis Island	86	479	\N
11074	Kingman Reef	89	479	\N
11075	Palmyra Atoll	95	479	\N
11076	Alaska	AK	480	\N
11077	Alabama	AL	480	\N
11078	Arkansas	AR	480	\N
11079	American Samoa	AS	480	\N
11080	Arizona	AZ	480	\N
11081	California	CA	480	\N
11082	Colorado	CO	480	\N
11083	Connecticut	CT	480	\N
11084	District of Columbia	DC	480	\N
11085	Delaware	DE	480	\N
11086	Florida	FL	480	\N
11087	Georgia	GA	480	\N
11088	Guam	GU	480	\N
11089	Hawaii	HI	480	\N
11090	Iowa	IA	480	\N
11091	Idaho	ID	480	\N
11092	Illinois	IL	480	\N
11093	Indiana	IN	480	\N
11094	Kansas	KS	480	\N
11095	Kentucky	KY	480	\N
11096	Louisiana	LA	480	\N
11097	Massachusetts	MA	480	\N
11098	Maryland	MD	480	\N
11099	Maine	ME	480	\N
11100	Michigan	MI	480	\N
11101	Minnesota	MN	480	\N
11102	Missouri	MO	480	\N
11103	Northern Mariana Islands	MP	480	\N
11104	Mississippi	MS	480	\N
11105	Montana	MT	480	\N
11106	North Carolina	NC	480	\N
11107	North Dakota	ND	480	\N
11108	Nebraska	NE	480	\N
11109	New Hampshire	NH	480	\N
11110	New Jersey	NJ	480	\N
11111	New Mexico	NM	480	\N
11112	Nevada	NV	480	\N
11113	New York	NY	480	\N
11114	Ohio	OH	480	\N
11115	Oklahoma	OK	480	\N
11116	Oregon	OR	480	\N
11117	Pennsylvania	PA	480	\N
11118	Puerto Rico	PR	480	\N
11119	Rhode Island	RI	480	\N
11120	South Carolina	SC	480	\N
11121	South Dakota	SD	480	\N
11122	Tennessee	TN	480	\N
11123	Texas	TX	480	\N
11124	United States Minor Outlying Islands	UM	480	\N
11125	Utah	UT	480	\N
11126	Virginia	VA	480	\N
11127	Virgin Islands	VI	480	\N
11128	Vermont	VT	480	\N
11129	Washington	WA	480	\N
11130	Wisconsin	WI	480	\N
11131	West Virginia	WV	480	\N
11132	Wyoming	WY	480	\N
11133	Armed Forces Americas (except Canada)	AA	480	\N
11134	Armed Forces Africa, Canada, Europe, Middle East	AE	480	\N
11135	Armed Forces Pacific	AP	480	\N
11136	Artigas	AR	481	\N
11137	Canelones	CA	481	\N
11138	Cerro Largo	CL	481	\N
11139	Colonia	CO	481	\N
11140	Durazno	DU	481	\N
11141	Florida	FD	481	\N
11142	Flores	FS	481	\N
11143	Lavalleja	LA	481	\N
11144	Maldonado	MA	481	\N
11145	Montevideo	MO	481	\N
11146	Paysandú	PA	481	\N
11147	Río Negro	RN	481	\N
11148	Rocha	RO	481	\N
11149	Rivera	RV	481	\N
11150	Salto	SA	481	\N
11151	San José	SJ	481	\N
11152	Soriano	SO	481	\N
11153	Tacuarembó	TA	481	\N
11154	Treinta y Tres	TT	481	\N
11155	Andijon	AN	482	\N
11156	Buxoro	BU	482	\N
11157	Farg'ona	FA	482	\N
11158	Jizzax	JI	482	\N
11159	Namangan	NG	482	\N
11160	Navoiy	NW	482	\N
11161	Qashqadaryo	QA	482	\N
11162	Qoraqalpog'iston Respublikasi	QR	482	\N
11163	Samarqand	SA	482	\N
11164	Sirdaryo	SI	482	\N
11165	Surxondaryo	SU	482	\N
11166	Toshkent	TK	482	\N
11167	Toshkent	TO	482	\N
11168	Xorazm	XO	482	\N
11169	Charlotte	01	484	\N
11170	Saint Andrew	02	484	\N
11171	Saint David	03	484	\N
11172	Saint George	04	484	\N
11173	Saint Patrick	05	484	\N
11174	Grenadines	06	484	\N
11175	Distrito Federal	A	485	\N
11176	Anzoátegui	B	485	\N
11177	Apure	C	485	\N
11178	Aragua	D	485	\N
11179	Barinas	E	485	\N
11180	Bolívar	F	485	\N
11181	Carabobo	G	485	\N
11182	Cojedes	H	485	\N
11183	Falcón	I	485	\N
11184	Guárico	J	485	\N
11185	Lara	K	485	\N
11186	Mérida	L	485	\N
11187	Miranda	M	485	\N
11188	Monagas	N	485	\N
11189	Nueva Esparta	O	485	\N
11190	Portuguesa	P	485	\N
11191	Sucre	R	485	\N
11192	Táchira	S	485	\N
11193	Trujillo	T	485	\N
11194	Yaracuy	U	485	\N
11195	Zulia	V	485	\N
11196	Dependencias Federales	W	485	\N
11197	Vargas	X	485	\N
11198	Delta Amacuro	Y	485	\N
11199	Amazonas	Z	485	\N
11200	Lai Châu	01	488	\N
11201	Lào Cai	02	488	\N
11202	Hà Giang	03	488	\N
11203	Cao Bằng	04	488	\N
11204	Sơn La	05	488	\N
11205	Yên Bái	06	488	\N
11206	Tuyên Quang	07	488	\N
11207	Lạng Sơn	09	488	\N
11208	Quảng Ninh	13	488	\N
11209	Hoà Bình	14	488	\N
11210	Hà Tây	15	488	\N
11211	Ninh Bình	18	488	\N
11212	Thái Bình	20	488	\N
11213	Thanh Hóa	21	488	\N
11214	Nghệ An	22	488	\N
11215	Hà Tỉnh	23	488	\N
11216	Quảng Bình	24	488	\N
11217	Quảng Trị	25	488	\N
11218	Thừa Thiên-Huế	26	488	\N
11219	Quảng Nam	27	488	\N
11220	Kon Tum	28	488	\N
11221	Quảng Ngãi	29	488	\N
11222	Gia Lai	30	488	\N
11223	Bình Định	31	488	\N
11224	Phú Yên	32	488	\N
11225	Đắc Lắk	33	488	\N
11226	Khánh Hòa	34	488	\N
11227	Lâm Đồng	35	488	\N
11228	Ninh Thuận	36	488	\N
11229	Tây Ninh	37	488	\N
11230	Đồng Nai	39	488	\N
11231	Bình Thuận	40	488	\N
11232	Long An	41	488	\N
11233	Bà Rịa-Vũng Tàu	43	488	\N
11234	An Giang	44	488	\N
11235	Đồng Tháp	45	488	\N
11236	Tiền Giang	46	488	\N
11237	Kiên Giang	47	488	\N
11238	Vĩnh Long	49	488	\N
11239	Bến Tre	50	488	\N
11240	Trà Vinh	51	488	\N
11241	Sóc Trăng	52	488	\N
11242	Bắc Kạn	53	488	\N
11243	Bắc Giang	54	488	\N
11244	Bạc Liêu	55	488	\N
11245	Bắc Ninh	56	488	\N
11246	Bình Dương	57	488	\N
11247	Bình Phước	58	488	\N
11248	Cà Mau	59	488	\N
11249	Hải Duong	61	488	\N
11250	Hà Nam	63	488	\N
11251	Hưng Yên	66	488	\N
11252	Nam Định	67	488	\N
11253	Phú Thọ	68	488	\N
11254	Thái Nguyên	69	488	\N
11255	Vĩnh Phúc	70	488	\N
11256	Điện Biên	71	488	\N
11257	Đắk Nông	72	488	\N
11258	Hậu Giang	73	488	\N
11259	Cần Thơ	CT	488	\N
11260	Đà Nẵng	DN	488	\N
11261	Hà Nội	HN	488	\N
11262	Hải Phòng	HP	488	\N
11263	Hồ Chí Minh [Sài Gòn]	SG	488	\N
11264	Malampa	MAP	489	\N
11265	Pénama	PAM	489	\N
11266	Sanma	SAM	489	\N
11267	Shéfa	SEE	489	\N
11268	Taféa	TAE	489	\N
11269	Torba	TOB	489	\N
11270	A'ana	AA	491	\N
11271	Aiga-i-le-Tai	AL	491	\N
11272	Atua	AT	491	\N
11273	Fa'asaleleaga	FA	491	\N
11274	Gaga'emauga	GE	491	\N
11275	Gagaifomauga	GI	491	\N
11276	Palauli	PA	491	\N
11277	Satupa'itea	SA	491	\N
11278	Tuamasaga	TU	491	\N
11279	Va'a-o-Fonoti	VF	491	\N
11280	Vaisigano	VS	491	\N
11281	Abyān	AB	492	\N
11282	'Adan	AD	492	\N
11283	'Amrān	AM	492	\N
11284	Al Bayḑā'	BA	492	\N
11285	Aḑ Ḑāli‘	DA	492	\N
11286	Dhamār	DH	492	\N
11287	Ḩaḑramawt	HD	492	\N
11288	Ḩajjah	HJ	492	\N
11289	Ibb	IB	492	\N
11290	Al Jawf	JA	492	\N
11291	Laḩij	LA	492	\N
11292	Ma'rib	MA	492	\N
11293	Al Mahrah	MR	492	\N
11294	Al Ḩudaydah	MU	492	\N
11295	Al Maḩwīt	MW	492	\N
11296	Raymah	RA	492	\N
11297	Şa'dah	SD	492	\N
11298	Shabwah	SH	492	\N
11299	Şan'ā'	SN	492	\N
11300	Tā'izz	TA	492	\N
11301	Eastern Cape	EC	494	\N
11302	Free State	FS	494	\N
11303	Gauteng	GP	494	\N
11304	Limpopo	LP	494	\N
11305	Mpumalanga	MP	494	\N
11306	Northern Cape	NC	494	\N
11307	North-West (South Africa)	NW	494	\N
11308	Western Cape	WC	494	\N
11309	Kwazulu-Natal	ZN	494	\N
11310	Western	01	495	\N
11311	Central	02	495	\N
11312	Eastern	03	495	\N
11313	Luapula	04	495	\N
11314	Northern	05	495	\N
11315	North-Western	06	495	\N
11316	Southern (Zambia)	07	495	\N
11317	Copperbelt	08	495	\N
11318	Lusaka	09	495	\N
11319	Bulawayo	BU	496	\N
11320	Harare	HA	496	\N
11321	Manicaland	MA	496	\N
11322	Mashonaland Central	MC	496	\N
11323	Mashonaland East	ME	496	\N
11324	Midlands	MI	496	\N
11325	Matabeleland North	MN	496	\N
11326	Matabeleland South	MS	496	\N
11327	Masvingo	MV	496	\N
11328	Mashonaland West	MW	496	\N
\.


--
-- Name: spree_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_states_id_seq', 11328, true);


--
-- Data for Name: spree_stock_items; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_stock_items (id, stock_location_id, variant_id, count_on_hand, created_at, updated_at, backorderable, deleted_at) FROM stdin;
3	1	3	10	2016-04-23 23:18:22.627642	2016-04-23 23:18:29.268874	t	\N
1	1	1	10	2016-04-23 23:18:22.365116	2016-04-23 23:18:29.299008	t	\N
2	1	2	10	2016-04-23 23:18:22.505808	2016-04-23 23:18:29.325815	t	\N
4	1	4	10	2016-04-23 23:18:22.752309	2016-04-23 23:18:29.354104	t	\N
13	1	13	10	2016-04-23 23:18:23.864257	2016-04-23 23:18:29.382421	t	\N
5	1	5	10	2016-04-23 23:18:22.874984	2016-04-23 23:18:29.415626	t	\N
14	1	14	10	2016-04-23 23:18:23.984176	2016-04-23 23:18:29.451111	t	\N
7	1	7	10	2016-04-23 23:18:23.136481	2016-04-23 23:18:29.478866	t	\N
6	1	6	10	2016-04-23 23:18:23.001297	2016-04-23 23:18:29.506219	t	\N
8	1	8	10	2016-04-23 23:18:23.258146	2016-04-23 23:18:29.532997	t	\N
15	1	15	10	2016-04-23 23:18:24.101202	2016-04-23 23:18:29.559642	t	\N
9	1	9	10	2016-04-23 23:18:23.377455	2016-04-23 23:18:29.588019	t	\N
17	1	17	10	2016-04-23 23:18:28.218776	2016-04-23 23:18:29.615873	t	\N
16	1	16	10	2016-04-23 23:18:24.229055	2016-04-23 23:18:29.643613	t	\N
10	1	10	10	2016-04-23 23:18:23.504642	2016-04-23 23:18:29.670296	t	\N
18	1	18	10	2016-04-23 23:18:28.285886	2016-04-23 23:18:29.697006	t	\N
11	1	11	10	2016-04-23 23:18:23.625111	2016-04-23 23:18:29.724077	t	\N
12	1	12	10	2016-04-23 23:18:23.742857	2016-04-23 23:18:29.750989	t	\N
19	1	19	10	2016-04-23 23:18:28.346617	2016-04-23 23:18:29.777743	t	\N
20	1	20	10	2016-04-23 23:18:28.417768	2016-04-23 23:18:29.805055	t	\N
21	1	21	10	2016-04-23 23:18:28.479539	2016-04-23 23:18:29.831958	t	\N
22	1	22	10	2016-04-23 23:18:28.541247	2016-04-23 23:18:29.859281	t	\N
23	1	23	10	2016-04-23 23:18:28.604523	2016-04-23 23:18:29.886353	t	\N
24	1	24	10	2016-04-23 23:18:28.66736	2016-04-23 23:18:29.914853	t	\N
25	1	25	10	2016-04-23 23:18:28.728404	2016-04-23 23:18:29.941258	t	\N
26	1	26	10	2016-04-23 23:18:28.788743	2016-04-23 23:18:29.968441	t	\N
27	1	27	0	2016-04-24 00:06:15.273211	2016-04-24 00:06:15.273211	t	\N
28	1	28	0	2016-04-24 00:06:15.546938	2016-04-24 00:06:15.546938	t	\N
29	1	29	0	2016-04-24 00:06:15.606694	2016-04-24 00:06:15.606694	t	\N
30	1	30	0	2016-04-24 00:06:15.661908	2016-04-24 00:06:15.661908	t	\N
31	1	31	0	2016-04-24 00:06:15.72109	2016-04-24 00:06:15.72109	t	\N
32	1	32	0	2016-04-24 00:06:15.777011	2016-04-24 00:06:15.777011	t	\N
33	1	33	0	2016-04-24 00:06:15.827169	2016-04-24 00:06:15.827169	t	\N
34	1	34	0	2016-04-24 00:06:15.874394	2016-04-24 00:06:15.874394	t	\N
35	1	35	0	2016-04-24 00:06:15.919393	2016-04-24 00:06:15.919393	t	\N
36	1	36	0	2016-04-24 00:06:15.965379	2016-04-24 00:06:15.965379	t	\N
37	1	37	0	2016-04-24 00:06:16.006918	2016-04-24 00:06:16.006918	t	\N
38	1	38	0	2016-04-24 00:06:16.047042	2016-04-24 00:06:16.047042	t	\N
39	1	39	0	2016-04-24 00:06:16.086923	2016-04-24 00:06:16.086923	t	\N
40	1	40	0	2016-04-24 00:06:16.127844	2016-04-24 00:06:16.127844	t	\N
41	1	41	0	2016-04-24 00:06:16.168562	2016-04-24 00:06:16.168562	t	\N
42	1	42	0	2016-04-24 00:06:16.209508	2016-04-24 00:06:16.209508	t	\N
43	1	43	0	2016-04-24 00:06:16.252509	2016-04-24 00:06:16.252509	t	\N
44	1	44	0	2016-04-24 00:06:16.29284	2016-04-24 00:06:16.29284	t	\N
45	1	45	0	2016-04-24 00:06:16.34737	2016-04-24 00:06:16.34737	t	\N
46	1	46	0	2016-04-24 00:06:16.387003	2016-04-24 00:06:16.387003	t	\N
47	1	47	0	2016-04-24 00:06:16.426849	2016-04-24 00:06:16.426849	t	\N
48	1	48	0	2016-04-24 00:06:16.467203	2016-04-24 00:06:16.467203	t	\N
49	1	49	0	2016-04-24 00:06:16.507122	2016-04-24 00:06:16.507122	t	\N
50	1	50	0	2016-04-24 00:06:16.547478	2016-04-24 00:06:16.547478	t	\N
51	1	51	0	2016-04-24 00:06:16.587674	2016-04-24 00:06:16.587674	t	\N
52	1	52	0	2016-04-24 00:06:16.628583	2016-04-24 00:06:16.628583	t	\N
53	1	53	0	2016-04-24 00:06:16.669277	2016-04-24 00:06:16.669277	t	\N
54	1	54	0	2016-04-24 00:06:16.709783	2016-04-24 00:06:16.709783	t	\N
55	1	55	0	2016-04-24 00:06:16.749436	2016-04-24 00:06:16.749436	t	\N
56	1	56	0	2016-04-24 00:06:16.791004	2016-04-24 00:06:16.791004	t	\N
57	1	57	0	2016-04-24 00:06:16.830704	2016-04-24 00:06:16.830704	t	\N
58	1	58	0	2016-04-24 00:06:16.871301	2016-04-24 00:06:16.871301	t	\N
59	1	59	0	2016-04-24 00:06:16.91111	2016-04-24 00:06:16.91111	t	\N
60	1	60	0	2016-04-24 00:06:16.953155	2016-04-24 00:06:16.953155	t	\N
61	1	61	0	2016-04-24 00:06:16.99453	2016-04-24 00:06:16.99453	t	\N
62	1	62	0	2016-04-24 00:06:17.034183	2016-04-24 00:06:17.034183	t	\N
63	1	63	0	2016-04-24 00:06:17.07525	2016-04-24 00:06:17.07525	t	\N
64	1	64	0	2016-04-24 00:06:17.128038	2016-04-24 00:06:17.128038	t	\N
65	1	65	0	2016-04-24 00:06:17.168158	2016-04-24 00:06:17.168158	t	\N
66	1	66	0	2016-04-24 00:06:17.207815	2016-04-24 00:06:17.207815	t	\N
67	1	67	0	2016-04-24 00:06:17.248081	2016-04-24 00:06:17.248081	t	\N
68	1	68	0	2016-04-24 00:06:17.287991	2016-04-24 00:06:17.287991	t	\N
69	1	69	0	2016-04-24 00:06:17.328133	2016-04-24 00:06:17.328133	t	\N
70	1	70	0	2016-04-24 00:06:17.369453	2016-04-24 00:06:17.369453	t	\N
71	1	71	0	2016-04-24 00:06:17.409268	2016-04-24 00:06:17.409268	t	\N
72	1	72	0	2016-04-25 22:45:42.334195	2016-04-25 22:45:42.334195	t	\N
73	1	73	0	2016-04-25 22:45:42.578183	2016-04-25 22:45:42.578183	t	\N
74	1	74	0	2016-04-25 22:45:42.639366	2016-04-25 22:45:42.639366	t	\N
75	1	75	0	2016-04-25 22:45:42.687383	2016-04-25 22:45:42.687383	t	\N
76	1	76	0	2016-04-27 22:49:13.345782	2016-04-27 22:49:13.345782	t	\N
77	1	77	0	2016-04-27 22:49:13.650133	2016-04-27 22:49:13.650133	t	\N
78	1	78	0	2016-04-27 22:49:13.708202	2016-04-27 22:49:13.708202	t	\N
79	1	79	0	2016-04-27 22:49:13.755559	2016-04-27 22:49:13.755559	t	\N
80	1	80	0	2016-04-27 22:57:03.02491	2016-04-27 22:57:03.02491	t	\N
82	1	82	0	2016-04-27 22:57:03.272618	2016-04-27 22:57:03.272618	t	\N
83	1	83	0	2016-04-27 22:57:03.315489	2016-04-27 22:57:03.315489	t	\N
81	1	81	3	2016-04-27 22:57:03.225883	2016-04-27 23:06:40.330032	t	\N
\.


--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_stock_items_id_seq', 83, true);


--
-- Data for Name: spree_stock_locations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_stock_locations (id, name, created_at, updated_at, "default", address1, address2, city, state_id, state_name, country_id, zipcode, phone, active, backorderable_default, propagate_all_variants, admin_name) FROM stdin;
1	Склад #1	2016-04-23 23:17:59.748287	2016-04-27 22:59:42.120029	f				\N	\N	284			t	t	t	
\.


--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_stock_locations_id_seq', 1, true);


--
-- Data for Name: spree_stock_movements; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_stock_movements (id, stock_item_id, quantity, action, created_at, updated_at, originator_id, originator_type) FROM stdin;
1	3	10	\N	2016-04-23 23:18:29.152298	2016-04-23 23:18:29.152298	\N	\N
2	1	10	\N	2016-04-23 23:18:29.289095	2016-04-23 23:18:29.289095	\N	\N
3	2	10	\N	2016-04-23 23:18:29.316073	2016-04-23 23:18:29.316073	\N	\N
4	4	10	\N	2016-04-23 23:18:29.344065	2016-04-23 23:18:29.344065	\N	\N
5	13	10	\N	2016-04-23 23:18:29.372395	2016-04-23 23:18:29.372395	\N	\N
6	5	10	\N	2016-04-23 23:18:29.40352	2016-04-23 23:18:29.40352	\N	\N
7	14	10	\N	2016-04-23 23:18:29.439349	2016-04-23 23:18:29.439349	\N	\N
8	7	10	\N	2016-04-23 23:18:29.469946	2016-04-23 23:18:29.469946	\N	\N
9	6	10	\N	2016-04-23 23:18:29.496592	2016-04-23 23:18:29.496592	\N	\N
10	8	10	\N	2016-04-23 23:18:29.523697	2016-04-23 23:18:29.523697	\N	\N
11	15	10	\N	2016-04-23 23:18:29.550905	2016-04-23 23:18:29.550905	\N	\N
12	9	10	\N	2016-04-23 23:18:29.578398	2016-04-23 23:18:29.578398	\N	\N
13	17	10	\N	2016-04-23 23:18:29.605985	2016-04-23 23:18:29.605985	\N	\N
14	16	10	\N	2016-04-23 23:18:29.634336	2016-04-23 23:18:29.634336	\N	\N
15	10	10	\N	2016-04-23 23:18:29.661192	2016-04-23 23:18:29.661192	\N	\N
16	18	10	\N	2016-04-23 23:18:29.687716	2016-04-23 23:18:29.687716	\N	\N
17	11	10	\N	2016-04-23 23:18:29.714987	2016-04-23 23:18:29.714987	\N	\N
18	12	10	\N	2016-04-23 23:18:29.741789	2016-04-23 23:18:29.741789	\N	\N
19	19	10	\N	2016-04-23 23:18:29.768541	2016-04-23 23:18:29.768541	\N	\N
20	20	10	\N	2016-04-23 23:18:29.795684	2016-04-23 23:18:29.795684	\N	\N
21	21	10	\N	2016-04-23 23:18:29.822769	2016-04-23 23:18:29.822769	\N	\N
22	22	10	\N	2016-04-23 23:18:29.849741	2016-04-23 23:18:29.849741	\N	\N
23	23	10	\N	2016-04-23 23:18:29.877124	2016-04-23 23:18:29.877124	\N	\N
24	24	10	\N	2016-04-23 23:18:29.905324	2016-04-23 23:18:29.905324	\N	\N
25	25	10	\N	2016-04-23 23:18:29.932376	2016-04-23 23:18:29.932376	\N	\N
26	26	10	\N	2016-04-23 23:18:29.958919	2016-04-23 23:18:29.958919	\N	\N
27	81	1	\N	2016-04-27 22:58:38.231437	2016-04-27 22:58:38.231437	\N	\N
28	81	1	\N	2016-04-27 22:58:45.255785	2016-04-27 22:58:45.255785	\N	\N
29	81	1	\N	2016-04-27 22:58:47.760703	2016-04-27 22:58:47.760703	\N	\N
30	81	3	\N	2016-04-27 23:06:13.163662	2016-04-27 23:06:13.163662	\N	\N
31	81	-3	\N	2016-04-27 23:06:40.32101	2016-04-27 23:06:40.32101	\N	\N
\.


--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_stock_movements_id_seq', 31, true);


--
-- Data for Name: spree_stock_transfers; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_stock_transfers (id, type, reference, source_location_id, destination_location_id, created_at, updated_at, number) FROM stdin;
\.


--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_stock_transfers_id_seq', 1, false);


--
-- Data for Name: spree_stores; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_stores (id, name, url, meta_description, meta_keywords, seo_title, mail_from_address, default_currency, code, "default", created_at, updated_at) FROM stdin;
1	Spree Demo Site	demo.spreecommerce.com				spree@example.com	BYR	spree	t	2016-04-23 23:18:02.716305	2016-04-24 00:06:48.759377
\.


--
-- Name: spree_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_stores_id_seq', 1, true);


--
-- Data for Name: spree_tax_categories; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_tax_categories (id, name, description, is_default, deleted_at, created_at, updated_at, tax_code) FROM stdin;
1	Clothing	\N	f	\N	2016-04-23 23:18:20.521757	2016-04-23 23:18:20.521757	\N
2	Food	\N	f	\N	2016-04-23 23:18:20.525532	2016-04-23 23:18:20.525532	\N
\.


--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_tax_categories_id_seq', 2, true);


--
-- Data for Name: spree_tax_rates; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_tax_rates (id, amount, zone_id, tax_category_id, included_in_price, created_at, updated_at, name, show_rate_in_label, deleted_at) FROM stdin;
1	0.05000	2	1	f	2016-04-23 23:18:22.174395	2016-04-23 23:18:22.174395	North America	t	\N
\.


--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_tax_rates_id_seq', 1, true);


--
-- Data for Name: spree_taxon_translations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_taxon_translations (id, spree_taxon_id, locale, created_at, updated_at, name, description, meta_title, meta_description, meta_keywords, permalink) FROM stdin;
3	3	ru	2016-04-23 23:18:24.704224	2016-04-23 23:18:24.704224	Bags	\N	\N	\N	\N	categories/bags
4	4	ru	2016-04-23 23:18:24.848148	2016-04-23 23:18:24.848148	Mugs	\N	\N	\N	\N	categories/mugs
5	5	ru	2016-04-23 23:18:24.884242	2016-04-23 23:18:24.884242	Clothing	\N	\N	\N	\N	categories/clothing
6	6	ru	2016-04-23 23:18:24.971438	2016-04-23 23:18:24.971438	Shirts	\N	\N	\N	\N	categories/clothing/shirts
7	7	ru	2016-04-23 23:18:25.162726	2016-04-23 23:18:25.162726	T-Shirts	\N	\N	\N	\N	categories/clothing/t-shirts
8	8	ru	2016-04-23 23:18:25.230288	2016-04-23 23:18:25.230288	Ruby	\N	\N	\N	\N	brand/ruby
9	9	ru	2016-04-23 23:18:25.287133	2016-04-23 23:18:25.287133	Apache	\N	\N	\N	\N	brand/apache
10	10	ru	2016-04-23 23:18:25.476257	2016-04-23 23:18:25.476257	Spree	\N	\N	\N	\N	brand/spree
11	11	ru	2016-04-23 23:18:25.662679	2016-04-23 23:18:25.662679	Rails	\N	\N	\N	\N	brand/rails
1	1	ru	2016-04-23 23:18:24.372417	2016-04-23 23:55:31.684698	Категории					categories
12	12	ru	2016-04-23 23:55:53.592331	2016-04-23 23:56:25.294398	Матрасы					categories/mattresses
13	13	ru	2016-04-27 22:34:43.57863	2016-04-27 22:34:43.582807	Подушки	\N	\N	\N	\N	categories/podushki
14	14	ru	2016-04-27 22:34:49.698134	2016-04-27 22:34:49.704856	Основания	\N	\N	\N	\N	categories/osnovaniia
15	15	ru	2016-04-27 22:34:58.602959	2016-04-27 22:34:58.607533	Наматрасники	\N	\N	\N	\N	categories/namatrasniki
2	2	ru	2016-04-23 23:18:24.441103	2016-04-27 22:39:02.206262	Бренд					brand
16	16	ru	2016-04-27 22:39:12.953506	2016-04-27 22:39:12.957506	Vegas	\N	\N	\N	\N	brand/vegas
17	17	ru	2016-04-27 22:39:43.650276	2016-04-27 22:40:01.440827	Belabedding	\N	\N	\N	\N	brand/bella
\.


--
-- Name: spree_taxon_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_taxon_translations_id_seq', 17, true);


--
-- Data for Name: spree_taxonomies; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_taxonomies (id, name, created_at, updated_at, "position") FROM stdin;
1	\N	2016-04-23 23:18:24.326056	2016-04-27 23:07:38.009983	1
2	\N	2016-04-23 23:18:24.428769	2016-04-27 23:07:38.009983	2
\.


--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_taxonomies_id_seq', 2, true);


--
-- Data for Name: spree_taxonomy_translations; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_taxonomy_translations (id, spree_taxonomy_id, locale, created_at, updated_at, name) FROM stdin;
1	1	ru	2016-04-23 23:18:24.411192	2016-04-23 23:18:24.411192	Categories
2	2	ru	2016-04-23 23:18:24.461859	2016-04-23 23:18:24.461859	Brand
\.


--
-- Name: spree_taxonomy_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_taxonomy_translations_id_seq', 2, true);


--
-- Data for Name: spree_taxons; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_taxons (id, parent_id, "position", name, permalink, taxonomy_id, lft, rgt, icon_file_name, icon_content_type, icon_file_size, icon_updated_at, description, created_at, updated_at, meta_title, meta_description, meta_keywords, depth) FROM stdin;
13	1	0	\N	\N	1	14	15	\N	\N	\N	\N	\N	2016-04-27 22:34:43.557013	2016-04-27 22:34:43.590276	\N	\N	\N	1
14	1	0	\N	\N	1	16	17	\N	\N	\N	\N	\N	2016-04-27 22:34:49.690698	2016-04-27 22:34:49.711677	\N	\N	\N	1
12	1	0	\N	\N	1	12	13	\N	\N	\N	\N	\N	2016-04-23 23:55:53.574474	2016-04-27 23:07:38.005477	\N	\N	\N	1
1	\N	0	\N	\N	1	1	20	\N	\N	\N	\N	\N	2016-04-23 23:18:24.346739	2016-04-27 23:07:38.005477	\N	\N	\N	0
15	1	0	\N	\N	1	18	19	\N	\N	\N	\N	\N	2016-04-27 22:34:58.591133	2016-04-27 22:34:58.61449	\N	\N	\N	1
17	2	0	\N	\N	2	32	33	\N	\N	\N	\N	\N	2016-04-27 22:39:43.643244	2016-04-27 23:07:38.005477	\N	\N	\N	1
2	\N	0	\N	\N	2	21	34	\N	\N	\N	\N	\N	2016-04-23 23:18:24.434659	2016-04-27 23:07:38.005477	\N	\N	\N	0
8	2	0	\N	\N	2	22	23	\N	\N	\N	\N	\N	2016-04-23 23:18:25.208177	2016-04-27 22:34:58.61449	\N	\N	\N	1
6	5	0	\N	\N	1	7	8	\N	\N	\N	\N	\N	2016-04-23 23:18:24.930939	2016-04-24 00:06:51.536002	\N	\N	\N	2
9	2	0	\N	\N	2	24	25	\N	\N	\N	\N	\N	2016-04-23 23:18:25.265477	2016-04-27 22:34:58.61449	\N	\N	\N	1
10	2	0	\N	\N	2	26	27	\N	\N	\N	\N	\N	2016-04-23 23:18:25.356509	2016-04-27 22:34:58.61449	\N	\N	\N	1
11	2	0	\N	\N	2	28	29	\N	\N	\N	\N	\N	2016-04-23 23:18:25.548486	2016-04-27 22:34:58.61449	\N	\N	\N	1
7	5	0	\N	\N	1	9	10	\N	\N	\N	\N	\N	2016-04-23 23:18:25.0529	2016-04-24 00:06:51.559639	\N	\N	\N	2
5	1	0	\N	\N	1	6	11	\N	\N	\N	\N	\N	2016-04-23 23:18:24.878432	2016-04-24 00:06:51.559639	\N	\N	\N	1
16	2	0	\N	\N	2	30	31	\N	\N	\N	\N	\N	2016-04-27 22:39:12.938418	2016-04-27 22:39:12.961943	\N	\N	\N	1
3	1	1	\N	\N	1	2	3	\N	\N	\N	\N	\N	2016-04-23 23:18:24.626796	2016-04-24 00:07:01.9113	\N	\N	\N	1
4	1	2	\N	\N	1	4	5	\N	\N	\N	\N	\N	2016-04-23 23:18:24.772803	2016-04-24 00:07:02.030254	\N	\N	\N	1
\.


--
-- Name: spree_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_taxons_id_seq', 17, true);


--
-- Data for Name: spree_taxons_promotion_rules; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_taxons_promotion_rules (id, taxon_id, promotion_rule_id) FROM stdin;
\.


--
-- Name: spree_taxons_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_taxons_promotion_rules_id_seq', 1, false);


--
-- Data for Name: spree_taxons_prototypes; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_taxons_prototypes (id, taxon_id, prototype_id) FROM stdin;
\.


--
-- Name: spree_taxons_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_taxons_prototypes_id_seq', 1, false);


--
-- Data for Name: spree_trackers; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_trackers (id, analytics_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_trackers_id_seq', 1, false);


--
-- Data for Name: spree_users; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_users (id, encrypted_password, password_salt, email, remember_token, persistence_token, reset_password_token, perishable_token, sign_in_count, failed_attempts, last_request_at, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, login, ship_address_id, bill_address_id, authentication_token, unlock_token, locked_at, reset_password_sent_at, created_at, updated_at, spree_api_key, remember_created_at, deleted_at, confirmation_token, confirmed_at, confirmation_sent_at) FROM stdin;
1	e9fe7d1efd05b551181a0cc7793f2266267913b69a28bf19041d839bfbc4a66d8180868acde6dbf6587cda6dd3d27d823025e6df554fd823a4d1e6c862855c8f	wvtE3iFSJyytaad-gY2n	spree@example.com	\N	\N	\N	\N	1	0	\N	2016-04-23 23:34:51.80048	2016-04-23 23:34:51.80048	::1	::1	spree@example.com	\N	\N	\N	\N	\N	\N	2016-04-23 23:18:09.779702	2016-04-23 23:34:51.804563	3b7f39e1c7b37a7bf1fc0186c7a179357d74f1d4256c1d2f	\N	\N	\N	\N	\N
\.


--
-- Name: spree_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_users_id_seq', 1, true);


--
-- Data for Name: spree_variants; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_variants (id, sku, weight, height, width, depth, deleted_at, is_master, product_id, cost_price, "position", cost_currency, track_inventory, tax_category_id, updated_at, stock_items_count) FROM stdin;
27		0.00	\N	\N	\N	\N	t	17	\N	1	BYR	t	\N	2016-04-24 00:12:39.58377	1
1	ROR-00011	0.00	\N	\N	\N	\N	t	1	17.00	1	USD	t	\N	2016-04-24 00:06:51.311071	1
19	ROR-00003	0.00	\N	\N	\N	\N	f	3	17.00	4	USD	t	\N	2016-04-23 23:18:32.058323	1
2	ROR-00012	0.00	\N	\N	\N	\N	t	2	21.00	1	USD	t	\N	2016-04-24 00:06:51.343837	1
3	ROR-001	0.00	\N	\N	\N	\N	t	3	17.00	1	USD	t	\N	2016-04-24 00:06:51.36596	1
20	ROR-00004	0.00	\N	\N	\N	\N	f	3	17.00	5	USD	t	\N	2016-04-23 23:18:32.672255	1
4	ROR-00013	0.00	\N	\N	\N	\N	t	4	17.00	1	USD	t	\N	2016-04-24 00:06:51.410227	1
5	ROR-00015	0.00	\N	\N	\N	\N	t	5	17.00	1	USD	t	\N	2016-04-24 00:06:51.431623	1
21	ROR-00005	0.00	\N	\N	\N	\N	f	3	17.00	6	USD	t	\N	2016-04-23 23:18:33.282679	1
6	RUB-00001	0.00	\N	\N	\N	\N	t	6	17.00	1	USD	t	\N	2016-04-24 00:06:51.455025	1
7	APC-00001	0.00	\N	\N	\N	\N	t	7	17.00	1	USD	t	\N	2016-04-24 00:06:51.478719	1
8	SPR-00001	0.00	\N	\N	\N	\N	t	8	17.00	1	USD	t	\N	2016-04-24 00:06:51.503108	1
22	ROR-00006	0.00	\N	\N	\N	\N	f	3	17.00	7	USD	t	\N	2016-04-23 23:18:33.894457	1
9	SPR-00013	0.00	\N	\N	\N	\N	t	9	17.00	1	USD	t	\N	2016-04-24 00:06:51.527088	1
10	SPR-00015	0.00	\N	\N	\N	\N	t	10	17.00	1	USD	t	\N	2016-04-24 00:06:51.551189	1
11	SPR-00011	0.00	\N	\N	\N	\N	t	11	13.00	1	USD	t	\N	2016-04-24 00:07:01.872859	1
23	ROR-00007	0.00	\N	\N	\N	\N	f	3	17.00	8	USD	t	\N	2016-04-23 23:18:34.505697	1
12	SPR-00012	0.00	\N	\N	\N	\N	t	12	21.00	1	USD	t	\N	2016-04-24 00:07:01.901423	1
13	ROR-00014	0.00	\N	\N	\N	\N	t	13	11.00	1	USD	t	\N	2016-04-24 00:07:01.928576	1
24	ROR-00008	0.00	\N	\N	\N	\N	f	3	17.00	9	USD	t	\N	2016-04-23 23:18:35.114741	1
14	ROR-00016	0.00	\N	\N	\N	\N	t	14	15.00	1	USD	t	\N	2016-04-24 00:07:01.959041	1
25	ROR-00009	0.00	\N	\N	\N	\N	f	3	17.00	10	USD	t	\N	2016-04-23 23:18:35.736117	1
15	SPR-00016	0.00	\N	\N	\N	\N	t	15	15.00	1	USD	t	\N	2016-04-24 00:07:01.989144	1
16	SPR-00014	0.00	\N	\N	\N	\N	t	16	11.00	1	USD	t	\N	2016-04-24 00:07:02.018952	1
26	ROR-00010	0.00	\N	\N	\N	\N	f	3	17.00	11	USD	t	\N	2016-04-23 23:18:36.351149	1
29		0.00	\N	\N	\N	\N	f	17	\N	3	USD	t	\N	2016-04-24 00:07:29.678185	1
74		0.00	\N	\N	\N	\N	f	18	\N	3	BYR	t	\N	2016-04-25 22:45:42.642087	1
30		0.00	\N	\N	\N	\N	f	17	\N	4	USD	t	\N	2016-04-24 00:07:29.695616	1
31		0.00	\N	\N	\N	\N	f	17	\N	5	USD	t	\N	2016-04-24 00:07:29.713121	1
32		0.00	\N	\N	\N	\N	f	17	\N	6	USD	t	\N	2016-04-24 00:07:29.733274	1
33		0.00	\N	\N	\N	\N	f	17	\N	7	USD	t	\N	2016-04-24 00:07:29.752743	1
72		0.00	\N	\N	\N	\N	t	18	\N	1	BYR	t	\N	2016-04-25 22:49:35.548237	1
34		0.00	\N	\N	\N	\N	f	17	\N	8	USD	t	\N	2016-04-24 00:07:29.771201	1
35		0.00	\N	\N	\N	\N	f	17	\N	9	USD	t	\N	2016-04-24 00:07:29.789941	1
73		0.00	\N	\N	\N	\N	f	18	\N	2	BYR	t	\N	2016-04-25 22:52:33.475629	1
36		0.00	\N	\N	\N	\N	f	17	\N	10	USD	t	\N	2016-04-24 00:07:29.809854	1
37		0.00	\N	\N	\N	\N	f	17	\N	11	USD	t	\N	2016-04-24 00:07:29.829668	1
75		0.00	\N	\N	\N	\N	f	18	\N	4	BYR	t	\N	2016-04-25 23:19:35.561553	1
38		0.00	\N	\N	\N	\N	f	17	\N	12	USD	t	\N	2016-04-24 00:07:29.848809	1
39		0.00	\N	\N	\N	\N	f	17	\N	13	USD	t	\N	2016-04-24 00:07:29.8686	1
40		0.00	\N	\N	\N	\N	f	17	\N	14	USD	t	\N	2016-04-24 00:07:29.887962	1
41		0.00	\N	\N	\N	\N	f	17	\N	15	USD	t	\N	2016-04-24 00:07:29.952356	1
42		0.00	\N	\N	\N	\N	f	17	\N	16	USD	t	\N	2016-04-24 00:07:29.970349	1
28		0.00	\N	\N	\N	\N	f	17	\N	2	USD	t	\N	2016-04-24 00:07:43.241595	1
77		0.00	\N	\N	\N	\N	f	19	\N	2	BYR	t	\N	2016-04-27 22:49:13.65374	1
17	ROR-00001	0.00	\N	\N	\N	\N	f	3	17.00	2	USD	t	\N	2016-04-23 23:18:30.76086	1
82		0.00	\N	\N	\N	\N	f	20	\N	3	BYR	t	\N	2016-04-27 23:01:52.391008	1
18	ROR-00002	0.00	\N	\N	\N	\N	f	3	17.00	3	USD	t	\N	2016-04-23 23:18:31.38578	1
83		0.00	\N	\N	\N	\N	f	20	\N	4	BYR	t	\N	2016-04-27 23:02:24.796288	1
80		0.00	\N	\N	\N	\N	t	20	\N	1	BYR	t	\N	2016-04-27 23:05:36.682376	1
76		0.00	\N	\N	\N	\N	t	19	\N	1	BYR	t	\N	2016-04-27 22:50:49.508503	1
78		0.00	\N	\N	\N	\N	f	19	\N	3	BYR	t	\N	2016-04-27 22:52:18.259349	1
79		0.00	\N	\N	\N	\N	f	19	\N	4	BYR	t	\N	2016-04-27 22:53:16.592769	1
81		0.00	\N	\N	\N	\N	f	20	\N	2	BYR	t	\N	2016-04-27 23:06:40.332551	1
43		0.00	\N	\N	\N	\N	f	17	\N	17	USD	t	\N	2016-04-24 00:07:29.986906	1
44		0.00	\N	\N	\N	\N	f	17	\N	18	USD	t	\N	2016-04-24 00:07:30.002452	1
45		0.00	\N	\N	\N	\N	f	17	\N	19	USD	t	\N	2016-04-24 00:07:30.017672	1
46		0.00	\N	\N	\N	\N	f	17	\N	20	USD	t	\N	2016-04-24 00:07:30.034529	1
47		0.00	\N	\N	\N	\N	f	17	\N	21	USD	t	\N	2016-04-24 00:07:30.050501	1
48		0.00	\N	\N	\N	\N	f	17	\N	22	USD	t	\N	2016-04-24 00:07:30.066447	1
49		0.00	\N	\N	\N	\N	f	17	\N	23	USD	t	\N	2016-04-24 00:07:30.082371	1
50		0.00	\N	\N	\N	\N	f	17	\N	24	USD	t	\N	2016-04-24 00:07:30.098457	1
51		0.00	\N	\N	\N	\N	f	17	\N	25	USD	t	\N	2016-04-24 00:07:30.114415	1
52		0.00	\N	\N	\N	\N	f	17	\N	26	USD	t	\N	2016-04-24 00:07:30.129682	1
53		0.00	\N	\N	\N	\N	f	17	\N	27	USD	t	\N	2016-04-24 00:07:30.145931	1
54		0.00	\N	\N	\N	\N	f	17	\N	28	USD	t	\N	2016-04-24 00:07:30.161429	1
55		0.00	\N	\N	\N	\N	f	17	\N	29	USD	t	\N	2016-04-24 00:07:30.178234	1
56		0.00	\N	\N	\N	\N	f	17	\N	30	USD	t	\N	2016-04-24 00:07:30.195069	1
57		0.00	\N	\N	\N	\N	f	17	\N	31	USD	t	\N	2016-04-24 00:07:30.211228	1
58		0.00	\N	\N	\N	\N	f	17	\N	32	USD	t	\N	2016-04-24 00:07:30.226249	1
59		0.00	\N	\N	\N	\N	f	17	\N	33	USD	t	\N	2016-04-24 00:07:30.241861	1
60		0.00	\N	\N	\N	\N	f	17	\N	34	USD	t	\N	2016-04-24 00:07:30.257228	1
61		0.00	\N	\N	\N	\N	f	17	\N	35	USD	t	\N	2016-04-24 00:07:30.272248	1
62		0.00	\N	\N	\N	\N	f	17	\N	36	USD	t	\N	2016-04-24 00:07:30.287652	1
63		0.00	\N	\N	\N	\N	f	17	\N	37	USD	t	\N	2016-04-24 00:07:30.302969	1
64		0.00	\N	\N	\N	\N	f	17	\N	38	USD	t	\N	2016-04-24 00:07:30.319822	1
65		0.00	\N	\N	\N	\N	f	17	\N	39	USD	t	\N	2016-04-24 00:07:30.337242	1
66		0.00	\N	\N	\N	\N	f	17	\N	40	USD	t	\N	2016-04-24 00:07:30.353744	1
71		0.00	\N	\N	\N	\N	f	17	\N	45	USD	t	\N	2016-04-24 00:11:11.257728	1
67		0.00	\N	\N	\N	\N	f	17	\N	41	USD	t	\N	2016-04-24 00:07:30.370999	1
68		0.00	\N	\N	\N	\N	f	17	\N	42	USD	t	\N	2016-04-24 00:07:30.387965	1
69		0.00	\N	\N	\N	\N	f	17	\N	43	USD	t	\N	2016-04-24 00:07:30.405145	1
70		0.00	\N	\N	\N	\N	f	17	\N	44	USD	t	\N	2016-04-24 00:07:30.421865	1
\.


--
-- Name: spree_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_variants_id_seq', 83, true);


--
-- Data for Name: spree_zone_members; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_zone_members (id, zoneable_id, zoneable_type, zone_id, created_at, updated_at) FROM stdin;
1	179	Spree::Country	1	2016-04-23 23:18:07.045759	2016-04-23 23:18:07.045759
2	70	Spree::Country	1	2016-04-23 23:18:07.055286	2016-04-23 23:18:07.055286
3	183	Spree::Country	1	2016-04-23 23:18:07.067011	2016-04-23 23:18:07.067011
4	188	Spree::Country	1	2016-04-23 23:18:07.071519	2016-04-23 23:18:07.071519
5	57	Spree::Country	1	2016-04-23 23:18:07.075599	2016-04-23 23:18:07.075599
6	75	Spree::Country	1	2016-04-23 23:18:07.080484	2016-04-23 23:18:07.080484
7	201	Spree::Country	1	2016-04-23 23:18:07.084538	2016-04-23 23:18:07.084538
8	100	Spree::Country	1	2016-04-23 23:18:07.088916	2016-04-23 23:18:07.088916
9	199	Spree::Country	1	2016-04-23 23:18:07.093637	2016-04-23 23:18:07.093637
10	102	Spree::Country	1	2016-04-23 23:18:07.097782	2016-04-23 23:18:07.097782
11	12	Spree::Country	1	2016-04-23 23:18:07.102784	2016-04-23 23:18:07.102784
12	68	Spree::Country	1	2016-04-23 23:18:07.107205	2016-04-23 23:18:07.107205
13	110	Spree::Country	1	2016-04-23 23:18:07.111277	2016-04-23 23:18:07.111277
14	20	Spree::Country	1	2016-04-23 23:18:07.115608	2016-04-23 23:18:07.115608
15	196	Spree::Country	1	2016-04-23 23:18:07.120426	2016-04-23 23:18:07.120426
16	135	Spree::Country	1	2016-04-23 23:18:07.125209	2016-04-23 23:18:07.125209
17	22	Spree::Country	1	2016-04-23 23:18:07.129789	2016-04-23 23:18:07.129789
18	77	Spree::Country	1	2016-04-23 23:18:07.133663	2016-04-23 23:18:07.133663
19	133	Spree::Country	1	2016-04-23 23:18:07.138001	2016-04-23 23:18:07.138001
20	55	Spree::Country	1	2016-04-23 23:18:07.142471	2016-04-23 23:18:07.142471
21	134	Spree::Country	1	2016-04-23 23:18:07.147165	2016-04-23 23:18:07.147165
22	153	Spree::Country	1	2016-04-23 23:18:07.151813	2016-04-23 23:18:07.151813
23	59	Spree::Country	1	2016-04-23 23:18:07.156462	2016-04-23 23:18:07.156462
24	166	Spree::Country	1	2016-04-23 23:18:07.160734	2016-04-23 23:18:07.160734
25	64	Spree::Country	1	2016-04-23 23:18:07.16506	2016-04-23 23:18:07.16506
26	232	Spree::Country	2	2016-04-23 23:18:07.170388	2016-04-23 23:18:07.170388
27	38	Spree::Country	2	2016-04-23 23:18:07.174557	2016-04-23 23:18:07.174557
\.


--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_zone_members_id_seq', 27, true);


--
-- Data for Name: spree_zones; Type: TABLE DATA; Schema: public; Owner: cosmosloth
--

COPY spree_zones (id, name, description, default_tax, zone_members_count, created_at, updated_at, kind) FROM stdin;
1	EU_VAT	Countries that make up the EU VAT zone.	f	25	2016-04-23 23:18:07.001598	2016-04-23 23:18:07.001598	\N
2	North America	USA + Canada	f	2	2016-04-23 23:18:07.020946	2016-04-23 23:18:07.020946	\N
\.


--
-- Name: spree_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmosloth
--

SELECT pg_catalog.setval('spree_zones_id_seq', 2, true);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: spree_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_addresses
    ADD CONSTRAINT spree_addresses_pkey PRIMARY KEY (id);


--
-- Name: spree_adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_adjustments
    ADD CONSTRAINT spree_adjustments_pkey PRIMARY KEY (id);


--
-- Name: spree_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_assets
    ADD CONSTRAINT spree_assets_pkey PRIMARY KEY (id);


--
-- Name: spree_calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_calculators
    ADD CONSTRAINT spree_calculators_pkey PRIMARY KEY (id);


--
-- Name: spree_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_countries
    ADD CONSTRAINT spree_countries_pkey PRIMARY KEY (id);


--
-- Name: spree_credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_credit_cards
    ADD CONSTRAINT spree_credit_cards_pkey PRIMARY KEY (id);


--
-- Name: spree_customer_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_customer_returns
    ADD CONSTRAINT spree_customer_returns_pkey PRIMARY KEY (id);


--
-- Name: spree_gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_gateways
    ADD CONSTRAINT spree_gateways_pkey PRIMARY KEY (id);


--
-- Name: spree_inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_inventory_units
    ADD CONSTRAINT spree_inventory_units_pkey PRIMARY KEY (id);


--
-- Name: spree_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_line_items
    ADD CONSTRAINT spree_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_log_entries
    ADD CONSTRAINT spree_log_entries_pkey PRIMARY KEY (id);


--
-- Name: spree_option_type_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_option_type_translations
    ADD CONSTRAINT spree_option_type_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_option_types
    ADD CONSTRAINT spree_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_option_value_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_option_value_translations
    ADD CONSTRAINT spree_option_value_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_option_values
    ADD CONSTRAINT spree_option_values_pkey PRIMARY KEY (id);


--
-- Name: spree_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_orders
    ADD CONSTRAINT spree_orders_pkey PRIMARY KEY (id);


--
-- Name: spree_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_pages
    ADD CONSTRAINT spree_pages_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_capture_events_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_payment_capture_events
    ADD CONSTRAINT spree_payment_capture_events_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_payment_methods
    ADD CONSTRAINT spree_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_payments
    ADD CONSTRAINT spree_payments_pkey PRIMARY KEY (id);


--
-- Name: spree_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_preferences
    ADD CONSTRAINT spree_preferences_pkey PRIMARY KEY (id);


--
-- Name: spree_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_prices
    ADD CONSTRAINT spree_prices_pkey PRIMARY KEY (id);


--
-- Name: spree_product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_product_option_types
    ADD CONSTRAINT spree_product_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_product_properties
    ADD CONSTRAINT spree_product_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_product_property_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_product_property_translations
    ADD CONSTRAINT spree_product_property_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_product_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_product_translations
    ADD CONSTRAINT spree_product_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_products_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_products
    ADD CONSTRAINT spree_products_pkey PRIMARY KEY (id);


--
-- Name: spree_products_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_products_taxons
    ADD CONSTRAINT spree_products_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_action_line_items
    ADD CONSTRAINT spree_promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_actions
    ADD CONSTRAINT spree_promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_categories
    ADD CONSTRAINT spree_promotion_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_rules
    ADD CONSTRAINT spree_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotion_translations
    ADD CONSTRAINT spree_promotion_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_promotions
    ADD CONSTRAINT spree_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_properties
    ADD CONSTRAINT spree_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_property_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_property_translations
    ADD CONSTRAINT spree_property_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_prototypes
    ADD CONSTRAINT spree_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_refund_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_refund_reasons
    ADD CONSTRAINT spree_refund_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_refunds
    ADD CONSTRAINT spree_refunds_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_reimbursement_credits
    ADD CONSTRAINT spree_reimbursement_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_reimbursement_types
    ADD CONSTRAINT spree_reimbursement_types_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursements_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_reimbursements
    ADD CONSTRAINT spree_reimbursements_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorization_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_return_authorization_reasons
    ADD CONSTRAINT spree_return_authorization_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_return_authorizations
    ADD CONSTRAINT spree_return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: spree_return_items_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_return_items
    ADD CONSTRAINT spree_return_items_pkey PRIMARY KEY (id);


--
-- Name: spree_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_roles
    ADD CONSTRAINT spree_roles_pkey PRIMARY KEY (id);


--
-- Name: spree_shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipments
    ADD CONSTRAINT spree_shipments_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipping_categories
    ADD CONSTRAINT spree_shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipping_method_categories
    ADD CONSTRAINT spree_shipping_method_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipping_methods
    ADD CONSTRAINT spree_shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_shipping_rates
    ADD CONSTRAINT spree_shipping_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_skrill_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_skrill_transactions
    ADD CONSTRAINT spree_skrill_transactions_pkey PRIMARY KEY (id);


--
-- Name: spree_slide_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_slide_locations
    ADD CONSTRAINT spree_slide_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_slide_slide_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_slide_slide_locations
    ADD CONSTRAINT spree_slide_slide_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_slides
    ADD CONSTRAINT spree_slides_pkey PRIMARY KEY (id);


--
-- Name: spree_state_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_state_changes
    ADD CONSTRAINT spree_state_changes_pkey PRIMARY KEY (id);


--
-- Name: spree_states_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_states
    ADD CONSTRAINT spree_states_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_items_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stock_items
    ADD CONSTRAINT spree_stock_items_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stock_locations
    ADD CONSTRAINT spree_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stock_movements
    ADD CONSTRAINT spree_stock_movements_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stock_transfers
    ADD CONSTRAINT spree_stock_transfers_pkey PRIMARY KEY (id);


--
-- Name: spree_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_stores
    ADD CONSTRAINT spree_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_tax_categories
    ADD CONSTRAINT spree_tax_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_tax_rates
    ADD CONSTRAINT spree_tax_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_taxon_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxon_translations
    ADD CONSTRAINT spree_taxon_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxonomies
    ADD CONSTRAINT spree_taxonomies_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomy_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxonomy_translations
    ADD CONSTRAINT spree_taxonomy_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxons
    ADD CONSTRAINT spree_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxons_promotion_rules
    ADD CONSTRAINT spree_taxons_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_taxons_prototypes
    ADD CONSTRAINT spree_taxons_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_trackers
    ADD CONSTRAINT spree_trackers_pkey PRIMARY KEY (id);


--
-- Name: spree_users_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_users
    ADD CONSTRAINT spree_users_pkey PRIMARY KEY (id);


--
-- Name: spree_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_variants
    ADD CONSTRAINT spree_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_zone_members
    ADD CONSTRAINT spree_zone_members_pkey PRIMARY KEY (id);


--
-- Name: spree_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: cosmosloth
--

ALTER TABLE ONLY spree_zones
    ADD CONSTRAINT spree_zones_pkey PRIMARY KEY (id);


--
-- Name: email_idx_unique; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE UNIQUE INDEX email_idx_unique ON spree_users USING btree (email);


--
-- Name: index_0968f57fbd8fb9f31050820cbb66109a266c516a; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_0968f57fbd8fb9f31050820cbb66109a266c516a ON spree_product_property_translations USING btree (spree_product_property_id);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_addresses_on_firstname ON spree_addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_addresses_on_lastname ON spree_addresses USING btree (lastname);


--
-- Name: index_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_adjustments_on_order_id ON spree_adjustments USING btree (adjustable_id);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_assets_on_viewable_id ON spree_assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_assets_on_viewable_type_and_type ON spree_assets USING btree (viewable_type, type);


--
-- Name: index_friendly_id_slugs_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_friendly_id_slugs_on_deleted_at ON friendly_id_slugs USING btree (deleted_at);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_inventory_units_on_order_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_inventory_units_on_order_id ON spree_inventory_units USING btree (order_id);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_inventory_units_on_shipment_id ON spree_inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_inventory_units_on_variant_id ON spree_inventory_units USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON spree_option_values_variants USING btree (variant_id, option_value_id);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_product_properties_on_product_id ON spree_product_properties USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_products_promotion_rules_on_product_id ON spree_products_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_id ON spree_products_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_promotion_rules_on_product_group_id ON spree_promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_on_user_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_promotion_rules_on_user_id ON spree_promotion_rules USING btree (user_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON spree_promotion_rules_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_promotion_rules_users_on_user_id ON spree_promotion_rules_users USING btree (user_id);


--
-- Name: index_refunds_on_refund_reason_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_refunds_on_refund_reason_id ON spree_refunds USING btree (refund_reason_id);


--
-- Name: index_return_authorizations_on_return_authorization_reason_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_return_authorizations_on_return_authorization_reason_id ON spree_return_authorizations USING btree (return_authorization_reason_id);


--
-- Name: index_return_items_on_customer_return_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_return_items_on_customer_return_id ON spree_return_items USING btree (customer_return_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_shipments_on_number ON spree_shipments USING btree (number);


--
-- Name: index_spree_addresses_on_country_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_addresses_on_country_id ON spree_addresses USING btree (country_id);


--
-- Name: index_spree_addresses_on_state_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_addresses_on_state_id ON spree_addresses USING btree (state_id);


--
-- Name: index_spree_adjustments_on_adjustable_id_and_adjustable_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_adjustments_on_adjustable_id_and_adjustable_type ON spree_adjustments USING btree (adjustable_id, adjustable_type);


--
-- Name: index_spree_adjustments_on_eligible; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_adjustments_on_eligible ON spree_adjustments USING btree (eligible);


--
-- Name: index_spree_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_adjustments_on_order_id ON spree_adjustments USING btree (order_id);


--
-- Name: index_spree_adjustments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_adjustments_on_source_id_and_source_type ON spree_adjustments USING btree (source_id, source_type);


--
-- Name: index_spree_calculators_on_calculable_id_and_calculable_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_calculators_on_calculable_id_and_calculable_type ON spree_calculators USING btree (calculable_id, calculable_type);


--
-- Name: index_spree_calculators_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_calculators_on_deleted_at ON spree_calculators USING btree (deleted_at);


--
-- Name: index_spree_calculators_on_id_and_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_calculators_on_id_and_type ON spree_calculators USING btree (id, type);


--
-- Name: index_spree_credit_cards_on_address_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_credit_cards_on_address_id ON spree_credit_cards USING btree (address_id);


--
-- Name: index_spree_credit_cards_on_payment_method_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_credit_cards_on_payment_method_id ON spree_credit_cards USING btree (payment_method_id);


--
-- Name: index_spree_credit_cards_on_user_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_credit_cards_on_user_id ON spree_credit_cards USING btree (user_id);


--
-- Name: index_spree_gateways_on_active; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_gateways_on_active ON spree_gateways USING btree (active);


--
-- Name: index_spree_gateways_on_test_mode; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_gateways_on_test_mode ON spree_gateways USING btree (test_mode);


--
-- Name: index_spree_inventory_units_on_line_item_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_inventory_units_on_line_item_id ON spree_inventory_units USING btree (line_item_id);


--
-- Name: index_spree_line_items_on_order_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_line_items_on_order_id ON spree_line_items USING btree (order_id);


--
-- Name: index_spree_line_items_on_tax_category_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_line_items_on_tax_category_id ON spree_line_items USING btree (tax_category_id);


--
-- Name: index_spree_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_line_items_on_variant_id ON spree_line_items USING btree (variant_id);


--
-- Name: index_spree_log_entries_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_log_entries_on_source_id_and_source_type ON spree_log_entries USING btree (source_id, source_type);


--
-- Name: index_spree_option_type_translations_on_locale; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_option_type_translations_on_locale ON spree_option_type_translations USING btree (locale);


--
-- Name: index_spree_option_type_translations_on_spree_option_type_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_option_type_translations_on_spree_option_type_id ON spree_option_type_translations USING btree (spree_option_type_id);


--
-- Name: index_spree_option_types_on_position; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_option_types_on_position ON spree_option_types USING btree ("position");


--
-- Name: index_spree_option_value_translations_on_locale; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_option_value_translations_on_locale ON spree_option_value_translations USING btree (locale);


--
-- Name: index_spree_option_value_translations_on_spree_option_value_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_option_value_translations_on_spree_option_value_id ON spree_option_value_translations USING btree (spree_option_value_id);


--
-- Name: index_spree_option_values_on_option_type_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_option_values_on_option_type_id ON spree_option_values USING btree (option_type_id);


--
-- Name: index_spree_option_values_on_position; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_option_values_on_position ON spree_option_values USING btree ("position");


--
-- Name: index_spree_option_values_variants_on_variant_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_option_values_variants_on_variant_id ON spree_option_values_variants USING btree (variant_id);


--
-- Name: index_spree_orders_on_approver_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_approver_id ON spree_orders USING btree (approver_id);


--
-- Name: index_spree_orders_on_bill_address_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_bill_address_id ON spree_orders USING btree (bill_address_id);


--
-- Name: index_spree_orders_on_completed_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_completed_at ON spree_orders USING btree (completed_at);


--
-- Name: index_spree_orders_on_confirmation_delivered; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_confirmation_delivered ON spree_orders USING btree (confirmation_delivered);


--
-- Name: index_spree_orders_on_considered_risky; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_considered_risky ON spree_orders USING btree (considered_risky);


--
-- Name: index_spree_orders_on_created_by_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_created_by_id ON spree_orders USING btree (created_by_id);


--
-- Name: index_spree_orders_on_guest_token; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_guest_token ON spree_orders USING btree (guest_token);


--
-- Name: index_spree_orders_on_number; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_number ON spree_orders USING btree (number);


--
-- Name: index_spree_orders_on_ship_address_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_ship_address_id ON spree_orders USING btree (ship_address_id);


--
-- Name: index_spree_orders_on_shipping_method_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_shipping_method_id ON spree_orders USING btree (shipping_method_id);


--
-- Name: index_spree_orders_on_user_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_user_id ON spree_orders USING btree (user_id);


--
-- Name: index_spree_orders_on_user_id_and_created_by_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_on_user_id_and_created_by_id ON spree_orders USING btree (user_id, created_by_id);


--
-- Name: index_spree_orders_promotions_on_order_id_and_promotion_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_orders_promotions_on_order_id_and_promotion_id ON spree_orders_promotions USING btree (order_id, promotion_id);


--
-- Name: index_spree_pages_on_slug; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_pages_on_slug ON spree_pages USING btree (slug);


--
-- Name: index_spree_pages_stores_on_page_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_pages_stores_on_page_id ON spree_pages_stores USING btree (page_id);


--
-- Name: index_spree_pages_stores_on_store_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_pages_stores_on_store_id ON spree_pages_stores USING btree (store_id);


--
-- Name: index_spree_payment_capture_events_on_payment_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_payment_capture_events_on_payment_id ON spree_payment_capture_events USING btree (payment_id);


--
-- Name: index_spree_payment_methods_on_id_and_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_payment_methods_on_id_and_type ON spree_payment_methods USING btree (id, type);


--
-- Name: index_spree_payments_on_number; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_payments_on_number ON spree_payments USING btree (number);


--
-- Name: index_spree_payments_on_order_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_payments_on_order_id ON spree_payments USING btree (order_id);


--
-- Name: index_spree_payments_on_payment_method_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_payments_on_payment_method_id ON spree_payments USING btree (payment_method_id);


--
-- Name: index_spree_payments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_payments_on_source_id_and_source_type ON spree_payments USING btree (source_id, source_type);


--
-- Name: index_spree_preferences_on_key; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE UNIQUE INDEX index_spree_preferences_on_key ON spree_preferences USING btree (key);


--
-- Name: index_spree_prices_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_prices_on_deleted_at ON spree_prices USING btree (deleted_at);


--
-- Name: index_spree_prices_on_variant_id_and_currency; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_prices_on_variant_id_and_currency ON spree_prices USING btree (variant_id, currency);


--
-- Name: index_spree_product_option_types_on_option_type_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_product_option_types_on_option_type_id ON spree_product_option_types USING btree (option_type_id);


--
-- Name: index_spree_product_option_types_on_position; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_product_option_types_on_position ON spree_product_option_types USING btree ("position");


--
-- Name: index_spree_product_option_types_on_product_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_product_option_types_on_product_id ON spree_product_option_types USING btree (product_id);


--
-- Name: index_spree_product_properties_on_position; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_product_properties_on_position ON spree_product_properties USING btree ("position");


--
-- Name: index_spree_product_properties_on_property_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_product_properties_on_property_id ON spree_product_properties USING btree (property_id);


--
-- Name: index_spree_product_property_translations_on_locale; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_product_property_translations_on_locale ON spree_product_property_translations USING btree (locale);


--
-- Name: index_spree_product_translations_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_product_translations_on_deleted_at ON spree_product_translations USING btree (deleted_at);


--
-- Name: index_spree_product_translations_on_locale; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_product_translations_on_locale ON spree_product_translations USING btree (locale);


--
-- Name: index_spree_product_translations_on_spree_product_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_product_translations_on_spree_product_id ON spree_product_translations USING btree (spree_product_id);


--
-- Name: index_spree_products_on_available_on; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_products_on_available_on ON spree_products USING btree (available_on);


--
-- Name: index_spree_products_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_products_on_deleted_at ON spree_products USING btree (deleted_at);


--
-- Name: index_spree_products_on_name; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_products_on_name ON spree_products USING btree (name);


--
-- Name: index_spree_products_on_shipping_category_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_products_on_shipping_category_id ON spree_products USING btree (shipping_category_id);


--
-- Name: index_spree_products_on_slug; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE UNIQUE INDEX index_spree_products_on_slug ON spree_products USING btree (slug);


--
-- Name: index_spree_products_on_tax_category_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_products_on_tax_category_id ON spree_products USING btree (tax_category_id);


--
-- Name: index_spree_products_taxons_on_position; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_products_taxons_on_position ON spree_products_taxons USING btree ("position");


--
-- Name: index_spree_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_products_taxons_on_product_id ON spree_products_taxons USING btree (product_id);


--
-- Name: index_spree_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_products_taxons_on_taxon_id ON spree_products_taxons USING btree (taxon_id);


--
-- Name: index_spree_promotion_action_line_items_on_promotion_action_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotion_action_line_items_on_promotion_action_id ON spree_promotion_action_line_items USING btree (promotion_action_id);


--
-- Name: index_spree_promotion_action_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotion_action_line_items_on_variant_id ON spree_promotion_action_line_items USING btree (variant_id);


--
-- Name: index_spree_promotion_actions_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotion_actions_on_deleted_at ON spree_promotion_actions USING btree (deleted_at);


--
-- Name: index_spree_promotion_actions_on_id_and_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotion_actions_on_id_and_type ON spree_promotion_actions USING btree (id, type);


--
-- Name: index_spree_promotion_actions_on_promotion_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotion_actions_on_promotion_id ON spree_promotion_actions USING btree (promotion_id);


--
-- Name: index_spree_promotion_rules_on_promotion_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotion_rules_on_promotion_id ON spree_promotion_rules USING btree (promotion_id);


--
-- Name: index_spree_promotion_translations_on_locale; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotion_translations_on_locale ON spree_promotion_translations USING btree (locale);


--
-- Name: index_spree_promotion_translations_on_spree_promotion_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotion_translations_on_spree_promotion_id ON spree_promotion_translations USING btree (spree_promotion_id);


--
-- Name: index_spree_promotions_on_advertise; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotions_on_advertise ON spree_promotions USING btree (advertise);


--
-- Name: index_spree_promotions_on_code; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotions_on_code ON spree_promotions USING btree (code);


--
-- Name: index_spree_promotions_on_expires_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotions_on_expires_at ON spree_promotions USING btree (expires_at);


--
-- Name: index_spree_promotions_on_id_and_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotions_on_id_and_type ON spree_promotions USING btree (id, type);


--
-- Name: index_spree_promotions_on_promotion_category_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotions_on_promotion_category_id ON spree_promotions USING btree (promotion_category_id);


--
-- Name: index_spree_promotions_on_starts_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_promotions_on_starts_at ON spree_promotions USING btree (starts_at);


--
-- Name: index_spree_property_translations_on_locale; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_property_translations_on_locale ON spree_property_translations USING btree (locale);


--
-- Name: index_spree_property_translations_on_spree_property_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_property_translations_on_spree_property_id ON spree_property_translations USING btree (spree_property_id);


--
-- Name: index_spree_reimbursement_types_on_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_reimbursement_types_on_type ON spree_reimbursement_types USING btree (type);


--
-- Name: index_spree_reimbursements_on_customer_return_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_reimbursements_on_customer_return_id ON spree_reimbursements USING btree (customer_return_id);


--
-- Name: index_spree_reimbursements_on_order_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_reimbursements_on_order_id ON spree_reimbursements USING btree (order_id);


--
-- Name: index_spree_return_items_on_exchange_inventory_unit_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_return_items_on_exchange_inventory_unit_id ON spree_return_items USING btree (exchange_inventory_unit_id);


--
-- Name: index_spree_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_roles_users_on_role_id ON spree_roles_users USING btree (role_id);


--
-- Name: index_spree_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_roles_users_on_user_id ON spree_roles_users USING btree (user_id);


--
-- Name: index_spree_shipments_on_address_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_shipments_on_address_id ON spree_shipments USING btree (address_id);


--
-- Name: index_spree_shipments_on_order_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_shipments_on_order_id ON spree_shipments USING btree (order_id);


--
-- Name: index_spree_shipments_on_stock_location_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_shipments_on_stock_location_id ON spree_shipments USING btree (stock_location_id);


--
-- Name: index_spree_shipping_method_categories_on_shipping_method_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_shipping_method_categories_on_shipping_method_id ON spree_shipping_method_categories USING btree (shipping_method_id);


--
-- Name: index_spree_shipping_methods_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_shipping_methods_on_deleted_at ON spree_shipping_methods USING btree (deleted_at);


--
-- Name: index_spree_shipping_methods_on_tax_category_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_shipping_methods_on_tax_category_id ON spree_shipping_methods USING btree (tax_category_id);


--
-- Name: index_spree_shipping_rates_on_selected; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_shipping_rates_on_selected ON spree_shipping_rates USING btree (selected);


--
-- Name: index_spree_shipping_rates_on_tax_rate_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_shipping_rates_on_tax_rate_id ON spree_shipping_rates USING btree (tax_rate_id);


--
-- Name: index_spree_slide_slide_locations_on_slide_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_slide_slide_locations_on_slide_id ON spree_slide_slide_locations USING btree (slide_id);


--
-- Name: index_spree_slide_slide_locations_on_slide_location_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_slide_slide_locations_on_slide_location_id ON spree_slide_slide_locations USING btree (slide_location_id);


--
-- Name: index_spree_state_changes_on_stateful_id_and_stateful_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_state_changes_on_stateful_id_and_stateful_type ON spree_state_changes USING btree (stateful_id, stateful_type);


--
-- Name: index_spree_state_changes_on_user_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_state_changes_on_user_id ON spree_state_changes USING btree (user_id);


--
-- Name: index_spree_states_on_country_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_states_on_country_id ON spree_states USING btree (country_id);


--
-- Name: index_spree_stock_items_on_backorderable; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_items_on_backorderable ON spree_stock_items USING btree (backorderable);


--
-- Name: index_spree_stock_items_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_items_on_deleted_at ON spree_stock_items USING btree (deleted_at);


--
-- Name: index_spree_stock_items_on_stock_location_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_items_on_stock_location_id ON spree_stock_items USING btree (stock_location_id);


--
-- Name: index_spree_stock_items_on_variant_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_items_on_variant_id ON spree_stock_items USING btree (variant_id);


--
-- Name: index_spree_stock_locations_on_active; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_locations_on_active ON spree_stock_locations USING btree (active);


--
-- Name: index_spree_stock_locations_on_backorderable_default; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_locations_on_backorderable_default ON spree_stock_locations USING btree (backorderable_default);


--
-- Name: index_spree_stock_locations_on_country_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_locations_on_country_id ON spree_stock_locations USING btree (country_id);


--
-- Name: index_spree_stock_locations_on_propagate_all_variants; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_locations_on_propagate_all_variants ON spree_stock_locations USING btree (propagate_all_variants);


--
-- Name: index_spree_stock_locations_on_state_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_locations_on_state_id ON spree_stock_locations USING btree (state_id);


--
-- Name: index_spree_stock_movements_on_stock_item_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_movements_on_stock_item_id ON spree_stock_movements USING btree (stock_item_id);


--
-- Name: index_spree_stock_transfers_on_destination_location_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_transfers_on_destination_location_id ON spree_stock_transfers USING btree (destination_location_id);


--
-- Name: index_spree_stock_transfers_on_number; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_transfers_on_number ON spree_stock_transfers USING btree (number);


--
-- Name: index_spree_stock_transfers_on_source_location_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stock_transfers_on_source_location_id ON spree_stock_transfers USING btree (source_location_id);


--
-- Name: index_spree_stores_on_code; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stores_on_code ON spree_stores USING btree (code);


--
-- Name: index_spree_stores_on_default; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stores_on_default ON spree_stores USING btree ("default");


--
-- Name: index_spree_stores_on_url; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_stores_on_url ON spree_stores USING btree (url);


--
-- Name: index_spree_tax_categories_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_tax_categories_on_deleted_at ON spree_tax_categories USING btree (deleted_at);


--
-- Name: index_spree_tax_categories_on_is_default; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_tax_categories_on_is_default ON spree_tax_categories USING btree (is_default);


--
-- Name: index_spree_tax_rates_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_tax_rates_on_deleted_at ON spree_tax_rates USING btree (deleted_at);


--
-- Name: index_spree_tax_rates_on_included_in_price; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_tax_rates_on_included_in_price ON spree_tax_rates USING btree (included_in_price);


--
-- Name: index_spree_tax_rates_on_show_rate_in_label; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_tax_rates_on_show_rate_in_label ON spree_tax_rates USING btree (show_rate_in_label);


--
-- Name: index_spree_tax_rates_on_tax_category_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_tax_rates_on_tax_category_id ON spree_tax_rates USING btree (tax_category_id);


--
-- Name: index_spree_tax_rates_on_zone_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_tax_rates_on_zone_id ON spree_tax_rates USING btree (zone_id);


--
-- Name: index_spree_taxon_translations_on_locale; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxon_translations_on_locale ON spree_taxon_translations USING btree (locale);


--
-- Name: index_spree_taxon_translations_on_spree_taxon_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxon_translations_on_spree_taxon_id ON spree_taxon_translations USING btree (spree_taxon_id);


--
-- Name: index_spree_taxonomies_on_position; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxonomies_on_position ON spree_taxonomies USING btree ("position");


--
-- Name: index_spree_taxonomy_translations_on_locale; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxonomy_translations_on_locale ON spree_taxonomy_translations USING btree (locale);


--
-- Name: index_spree_taxonomy_translations_on_spree_taxonomy_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxonomy_translations_on_spree_taxonomy_id ON spree_taxonomy_translations USING btree (spree_taxonomy_id);


--
-- Name: index_spree_taxons_on_position; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxons_on_position ON spree_taxons USING btree ("position");


--
-- Name: index_spree_taxons_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxons_promotion_rules_on_promotion_rule_id ON spree_taxons_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_spree_taxons_promotion_rules_on_taxon_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxons_promotion_rules_on_taxon_id ON spree_taxons_promotion_rules USING btree (taxon_id);


--
-- Name: index_spree_taxons_prototypes_on_prototype_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxons_prototypes_on_prototype_id ON spree_taxons_prototypes USING btree (prototype_id);


--
-- Name: index_spree_taxons_prototypes_on_taxon_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_taxons_prototypes_on_taxon_id ON spree_taxons_prototypes USING btree (taxon_id);


--
-- Name: index_spree_trackers_on_active; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_trackers_on_active ON spree_trackers USING btree (active);


--
-- Name: index_spree_users_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_users_on_deleted_at ON spree_users USING btree (deleted_at);


--
-- Name: index_spree_users_on_spree_api_key; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_users_on_spree_api_key ON spree_users USING btree (spree_api_key);


--
-- Name: index_spree_variants_on_deleted_at; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_variants_on_deleted_at ON spree_variants USING btree (deleted_at);


--
-- Name: index_spree_variants_on_is_master; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_variants_on_is_master ON spree_variants USING btree (is_master);


--
-- Name: index_spree_variants_on_position; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_variants_on_position ON spree_variants USING btree ("position");


--
-- Name: index_spree_variants_on_product_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_variants_on_product_id ON spree_variants USING btree (product_id);


--
-- Name: index_spree_variants_on_sku; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_variants_on_sku ON spree_variants USING btree (sku);


--
-- Name: index_spree_variants_on_tax_category_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_variants_on_tax_category_id ON spree_variants USING btree (tax_category_id);


--
-- Name: index_spree_variants_on_track_inventory; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_variants_on_track_inventory ON spree_variants USING btree (track_inventory);


--
-- Name: index_spree_zone_members_on_zone_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_zone_members_on_zone_id ON spree_zone_members USING btree (zone_id);


--
-- Name: index_spree_zone_members_on_zoneable_id_and_zoneable_type; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_zone_members_on_zoneable_id_and_zoneable_type ON spree_zone_members USING btree (zoneable_id, zoneable_type);


--
-- Name: index_spree_zones_on_default_tax; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_zones_on_default_tax ON spree_zones USING btree (default_tax);


--
-- Name: index_spree_zones_on_kind; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_spree_zones_on_kind ON spree_zones USING btree (kind);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_taxons_on_parent_id ON spree_taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_taxons_on_permalink ON spree_taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX index_taxons_on_taxonomy_id ON spree_taxons USING btree (taxonomy_id);


--
-- Name: spree_shipping_rates_join_index; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE UNIQUE INDEX spree_shipping_rates_join_index ON spree_shipping_rates USING btree (shipment_id, shipping_method_id);


--
-- Name: stock_item_by_loc_and_var_id; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE INDEX stock_item_by_loc_and_var_id ON spree_stock_items USING btree (stock_location_id, variant_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: unique_spree_shipping_method_categories; Type: INDEX; Schema: public; Owner: cosmosloth
--

CREATE UNIQUE INDEX unique_spree_shipping_method_categories ON spree_shipping_method_categories USING btree (shipping_category_id, shipping_method_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: cosmosloth
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM cosmosloth;
GRANT ALL ON SCHEMA public TO cosmosloth;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

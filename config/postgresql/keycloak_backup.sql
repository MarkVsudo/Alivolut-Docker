--
-- PostgreSQL database dump
--

-- Dumped from database version 11.20
-- Dumped by pg_dump version 11.20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: keycloak; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA keycloak;


ALTER SCHEMA keycloak OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_event_entity; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE keycloak.admin_event_entity OWNER TO keycloak_user;

--
-- Name: associated_policy; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.associated_policy OWNER TO keycloak_user;

--
-- Name: authentication_execution; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE keycloak.authentication_execution OWNER TO keycloak_user;

--
-- Name: authentication_flow; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.authentication_flow OWNER TO keycloak_user;

--
-- Name: authenticator_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE keycloak.authenticator_config OWNER TO keycloak_user;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.authenticator_config_entry OWNER TO keycloak_user;

--
-- Name: broker_link; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE keycloak.broker_link OWNER TO keycloak_user;

--
-- Name: client; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.client OWNER TO keycloak_user;

--
-- Name: client_attributes; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE keycloak.client_attributes OWNER TO keycloak_user;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_auth_flow_bindings OWNER TO keycloak_user;

--
-- Name: client_initial_access; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE keycloak.client_initial_access OWNER TO keycloak_user;

--
-- Name: client_node_registrations; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_node_registrations OWNER TO keycloak_user;

--
-- Name: client_scope; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE keycloak.client_scope OWNER TO keycloak_user;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_scope_attributes OWNER TO keycloak_user;

--
-- Name: client_scope_client; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.client_scope_client OWNER TO keycloak_user;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_scope_role_mapping OWNER TO keycloak_user;

--
-- Name: client_session; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE keycloak.client_session OWNER TO keycloak_user;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_auth_status OWNER TO keycloak_user;

--
-- Name: client_session_note; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_note OWNER TO keycloak_user;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_prot_mapper OWNER TO keycloak_user;

--
-- Name: client_session_role; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_role OWNER TO keycloak_user;

--
-- Name: client_user_session_note; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_user_session_note OWNER TO keycloak_user;

--
-- Name: component; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE keycloak.component OWNER TO keycloak_user;

--
-- Name: component_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE keycloak.component_config OWNER TO keycloak_user;

--
-- Name: composite_role; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE keycloak.composite_role OWNER TO keycloak_user;

--
-- Name: credential; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE keycloak.credential OWNER TO keycloak_user;

--
-- Name: databasechangelog; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE keycloak.databasechangelog OWNER TO keycloak_user;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE keycloak.databasechangeloglock OWNER TO keycloak_user;

--
-- Name: default_client_scope; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.default_client_scope OWNER TO keycloak_user;

--
-- Name: event_entity; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE keycloak.event_entity OWNER TO keycloak_user;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE keycloak.fed_user_attribute OWNER TO keycloak_user;

--
-- Name: fed_user_consent; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE keycloak.fed_user_consent OWNER TO keycloak_user;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.fed_user_consent_cl_scope OWNER TO keycloak_user;

--
-- Name: fed_user_credential; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE keycloak.fed_user_credential OWNER TO keycloak_user;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE keycloak.fed_user_group_membership OWNER TO keycloak_user;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE keycloak.fed_user_required_action OWNER TO keycloak_user;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE keycloak.fed_user_role_mapping OWNER TO keycloak_user;

--
-- Name: federated_identity; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.federated_identity OWNER TO keycloak_user;

--
-- Name: federated_user; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.federated_user OWNER TO keycloak_user;

--
-- Name: group_attribute; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.group_attribute OWNER TO keycloak_user;

--
-- Name: group_role_mapping; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.group_role_mapping OWNER TO keycloak_user;

--
-- Name: identity_provider; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.identity_provider OWNER TO keycloak_user;

--
-- Name: identity_provider_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.identity_provider_config OWNER TO keycloak_user;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.identity_provider_mapper OWNER TO keycloak_user;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.idp_mapper_config OWNER TO keycloak_user;

--
-- Name: keycloak_group; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE keycloak.keycloak_group OWNER TO keycloak_user;

--
-- Name: keycloak_role; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE keycloak.keycloak_role OWNER TO keycloak_user;

--
-- Name: migration_model; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.migration_model OWNER TO keycloak_user;

--
-- Name: offline_client_session; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE keycloak.offline_client_session OWNER TO keycloak_user;

--
-- Name: offline_user_session; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.offline_user_session OWNER TO keycloak_user;

--
-- Name: policy_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE keycloak.policy_config OWNER TO keycloak_user;

--
-- Name: protocol_mapper; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE keycloak.protocol_mapper OWNER TO keycloak_user;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.protocol_mapper_config OWNER TO keycloak_user;

--
-- Name: realm; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE keycloak.realm OWNER TO keycloak_user;

--
-- Name: realm_attribute; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE keycloak.realm_attribute OWNER TO keycloak_user;

--
-- Name: realm_default_groups; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.realm_default_groups OWNER TO keycloak_user;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_enabled_event_types OWNER TO keycloak_user;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_events_listeners OWNER TO keycloak_user;

--
-- Name: realm_localizations; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE keycloak.realm_localizations OWNER TO keycloak_user;

--
-- Name: realm_required_credential; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.realm_required_credential OWNER TO keycloak_user;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_smtp_config OWNER TO keycloak_user;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_supported_locales OWNER TO keycloak_user;

--
-- Name: redirect_uris; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.redirect_uris OWNER TO keycloak_user;

--
-- Name: required_action_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.required_action_config OWNER TO keycloak_user;

--
-- Name: required_action_provider; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE keycloak.required_action_provider OWNER TO keycloak_user;

--
-- Name: resource_attribute; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.resource_attribute OWNER TO keycloak_user;

--
-- Name: resource_policy; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.resource_policy OWNER TO keycloak_user;

--
-- Name: resource_scope; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.resource_scope OWNER TO keycloak_user;

--
-- Name: resource_server; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE keycloak.resource_server OWNER TO keycloak_user;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE keycloak.resource_server_perm_ticket OWNER TO keycloak_user;

--
-- Name: resource_server_policy; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE keycloak.resource_server_policy OWNER TO keycloak_user;

--
-- Name: resource_server_resource; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE keycloak.resource_server_resource OWNER TO keycloak_user;

--
-- Name: resource_server_scope; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE keycloak.resource_server_scope OWNER TO keycloak_user;

--
-- Name: resource_uris; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.resource_uris OWNER TO keycloak_user;

--
-- Name: role_attribute; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE keycloak.role_attribute OWNER TO keycloak_user;

--
-- Name: scope_mapping; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.scope_mapping OWNER TO keycloak_user;

--
-- Name: scope_policy; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.scope_policy OWNER TO keycloak_user;

--
-- Name: user_attribute; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE keycloak.user_attribute OWNER TO keycloak_user;

--
-- Name: user_consent; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE keycloak.user_consent OWNER TO keycloak_user;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_consent_client_scope OWNER TO keycloak_user;

--
-- Name: user_entity; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.user_entity OWNER TO keycloak_user;

--
-- Name: user_federation_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.user_federation_config OWNER TO keycloak_user;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_federation_mapper OWNER TO keycloak_user;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.user_federation_mapper_config OWNER TO keycloak_user;

--
-- Name: user_federation_provider; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE keycloak.user_federation_provider OWNER TO keycloak_user;

--
-- Name: user_group_membership; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_group_membership OWNER TO keycloak_user;

--
-- Name: user_required_action; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE keycloak.user_required_action OWNER TO keycloak_user;

--
-- Name: user_role_mapping; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_role_mapping OWNER TO keycloak_user;

--
-- Name: user_session; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE keycloak.user_session OWNER TO keycloak_user;

--
-- Name: user_session_note; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE keycloak.user_session_note OWNER TO keycloak_user;

--
-- Name: username_login_failure; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE keycloak.username_login_failure OWNER TO keycloak_user;

--
-- Name: web_origins; Type: TABLE; Schema: keycloak; Owner: keycloak_user
--

CREATE TABLE keycloak.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.web_origins OWNER TO keycloak_user;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
cde8b405-5f66-4d35-a3f9-1dc3792b9454	\N	auth-cookie	c214cae2-06a9-4de8-9406-3a4f87bad41b	43d57a9e-3ce6-4880-bd63-6667053456c3	2	10	f	\N	\N
48d7e5a0-818b-47a3-968d-c06d458d7923	\N	auth-spnego	c214cae2-06a9-4de8-9406-3a4f87bad41b	43d57a9e-3ce6-4880-bd63-6667053456c3	3	20	f	\N	\N
eb40a634-2f88-4cf1-896a-25d36c80dbde	\N	identity-provider-redirector	c214cae2-06a9-4de8-9406-3a4f87bad41b	43d57a9e-3ce6-4880-bd63-6667053456c3	2	25	f	\N	\N
49188f67-134d-45f7-9f59-0be8582cd791	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	43d57a9e-3ce6-4880-bd63-6667053456c3	2	30	t	c6858ba0-c428-498f-822a-5d57ac207d77	\N
3a1e8262-ffa4-4032-9774-4d5f0e55b8d3	\N	auth-username-password-form	c214cae2-06a9-4de8-9406-3a4f87bad41b	c6858ba0-c428-498f-822a-5d57ac207d77	0	10	f	\N	\N
5da537f9-564e-4f8b-babb-08cdc85132ac	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	c6858ba0-c428-498f-822a-5d57ac207d77	1	20	t	bac07ca5-c769-420e-98b9-18658b8cd639	\N
cb9f0643-8f97-41b5-8763-3c948e4963ee	\N	conditional-user-configured	c214cae2-06a9-4de8-9406-3a4f87bad41b	bac07ca5-c769-420e-98b9-18658b8cd639	0	10	f	\N	\N
7ef4767e-0f57-4fb4-84b7-61fb30504e2c	\N	auth-otp-form	c214cae2-06a9-4de8-9406-3a4f87bad41b	bac07ca5-c769-420e-98b9-18658b8cd639	0	20	f	\N	\N
7941dc3b-7cfb-4ed7-8bf9-5162ca225ba1	\N	direct-grant-validate-username	c214cae2-06a9-4de8-9406-3a4f87bad41b	e04b60ff-f609-46c8-b769-d4b3e966f320	0	10	f	\N	\N
e4f3ed00-6f7f-4497-bd41-7dae643d13d4	\N	direct-grant-validate-password	c214cae2-06a9-4de8-9406-3a4f87bad41b	e04b60ff-f609-46c8-b769-d4b3e966f320	0	20	f	\N	\N
c0b27bd8-b753-4258-aadc-2e5648cd07eb	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	e04b60ff-f609-46c8-b769-d4b3e966f320	1	30	t	8c3af8b1-5e74-48b5-ac22-7569478afc14	\N
8f79b863-76da-4af6-ae06-a25bd4ac5b73	\N	conditional-user-configured	c214cae2-06a9-4de8-9406-3a4f87bad41b	8c3af8b1-5e74-48b5-ac22-7569478afc14	0	10	f	\N	\N
ea0265a9-aa6a-4f9f-9151-fe6ae7f2de66	\N	direct-grant-validate-otp	c214cae2-06a9-4de8-9406-3a4f87bad41b	8c3af8b1-5e74-48b5-ac22-7569478afc14	0	20	f	\N	\N
ce5739ae-44d3-448e-b29d-e7220ad8dce9	\N	registration-page-form	c214cae2-06a9-4de8-9406-3a4f87bad41b	acce71a9-74bc-42b8-96b2-c368f6ddf0fa	0	10	t	5dc2795d-1f13-425d-80fc-ffabd35e4ddb	\N
57cbcc73-ce17-497a-8b06-ad65e7a306ec	\N	registration-user-creation	c214cae2-06a9-4de8-9406-3a4f87bad41b	5dc2795d-1f13-425d-80fc-ffabd35e4ddb	0	20	f	\N	\N
65e42cad-cb22-4c31-a361-61c352bc77ad	\N	registration-profile-action	c214cae2-06a9-4de8-9406-3a4f87bad41b	5dc2795d-1f13-425d-80fc-ffabd35e4ddb	0	40	f	\N	\N
c2de6753-66b7-4ddf-b29f-9b228f18d6d9	\N	registration-password-action	c214cae2-06a9-4de8-9406-3a4f87bad41b	5dc2795d-1f13-425d-80fc-ffabd35e4ddb	0	50	f	\N	\N
2cfc350d-4735-43e8-83f3-e18409549969	\N	registration-recaptcha-action	c214cae2-06a9-4de8-9406-3a4f87bad41b	5dc2795d-1f13-425d-80fc-ffabd35e4ddb	3	60	f	\N	\N
6f23e00a-cc1d-4b47-add5-a8c80ddd058d	\N	reset-credentials-choose-user	c214cae2-06a9-4de8-9406-3a4f87bad41b	79dc8e40-f3cd-4b48-a1ec-2b9526eb67ed	0	10	f	\N	\N
4f44a7a9-03d8-4c83-b0e9-c9deb3998b41	\N	reset-credential-email	c214cae2-06a9-4de8-9406-3a4f87bad41b	79dc8e40-f3cd-4b48-a1ec-2b9526eb67ed	0	20	f	\N	\N
80427023-1a2f-49af-803d-d8d1ae424e1d	\N	reset-password	c214cae2-06a9-4de8-9406-3a4f87bad41b	79dc8e40-f3cd-4b48-a1ec-2b9526eb67ed	0	30	f	\N	\N
a94f7f51-a86a-4e1e-ba4c-76e29d15451c	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	79dc8e40-f3cd-4b48-a1ec-2b9526eb67ed	1	40	t	68c34893-8832-46ba-8ef8-b11911781b0c	\N
cba203df-60ad-40f2-ad02-d736996979cc	\N	conditional-user-configured	c214cae2-06a9-4de8-9406-3a4f87bad41b	68c34893-8832-46ba-8ef8-b11911781b0c	0	10	f	\N	\N
e18f1d3b-e4bb-4e4c-acb4-af6d47f23ca7	\N	reset-otp	c214cae2-06a9-4de8-9406-3a4f87bad41b	68c34893-8832-46ba-8ef8-b11911781b0c	0	20	f	\N	\N
14757469-dccf-4468-ad6d-c7a2a6a0c23b	\N	client-secret	c214cae2-06a9-4de8-9406-3a4f87bad41b	5ede6740-c571-47bd-abdc-8d2f367b1154	2	10	f	\N	\N
6b657cf7-82f2-49e2-b224-a210464b6ceb	\N	client-jwt	c214cae2-06a9-4de8-9406-3a4f87bad41b	5ede6740-c571-47bd-abdc-8d2f367b1154	2	20	f	\N	\N
c3511ffc-ea6b-4fe8-b82b-23468563ea1e	\N	client-secret-jwt	c214cae2-06a9-4de8-9406-3a4f87bad41b	5ede6740-c571-47bd-abdc-8d2f367b1154	2	30	f	\N	\N
ec3f5707-043d-4b88-8409-c38958840d28	\N	client-x509	c214cae2-06a9-4de8-9406-3a4f87bad41b	5ede6740-c571-47bd-abdc-8d2f367b1154	2	40	f	\N	\N
7f6beada-dc76-4695-9b5c-76b53a1e21b2	\N	idp-review-profile	c214cae2-06a9-4de8-9406-3a4f87bad41b	68c24367-5d9e-44ac-b3c4-dfed30256c85	0	10	f	\N	a9d6e0bd-6039-4b05-a495-9aad14bd11a8
9c03e710-386c-4586-a7e5-ef6836331e7f	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	68c24367-5d9e-44ac-b3c4-dfed30256c85	0	20	t	5660c8a6-2478-443f-9909-e9bcd665c512	\N
33a45870-1328-469b-bc6a-9ae90bf45fda	\N	idp-create-user-if-unique	c214cae2-06a9-4de8-9406-3a4f87bad41b	5660c8a6-2478-443f-9909-e9bcd665c512	2	10	f	\N	8fd851bb-5e42-4ab3-b97f-49ac96dabe22
88022717-9a33-48fc-8707-66a3cd9c329f	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	5660c8a6-2478-443f-9909-e9bcd665c512	2	20	t	a61c4db8-87f0-4ccc-97e8-fbbb57eafdab	\N
a892322a-18cc-4e45-93ca-a12c84c3cf8e	\N	idp-confirm-link	c214cae2-06a9-4de8-9406-3a4f87bad41b	a61c4db8-87f0-4ccc-97e8-fbbb57eafdab	0	10	f	\N	\N
2034fa37-5853-4490-ae67-a76928d0ad34	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	a61c4db8-87f0-4ccc-97e8-fbbb57eafdab	0	20	t	c2a51df8-2626-47ce-a8b5-744d54f12f0a	\N
0cfd0b5e-862f-4ca5-804f-fe6edb2cb2c4	\N	idp-email-verification	c214cae2-06a9-4de8-9406-3a4f87bad41b	c2a51df8-2626-47ce-a8b5-744d54f12f0a	2	10	f	\N	\N
19fce0a8-26d2-4a44-b9db-54f002bf7928	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	c2a51df8-2626-47ce-a8b5-744d54f12f0a	2	20	t	26975658-11e0-4269-82a0-1e8937b5f561	\N
6b50f40d-bdc9-4065-938d-2f1d26c3462a	\N	idp-username-password-form	c214cae2-06a9-4de8-9406-3a4f87bad41b	26975658-11e0-4269-82a0-1e8937b5f561	0	10	f	\N	\N
b9817b29-f800-49bc-bdd3-2c7aed7fc743	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	26975658-11e0-4269-82a0-1e8937b5f561	1	20	t	f0cd809b-08cb-4616-b464-b5e6b50b9fc3	\N
4ae354e1-0d1f-47c8-9dd7-865119f65410	\N	conditional-user-configured	c214cae2-06a9-4de8-9406-3a4f87bad41b	f0cd809b-08cb-4616-b464-b5e6b50b9fc3	0	10	f	\N	\N
35b7f92b-a2c6-40a9-8685-3ca25f5590d6	\N	auth-otp-form	c214cae2-06a9-4de8-9406-3a4f87bad41b	f0cd809b-08cb-4616-b464-b5e6b50b9fc3	0	20	f	\N	\N
97245f1c-a775-42ba-b2af-46f492c56ce6	\N	http-basic-authenticator	c214cae2-06a9-4de8-9406-3a4f87bad41b	86e94813-9bdc-4637-8db6-26f4f423230c	0	10	f	\N	\N
8dcba5b6-9a9a-405d-903d-b806853fbe1e	\N	docker-http-basic-authenticator	c214cae2-06a9-4de8-9406-3a4f87bad41b	6a66048a-474c-4444-8366-a1aeb2f619de	0	10	f	\N	\N
93c6a97f-97fb-4dc6-91f1-a7f250852d46	\N	no-cookie-redirect	c214cae2-06a9-4de8-9406-3a4f87bad41b	9f5b97ad-892b-4c88-a8bb-70f722722ef1	0	10	f	\N	\N
bb952c57-e51c-46cf-945e-331fc97d7cfb	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	9f5b97ad-892b-4c88-a8bb-70f722722ef1	0	20	t	2d16bd7d-51ed-472a-97f7-dd8a53c20097	\N
6b7065a5-adfd-429a-9e0d-25f0579c46aa	\N	basic-auth	c214cae2-06a9-4de8-9406-3a4f87bad41b	2d16bd7d-51ed-472a-97f7-dd8a53c20097	0	10	f	\N	\N
9dbc6a3b-d20f-4f0a-b26b-abd2323a0688	\N	basic-auth-otp	c214cae2-06a9-4de8-9406-3a4f87bad41b	2d16bd7d-51ed-472a-97f7-dd8a53c20097	3	20	f	\N	\N
8c683072-8a6c-450f-8af3-b4c89b8e0a8d	\N	auth-spnego	c214cae2-06a9-4de8-9406-3a4f87bad41b	2d16bd7d-51ed-472a-97f7-dd8a53c20097	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
43d57a9e-3ce6-4880-bd63-6667053456c3	browser	browser based authentication	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	t	t
c6858ba0-c428-498f-822a-5d57ac207d77	forms	Username, password, otp and other auth forms.	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
bac07ca5-c769-420e-98b9-18658b8cd639	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
e04b60ff-f609-46c8-b769-d4b3e966f320	direct grant	OpenID Connect Resource Owner Grant	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	t	t
8c3af8b1-5e74-48b5-ac22-7569478afc14	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
acce71a9-74bc-42b8-96b2-c368f6ddf0fa	registration	registration flow	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	t	t
5dc2795d-1f13-425d-80fc-ffabd35e4ddb	registration form	registration form	c214cae2-06a9-4de8-9406-3a4f87bad41b	form-flow	f	t
79dc8e40-f3cd-4b48-a1ec-2b9526eb67ed	reset credentials	Reset credentials for a user if they forgot their password or something	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	t	t
68c34893-8832-46ba-8ef8-b11911781b0c	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
5ede6740-c571-47bd-abdc-8d2f367b1154	clients	Base authentication for clients	c214cae2-06a9-4de8-9406-3a4f87bad41b	client-flow	t	t
68c24367-5d9e-44ac-b3c4-dfed30256c85	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	t	t
5660c8a6-2478-443f-9909-e9bcd665c512	User creation or linking	Flow for the existing/non-existing user alternatives	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
a61c4db8-87f0-4ccc-97e8-fbbb57eafdab	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
c2a51df8-2626-47ce-a8b5-744d54f12f0a	Account verification options	Method with which to verity the existing account	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
26975658-11e0-4269-82a0-1e8937b5f561	Verify Existing Account by Re-authentication	Reauthentication of existing account	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
f0cd809b-08cb-4616-b464-b5e6b50b9fc3	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
86e94813-9bdc-4637-8db6-26f4f423230c	saml ecp	SAML ECP Profile Authentication Flow	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	t	t
6a66048a-474c-4444-8366-a1aeb2f619de	docker auth	Used by Docker clients to authenticate against the IDP	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	t	t
9f5b97ad-892b-4c88-a8bb-70f722722ef1	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	t	t
2d16bd7d-51ed-472a-97f7-dd8a53c20097	Authentication Options	Authentication options.	c214cae2-06a9-4de8-9406-3a4f87bad41b	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.authenticator_config (id, alias, realm_id) FROM stdin;
a9d6e0bd-6039-4b05-a495-9aad14bd11a8	review profile config	c214cae2-06a9-4de8-9406-3a4f87bad41b
8fd851bb-5e42-4ab3-b97f-49ac96dabe22	create unique user config	c214cae2-06a9-4de8-9406-3a4f87bad41b
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
8fd851bb-5e42-4ab3-b97f-49ac96dabe22	false	require.password.update.after.registration
a9d6e0bd-6039-4b05-a495-9aad14bd11a8	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	f	master-realm	0	f	\N	\N	t	\N	f	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
d0ff74ad-541a-4f33-9bdc-294c2423e544	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	c214cae2-06a9-4de8-9406-3a4f87bad41b	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
f154d630-1dba-46d0-80f1-4bd5b80121e5	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	c214cae2-06a9-4de8-9406-3a4f87bad41b	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
483b7551-761b-46a1-86ac-8202cebaa83b	t	f	broker	0	f	\N	\N	t	\N	f	c214cae2-06a9-4de8-9406-3a4f87bad41b	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
4c8585f7-4bf3-407a-b001-49bed16762d1	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	c214cae2-06a9-4de8-9406-3a4f87bad41b	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
e480b49e-339e-4ead-86b7-111500431d37	t	f	admin-cli	0	t	\N	\N	f	\N	f	c214cae2-06a9-4de8-9406-3a4f87bad41b	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
bbddb453-b499-4be5-9e3c-161fe92f0bbc	t	t	platform	0	t	\N		f		f	c214cae2-06a9-4de8-9406-3a4f87bad41b	openid-connect	-1	f	f		f	client-secret			\N	t	f	t	f
c881c6a7-2177-4c06-b78f-2252ee3edfdc	t	t	currency	0	t	\N		f		f	c214cae2-06a9-4de8-9406-3a4f87bad41b	openid-connect	-1	f	f		f	client-secret			\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_attributes (client_id, name, value) FROM stdin;
d0ff74ad-541a-4f33-9bdc-294c2423e544	post.logout.redirect.uris	+
f154d630-1dba-46d0-80f1-4bd5b80121e5	post.logout.redirect.uris	+
f154d630-1dba-46d0-80f1-4bd5b80121e5	pkce.code.challenge.method	S256
4c8585f7-4bf3-407a-b001-49bed16762d1	post.logout.redirect.uris	+
4c8585f7-4bf3-407a-b001-49bed16762d1	pkce.code.challenge.method	S256
bbddb453-b499-4be5-9e3c-161fe92f0bbc	oauth2.device.authorization.grant.enabled	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	oidc.ciba.grant.enabled	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	id.token.as.detached.signature	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.assertion.signature	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.force.post.binding	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.multivalued.roles	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.encrypt	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	backchannel.logout.revoke.offline.tokens	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.server.signature	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.server.signature.keyinfo.ext	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	use.refresh.tokens	true
bbddb453-b499-4be5-9e3c-161fe92f0bbc	exclude.session.state.from.auth.response	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.artifact.binding	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	backchannel.logout.session.required	true
bbddb453-b499-4be5-9e3c-161fe92f0bbc	client_credentials.use_refresh_token	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml_force_name_id_format	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.client.signature	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	tls.client.certificate.bound.access.tokens	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.authnstatement	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	display.on.consent.screen	false
bbddb453-b499-4be5-9e3c-161fe92f0bbc	saml.onetimeuse.condition	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	oauth2.device.authorization.grant.enabled	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	oidc.ciba.grant.enabled	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	id.token.as.detached.signature	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.assertion.signature	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.force.post.binding	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.multivalued.roles	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.encrypt	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	backchannel.logout.revoke.offline.tokens	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.server.signature	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.server.signature.keyinfo.ext	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	use.refresh.tokens	true
c881c6a7-2177-4c06-b78f-2252ee3edfdc	exclude.session.state.from.auth.response	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.artifact.binding	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	backchannel.logout.session.required	true
c881c6a7-2177-4c06-b78f-2252ee3edfdc	client_credentials.use_refresh_token	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml_force_name_id_format	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.client.signature	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	tls.client.certificate.bound.access.tokens	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.authnstatement	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	display.on.consent.screen	false
c881c6a7-2177-4c06-b78f-2252ee3edfdc	saml.onetimeuse.condition	false
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_scope (id, name, realm_id, description, protocol) FROM stdin;
530bc68d-8ec3-4a70-aa02-45668d7f360a	offline_access	c214cae2-06a9-4de8-9406-3a4f87bad41b	OpenID Connect built-in scope: offline_access	openid-connect
49e0c94d-efbe-4810-bc18-cd5b4df54c2a	role_list	c214cae2-06a9-4de8-9406-3a4f87bad41b	SAML role list	saml
36715a57-f960-44e4-a4d9-c9a2eca3c242	profile	c214cae2-06a9-4de8-9406-3a4f87bad41b	OpenID Connect built-in scope: profile	openid-connect
f77b1411-65a4-4faa-8a8b-5e21745c7518	email	c214cae2-06a9-4de8-9406-3a4f87bad41b	OpenID Connect built-in scope: email	openid-connect
6807ba0b-21fe-4ade-8fe7-de90199d7cd8	address	c214cae2-06a9-4de8-9406-3a4f87bad41b	OpenID Connect built-in scope: address	openid-connect
17619410-8150-44c1-bc17-6409dca5f49c	phone	c214cae2-06a9-4de8-9406-3a4f87bad41b	OpenID Connect built-in scope: phone	openid-connect
d09f418b-83a4-4520-a8c6-dfa20ad879cb	roles	c214cae2-06a9-4de8-9406-3a4f87bad41b	OpenID Connect scope for add user roles to the access token	openid-connect
7965b5d4-957f-4194-aba7-c5de71c415f7	web-origins	c214cae2-06a9-4de8-9406-3a4f87bad41b	OpenID Connect scope for add allowed web origins to the access token	openid-connect
7874f9f8-3f97-4083-96f8-928f901b2c93	microprofile-jwt	c214cae2-06a9-4de8-9406-3a4f87bad41b	Microprofile - JWT built-in scope	openid-connect
80454ebd-2bda-48f9-8820-bed523ce88dc	acr	c214cae2-06a9-4de8-9406-3a4f87bad41b	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_scope_attributes (scope_id, value, name) FROM stdin;
530bc68d-8ec3-4a70-aa02-45668d7f360a	true	display.on.consent.screen
530bc68d-8ec3-4a70-aa02-45668d7f360a	${offlineAccessScopeConsentText}	consent.screen.text
49e0c94d-efbe-4810-bc18-cd5b4df54c2a	true	display.on.consent.screen
49e0c94d-efbe-4810-bc18-cd5b4df54c2a	${samlRoleListScopeConsentText}	consent.screen.text
36715a57-f960-44e4-a4d9-c9a2eca3c242	true	display.on.consent.screen
36715a57-f960-44e4-a4d9-c9a2eca3c242	${profileScopeConsentText}	consent.screen.text
36715a57-f960-44e4-a4d9-c9a2eca3c242	true	include.in.token.scope
f77b1411-65a4-4faa-8a8b-5e21745c7518	true	display.on.consent.screen
f77b1411-65a4-4faa-8a8b-5e21745c7518	${emailScopeConsentText}	consent.screen.text
f77b1411-65a4-4faa-8a8b-5e21745c7518	true	include.in.token.scope
6807ba0b-21fe-4ade-8fe7-de90199d7cd8	true	display.on.consent.screen
6807ba0b-21fe-4ade-8fe7-de90199d7cd8	${addressScopeConsentText}	consent.screen.text
6807ba0b-21fe-4ade-8fe7-de90199d7cd8	true	include.in.token.scope
17619410-8150-44c1-bc17-6409dca5f49c	true	display.on.consent.screen
17619410-8150-44c1-bc17-6409dca5f49c	${phoneScopeConsentText}	consent.screen.text
17619410-8150-44c1-bc17-6409dca5f49c	true	include.in.token.scope
d09f418b-83a4-4520-a8c6-dfa20ad879cb	true	display.on.consent.screen
d09f418b-83a4-4520-a8c6-dfa20ad879cb	${rolesScopeConsentText}	consent.screen.text
d09f418b-83a4-4520-a8c6-dfa20ad879cb	false	include.in.token.scope
7965b5d4-957f-4194-aba7-c5de71c415f7	false	display.on.consent.screen
7965b5d4-957f-4194-aba7-c5de71c415f7		consent.screen.text
7965b5d4-957f-4194-aba7-c5de71c415f7	false	include.in.token.scope
7874f9f8-3f97-4083-96f8-928f901b2c93	false	display.on.consent.screen
7874f9f8-3f97-4083-96f8-928f901b2c93	true	include.in.token.scope
80454ebd-2bda-48f9-8820-bed523ce88dc	false	display.on.consent.screen
80454ebd-2bda-48f9-8820-bed523ce88dc	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
d0ff74ad-541a-4f33-9bdc-294c2423e544	7965b5d4-957f-4194-aba7-c5de71c415f7	t
d0ff74ad-541a-4f33-9bdc-294c2423e544	80454ebd-2bda-48f9-8820-bed523ce88dc	t
d0ff74ad-541a-4f33-9bdc-294c2423e544	d09f418b-83a4-4520-a8c6-dfa20ad879cb	t
d0ff74ad-541a-4f33-9bdc-294c2423e544	36715a57-f960-44e4-a4d9-c9a2eca3c242	t
d0ff74ad-541a-4f33-9bdc-294c2423e544	f77b1411-65a4-4faa-8a8b-5e21745c7518	t
d0ff74ad-541a-4f33-9bdc-294c2423e544	6807ba0b-21fe-4ade-8fe7-de90199d7cd8	f
d0ff74ad-541a-4f33-9bdc-294c2423e544	530bc68d-8ec3-4a70-aa02-45668d7f360a	f
d0ff74ad-541a-4f33-9bdc-294c2423e544	7874f9f8-3f97-4083-96f8-928f901b2c93	f
d0ff74ad-541a-4f33-9bdc-294c2423e544	17619410-8150-44c1-bc17-6409dca5f49c	f
f154d630-1dba-46d0-80f1-4bd5b80121e5	7965b5d4-957f-4194-aba7-c5de71c415f7	t
f154d630-1dba-46d0-80f1-4bd5b80121e5	80454ebd-2bda-48f9-8820-bed523ce88dc	t
f154d630-1dba-46d0-80f1-4bd5b80121e5	d09f418b-83a4-4520-a8c6-dfa20ad879cb	t
f154d630-1dba-46d0-80f1-4bd5b80121e5	36715a57-f960-44e4-a4d9-c9a2eca3c242	t
f154d630-1dba-46d0-80f1-4bd5b80121e5	f77b1411-65a4-4faa-8a8b-5e21745c7518	t
f154d630-1dba-46d0-80f1-4bd5b80121e5	6807ba0b-21fe-4ade-8fe7-de90199d7cd8	f
f154d630-1dba-46d0-80f1-4bd5b80121e5	530bc68d-8ec3-4a70-aa02-45668d7f360a	f
f154d630-1dba-46d0-80f1-4bd5b80121e5	7874f9f8-3f97-4083-96f8-928f901b2c93	f
f154d630-1dba-46d0-80f1-4bd5b80121e5	17619410-8150-44c1-bc17-6409dca5f49c	f
e480b49e-339e-4ead-86b7-111500431d37	7965b5d4-957f-4194-aba7-c5de71c415f7	t
e480b49e-339e-4ead-86b7-111500431d37	80454ebd-2bda-48f9-8820-bed523ce88dc	t
e480b49e-339e-4ead-86b7-111500431d37	d09f418b-83a4-4520-a8c6-dfa20ad879cb	t
e480b49e-339e-4ead-86b7-111500431d37	36715a57-f960-44e4-a4d9-c9a2eca3c242	t
e480b49e-339e-4ead-86b7-111500431d37	f77b1411-65a4-4faa-8a8b-5e21745c7518	t
e480b49e-339e-4ead-86b7-111500431d37	6807ba0b-21fe-4ade-8fe7-de90199d7cd8	f
e480b49e-339e-4ead-86b7-111500431d37	530bc68d-8ec3-4a70-aa02-45668d7f360a	f
e480b49e-339e-4ead-86b7-111500431d37	7874f9f8-3f97-4083-96f8-928f901b2c93	f
e480b49e-339e-4ead-86b7-111500431d37	17619410-8150-44c1-bc17-6409dca5f49c	f
483b7551-761b-46a1-86ac-8202cebaa83b	7965b5d4-957f-4194-aba7-c5de71c415f7	t
483b7551-761b-46a1-86ac-8202cebaa83b	80454ebd-2bda-48f9-8820-bed523ce88dc	t
483b7551-761b-46a1-86ac-8202cebaa83b	d09f418b-83a4-4520-a8c6-dfa20ad879cb	t
483b7551-761b-46a1-86ac-8202cebaa83b	36715a57-f960-44e4-a4d9-c9a2eca3c242	t
483b7551-761b-46a1-86ac-8202cebaa83b	f77b1411-65a4-4faa-8a8b-5e21745c7518	t
483b7551-761b-46a1-86ac-8202cebaa83b	6807ba0b-21fe-4ade-8fe7-de90199d7cd8	f
483b7551-761b-46a1-86ac-8202cebaa83b	530bc68d-8ec3-4a70-aa02-45668d7f360a	f
483b7551-761b-46a1-86ac-8202cebaa83b	7874f9f8-3f97-4083-96f8-928f901b2c93	f
483b7551-761b-46a1-86ac-8202cebaa83b	17619410-8150-44c1-bc17-6409dca5f49c	f
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	7965b5d4-957f-4194-aba7-c5de71c415f7	t
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	80454ebd-2bda-48f9-8820-bed523ce88dc	t
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	d09f418b-83a4-4520-a8c6-dfa20ad879cb	t
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	36715a57-f960-44e4-a4d9-c9a2eca3c242	t
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	f77b1411-65a4-4faa-8a8b-5e21745c7518	t
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	6807ba0b-21fe-4ade-8fe7-de90199d7cd8	f
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	530bc68d-8ec3-4a70-aa02-45668d7f360a	f
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	7874f9f8-3f97-4083-96f8-928f901b2c93	f
a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	17619410-8150-44c1-bc17-6409dca5f49c	f
4c8585f7-4bf3-407a-b001-49bed16762d1	7965b5d4-957f-4194-aba7-c5de71c415f7	t
4c8585f7-4bf3-407a-b001-49bed16762d1	80454ebd-2bda-48f9-8820-bed523ce88dc	t
4c8585f7-4bf3-407a-b001-49bed16762d1	d09f418b-83a4-4520-a8c6-dfa20ad879cb	t
4c8585f7-4bf3-407a-b001-49bed16762d1	36715a57-f960-44e4-a4d9-c9a2eca3c242	t
4c8585f7-4bf3-407a-b001-49bed16762d1	f77b1411-65a4-4faa-8a8b-5e21745c7518	t
4c8585f7-4bf3-407a-b001-49bed16762d1	6807ba0b-21fe-4ade-8fe7-de90199d7cd8	f
4c8585f7-4bf3-407a-b001-49bed16762d1	530bc68d-8ec3-4a70-aa02-45668d7f360a	f
4c8585f7-4bf3-407a-b001-49bed16762d1	7874f9f8-3f97-4083-96f8-928f901b2c93	f
4c8585f7-4bf3-407a-b001-49bed16762d1	17619410-8150-44c1-bc17-6409dca5f49c	f
bbddb453-b499-4be5-9e3c-161fe92f0bbc	7965b5d4-957f-4194-aba7-c5de71c415f7	t
bbddb453-b499-4be5-9e3c-161fe92f0bbc	36715a57-f960-44e4-a4d9-c9a2eca3c242	t
bbddb453-b499-4be5-9e3c-161fe92f0bbc	d09f418b-83a4-4520-a8c6-dfa20ad879cb	t
bbddb453-b499-4be5-9e3c-161fe92f0bbc	f77b1411-65a4-4faa-8a8b-5e21745c7518	t
bbddb453-b499-4be5-9e3c-161fe92f0bbc	6807ba0b-21fe-4ade-8fe7-de90199d7cd8	f
bbddb453-b499-4be5-9e3c-161fe92f0bbc	17619410-8150-44c1-bc17-6409dca5f49c	f
bbddb453-b499-4be5-9e3c-161fe92f0bbc	530bc68d-8ec3-4a70-aa02-45668d7f360a	f
bbddb453-b499-4be5-9e3c-161fe92f0bbc	7874f9f8-3f97-4083-96f8-928f901b2c93	f
c881c6a7-2177-4c06-b78f-2252ee3edfdc	7965b5d4-957f-4194-aba7-c5de71c415f7	t
c881c6a7-2177-4c06-b78f-2252ee3edfdc	36715a57-f960-44e4-a4d9-c9a2eca3c242	t
c881c6a7-2177-4c06-b78f-2252ee3edfdc	d09f418b-83a4-4520-a8c6-dfa20ad879cb	t
c881c6a7-2177-4c06-b78f-2252ee3edfdc	f77b1411-65a4-4faa-8a8b-5e21745c7518	t
c881c6a7-2177-4c06-b78f-2252ee3edfdc	6807ba0b-21fe-4ade-8fe7-de90199d7cd8	f
c881c6a7-2177-4c06-b78f-2252ee3edfdc	17619410-8150-44c1-bc17-6409dca5f49c	f
c881c6a7-2177-4c06-b78f-2252ee3edfdc	530bc68d-8ec3-4a70-aa02-45668d7f360a	f
c881c6a7-2177-4c06-b78f-2252ee3edfdc	7874f9f8-3f97-4083-96f8-928f901b2c93	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_scope_role_mapping (scope_id, role_id) FROM stdin;
530bc68d-8ec3-4a70-aa02-45668d7f360a	5d26a3b9-6df9-4c2f-90b4-005bc9bca003
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
2fd5f40d-2f20-4301-ab26-b4e3cf4732a8	Trusted Hosts	c214cae2-06a9-4de8-9406-3a4f87bad41b	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c214cae2-06a9-4de8-9406-3a4f87bad41b	anonymous
6c64f90f-2755-42bf-b5af-9ab651349890	Consent Required	c214cae2-06a9-4de8-9406-3a4f87bad41b	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c214cae2-06a9-4de8-9406-3a4f87bad41b	anonymous
c5ce56c9-79f5-4ce5-8e6c-004d6f4cbfd3	Full Scope Disabled	c214cae2-06a9-4de8-9406-3a4f87bad41b	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c214cae2-06a9-4de8-9406-3a4f87bad41b	anonymous
5d24e676-b6e3-457c-a8e6-c1009ca13f34	Max Clients Limit	c214cae2-06a9-4de8-9406-3a4f87bad41b	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c214cae2-06a9-4de8-9406-3a4f87bad41b	anonymous
eba754c0-85ef-4f41-bdd7-37c744a8864a	Allowed Protocol Mapper Types	c214cae2-06a9-4de8-9406-3a4f87bad41b	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c214cae2-06a9-4de8-9406-3a4f87bad41b	anonymous
8228b40d-99d6-40d5-9a1e-2e3e0fa80302	Allowed Client Scopes	c214cae2-06a9-4de8-9406-3a4f87bad41b	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c214cae2-06a9-4de8-9406-3a4f87bad41b	anonymous
c0999090-f87f-408b-9781-18aaab9235d8	Allowed Protocol Mapper Types	c214cae2-06a9-4de8-9406-3a4f87bad41b	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c214cae2-06a9-4de8-9406-3a4f87bad41b	authenticated
40037763-11d3-4f79-8b4a-e4e4ababd3a0	Allowed Client Scopes	c214cae2-06a9-4de8-9406-3a4f87bad41b	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c214cae2-06a9-4de8-9406-3a4f87bad41b	authenticated
89a11587-3fa6-43b7-a175-83f30151d139	rsa-generated	c214cae2-06a9-4de8-9406-3a4f87bad41b	rsa-generated	org.keycloak.keys.KeyProvider	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N
974174ab-0036-4d86-acdd-e32a52f30bce	rsa-enc-generated	c214cae2-06a9-4de8-9406-3a4f87bad41b	rsa-enc-generated	org.keycloak.keys.KeyProvider	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N
33416792-08db-409d-b0d2-7520854d69fc	hmac-generated	c214cae2-06a9-4de8-9406-3a4f87bad41b	hmac-generated	org.keycloak.keys.KeyProvider	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N
5b78ca93-1bca-404b-84ea-852a5dfda95d	aes-generated	c214cae2-06a9-4de8-9406-3a4f87bad41b	aes-generated	org.keycloak.keys.KeyProvider	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.component_config (id, component_id, name, value) FROM stdin;
3b9ba146-ff7e-48bc-a081-d00fe30ae48e	8228b40d-99d6-40d5-9a1e-2e3e0fa80302	allow-default-scopes	true
4279302b-3c06-4496-a70a-f8619ee78fd9	2fd5f40d-2f20-4301-ab26-b4e3cf4732a8	client-uris-must-match	true
c868f5ae-ef3c-4ef8-bdf7-5dd6b17d86f9	2fd5f40d-2f20-4301-ab26-b4e3cf4732a8	host-sending-registration-request-must-match	true
18514a79-8113-4dba-8189-860a769f4531	c0999090-f87f-408b-9781-18aaab9235d8	allowed-protocol-mapper-types	saml-user-attribute-mapper
e45b99ff-8be6-4dae-b829-bb7e5f444e1a	c0999090-f87f-408b-9781-18aaab9235d8	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
99610cb6-b02f-4bd1-b4b8-1a50e5c89b7e	c0999090-f87f-408b-9781-18aaab9235d8	allowed-protocol-mapper-types	oidc-full-name-mapper
6d956fe8-806a-4086-b3c2-7672ba51ff93	c0999090-f87f-408b-9781-18aaab9235d8	allowed-protocol-mapper-types	saml-user-property-mapper
a13cac23-e043-43d1-a573-bdc1730a9c9d	c0999090-f87f-408b-9781-18aaab9235d8	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
a4e5feb1-7459-440e-a740-fd1f22d128b5	c0999090-f87f-408b-9781-18aaab9235d8	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
0f97e241-a34c-4205-992e-296330f9a60c	c0999090-f87f-408b-9781-18aaab9235d8	allowed-protocol-mapper-types	saml-role-list-mapper
83724626-ca74-4873-9b24-afaf4e191169	c0999090-f87f-408b-9781-18aaab9235d8	allowed-protocol-mapper-types	oidc-address-mapper
9a17d13e-c271-4ce3-8c37-1df0201ab869	40037763-11d3-4f79-8b4a-e4e4ababd3a0	allow-default-scopes	true
d16a1f30-76bc-443c-a1d4-08b20472fd34	5d24e676-b6e3-457c-a8e6-c1009ca13f34	max-clients	200
96399883-d9db-4a97-a4b2-12091348cff1	eba754c0-85ef-4f41-bdd7-37c744a8864a	allowed-protocol-mapper-types	saml-role-list-mapper
2e6919aa-98e1-4628-a5d4-586c5b5b098d	eba754c0-85ef-4f41-bdd7-37c744a8864a	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
2abc27ae-8c43-4f36-98c4-585dc370481d	eba754c0-85ef-4f41-bdd7-37c744a8864a	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
eb52522a-f4c2-451e-a187-6e1afe5c6d69	eba754c0-85ef-4f41-bdd7-37c744a8864a	allowed-protocol-mapper-types	saml-user-property-mapper
f7c94341-b4ac-4f02-a7a2-8291b1fd307e	eba754c0-85ef-4f41-bdd7-37c744a8864a	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
78c6378c-a796-4453-b7dd-cbea54d352c8	eba754c0-85ef-4f41-bdd7-37c744a8864a	allowed-protocol-mapper-types	oidc-address-mapper
8c57d261-244b-4dd0-88ee-8bb511f2b936	eba754c0-85ef-4f41-bdd7-37c744a8864a	allowed-protocol-mapper-types	oidc-full-name-mapper
4ad37f44-a501-4a89-b0a1-a012d0f2fffe	eba754c0-85ef-4f41-bdd7-37c744a8864a	allowed-protocol-mapper-types	saml-user-attribute-mapper
59c233a9-95bf-4db8-983d-7c3cfc5c74be	89a11587-3fa6-43b7-a175-83f30151d139	certificate	MIICmzCCAYMCBgGJIOueZTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNzA0MTIzOTE5WhcNMzMwNzA0MTI0MDU5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvPAOYFqpBQpEDlFlKDC/6nfF2Yv5dcT6cFYsdhmRFMi4gavH6gDEoIIhpvAI6CKfTyCdbofqvHidSr67m62dXwYNslal0OWM8l9bAMVMygG/4Zqu8qtGqore7hLUMa9rBd8w+OIkaomYWpP7YdJ8L6MJaoJBdMOXOUH1j/sHW3hmtfiBBKMGdma3AMm2Uji+z1R5c/pYvQZzRb/bKEuiSU0lYlVsyh5Lb/cQYKOd5YHqlAXEFhS7B9YqPznpoIqLfgnBLh+kiBqUUEN6DLpin4LSffNpdodNnv0Ym5L1Se2lUdbnByN9Pr55Yr4OEORZXR8KpiigaX4FNeEWY2LhNAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHlMLWjMaAlxuJg0qgnSUOxa+lau1kD9wXw8q0SK25j4kk8BINSD+C3Om8AhDskv8ZEbG5CoU+YZrIMwC3XZ83eWyRw3Xepf80tICTFGQVoepWx4Y8IZLzALrMxx0mfLa4+qqzr3I/0T+zZtogiTqE1E5mtity3v7T2hxAvLRc9UO1hHiwNpykMa2zqPwUh6k+51E5J2D5nMYbbqN2nM6HMGGR5E1iewyqQnqalP5POx4OvItlE++dNRo2Vkqd7CgWuE6FM4Ja30QqZMOjWVKZm81mzsXB/sDgCgkD2Ogu1e/9Ytr/qJPi//yQv58Nl3MQGB3BVGX1kUDbTCNCrn2kY=
59ab2899-28a1-461a-8c45-30f24efbe430	89a11587-3fa6-43b7-a175-83f30151d139	keyUse	SIG
b4634e9f-5b7d-4a97-afe8-630a387ba3b6	89a11587-3fa6-43b7-a175-83f30151d139	privateKey	MIIEpAIBAAKCAQEArzwDmBaqQUKRA5RZSgwv+p3xdmL+XXE+nBWLHYZkRTIuIGrx+oAxKCCIabwCOgin08gnW6H6rx4nUq+u5utnV8GDbJWpdDljPJfWwDFTMoBv+GarvKrRqqK3u4S1DGvawXfMPjiJGqJmFqT+2HSfC+jCWqCQXTDlzlB9Y/7B1t4ZrX4gQSjBnZmtwDJtlI4vs9UeXP6WL0Gc0W/2yhLoklNJWJVbMoeS2/3EGCjneWB6pQFxBYUuwfWKj856aCKi34JwS4fpIgalFBDegy6Yp+C0n3zaXaHTZ79GJuS9UntpVHW5wcjfT6+eWK+DhDkWV0fCqYooGl+BTXhFmNi4TQIDAQABAoIBAAl4RHgfSXDLaHYkDzXkNgzkz4a7+iO8mfXqEsw0ALkzPrDmdqXjRZogip6u2AP2Mcj3zmtc8+TWIVPjm0puuvVQHN/CWsJQKPUTqORWsLilnjzIokvzg0R7FKjKltTRWKS56ky2gMTytRz7f6uHlIzFNbObbRHMMa8WRHXMmlcX2gLoGBBNHdeRO4vrP7YSDyGvQFY/blzCDlCdh2FT0Lp2wfGx660hE3XIT0oOpnUR+gQ+YKS1HGwqMDQuNacT8HiBGzE533OL+mSOateKhpFQLL1PSiicwC/bTSqDSyeZtWolgZYzaBO6vykso3GwfdZZnfLwcBz6wdL7ngMGotUCgYEA2ygWXIR0k2t9Jkm/oFv+j87Dkj/MRvXDzpf4nIJp9Dbs7GhOwYUD5OGkEPfeCYN5iriwxt4fM1ZX/H4ih80ivWEeT11X2OgLibxKYntXwkyQekKQNhTpvfObatUTyTNOjY6r/uOIxuRNadGXs6QWu0aBQWtnO9PzEIV6/LCO8jcCgYEAzLGib5iS3zzyyjdu2lRDA8iPxlyUsJltlb9eV+GCyRBV7OqZbuIOtVAR3rXArJZ7bEfwzWW/Ys/4s1Dji3xnzIAJOCg/9vg4mW/b7G7ETRR+zFBxB3Zod54NeL1pUyHujM10phibWASii15dR2H7Z9jLyLCUYNxGN6YUxuWv95sCgYBSyajw2CSFkARd01wtQrM+NfhRJgKQB8UpJOWIkgdeduU3RQwDNLFM5CQrOMdKxrzCN5Sn+z7EEOj5+9glfsuRyL8/cd5+lOHO7S8YVsnHH08wsDZ0B6Bo3j6ms8lepyAUf4Hfrqp7n8DSqZdqCCGCK1cmlGESC7X1Vscn77aALwKBgQCkfyBV5FwrsLRAk9mu9UZBtRztwRrw7OvnCrpLj3vmDw2ubj3NoTdGuEkUHCXxzKD1PL8koV7zjsSDfj7OqrRT4JUIHziARaxeiklHsSBp/U2E7iRXZe3AKzESVc1dtIgbeUUD8gRs8JSbwcLeibxbERt7dYRYbsyzDfHmgVEvfwKBgQC3BZ2GpXUgSChxPgDf0dX3O0XXgwng4hfbFhZsRs45bvBBzpsuJ6l1NLDZdIBavfyoDo486lAXjiodSX5CziBbURYvrTrkU+xCVIvVguUvIvesWCocEj0KotdZmb4d4NoaBuSMiimTboHCpe+mptlhLeFgDWF+OEx53UuTPLaC5A==
c8cd4333-5882-4393-9265-1a7fc6ef164a	89a11587-3fa6-43b7-a175-83f30151d139	priority	100
74c7ea50-15aa-4dff-a92a-62d9d8f0e21b	974174ab-0036-4d86-acdd-e32a52f30bce	priority	100
76f71590-cd0b-4c23-bf63-cfffe2fe8f49	974174ab-0036-4d86-acdd-e32a52f30bce	keyUse	ENC
0088e1a7-74ae-4728-8ad8-52ef9879a028	974174ab-0036-4d86-acdd-e32a52f30bce	certificate	MIICmzCCAYMCBgGJIOufGzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNzA0MTIzOTE5WhcNMzMwNzA0MTI0MDU5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCoeZhJKd0WBQW100bAkv1+rmMCF4nomB4z3L0Wrk+HqVk4robhpz0cuz9FfFFjaKvZTbyte+VjQKo3tM3JPEC/KBXDBuOsbBDsj4z4C46nz/+pURFmZvwUk7LIH0pbAfNEbmbslDzsGWleMpAgFOTpnKM5oi4AUoo/Ttkhner1as0stIgP8U4ETQ1+fHSquXMBDGMx13f8EiD3dwg+qQdD8Nye9kpy/GnSpc8ujeoPqgR/PuPwOLoz+vUK2efnOVBl7PmR/qyo/Kpsq+fYay4Q6e7OerodXIwka7b/tqL4NbkaHAHwYziaW00fvBzX8ZtRMEj62UkAXJoIlZCvTYu3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIKGIzbxj1hAL7yukL45ngaQS09qZkFOxuktNjbNUYB49eFfe5xqZZ95n2/3gdi6/OpwgGsmdWgvxyXzwuu+sVtN1Uuss328mp2xNYKtZ7/mMU8cdDeVxLyY/Aq6D8rZSP4vi/GnjVaScqEgCKTRE1e2LXfwSJxf7TRo9g1ODJXXmMWX6n5C33HtfcNDZ7pwV2gr9U270d9SQ67erGM1rrDIMkcXqsQO4fiC0sSYZd2i4AVvMEsWCwvZFdAeZqlpPAwCCbBMFBzqRl03o7VhhARl7iY8AjaSI5StFN41AI30IXOwvwuniCsDUlObnBbiwhOXqWeJHNnY5q1zQjPP0Fg=
dc630f9d-939d-445c-b3eb-ae2af399c0fb	974174ab-0036-4d86-acdd-e32a52f30bce	algorithm	RSA-OAEP
1aa31f4f-678c-45e5-96c6-351ba8db13c8	974174ab-0036-4d86-acdd-e32a52f30bce	privateKey	MIIEpAIBAAKCAQEAqHmYSSndFgUFtdNGwJL9fq5jAheJ6JgeM9y9Fq5Ph6lZOK6G4ac9HLs/RXxRY2ir2U28rXvlY0CqN7TNyTxAvygVwwbjrGwQ7I+M+AuOp8//qVERZmb8FJOyyB9KWwHzRG5m7JQ87BlpXjKQIBTk6ZyjOaIuAFKKP07ZIZ3q9WrNLLSID/FOBE0Nfnx0qrlzAQxjMdd3/BIg93cIPqkHQ/DcnvZKcvxp0qXPLo3qD6oEfz7j8Di6M/r1Ctnn5zlQZez5kf6sqPyqbKvn2GsuEOnuznq6HVyMJGu2/7ai+DW5GhwB8GM4mltNH7wc1/GbUTBI+tlJAFyaCJWQr02LtwIDAQABAoIBAAw/fss+4GRT7CTaXcftR8GYcvk5ddyzhmqVzydhd8WwkZx1z7eC/YXjtQdbsN0NxISRSrjAC56qGlXfbqCFIV3kT6S0kQO9fYN9Mi3sRSw9CmSoUKAFt6jVTgePgsvX+fQNJK1pX354oHjpKyIx8qxrJ1Cu0jJSzdspY862WNkLktRm1Hjh1LSBpTdfrSTyKxyAv+5vx1GqgMvfUi9DvxoACEwbpnzduOq3FcYKJb+YSgTk9C1goijQ+A3VshSk23JaKdKM9eQe5JPzXulKqSZFi2BUzWL0zQ3HS087GJ4BHT3R9q/9z7AEpDCNJhBuIk2O6x4EJMwofYWQMv+P/wkCgYEA5RxdxIVeEqZ1Zf+KzxFPx/rPyGaUJ8H8+tSUEO+uJQbCegEbKvsjkzLR7MhauskFFLsa7N0uSqXhMVtrPSkcW5TCzre8S+i7LjHc9i3nPYoqAB5MLBMzEcLnOMqaZX20ywq3imJknc6zGs/0W7srh4LacleAwWZspDIC72h+8S8CgYEAvD9s4Xwa83Ttgr43tfQlqzQF1GkBSp1wtUgWu4dLI0RLFptjHDdwgUbE1yLMiyR4MxuWtAcKyHSLdy7r/5eQjZbOp5OyFlRgSgbagOdH7O4XIR8Ey1wCvNdwEhKza3CT7/iZf7KBMAPQl0Lkw0HkGa3evCAfEx+vO2PD5dKrG/kCgYAgF6UazgOrYR24t97dunMOdBd+3r+KAiZJjFVhOfGOxi+fn2AK2TrWd5voKvhqiZXonXzcCO9fDXVJ0KBo5MVQHrpa8mmxyFvP0LQ+15c4i43ujk/lLJtOtZpl3htadA1LE6k5/SZS5I06CD8WSlWCmdW3hoJGlO5K4aZ/moeNiQKBgQCNqo2eA2+k19IGGnCClgHjHXtlpsA6DtHLGz1AU0jQeYyorreffHlGUKPB44ZbEE8E5zY6tTIAOPTb9IvWBZHbfCp5IkVbWJQ+IXo+l88hFuyBGH7bK5tD0j2c3EX6DPbIGSYrW4KtR7Gqo8TUzLmEObzthp7cHXQaFbJPOoNawQKBgQDh0Zq+tOB+RGMF8hGKpee82gO6OU8aeByME8mKdNDlvXAP6/ojrvK4dePwwbc3RRadnCHNuBCalSuezvjOzSVnu+cNi3giD7LLpWW6SMXv/OB1FMTYrDU31CcZepliqnxiGXUBZ3+qv9INeBhitHPOemnOblE2d9I9lYy4R0PwlQ==
745909bb-1c2a-4c45-94b4-f973a56bc8b1	33416792-08db-409d-b0d2-7520854d69fc	algorithm	HS256
4787cb76-6287-4afe-9f91-70e417c1c0b7	33416792-08db-409d-b0d2-7520854d69fc	priority	100
fc18d3b9-4565-467d-bc84-937c56061f7f	33416792-08db-409d-b0d2-7520854d69fc	secret	BaZppX2Ug5IpTJaGyWtN5vopGA3WuKKqR4AiwO8fbzIBUotBHY1ZSmDHFugVyMMB3wG0xxrOykJxhy5yD6_MfA
a484fe85-caed-487b-b68b-bdd964f41313	33416792-08db-409d-b0d2-7520854d69fc	kid	cf73ed38-317b-4bfe-b4f8-f06d6cdc38ca
b496d173-f5ff-4889-9ecd-6c76a1a97331	5b78ca93-1bca-404b-84ea-852a5dfda95d	kid	a9958426-8127-4bcc-afda-56eef8f57ad1
8668fd53-378b-43e4-a842-f44460d19166	5b78ca93-1bca-404b-84ea-852a5dfda95d	priority	100
066086eb-3c97-43e4-a771-0306ab8a1c90	5b78ca93-1bca-404b-84ea-852a5dfda95d	secret	DZL2smqLoERBW-OJFTx0Lg
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.composite_role (composite, child_role) FROM stdin;
b255879f-e482-46c0-91f8-20aa8839bb98	ad31cc9a-8eaf-4423-b2e6-b8748f3508c2
b255879f-e482-46c0-91f8-20aa8839bb98	0973614c-fafe-4de6-bf6e-b2496b86ce76
b255879f-e482-46c0-91f8-20aa8839bb98	991b4450-e6da-4b6c-80e7-63807938ed7b
b255879f-e482-46c0-91f8-20aa8839bb98	2ed2cb27-a69f-4ad4-8cdb-d34ef6d51302
b255879f-e482-46c0-91f8-20aa8839bb98	48884aa5-593e-45ff-a009-6a1710e207ca
b255879f-e482-46c0-91f8-20aa8839bb98	af04e0d3-c0c3-40d0-8ef1-985abce05b16
b255879f-e482-46c0-91f8-20aa8839bb98	e0e686bc-1e43-4e55-ae25-1a48e890de21
b255879f-e482-46c0-91f8-20aa8839bb98	1d5bd41a-38c1-4101-ae0a-a088ab407809
b255879f-e482-46c0-91f8-20aa8839bb98	b0adfa8e-737b-46fc-a4ae-87fbd227ef7e
b255879f-e482-46c0-91f8-20aa8839bb98	99245969-3cd4-4e25-a84c-24870706cc0d
b255879f-e482-46c0-91f8-20aa8839bb98	56bc0790-ef60-44d6-8dc8-29209cea2364
b255879f-e482-46c0-91f8-20aa8839bb98	8558e765-08af-4038-98f9-169f3701e22d
b255879f-e482-46c0-91f8-20aa8839bb98	2fe75c1e-e0da-4615-82be-2d2efbbf0540
b255879f-e482-46c0-91f8-20aa8839bb98	6854d5a0-baa5-441c-8c22-f170fd7e0e25
b255879f-e482-46c0-91f8-20aa8839bb98	5ee4bdc0-f0bc-44b3-b784-4633a0545057
b255879f-e482-46c0-91f8-20aa8839bb98	a6b768d8-c26a-46d4-af86-1256cf22a65e
b255879f-e482-46c0-91f8-20aa8839bb98	7f650c70-4e59-4050-8aa2-685c3e3a83ea
b255879f-e482-46c0-91f8-20aa8839bb98	6857daa5-424b-47ac-9c40-140a44a30b6d
2ed2cb27-a69f-4ad4-8cdb-d34ef6d51302	6857daa5-424b-47ac-9c40-140a44a30b6d
2ed2cb27-a69f-4ad4-8cdb-d34ef6d51302	5ee4bdc0-f0bc-44b3-b784-4633a0545057
48884aa5-593e-45ff-a009-6a1710e207ca	a6b768d8-c26a-46d4-af86-1256cf22a65e
fe099b6d-76e7-4fe9-b516-2f9663277e0d	d309855f-5566-4e53-a03b-3e9381a8c6a0
fe099b6d-76e7-4fe9-b516-2f9663277e0d	d9db8ad2-d78f-480a-ae9c-a4b72ace1d4c
d9db8ad2-d78f-480a-ae9c-a4b72ace1d4c	1e0bf701-d5d8-4db1-97f3-cf77c30cb60c
7bad07df-1eaa-428d-91de-c65515824434	1abb2930-c797-48e1-a36c-b9c553a67262
b255879f-e482-46c0-91f8-20aa8839bb98	8ecf4ff3-aba4-4243-b82e-1443ce1bc8a6
fe099b6d-76e7-4fe9-b516-2f9663277e0d	5d26a3b9-6df9-4c2f-90b4-005bc9bca003
fe099b6d-76e7-4fe9-b516-2f9663277e0d	7dfc511e-d6a9-4f15-bd3e-e89dc2f003b0
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
7f75e453-c877-466b-a7a9-c2011da71b96	\N	password	cdf28582-6c1b-494a-b7ef-1e84be3d138e	1688474460281	\N	{"value":"R9MmEPaMBr3EM/p1Fmn0MDlQqt5BPHytgGZl30g/AHw=","salt":"mkR6uEpUzMXLdvk0fT6X5A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1552fea0-ec78-4024-8397-e962cb96d6d8	\N	password	8ee9a746-eeea-4d8f-8308-efa865474ff8	1688474794130	My password	{"value":"Tjng308U537o0asyiu3xNQxFhrVPrVIyrx4DoBSjwx0=","salt":"kY/2EiNtw+BYyO9gw1XmpA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-07-04 12:40:57.106993	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.16.1	\N	\N	8474456645
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-07-04 12:40:57.13091	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.16.1	\N	\N	8474456645
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-07-04 12:40:57.173288	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.16.1	\N	\N	8474456645
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-07-04 12:40:57.175365	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.16.1	\N	\N	8474456645
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-07-04 12:40:57.315175	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.16.1	\N	\N	8474456645
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-07-04 12:40:57.319644	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.16.1	\N	\N	8474456645
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-07-04 12:40:57.412464	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.16.1	\N	\N	8474456645
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-07-04 12:40:57.413818	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.16.1	\N	\N	8474456645
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-07-04 12:40:57.417398	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.16.1	\N	\N	8474456645
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-07-04 12:40:57.536462	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.16.1	\N	\N	8474456645
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-07-04 12:40:57.600114	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	8474456645
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-07-04 12:40:57.601216	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	8474456645
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-07-04 12:40:57.610463	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	8474456645
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-07-04 12:40:57.635848	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.16.1	\N	\N	8474456645
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-07-04 12:40:57.636786	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	8474456645
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-07-04 12:40:57.637885	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.16.1	\N	\N	8474456645
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-07-04 12:40:57.639177	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.16.1	\N	\N	8474456645
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-07-04 12:40:57.698197	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.16.1	\N	\N	8474456645
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-07-04 12:40:57.74618	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.16.1	\N	\N	8474456645
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-07-04 12:40:57.752326	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.16.1	\N	\N	8474456645
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-07-04 12:40:57.75342	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.16.1	\N	\N	8474456645
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-07-04 12:40:57.759115	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.16.1	\N	\N	8474456645
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-07-04 12:40:57.779471	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.16.1	\N	\N	8474456645
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-07-04 12:40:57.782387	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.16.1	\N	\N	8474456645
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-07-04 12:40:57.783265	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.16.1	\N	\N	8474456645
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-07-04 12:40:57.818047	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.16.1	\N	\N	8474456645
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-07-04 12:40:57.91911	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.16.1	\N	\N	8474456645
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-07-04 12:40:57.921783	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.16.1	\N	\N	8474456645
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-07-04 12:40:57.994794	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.16.1	\N	\N	8474456645
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-07-04 12:40:58.015418	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.16.1	\N	\N	8474456645
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-07-04 12:40:58.032065	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.16.1	\N	\N	8474456645
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-07-04 12:40:58.034302	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.16.1	\N	\N	8474456645
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-07-04 12:40:58.0363	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	8474456645
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-07-04 12:40:58.0369	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.16.1	\N	\N	8474456645
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-07-04 12:40:58.063359	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.16.1	\N	\N	8474456645
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-07-04 12:40:58.065634	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.16.1	\N	\N	8474456645
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-07-04 12:40:58.071527	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	8474456645
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-07-04 12:40:58.073428	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.16.1	\N	\N	8474456645
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-07-04 12:40:58.075212	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.16.1	\N	\N	8474456645
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-07-04 12:40:58.075897	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.16.1	\N	\N	8474456645
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-07-04 12:40:58.076766	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.16.1	\N	\N	8474456645
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-07-04 12:40:58.079194	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.16.1	\N	\N	8474456645
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-07-04 12:40:58.223968	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.16.1	\N	\N	8474456645
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-07-04 12:40:58.226124	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.16.1	\N	\N	8474456645
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-07-04 12:40:58.228673	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.16.1	\N	\N	8474456645
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-07-04 12:40:58.234611	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.16.1	\N	\N	8474456645
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-07-04 12:40:58.235305	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.16.1	\N	\N	8474456645
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-07-04 12:40:58.29684	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.16.1	\N	\N	8474456645
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-07-04 12:40:58.299448	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.16.1	\N	\N	8474456645
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-07-04 12:40:58.351371	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.16.1	\N	\N	8474456645
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-07-04 12:40:58.382065	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.16.1	\N	\N	8474456645
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-07-04 12:40:58.383574	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	8474456645
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-07-04 12:40:58.384998	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.16.1	\N	\N	8474456645
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-07-04 12:40:58.386326	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.16.1	\N	\N	8474456645
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-07-04 12:40:58.392269	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.16.1	\N	\N	8474456645
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-07-04 12:40:58.401732	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.16.1	\N	\N	8474456645
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-07-04 12:40:58.428677	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.16.1	\N	\N	8474456645
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-07-04 12:40:58.535748	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.16.1	\N	\N	8474456645
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-07-04 12:40:58.568741	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.16.1	\N	\N	8474456645
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-07-04 12:40:58.572906	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.16.1	\N	\N	8474456645
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-07-04 12:40:58.578386	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.16.1	\N	\N	8474456645
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-07-04 12:40:58.58961	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.16.1	\N	\N	8474456645
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-07-04 12:40:58.59132	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.16.1	\N	\N	8474456645
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-07-04 12:40:58.593986	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.16.1	\N	\N	8474456645
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-07-04 12:40:58.595454	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.16.1	\N	\N	8474456645
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-07-04 12:40:58.609499	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.16.1	\N	\N	8474456645
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-07-04 12:40:58.613891	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.16.1	\N	\N	8474456645
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-07-04 12:40:58.616497	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.16.1	\N	\N	8474456645
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-07-04 12:40:58.626728	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.16.1	\N	\N	8474456645
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-07-04 12:40:58.629952	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.16.1	\N	\N	8474456645
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-07-04 12:40:58.632354	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.16.1	\N	\N	8474456645
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-07-04 12:40:58.634613	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	8474456645
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-07-04 12:40:58.640264	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	8474456645
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-07-04 12:40:58.640927	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	8474456645
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-07-04 12:40:58.66464	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.16.1	\N	\N	8474456645
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-07-04 12:40:58.670493	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.16.1	\N	\N	8474456645
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-07-04 12:40:58.672253	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.16.1	\N	\N	8474456645
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-07-04 12:40:58.672862	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.16.1	\N	\N	8474456645
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-07-04 12:40:58.691787	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.16.1	\N	\N	8474456645
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-07-04 12:40:58.692474	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.16.1	\N	\N	8474456645
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-07-04 12:40:58.697273	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.16.1	\N	\N	8474456645
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-07-04 12:40:58.697964	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	8474456645
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-07-04 12:40:58.701449	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	8474456645
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-07-04 12:40:58.702056	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	8474456645
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-07-04 12:40:58.706068	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.16.1	\N	\N	8474456645
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-07-04 12:40:58.708564	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.16.1	\N	\N	8474456645
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-07-04 12:40:58.711091	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.16.1	\N	\N	8474456645
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-07-04 12:40:58.723514	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.16.1	\N	\N	8474456645
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-07-04 12:40:58.727044	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.16.1	\N	\N	8474456645
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-07-04 12:40:58.74446	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.16.1	\N	\N	8474456645
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-07-04 12:40:58.749768	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	8474456645
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-07-04 12:40:58.752921	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.16.1	\N	\N	8474456645
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-07-04 12:40:58.753729	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.16.1	\N	\N	8474456645
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-07-04 12:40:58.764591	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.16.1	\N	\N	8474456645
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-07-04 12:40:58.765518	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.16.1	\N	\N	8474456645
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-07-04 12:40:58.770221	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.16.1	\N	\N	8474456645
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-07-04 12:40:58.781993	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	8474456645
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-07-04 12:40:58.782806	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	8474456645
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-07-04 12:40:58.808932	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	8474456645
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-07-04 12:40:58.816363	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	8474456645
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-07-04 12:40:58.817176	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	8474456645
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-07-04 12:40:58.822295	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.16.1	\N	\N	8474456645
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-07-04 12:40:58.825016	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.16.1	\N	\N	8474456645
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-07-04 12:40:58.828549	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.16.1	\N	\N	8474456645
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-07-04 12:40:58.833503	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.16.1	\N	\N	8474456645
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-07-04 12:40:58.837819	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.16.1	\N	\N	8474456645
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-07-04 12:40:58.839637	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.16.1	\N	\N	8474456645
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-07-04 12:40:58.844394	108	EXECUTED	8:05c99fc610845ef66ee812b7921af0ef	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.16.1	\N	\N	8474456645
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-07-04 12:40:58.845143	109	MARK_RAN	8:314e803baf2f1ec315b3464e398b8247	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.16.1	\N	\N	8474456645
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-07-04 12:40:58.851163	110	EXECUTED	8:56e4677e7e12556f70b604c573840100	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	8474456645
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2023-07-04 12:40:58.853135	111	EXECUTED	8:8806cb33d2a546ce770384bf98cf6eac	customChange		\N	4.16.1	\N	\N	8474456645
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-07-04 12:40:58.919166	112	EXECUTED	8:fdb2924649d30555ab3a1744faba4928	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.16.1	\N	\N	8474456645
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-07-04 12:40:58.920056	113	MARK_RAN	8:1c96cc2b10903bd07a03670098d67fd6	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.16.1	\N	\N	8474456645
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
c214cae2-06a9-4de8-9406-3a4f87bad41b	530bc68d-8ec3-4a70-aa02-45668d7f360a	f
c214cae2-06a9-4de8-9406-3a4f87bad41b	49e0c94d-efbe-4810-bc18-cd5b4df54c2a	t
c214cae2-06a9-4de8-9406-3a4f87bad41b	36715a57-f960-44e4-a4d9-c9a2eca3c242	t
c214cae2-06a9-4de8-9406-3a4f87bad41b	f77b1411-65a4-4faa-8a8b-5e21745c7518	t
c214cae2-06a9-4de8-9406-3a4f87bad41b	6807ba0b-21fe-4ade-8fe7-de90199d7cd8	f
c214cae2-06a9-4de8-9406-3a4f87bad41b	17619410-8150-44c1-bc17-6409dca5f49c	f
c214cae2-06a9-4de8-9406-3a4f87bad41b	d09f418b-83a4-4520-a8c6-dfa20ad879cb	t
c214cae2-06a9-4de8-9406-3a4f87bad41b	7965b5d4-957f-4194-aba7-c5de71c415f7	t
c214cae2-06a9-4de8-9406-3a4f87bad41b	7874f9f8-3f97-4083-96f8-928f901b2c93	f
c214cae2-06a9-4de8-9406-3a4f87bad41b	80454ebd-2bda-48f9-8820-bed523ce88dc	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
1330cb06-9e65-4461-85b4-05a59722059e	platform	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	172.26.0.1	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N	1688539144128	LOGIN_ERROR	\N
5eb9b3c7-550b-408e-ae0c-077ac27d9cf1	security-admin-console	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://localhost:8585/admin/master/console/","code_id":"b5562fb3-c4de-4ff1-b338-4fefa0409f6d","username":"admin"}	user_not_found	172.26.0.1	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N	1688539163032	LOGIN_ERROR	\N
5b3f82ab-0e5e-429d-9b9b-094ac13eb7ab	security-admin-console	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://localhost:8585/admin/master/console/","code_id":"b5562fb3-c4de-4ff1-b338-4fefa0409f6d","username":"user"}	invalid_user_credentials	172.26.0.1	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N	1688539235553	LOGIN_ERROR	cdf28582-6c1b-494a-b7ef-1e84be3d138e
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
fe099b6d-76e7-4fe9-b516-2f9663277e0d	c214cae2-06a9-4de8-9406-3a4f87bad41b	f	${role_default-roles}	default-roles-master	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N	\N
ad31cc9a-8eaf-4423-b2e6-b8748f3508c2	c214cae2-06a9-4de8-9406-3a4f87bad41b	f	${role_create-realm}	create-realm	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N	\N
b255879f-e482-46c0-91f8-20aa8839bb98	c214cae2-06a9-4de8-9406-3a4f87bad41b	f	${role_admin}	admin	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N	\N
0973614c-fafe-4de6-bf6e-b2496b86ce76	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_create-client}	create-client	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
991b4450-e6da-4b6c-80e7-63807938ed7b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_view-realm}	view-realm	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
2ed2cb27-a69f-4ad4-8cdb-d34ef6d51302	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_view-users}	view-users	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
48884aa5-593e-45ff-a009-6a1710e207ca	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_view-clients}	view-clients	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
af04e0d3-c0c3-40d0-8ef1-985abce05b16	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_view-events}	view-events	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
e0e686bc-1e43-4e55-ae25-1a48e890de21	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_view-identity-providers}	view-identity-providers	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
1d5bd41a-38c1-4101-ae0a-a088ab407809	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_view-authorization}	view-authorization	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
b0adfa8e-737b-46fc-a4ae-87fbd227ef7e	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_manage-realm}	manage-realm	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
99245969-3cd4-4e25-a84c-24870706cc0d	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_manage-users}	manage-users	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
56bc0790-ef60-44d6-8dc8-29209cea2364	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_manage-clients}	manage-clients	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
8558e765-08af-4038-98f9-169f3701e22d	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_manage-events}	manage-events	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
2fe75c1e-e0da-4615-82be-2d2efbbf0540	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_manage-identity-providers}	manage-identity-providers	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
6854d5a0-baa5-441c-8c22-f170fd7e0e25	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_manage-authorization}	manage-authorization	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
5ee4bdc0-f0bc-44b3-b784-4633a0545057	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_query-users}	query-users	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
a6b768d8-c26a-46d4-af86-1256cf22a65e	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_query-clients}	query-clients	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
7f650c70-4e59-4050-8aa2-685c3e3a83ea	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_query-realms}	query-realms	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
6857daa5-424b-47ac-9c40-140a44a30b6d	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_query-groups}	query-groups	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
d309855f-5566-4e53-a03b-3e9381a8c6a0	d0ff74ad-541a-4f33-9bdc-294c2423e544	t	${role_view-profile}	view-profile	c214cae2-06a9-4de8-9406-3a4f87bad41b	d0ff74ad-541a-4f33-9bdc-294c2423e544	\N
d9db8ad2-d78f-480a-ae9c-a4b72ace1d4c	d0ff74ad-541a-4f33-9bdc-294c2423e544	t	${role_manage-account}	manage-account	c214cae2-06a9-4de8-9406-3a4f87bad41b	d0ff74ad-541a-4f33-9bdc-294c2423e544	\N
1e0bf701-d5d8-4db1-97f3-cf77c30cb60c	d0ff74ad-541a-4f33-9bdc-294c2423e544	t	${role_manage-account-links}	manage-account-links	c214cae2-06a9-4de8-9406-3a4f87bad41b	d0ff74ad-541a-4f33-9bdc-294c2423e544	\N
9ac545bb-c2a5-40e4-88e1-ac65d07cb810	d0ff74ad-541a-4f33-9bdc-294c2423e544	t	${role_view-applications}	view-applications	c214cae2-06a9-4de8-9406-3a4f87bad41b	d0ff74ad-541a-4f33-9bdc-294c2423e544	\N
1abb2930-c797-48e1-a36c-b9c553a67262	d0ff74ad-541a-4f33-9bdc-294c2423e544	t	${role_view-consent}	view-consent	c214cae2-06a9-4de8-9406-3a4f87bad41b	d0ff74ad-541a-4f33-9bdc-294c2423e544	\N
7bad07df-1eaa-428d-91de-c65515824434	d0ff74ad-541a-4f33-9bdc-294c2423e544	t	${role_manage-consent}	manage-consent	c214cae2-06a9-4de8-9406-3a4f87bad41b	d0ff74ad-541a-4f33-9bdc-294c2423e544	\N
1a035e37-6982-42be-b0b5-43f28d7e0423	d0ff74ad-541a-4f33-9bdc-294c2423e544	t	${role_view-groups}	view-groups	c214cae2-06a9-4de8-9406-3a4f87bad41b	d0ff74ad-541a-4f33-9bdc-294c2423e544	\N
98e89f9c-90c3-4b2f-ae44-f01828340f1f	d0ff74ad-541a-4f33-9bdc-294c2423e544	t	${role_delete-account}	delete-account	c214cae2-06a9-4de8-9406-3a4f87bad41b	d0ff74ad-541a-4f33-9bdc-294c2423e544	\N
835b597b-b944-4399-a439-b2dbe6a65cdd	483b7551-761b-46a1-86ac-8202cebaa83b	t	${role_read-token}	read-token	c214cae2-06a9-4de8-9406-3a4f87bad41b	483b7551-761b-46a1-86ac-8202cebaa83b	\N
8ecf4ff3-aba4-4243-b82e-1443ce1bc8a6	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	t	${role_impersonation}	impersonation	c214cae2-06a9-4de8-9406-3a4f87bad41b	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	\N
5d26a3b9-6df9-4c2f-90b4-005bc9bca003	c214cae2-06a9-4de8-9406-3a4f87bad41b	f	${role_offline-access}	offline_access	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N	\N
7dfc511e-d6a9-4f15-bd3e-e89dc2f003b0	c214cae2-06a9-4de8-9406-3a4f87bad41b	f	${role_uma_authorization}	uma_authorization	c214cae2-06a9-4de8-9406-3a4f87bad41b	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.migration_model (id, version, update_time) FROM stdin;
yxo8o	21.1.2	1688474459
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
01f7a195-e153-4bbd-be8f-293910f00600	audience resolve	openid-connect	oidc-audience-resolve-mapper	f154d630-1dba-46d0-80f1-4bd5b80121e5	\N
3f621f85-c46d-4821-894a-58b206b37ed8	locale	openid-connect	oidc-usermodel-attribute-mapper	4c8585f7-4bf3-407a-b001-49bed16762d1	\N
ca816ea2-b529-43ad-889f-4447fc9c6195	role list	saml	saml-role-list-mapper	\N	49e0c94d-efbe-4810-bc18-cd5b4df54c2a
1e9b59c6-f3a8-4f08-949c-431e10f0a73d	full name	openid-connect	oidc-full-name-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
c096c5de-a441-4dcc-9be6-0ba35d37a0ac	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
9a26226f-af2a-4d80-a7f9-576498043939	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
981b1657-f972-476d-a57f-2be7c002d1a2	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
9b3bf331-f59d-438b-bc65-a6b6a5885998	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
a6d81bae-f296-4a54-a19c-b5708672a547	username	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
79bc46ae-7898-4998-b0c1-407adc8a8350	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
803c42bf-d5c6-4167-b604-9d5198ba56d8	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
3e32fbdf-1b83-4431-b310-6cff70fc4ab5	website	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
91418709-8cc1-4af1-b31c-8eee6869d2b8	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
e6ac0c5d-5d6a-4c9b-af5a-222e8853a9c2	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
82ae6c0d-ff0d-4786-a78b-1c185f785372	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
06781680-add3-4455-9057-1f0d4bd06065	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
c3410a25-4952-4401-82e9-b8370d7a4068	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	36715a57-f960-44e4-a4d9-c9a2eca3c242
41e78384-1378-4e93-8ffc-a65d60eb542e	email	openid-connect	oidc-usermodel-attribute-mapper	\N	f77b1411-65a4-4faa-8a8b-5e21745c7518
48018e91-66f7-49df-8e6e-a19698f29684	email verified	openid-connect	oidc-usermodel-property-mapper	\N	f77b1411-65a4-4faa-8a8b-5e21745c7518
86d09c81-8fa7-4bcd-a241-5abae846b4e9	address	openid-connect	oidc-address-mapper	\N	6807ba0b-21fe-4ade-8fe7-de90199d7cd8
cdd8cc7a-347f-4481-a833-47b240dcd600	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	17619410-8150-44c1-bc17-6409dca5f49c
cd089cf7-3008-4625-87b2-194d9152a540	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	17619410-8150-44c1-bc17-6409dca5f49c
f5517345-5c3e-4559-886a-9e41d62f4c65	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	d09f418b-83a4-4520-a8c6-dfa20ad879cb
7bf0c0ce-0ea0-4074-a20b-865bd04d088f	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	d09f418b-83a4-4520-a8c6-dfa20ad879cb
7e679c08-2ea8-4950-82d4-02b358692ed1	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	d09f418b-83a4-4520-a8c6-dfa20ad879cb
a43b1fbd-5b8f-41fb-b555-a9f30e9014c2	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	7965b5d4-957f-4194-aba7-c5de71c415f7
ce9438cf-0886-4433-b627-c3a5da39669c	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	7874f9f8-3f97-4083-96f8-928f901b2c93
781b109f-5726-4c2b-99cf-80602f09827b	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	7874f9f8-3f97-4083-96f8-928f901b2c93
93a2874c-f1bc-497f-9bb8-088ffb49aef5	acr loa level	openid-connect	oidc-acr-mapper	\N	80454ebd-2bda-48f9-8820-bed523ce88dc
a47044a7-f7bf-4fce-8649-57dada9c5240	client roles	openid-connect	oidc-usermodel-client-role-mapper	bbddb453-b499-4be5-9e3c-161fe92f0bbc	\N
a22aeffa-2694-40f7-8ae3-38dd820b8688	LOCATION	openid-connect	oidc-usermodel-attribute-mapper	bbddb453-b499-4be5-9e3c-161fe92f0bbc	\N
a1151e93-2a63-4f8d-97ff-ca82b5ace653	client roles	openid-connect	oidc-usermodel-client-role-mapper	c881c6a7-2177-4c06-b78f-2252ee3edfdc	\N
b40a009f-77fc-4607-8720-50ae30c4b842	LOCATION	openid-connect	oidc-usermodel-attribute-mapper	c881c6a7-2177-4c06-b78f-2252ee3edfdc	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
3f621f85-c46d-4821-894a-58b206b37ed8	true	userinfo.token.claim
3f621f85-c46d-4821-894a-58b206b37ed8	locale	user.attribute
3f621f85-c46d-4821-894a-58b206b37ed8	true	id.token.claim
3f621f85-c46d-4821-894a-58b206b37ed8	true	access.token.claim
3f621f85-c46d-4821-894a-58b206b37ed8	locale	claim.name
3f621f85-c46d-4821-894a-58b206b37ed8	String	jsonType.label
ca816ea2-b529-43ad-889f-4447fc9c6195	false	single
ca816ea2-b529-43ad-889f-4447fc9c6195	Basic	attribute.nameformat
ca816ea2-b529-43ad-889f-4447fc9c6195	Role	attribute.name
06781680-add3-4455-9057-1f0d4bd06065	true	userinfo.token.claim
06781680-add3-4455-9057-1f0d4bd06065	locale	user.attribute
06781680-add3-4455-9057-1f0d4bd06065	true	id.token.claim
06781680-add3-4455-9057-1f0d4bd06065	true	access.token.claim
06781680-add3-4455-9057-1f0d4bd06065	locale	claim.name
06781680-add3-4455-9057-1f0d4bd06065	String	jsonType.label
1e9b59c6-f3a8-4f08-949c-431e10f0a73d	true	userinfo.token.claim
1e9b59c6-f3a8-4f08-949c-431e10f0a73d	true	id.token.claim
1e9b59c6-f3a8-4f08-949c-431e10f0a73d	true	access.token.claim
3e32fbdf-1b83-4431-b310-6cff70fc4ab5	true	userinfo.token.claim
3e32fbdf-1b83-4431-b310-6cff70fc4ab5	website	user.attribute
3e32fbdf-1b83-4431-b310-6cff70fc4ab5	true	id.token.claim
3e32fbdf-1b83-4431-b310-6cff70fc4ab5	true	access.token.claim
3e32fbdf-1b83-4431-b310-6cff70fc4ab5	website	claim.name
3e32fbdf-1b83-4431-b310-6cff70fc4ab5	String	jsonType.label
79bc46ae-7898-4998-b0c1-407adc8a8350	true	userinfo.token.claim
79bc46ae-7898-4998-b0c1-407adc8a8350	profile	user.attribute
79bc46ae-7898-4998-b0c1-407adc8a8350	true	id.token.claim
79bc46ae-7898-4998-b0c1-407adc8a8350	true	access.token.claim
79bc46ae-7898-4998-b0c1-407adc8a8350	profile	claim.name
79bc46ae-7898-4998-b0c1-407adc8a8350	String	jsonType.label
803c42bf-d5c6-4167-b604-9d5198ba56d8	true	userinfo.token.claim
803c42bf-d5c6-4167-b604-9d5198ba56d8	picture	user.attribute
803c42bf-d5c6-4167-b604-9d5198ba56d8	true	id.token.claim
803c42bf-d5c6-4167-b604-9d5198ba56d8	true	access.token.claim
803c42bf-d5c6-4167-b604-9d5198ba56d8	picture	claim.name
803c42bf-d5c6-4167-b604-9d5198ba56d8	String	jsonType.label
82ae6c0d-ff0d-4786-a78b-1c185f785372	true	userinfo.token.claim
82ae6c0d-ff0d-4786-a78b-1c185f785372	zoneinfo	user.attribute
82ae6c0d-ff0d-4786-a78b-1c185f785372	true	id.token.claim
82ae6c0d-ff0d-4786-a78b-1c185f785372	true	access.token.claim
82ae6c0d-ff0d-4786-a78b-1c185f785372	zoneinfo	claim.name
82ae6c0d-ff0d-4786-a78b-1c185f785372	String	jsonType.label
91418709-8cc1-4af1-b31c-8eee6869d2b8	true	userinfo.token.claim
91418709-8cc1-4af1-b31c-8eee6869d2b8	gender	user.attribute
91418709-8cc1-4af1-b31c-8eee6869d2b8	true	id.token.claim
91418709-8cc1-4af1-b31c-8eee6869d2b8	true	access.token.claim
91418709-8cc1-4af1-b31c-8eee6869d2b8	gender	claim.name
91418709-8cc1-4af1-b31c-8eee6869d2b8	String	jsonType.label
981b1657-f972-476d-a57f-2be7c002d1a2	true	userinfo.token.claim
981b1657-f972-476d-a57f-2be7c002d1a2	middleName	user.attribute
981b1657-f972-476d-a57f-2be7c002d1a2	true	id.token.claim
981b1657-f972-476d-a57f-2be7c002d1a2	true	access.token.claim
981b1657-f972-476d-a57f-2be7c002d1a2	middle_name	claim.name
981b1657-f972-476d-a57f-2be7c002d1a2	String	jsonType.label
9a26226f-af2a-4d80-a7f9-576498043939	true	userinfo.token.claim
9a26226f-af2a-4d80-a7f9-576498043939	firstName	user.attribute
9a26226f-af2a-4d80-a7f9-576498043939	true	id.token.claim
9a26226f-af2a-4d80-a7f9-576498043939	true	access.token.claim
9a26226f-af2a-4d80-a7f9-576498043939	given_name	claim.name
9a26226f-af2a-4d80-a7f9-576498043939	String	jsonType.label
9b3bf331-f59d-438b-bc65-a6b6a5885998	true	userinfo.token.claim
9b3bf331-f59d-438b-bc65-a6b6a5885998	nickname	user.attribute
9b3bf331-f59d-438b-bc65-a6b6a5885998	true	id.token.claim
9b3bf331-f59d-438b-bc65-a6b6a5885998	true	access.token.claim
9b3bf331-f59d-438b-bc65-a6b6a5885998	nickname	claim.name
9b3bf331-f59d-438b-bc65-a6b6a5885998	String	jsonType.label
a6d81bae-f296-4a54-a19c-b5708672a547	true	userinfo.token.claim
a6d81bae-f296-4a54-a19c-b5708672a547	username	user.attribute
a6d81bae-f296-4a54-a19c-b5708672a547	true	id.token.claim
a6d81bae-f296-4a54-a19c-b5708672a547	true	access.token.claim
a6d81bae-f296-4a54-a19c-b5708672a547	preferred_username	claim.name
a6d81bae-f296-4a54-a19c-b5708672a547	String	jsonType.label
c096c5de-a441-4dcc-9be6-0ba35d37a0ac	true	userinfo.token.claim
c096c5de-a441-4dcc-9be6-0ba35d37a0ac	lastName	user.attribute
c096c5de-a441-4dcc-9be6-0ba35d37a0ac	true	id.token.claim
c096c5de-a441-4dcc-9be6-0ba35d37a0ac	true	access.token.claim
c096c5de-a441-4dcc-9be6-0ba35d37a0ac	family_name	claim.name
c096c5de-a441-4dcc-9be6-0ba35d37a0ac	String	jsonType.label
c3410a25-4952-4401-82e9-b8370d7a4068	true	userinfo.token.claim
c3410a25-4952-4401-82e9-b8370d7a4068	updatedAt	user.attribute
c3410a25-4952-4401-82e9-b8370d7a4068	true	id.token.claim
c3410a25-4952-4401-82e9-b8370d7a4068	true	access.token.claim
c3410a25-4952-4401-82e9-b8370d7a4068	updated_at	claim.name
c3410a25-4952-4401-82e9-b8370d7a4068	long	jsonType.label
e6ac0c5d-5d6a-4c9b-af5a-222e8853a9c2	true	userinfo.token.claim
e6ac0c5d-5d6a-4c9b-af5a-222e8853a9c2	birthdate	user.attribute
e6ac0c5d-5d6a-4c9b-af5a-222e8853a9c2	true	id.token.claim
e6ac0c5d-5d6a-4c9b-af5a-222e8853a9c2	true	access.token.claim
e6ac0c5d-5d6a-4c9b-af5a-222e8853a9c2	birthdate	claim.name
e6ac0c5d-5d6a-4c9b-af5a-222e8853a9c2	String	jsonType.label
41e78384-1378-4e93-8ffc-a65d60eb542e	true	userinfo.token.claim
41e78384-1378-4e93-8ffc-a65d60eb542e	email	user.attribute
41e78384-1378-4e93-8ffc-a65d60eb542e	true	id.token.claim
41e78384-1378-4e93-8ffc-a65d60eb542e	true	access.token.claim
41e78384-1378-4e93-8ffc-a65d60eb542e	email	claim.name
41e78384-1378-4e93-8ffc-a65d60eb542e	String	jsonType.label
48018e91-66f7-49df-8e6e-a19698f29684	true	userinfo.token.claim
48018e91-66f7-49df-8e6e-a19698f29684	emailVerified	user.attribute
48018e91-66f7-49df-8e6e-a19698f29684	true	id.token.claim
48018e91-66f7-49df-8e6e-a19698f29684	true	access.token.claim
48018e91-66f7-49df-8e6e-a19698f29684	email_verified	claim.name
48018e91-66f7-49df-8e6e-a19698f29684	boolean	jsonType.label
86d09c81-8fa7-4bcd-a241-5abae846b4e9	formatted	user.attribute.formatted
86d09c81-8fa7-4bcd-a241-5abae846b4e9	country	user.attribute.country
86d09c81-8fa7-4bcd-a241-5abae846b4e9	postal_code	user.attribute.postal_code
86d09c81-8fa7-4bcd-a241-5abae846b4e9	true	userinfo.token.claim
86d09c81-8fa7-4bcd-a241-5abae846b4e9	street	user.attribute.street
86d09c81-8fa7-4bcd-a241-5abae846b4e9	true	id.token.claim
86d09c81-8fa7-4bcd-a241-5abae846b4e9	region	user.attribute.region
86d09c81-8fa7-4bcd-a241-5abae846b4e9	true	access.token.claim
86d09c81-8fa7-4bcd-a241-5abae846b4e9	locality	user.attribute.locality
cd089cf7-3008-4625-87b2-194d9152a540	true	userinfo.token.claim
cd089cf7-3008-4625-87b2-194d9152a540	phoneNumberVerified	user.attribute
cd089cf7-3008-4625-87b2-194d9152a540	true	id.token.claim
cd089cf7-3008-4625-87b2-194d9152a540	true	access.token.claim
cd089cf7-3008-4625-87b2-194d9152a540	phone_number_verified	claim.name
cd089cf7-3008-4625-87b2-194d9152a540	boolean	jsonType.label
cdd8cc7a-347f-4481-a833-47b240dcd600	true	userinfo.token.claim
cdd8cc7a-347f-4481-a833-47b240dcd600	phoneNumber	user.attribute
cdd8cc7a-347f-4481-a833-47b240dcd600	true	id.token.claim
cdd8cc7a-347f-4481-a833-47b240dcd600	true	access.token.claim
cdd8cc7a-347f-4481-a833-47b240dcd600	phone_number	claim.name
cdd8cc7a-347f-4481-a833-47b240dcd600	String	jsonType.label
7bf0c0ce-0ea0-4074-a20b-865bd04d088f	true	multivalued
7bf0c0ce-0ea0-4074-a20b-865bd04d088f	foo	user.attribute
7bf0c0ce-0ea0-4074-a20b-865bd04d088f	true	access.token.claim
7bf0c0ce-0ea0-4074-a20b-865bd04d088f	resource_access.${client_id}.roles	claim.name
7bf0c0ce-0ea0-4074-a20b-865bd04d088f	String	jsonType.label
f5517345-5c3e-4559-886a-9e41d62f4c65	true	multivalued
f5517345-5c3e-4559-886a-9e41d62f4c65	foo	user.attribute
f5517345-5c3e-4559-886a-9e41d62f4c65	true	access.token.claim
f5517345-5c3e-4559-886a-9e41d62f4c65	realm_access.roles	claim.name
f5517345-5c3e-4559-886a-9e41d62f4c65	String	jsonType.label
781b109f-5726-4c2b-99cf-80602f09827b	true	multivalued
781b109f-5726-4c2b-99cf-80602f09827b	foo	user.attribute
781b109f-5726-4c2b-99cf-80602f09827b	true	id.token.claim
781b109f-5726-4c2b-99cf-80602f09827b	true	access.token.claim
781b109f-5726-4c2b-99cf-80602f09827b	groups	claim.name
781b109f-5726-4c2b-99cf-80602f09827b	String	jsonType.label
ce9438cf-0886-4433-b627-c3a5da39669c	true	userinfo.token.claim
ce9438cf-0886-4433-b627-c3a5da39669c	username	user.attribute
ce9438cf-0886-4433-b627-c3a5da39669c	true	id.token.claim
ce9438cf-0886-4433-b627-c3a5da39669c	true	access.token.claim
ce9438cf-0886-4433-b627-c3a5da39669c	upn	claim.name
ce9438cf-0886-4433-b627-c3a5da39669c	String	jsonType.label
93a2874c-f1bc-497f-9bb8-088ffb49aef5	true	id.token.claim
93a2874c-f1bc-497f-9bb8-088ffb49aef5	true	access.token.claim
a22aeffa-2694-40f7-8ae3-38dd820b8688	true	userinfo.token.claim
a22aeffa-2694-40f7-8ae3-38dd820b8688	LOCATION	user.attribute
a22aeffa-2694-40f7-8ae3-38dd820b8688	true	id.token.claim
a22aeffa-2694-40f7-8ae3-38dd820b8688	true	access.token.claim
a22aeffa-2694-40f7-8ae3-38dd820b8688	location	claim.name
a22aeffa-2694-40f7-8ae3-38dd820b8688	String	jsonType.label
a47044a7-f7bf-4fce-8649-57dada9c5240	foo	user.attribute
a47044a7-f7bf-4fce-8649-57dada9c5240	true	access.token.claim
a47044a7-f7bf-4fce-8649-57dada9c5240	resource_access.${client_id}.roles	claim.name
a47044a7-f7bf-4fce-8649-57dada9c5240	String	jsonType.label
a47044a7-f7bf-4fce-8649-57dada9c5240	true	multivalued
a1151e93-2a63-4f8d-97ff-ca82b5ace653	foo	user.attribute
a1151e93-2a63-4f8d-97ff-ca82b5ace653	true	access.token.claim
a1151e93-2a63-4f8d-97ff-ca82b5ace653	resource_access.${client_id}.roles	claim.name
a1151e93-2a63-4f8d-97ff-ca82b5ace653	String	jsonType.label
a1151e93-2a63-4f8d-97ff-ca82b5ace653	true	multivalued
b40a009f-77fc-4607-8720-50ae30c4b842	true	userinfo.token.claim
b40a009f-77fc-4607-8720-50ae30c4b842	LOCATION	user.attribute
b40a009f-77fc-4607-8720-50ae30c4b842	true	id.token.claim
b40a009f-77fc-4607-8720-50ae30c4b842	true	access.token.claim
b40a009f-77fc-4607-8720-50ae30c4b842	location	claim.name
b40a009f-77fc-4607-8720-50ae30c4b842	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
c214cae2-06a9-4de8-9406-3a4f87bad41b	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	a6fb7d4f-97ca-46f4-8ac2-49dbbf4554a6	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	43d57a9e-3ce6-4880-bd63-6667053456c3	acce71a9-74bc-42b8-96b2-c368f6ddf0fa	e04b60ff-f609-46c8-b769-d4b3e966f320	79dc8e40-f3cd-4b48-a1ec-2b9526eb67ed	5ede6740-c571-47bd-abdc-8d2f367b1154	2592000	f	900	t	f	6a66048a-474c-4444-8366-a1aeb2f619de	0	f	0	0	fe099b6d-76e7-4fe9-b516-2f9663277e0d
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	c214cae2-06a9-4de8-9406-3a4f87bad41b	
_browser_header.xContentTypeOptions	c214cae2-06a9-4de8-9406-3a4f87bad41b	nosniff
_browser_header.xRobotsTag	c214cae2-06a9-4de8-9406-3a4f87bad41b	none
_browser_header.xFrameOptions	c214cae2-06a9-4de8-9406-3a4f87bad41b	SAMEORIGIN
_browser_header.contentSecurityPolicy	c214cae2-06a9-4de8-9406-3a4f87bad41b	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	c214cae2-06a9-4de8-9406-3a4f87bad41b	1; mode=block
_browser_header.strictTransportSecurity	c214cae2-06a9-4de8-9406-3a4f87bad41b	max-age=31536000; includeSubDomains
bruteForceProtected	c214cae2-06a9-4de8-9406-3a4f87bad41b	false
permanentLockout	c214cae2-06a9-4de8-9406-3a4f87bad41b	false
maxFailureWaitSeconds	c214cae2-06a9-4de8-9406-3a4f87bad41b	900
minimumQuickLoginWaitSeconds	c214cae2-06a9-4de8-9406-3a4f87bad41b	60
waitIncrementSeconds	c214cae2-06a9-4de8-9406-3a4f87bad41b	60
quickLoginCheckMilliSeconds	c214cae2-06a9-4de8-9406-3a4f87bad41b	1000
maxDeltaTimeSeconds	c214cae2-06a9-4de8-9406-3a4f87bad41b	43200
failureFactor	c214cae2-06a9-4de8-9406-3a4f87bad41b	30
realmReusableOtpCode	c214cae2-06a9-4de8-9406-3a4f87bad41b	false
displayName	c214cae2-06a9-4de8-9406-3a4f87bad41b	Keycloak
displayNameHtml	c214cae2-06a9-4de8-9406-3a4f87bad41b	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	c214cae2-06a9-4de8-9406-3a4f87bad41b	RS256
offlineSessionMaxLifespanEnabled	c214cae2-06a9-4de8-9406-3a4f87bad41b	false
offlineSessionMaxLifespan	c214cae2-06a9-4de8-9406-3a4f87bad41b	5184000
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.realm_events_listeners (realm_id, value) FROM stdin;
c214cae2-06a9-4de8-9406-3a4f87bad41b	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	c214cae2-06a9-4de8-9406-3a4f87bad41b
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.redirect_uris (client_id, value) FROM stdin;
d0ff74ad-541a-4f33-9bdc-294c2423e544	/realms/master/account/*
f154d630-1dba-46d0-80f1-4bd5b80121e5	/realms/master/account/*
4c8585f7-4bf3-407a-b001-49bed16762d1	/admin/master/console/*
bbddb453-b499-4be5-9e3c-161fe92f0bbc	*
c881c6a7-2177-4c06-b78f-2252ee3edfdc	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
99896a5f-6ef0-4036-b036-cc72db089ef8	VERIFY_EMAIL	Verify Email	c214cae2-06a9-4de8-9406-3a4f87bad41b	t	f	VERIFY_EMAIL	50
65bbfafc-a863-4fef-a0e3-3a15f80902b3	UPDATE_PROFILE	Update Profile	c214cae2-06a9-4de8-9406-3a4f87bad41b	t	f	UPDATE_PROFILE	40
e7554725-1ee9-4516-9740-20883249a4d0	CONFIGURE_TOTP	Configure OTP	c214cae2-06a9-4de8-9406-3a4f87bad41b	t	f	CONFIGURE_TOTP	10
223c3521-cfe0-4ea5-83c5-7397492e179e	UPDATE_PASSWORD	Update Password	c214cae2-06a9-4de8-9406-3a4f87bad41b	t	f	UPDATE_PASSWORD	30
b239cdff-de0f-4dd9-b09d-5d923118ca9d	TERMS_AND_CONDITIONS	Terms and Conditions	c214cae2-06a9-4de8-9406-3a4f87bad41b	f	f	TERMS_AND_CONDITIONS	20
b9f3f031-083b-4614-9a0a-553a03dd33ff	delete_account	Delete Account	c214cae2-06a9-4de8-9406-3a4f87bad41b	f	f	delete_account	60
2e1b5286-8bc9-47cf-9935-bc505e507b7f	update_user_locale	Update User Locale	c214cae2-06a9-4de8-9406-3a4f87bad41b	t	f	update_user_locale	1000
690ed88c-438a-4c91-ae05-cf251996f64a	webauthn-register	Webauthn Register	c214cae2-06a9-4de8-9406-3a4f87bad41b	t	f	webauthn-register	70
75c119cc-2da1-4570-aff2-ab33a459a424	webauthn-register-passwordless	Webauthn Register Passwordless	c214cae2-06a9-4de8-9406-3a4f87bad41b	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.scope_mapping (client_id, role_id) FROM stdin;
f154d630-1dba-46d0-80f1-4bd5b80121e5	1a035e37-6982-42be-b0b5-43f28d7e0423
f154d630-1dba-46d0-80f1-4bd5b80121e5	d9db8ad2-d78f-480a-ae9c-a4b72ace1d4c
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
cdf28582-6c1b-494a-b7ef-1e84be3d138e	\N	b6ff4b09-7e68-43df-ada3-37bb32f5e6cb	f	t	\N	\N	\N	c214cae2-06a9-4de8-9406-3a4f87bad41b	user	1688474460196	\N	0
8ee9a746-eeea-4d8f-8308-efa865474ff8	\N	e328047b-c846-4225-be7e-e20333229cbd	t	t	\N			c214cae2-06a9-4de8-9406-3a4f87bad41b	username	1688474777675	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_role_mapping (role_id, user_id) FROM stdin;
fe099b6d-76e7-4fe9-b516-2f9663277e0d	cdf28582-6c1b-494a-b7ef-1e84be3d138e
b255879f-e482-46c0-91f8-20aa8839bb98	cdf28582-6c1b-494a-b7ef-1e84be3d138e
fe099b6d-76e7-4fe9-b516-2f9663277e0d	8ee9a746-eeea-4d8f-8308-efa865474ff8
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: keycloak; Owner: keycloak_user
--

COPY keycloak.web_origins (client_id, value) FROM stdin;
4c8585f7-4bf3-407a-b001-49bed16762d1	+
bbddb453-b499-4be5-9e3c-161fe92f0bbc	*
c881c6a7-2177-4c06-b78f-2252ee3edfdc	*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_admin_event_time ON keycloak.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON keycloak.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_auth_config_realm ON keycloak.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_auth_exec_flow ON keycloak.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_auth_exec_realm_flow ON keycloak.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_auth_flow_realm ON keycloak.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_cl_clscope ON keycloak.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_client_id ON keycloak.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_client_init_acc_realm ON keycloak.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_client_session_session ON keycloak.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_clscope_attrs ON keycloak.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_clscope_cl ON keycloak.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_clscope_protmap ON keycloak.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_clscope_role ON keycloak.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_compo_config_compo ON keycloak.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_component_provider_type ON keycloak.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_component_realm ON keycloak.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_composite ON keycloak.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_composite_child ON keycloak.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_defcls_realm ON keycloak.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_defcls_scope ON keycloak.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_event_time ON keycloak.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fedidentity_feduser ON keycloak.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fedidentity_user ON keycloak.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_attribute ON keycloak.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_cnsnt_ext ON keycloak.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_consent ON keycloak.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_consent_ru ON keycloak.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_credential ON keycloak.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_credential_ru ON keycloak.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_group_membership ON keycloak.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_group_membership_ru ON keycloak.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_required_action ON keycloak.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_required_action_ru ON keycloak.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_role_mapping ON keycloak.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_fu_role_mapping_ru ON keycloak.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_group_att_by_name_value ON keycloak.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_group_attr_group ON keycloak.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_group_role_mapp_group ON keycloak.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_id_prov_mapp_realm ON keycloak.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_ident_prov_realm ON keycloak.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_keycloak_role_client ON keycloak.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_keycloak_role_realm ON keycloak.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_offline_css_preload ON keycloak.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_offline_uss_by_user ON keycloak.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_offline_uss_by_usersess ON keycloak.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_offline_uss_createdon ON keycloak.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_offline_uss_preload ON keycloak.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_protocol_mapper_client ON keycloak.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_realm_attr_realm ON keycloak.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_realm_clscope ON keycloak.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_realm_def_grp_realm ON keycloak.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_realm_evt_list_realm ON keycloak.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_realm_evt_types_realm ON keycloak.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_realm_master_adm_cli ON keycloak.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_realm_supp_local_realm ON keycloak.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_redir_uri_client ON keycloak.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_req_act_prov_realm ON keycloak.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_res_policy_policy ON keycloak.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_res_scope_scope ON keycloak.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_res_serv_pol_res_serv ON keycloak.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_res_srv_res_res_srv ON keycloak.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_res_srv_scope_res_srv ON keycloak.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_role_attribute ON keycloak.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_role_clscope ON keycloak.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_scope_mapping_role ON keycloak.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_scope_policy_policy ON keycloak.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_update_time ON keycloak.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON keycloak.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_usconsent_clscope ON keycloak.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_user_attribute ON keycloak.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_user_attribute_name ON keycloak.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_user_consent ON keycloak.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_user_credential ON keycloak.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_user_email ON keycloak.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_user_group_mapping ON keycloak.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_user_reqactions ON keycloak.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_user_role_mapping ON keycloak.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_user_service_account ON keycloak.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_usr_fed_map_fed_prv ON keycloak.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_usr_fed_map_realm ON keycloak.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_usr_fed_prv_realm ON keycloak.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: keycloak; Owner: keycloak_user
--

CREATE INDEX idx_web_orig_client ON keycloak.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES keycloak.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES keycloak.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES keycloak.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES keycloak.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES keycloak.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES keycloak.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES keycloak.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES keycloak.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES keycloak.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES keycloak.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES keycloak.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES keycloak.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES keycloak.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES keycloak.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES keycloak.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES keycloak.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES keycloak.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES keycloak.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES keycloak.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES keycloak.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES keycloak.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES keycloak.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: keycloak; Owner: keycloak_user
--

ALTER TABLE ONLY keycloak.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES keycloak.identity_provider(internal_id);


--
-- Name: SCHEMA keycloak; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA keycloak TO keycloak_user;


--
-- PostgreSQL database dump complete
--


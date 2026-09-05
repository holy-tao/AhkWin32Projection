#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants used by Authorization Manager.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/ne-azroles-az_prop_constants
 * @namespace Windows.Win32.Security.Authorization
 */
class AZ_PROP_CONSTANTS extends Win32Enum {

    /**
     * Native name: AZ_PROP_NAME
     * @type {Integer (Int32)}
     */
    static NAME => 1

    /**
     * Native name: AZ_PROP_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static DESCRIPTION => 2

    /**
     * Native name: AZ_PROP_WRITABLE
     * @type {Integer (Int32)}
     */
    static WRITABLE => 3

    /**
     * Native name: AZ_PROP_APPLICATION_DATA
     * @type {Integer (Int32)}
     */
    static APPLICATION_DATA => 4

    /**
     * Native name: AZ_PROP_CHILD_CREATE
     * @type {Integer (Int32)}
     */
    static CHILD_CREATE => 5

    /**
     * Native name: AZ_MAX_APPLICATION_NAME_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_APPLICATION_NAME_LENGTH => 512

    /**
     * Native name: AZ_MAX_OPERATION_NAME_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_OPERATION_NAME_LENGTH => 64

    /**
     * Native name: AZ_MAX_TASK_NAME_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_TASK_NAME_LENGTH => 64

    /**
     * Native name: AZ_MAX_SCOPE_NAME_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_SCOPE_NAME_LENGTH => 65536

    /**
     * Native name: AZ_MAX_GROUP_NAME_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_GROUP_NAME_LENGTH => 64

    /**
     * Native name: AZ_MAX_ROLE_NAME_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_ROLE_NAME_LENGTH => 64

    /**
     * Native name: AZ_MAX_NAME_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_NAME_LENGTH => 65536

    /**
     * Native name: AZ_MAX_DESCRIPTION_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_DESCRIPTION_LENGTH => 1024

    /**
     * Native name: AZ_MAX_APPLICATION_DATA_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_APPLICATION_DATA_LENGTH => 4096

    /**
     * Native name: AZ_SUBMIT_FLAG_ABORT
     * @type {Integer (Int32)}
     */
    static SUBMIT_FLAG_ABORT => 1

    /**
     * Native name: AZ_SUBMIT_FLAG_FLUSH
     * @type {Integer (Int32)}
     */
    static SUBMIT_FLAG_FLUSH => 2

    /**
     * Native name: AZ_MAX_POLICY_URL_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_POLICY_URL_LENGTH => 65536

    /**
     * Native name: AZ_AZSTORE_FLAG_CREATE
     * @type {Integer (Int32)}
     */
    static AZSTORE_FLAG_CREATE => 1

    /**
     * Native name: AZ_AZSTORE_FLAG_MANAGE_STORE_ONLY
     * @type {Integer (Int32)}
     */
    static AZSTORE_FLAG_MANAGE_STORE_ONLY => 2

    /**
     * Native name: AZ_AZSTORE_FLAG_BATCH_UPDATE
     * @type {Integer (Int32)}
     */
    static AZSTORE_FLAG_BATCH_UPDATE => 4

    /**
     * Native name: AZ_AZSTORE_FLAG_AUDIT_IS_CRITICAL
     * @type {Integer (Int32)}
     */
    static AZSTORE_FLAG_AUDIT_IS_CRITICAL => 8

    /**
     * Native name: AZ_AZSTORE_FORCE_APPLICATION_CLOSE
     * @type {Integer (Int32)}
     */
    static AZSTORE_FORCE_APPLICATION_CLOSE => 16

    /**
     * Native name: AZ_AZSTORE_NT6_FUNCTION_LEVEL
     * @type {Integer (Int32)}
     */
    static AZSTORE_NT6_FUNCTION_LEVEL => 32

    /**
     * Native name: AZ_AZSTORE_FLAG_MANAGE_ONLY_PASSIVE_SUBMIT
     * @type {Integer (Int32)}
     */
    static AZSTORE_FLAG_MANAGE_ONLY_PASSIVE_SUBMIT => 32768

    /**
     * Native name: AZ_PROP_AZSTORE_DOMAIN_TIMEOUT
     * @type {Integer (Int32)}
     */
    static AZSTORE_DOMAIN_TIMEOUT => 100

    /**
     * Native name: AZ_AZSTORE_DEFAULT_DOMAIN_TIMEOUT
     * @type {Integer (Int32)}
     */
    static AZSTORE_DEFAULT_DOMAIN_TIMEOUT => 15000

    /**
     * Native name: AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT
     * @type {Integer (Int32)}
     */
    static AZSTORE_SCRIPT_ENGINE_TIMEOUT => 101

    /**
     * Native name: AZ_AZSTORE_MIN_DOMAIN_TIMEOUT
     * @type {Integer (Int32)}
     */
    static AZSTORE_MIN_DOMAIN_TIMEOUT => 500

    /**
     * Native name: AZ_AZSTORE_MIN_SCRIPT_ENGINE_TIMEOUT
     * @type {Integer (Int32)}
     */
    static AZSTORE_MIN_SCRIPT_ENGINE_TIMEOUT => 5000

    /**
     * Native name: AZ_AZSTORE_DEFAULT_SCRIPT_ENGINE_TIMEOUT
     * @type {Integer (Int32)}
     */
    static AZSTORE_DEFAULT_SCRIPT_ENGINE_TIMEOUT => 45000

    /**
     * Native name: AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES
     * @type {Integer (Int32)}
     */
    static AZSTORE_MAX_SCRIPT_ENGINES => 102

    /**
     * Native name: AZ_AZSTORE_DEFAULT_MAX_SCRIPT_ENGINES
     * @type {Integer (Int32)}
     */
    static AZSTORE_DEFAULT_MAX_SCRIPT_ENGINES => 120

    /**
     * Native name: AZ_PROP_AZSTORE_MAJOR_VERSION
     * @type {Integer (Int32)}
     */
    static AZSTORE_MAJOR_VERSION => 103

    /**
     * Native name: AZ_PROP_AZSTORE_MINOR_VERSION
     * @type {Integer (Int32)}
     */
    static AZSTORE_MINOR_VERSION => 104

    /**
     * Native name: AZ_PROP_AZSTORE_TARGET_MACHINE
     * @type {Integer (Int32)}
     */
    static AZSTORE_TARGET_MACHINE => 105

    /**
     * Native name: AZ_PROP_AZTORE_IS_ADAM_INSTANCE
     * @type {Integer (Int32)}
     */
    static AZTORE_IS_ADAM_INSTANCE => 106

    /**
     * Native name: AZ_PROP_OPERATION_ID
     * @type {Integer (Int32)}
     */
    static OPERATION_ID => 200

    /**
     * Native name: AZ_PROP_TASK_OPERATIONS
     * @type {Integer (Int32)}
     */
    static TASK_OPERATIONS => 300

    /**
     * Native name: AZ_PROP_TASK_BIZRULE
     * @type {Integer (Int32)}
     */
    static TASK_BIZRULE => 301

    /**
     * Native name: AZ_PROP_TASK_BIZRULE_LANGUAGE
     * @type {Integer (Int32)}
     */
    static TASK_BIZRULE_LANGUAGE => 302

    /**
     * Native name: AZ_PROP_TASK_TASKS
     * @type {Integer (Int32)}
     */
    static TASK_TASKS => 303

    /**
     * Native name: AZ_PROP_TASK_BIZRULE_IMPORTED_PATH
     * @type {Integer (Int32)}
     */
    static TASK_BIZRULE_IMPORTED_PATH => 304

    /**
     * Native name: AZ_PROP_TASK_IS_ROLE_DEFINITION
     * @type {Integer (Int32)}
     */
    static TASK_IS_ROLE_DEFINITION => 305

    /**
     * Native name: AZ_MAX_TASK_BIZRULE_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_TASK_BIZRULE_LENGTH => 65536

    /**
     * Native name: AZ_MAX_TASK_BIZRULE_LANGUAGE_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_TASK_BIZRULE_LANGUAGE_LENGTH => 64

    /**
     * Native name: AZ_MAX_TASK_BIZRULE_IMPORTED_PATH_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_TASK_BIZRULE_IMPORTED_PATH_LENGTH => 512

    /**
     * Native name: AZ_MAX_BIZRULE_STRING
     * @type {Integer (Int32)}
     */
    static MAX_BIZRULE_STRING => 65536

    /**
     * Native name: AZ_PROP_GROUP_TYPE
     * @type {Integer (Int32)}
     */
    static GROUP_TYPE => 400

    /**
     * Native name: AZ_GROUPTYPE_LDAP_QUERY
     * @type {Integer (Int32)}
     */
    static GROUPTYPE_LDAP_QUERY => 1

    /**
     * Native name: AZ_GROUPTYPE_BASIC
     * @type {Integer (Int32)}
     */
    static GROUPTYPE_BASIC => 2

    /**
     * Native name: AZ_GROUPTYPE_BIZRULE
     * @type {Integer (Int32)}
     */
    static GROUPTYPE_BIZRULE => 3

    /**
     * Native name: AZ_PROP_GROUP_APP_MEMBERS
     * @type {Integer (Int32)}
     */
    static GROUP_APP_MEMBERS => 401

    /**
     * Native name: AZ_PROP_GROUP_APP_NON_MEMBERS
     * @type {Integer (Int32)}
     */
    static GROUP_APP_NON_MEMBERS => 402

    /**
     * Native name: AZ_PROP_GROUP_LDAP_QUERY
     * @type {Integer (Int32)}
     */
    static GROUP_LDAP_QUERY => 403

    /**
     * Native name: AZ_MAX_GROUP_LDAP_QUERY_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_GROUP_LDAP_QUERY_LENGTH => 4096

    /**
     * Native name: AZ_PROP_GROUP_MEMBERS
     * @type {Integer (Int32)}
     */
    static GROUP_MEMBERS => 404

    /**
     * Native name: AZ_PROP_GROUP_NON_MEMBERS
     * @type {Integer (Int32)}
     */
    static GROUP_NON_MEMBERS => 405

    /**
     * Native name: AZ_PROP_GROUP_MEMBERS_NAME
     * @type {Integer (Int32)}
     */
    static GROUP_MEMBERS_NAME => 406

    /**
     * Native name: AZ_PROP_GROUP_NON_MEMBERS_NAME
     * @type {Integer (Int32)}
     */
    static GROUP_NON_MEMBERS_NAME => 407

    /**
     * Native name: AZ_PROP_GROUP_BIZRULE
     * @type {Integer (Int32)}
     */
    static GROUP_BIZRULE => 408

    /**
     * Native name: AZ_PROP_GROUP_BIZRULE_LANGUAGE
     * @type {Integer (Int32)}
     */
    static GROUP_BIZRULE_LANGUAGE => 409

    /**
     * Native name: AZ_PROP_GROUP_BIZRULE_IMPORTED_PATH
     * @type {Integer (Int32)}
     */
    static GROUP_BIZRULE_IMPORTED_PATH => 410

    /**
     * Native name: AZ_MAX_GROUP_BIZRULE_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_GROUP_BIZRULE_LENGTH => 65536

    /**
     * Native name: AZ_MAX_GROUP_BIZRULE_LANGUAGE_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_GROUP_BIZRULE_LANGUAGE_LENGTH => 64

    /**
     * Native name: AZ_MAX_GROUP_BIZRULE_IMPORTED_PATH_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_GROUP_BIZRULE_IMPORTED_PATH_LENGTH => 512

    /**
     * Native name: AZ_PROP_ROLE_APP_MEMBERS
     * @type {Integer (Int32)}
     */
    static ROLE_APP_MEMBERS => 500

    /**
     * Native name: AZ_PROP_ROLE_MEMBERS
     * @type {Integer (Int32)}
     */
    static ROLE_MEMBERS => 501

    /**
     * Native name: AZ_PROP_ROLE_OPERATIONS
     * @type {Integer (Int32)}
     */
    static ROLE_OPERATIONS => 502

    /**
     * Native name: AZ_PROP_ROLE_TASKS
     * @type {Integer (Int32)}
     */
    static ROLE_TASKS => 504

    /**
     * Native name: AZ_PROP_ROLE_MEMBERS_NAME
     * @type {Integer (Int32)}
     */
    static ROLE_MEMBERS_NAME => 505

    /**
     * Native name: AZ_PROP_SCOPE_BIZRULES_WRITABLE
     * @type {Integer (Int32)}
     */
    static SCOPE_BIZRULES_WRITABLE => 600

    /**
     * Native name: AZ_PROP_SCOPE_CAN_BE_DELEGATED
     * @type {Integer (Int32)}
     */
    static SCOPE_CAN_BE_DELEGATED => 601

    /**
     * Native name: AZ_PROP_CLIENT_CONTEXT_USER_DN
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_USER_DN => 700

    /**
     * Native name: AZ_PROP_CLIENT_CONTEXT_USER_SAM_COMPAT
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_USER_SAM_COMPAT => 701

    /**
     * Native name: AZ_PROP_CLIENT_CONTEXT_USER_DISPLAY
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_USER_DISPLAY => 702

    /**
     * Native name: AZ_PROP_CLIENT_CONTEXT_USER_GUID
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_USER_GUID => 703

    /**
     * Native name: AZ_PROP_CLIENT_CONTEXT_USER_CANONICAL
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_USER_CANONICAL => 704

    /**
     * Native name: AZ_PROP_CLIENT_CONTEXT_USER_UPN
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_USER_UPN => 705

    /**
     * Native name: AZ_PROP_CLIENT_CONTEXT_USER_DNS_SAM_COMPAT
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_USER_DNS_SAM_COMPAT => 707

    /**
     * Native name: AZ_PROP_CLIENT_CONTEXT_ROLE_FOR_ACCESS_CHECK
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_ROLE_FOR_ACCESS_CHECK => 708

    /**
     * Native name: AZ_PROP_CLIENT_CONTEXT_LDAP_QUERY_DN
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_LDAP_QUERY_DN => 709

    /**
     * Native name: AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID
     * @type {Integer (Int32)}
     */
    static APPLICATION_AUTHZ_INTERFACE_CLSID => 800

    /**
     * Native name: AZ_PROP_APPLICATION_VERSION
     * @type {Integer (Int32)}
     */
    static APPLICATION_VERSION => 801

    /**
     * Native name: AZ_MAX_APPLICATION_VERSION_LENGTH
     * @type {Integer (Int32)}
     */
    static MAX_APPLICATION_VERSION_LENGTH => 512

    /**
     * Native name: AZ_PROP_APPLICATION_NAME
     * @type {Integer (Int32)}
     */
    static APPLICATION_NAME => 802

    /**
     * Native name: AZ_PROP_APPLICATION_BIZRULE_ENABLED
     * @type {Integer (Int32)}
     */
    static APPLICATION_BIZRULE_ENABLED => 803

    /**
     * Native name: AZ_PROP_APPLY_STORE_SACL
     * @type {Integer (Int32)}
     */
    static APPLY_STORE_SACL => 900

    /**
     * Native name: AZ_PROP_GENERATE_AUDITS
     * @type {Integer (Int32)}
     */
    static GENERATE_AUDITS => 901

    /**
     * Native name: AZ_PROP_POLICY_ADMINS
     * @type {Integer (Int32)}
     */
    static POLICY_ADMINS => 902

    /**
     * Native name: AZ_PROP_POLICY_READERS
     * @type {Integer (Int32)}
     */
    static POLICY_READERS => 903

    /**
     * Native name: AZ_PROP_DELEGATED_POLICY_USERS
     * @type {Integer (Int32)}
     */
    static DELEGATED_POLICY_USERS => 904

    /**
     * Native name: AZ_PROP_POLICY_ADMINS_NAME
     * @type {Integer (Int32)}
     */
    static POLICY_ADMINS_NAME => 905

    /**
     * Native name: AZ_PROP_POLICY_READERS_NAME
     * @type {Integer (Int32)}
     */
    static POLICY_READERS_NAME => 906

    /**
     * Native name: AZ_PROP_DELEGATED_POLICY_USERS_NAME
     * @type {Integer (Int32)}
     */
    static DELEGATED_POLICY_USERS_NAME => 907

    /**
     * Native name: AZ_CLIENT_CONTEXT_SKIP_GROUP
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_SKIP_GROUP => 1

    /**
     * Native name: AZ_CLIENT_CONTEXT_SKIP_LDAP_QUERY
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_SKIP_LDAP_QUERY => 1

    /**
     * Native name: AZ_CLIENT_CONTEXT_GET_GROUP_RECURSIVE
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_GET_GROUP_RECURSIVE => 2

    /**
     * Native name: AZ_CLIENT_CONTEXT_GET_GROUPS_STORE_LEVEL_ONLY
     * @type {Integer (Int32)}
     */
    static CLIENT_CONTEXT_GET_GROUPS_STORE_LEVEL_ONLY => 2
}

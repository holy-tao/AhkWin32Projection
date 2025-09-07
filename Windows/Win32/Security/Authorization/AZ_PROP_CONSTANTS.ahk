#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants used by Authorization Manager.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/ne-azroles-az_prop_constants
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AZ_PROP_CONSTANTS{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_NAME => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_DESCRIPTION => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_WRITABLE => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_APPLICATION_DATA => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CHILD_CREATE => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_APPLICATION_NAME_LENGTH => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_OPERATION_NAME_LENGTH => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_TASK_NAME_LENGTH => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_SCOPE_NAME_LENGTH => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_GROUP_NAME_LENGTH => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_ROLE_NAME_LENGTH => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_NAME_LENGTH => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_DESCRIPTION_LENGTH => 1024

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_APPLICATION_DATA_LENGTH => 4096

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_SUBMIT_FLAG_ABORT => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_SUBMIT_FLAG_FLUSH => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_POLICY_URL_LENGTH => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_FLAG_CREATE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_FLAG_MANAGE_STORE_ONLY => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_FLAG_BATCH_UPDATE => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_FLAG_AUDIT_IS_CRITICAL => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_FORCE_APPLICATION_CLOSE => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_NT6_FUNCTION_LEVEL => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_FLAG_MANAGE_ONLY_PASSIVE_SUBMIT => 32768

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_AZSTORE_DOMAIN_TIMEOUT => 100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_DEFAULT_DOMAIN_TIMEOUT => 15000

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT => 101

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_MIN_DOMAIN_TIMEOUT => 500

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_MIN_SCRIPT_ENGINE_TIMEOUT => 5000

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_DEFAULT_SCRIPT_ENGINE_TIMEOUT => 45000

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES => 102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_AZSTORE_DEFAULT_MAX_SCRIPT_ENGINES => 120

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_AZSTORE_MAJOR_VERSION => 103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_AZSTORE_MINOR_VERSION => 104

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_AZSTORE_TARGET_MACHINE => 105

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_AZTORE_IS_ADAM_INSTANCE => 106

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_OPERATION_ID => 200

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_TASK_OPERATIONS => 300

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_TASK_BIZRULE => 301

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_TASK_BIZRULE_LANGUAGE => 302

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_TASK_TASKS => 303

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_TASK_BIZRULE_IMPORTED_PATH => 304

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_TASK_IS_ROLE_DEFINITION => 305

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_TASK_BIZRULE_LENGTH => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_TASK_BIZRULE_LANGUAGE_LENGTH => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_TASK_BIZRULE_IMPORTED_PATH_LENGTH => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_BIZRULE_STRING => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_TYPE => 400

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_GROUPTYPE_LDAP_QUERY => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_GROUPTYPE_BASIC => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_GROUPTYPE_BIZRULE => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_APP_MEMBERS => 401

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_APP_NON_MEMBERS => 402

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_LDAP_QUERY => 403

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_GROUP_LDAP_QUERY_LENGTH => 4096

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_MEMBERS => 404

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_NON_MEMBERS => 405

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_MEMBERS_NAME => 406

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_NON_MEMBERS_NAME => 407

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_BIZRULE => 408

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_BIZRULE_LANGUAGE => 409

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GROUP_BIZRULE_IMPORTED_PATH => 410

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_GROUP_BIZRULE_LENGTH => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_GROUP_BIZRULE_LANGUAGE_LENGTH => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_GROUP_BIZRULE_IMPORTED_PATH_LENGTH => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_ROLE_APP_MEMBERS => 500

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_ROLE_MEMBERS => 501

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_ROLE_OPERATIONS => 502

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_ROLE_TASKS => 504

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_ROLE_MEMBERS_NAME => 505

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_SCOPE_BIZRULES_WRITABLE => 600

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_SCOPE_CAN_BE_DELEGATED => 601

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CLIENT_CONTEXT_USER_DN => 700

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CLIENT_CONTEXT_USER_SAM_COMPAT => 701

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CLIENT_CONTEXT_USER_DISPLAY => 702

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CLIENT_CONTEXT_USER_GUID => 703

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CLIENT_CONTEXT_USER_CANONICAL => 704

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CLIENT_CONTEXT_USER_UPN => 705

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CLIENT_CONTEXT_USER_DNS_SAM_COMPAT => 707

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CLIENT_CONTEXT_ROLE_FOR_ACCESS_CHECK => 708

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_CLIENT_CONTEXT_LDAP_QUERY_DN => 709

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID => 800

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_APPLICATION_VERSION => 801

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_MAX_APPLICATION_VERSION_LENGTH => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_APPLICATION_NAME => 802

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_APPLICATION_BIZRULE_ENABLED => 803

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_APPLY_STORE_SACL => 900

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_GENERATE_AUDITS => 901

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_POLICY_ADMINS => 902

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_POLICY_READERS => 903

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_DELEGATED_POLICY_USERS => 904

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_POLICY_ADMINS_NAME => 905

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_POLICY_READERS_NAME => 906

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_PROP_DELEGATED_POLICY_USERS_NAME => 907

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_CLIENT_CONTEXT_SKIP_GROUP => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_CLIENT_CONTEXT_SKIP_LDAP_QUERY => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_CLIENT_CONTEXT_GET_GROUP_RECURSIVE => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AZ_CLIENT_CONTEXT_GET_GROUPS_STORE_LEVEL_ONLY => 2
}

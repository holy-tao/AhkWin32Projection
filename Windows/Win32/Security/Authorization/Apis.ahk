#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class Authorization {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static SDDL_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SDDL_REVISION => 1

    /**
     * @type {String}
     */
    static SDDL_OWNER => "O"

    /**
     * @type {String}
     */
    static SDDL_GROUP => "G"

    /**
     * @type {String}
     */
    static SDDL_DACL => "D"

    /**
     * @type {String}
     */
    static SDDL_SACL => "S"

    /**
     * @type {String}
     */
    static SDDL_PROTECTED => "P"

    /**
     * @type {String}
     */
    static SDDL_AUTO_INHERIT_REQ => "AR"

    /**
     * @type {String}
     */
    static SDDL_AUTO_INHERITED => "AI"

    /**
     * @type {String}
     */
    static SDDL_NULL_ACL => "NO_ACCESS_CONTROL"

    /**
     * @type {String}
     */
    static SDDL_ACCESS_ALLOWED => "A"

    /**
     * @type {String}
     */
    static SDDL_ACCESS_DENIED => "D"

    /**
     * @type {String}
     */
    static SDDL_OBJECT_ACCESS_ALLOWED => "OA"

    /**
     * @type {String}
     */
    static SDDL_OBJECT_ACCESS_DENIED => "OD"

    /**
     * @type {String}
     */
    static SDDL_AUDIT => "AU"

    /**
     * @type {String}
     */
    static SDDL_ALARM => "AL"

    /**
     * @type {String}
     */
    static SDDL_OBJECT_AUDIT => "OU"

    /**
     * @type {String}
     */
    static SDDL_OBJECT_ALARM => "OL"

    /**
     * @type {String}
     */
    static SDDL_MANDATORY_LABEL => "ML"

    /**
     * @type {String}
     */
    static SDDL_PROCESS_TRUST_LABEL => "TL"

    /**
     * @type {String}
     */
    static SDDL_CALLBACK_ACCESS_ALLOWED => "XA"

    /**
     * @type {String}
     */
    static SDDL_CALLBACK_ACCESS_DENIED => "XD"

    /**
     * @type {String}
     */
    static SDDL_RESOURCE_ATTRIBUTE => "RA"

    /**
     * @type {String}
     */
    static SDDL_SCOPED_POLICY_ID => "SP"

    /**
     * @type {String}
     */
    static SDDL_CALLBACK_AUDIT => "XU"

    /**
     * @type {String}
     */
    static SDDL_CALLBACK_OBJECT_ACCESS_ALLOWED => "ZA"

    /**
     * @type {String}
     */
    static SDDL_ACCESS_FILTER => "FL"

    /**
     * @type {String}
     */
    static SDDL_INT => "TI"

    /**
     * @type {String}
     */
    static SDDL_UINT => "TU"

    /**
     * @type {String}
     */
    static SDDL_WSTRING => "TS"

    /**
     * @type {String}
     */
    static SDDL_SID => "TD"

    /**
     * @type {String}
     */
    static SDDL_BLOB => "TX"

    /**
     * @type {String}
     */
    static SDDL_BOOLEAN => "TB"

    /**
     * @type {String}
     */
    static SDDL_CONTAINER_INHERIT => "CI"

    /**
     * @type {String}
     */
    static SDDL_OBJECT_INHERIT => "OI"

    /**
     * @type {String}
     */
    static SDDL_NO_PROPAGATE => "NP"

    /**
     * @type {String}
     */
    static SDDL_INHERIT_ONLY => "IO"

    /**
     * @type {String}
     */
    static SDDL_INHERITED => "ID"

    /**
     * @type {String}
     */
    static SDDL_CRITICAL => "CR"

    /**
     * @type {String}
     */
    static SDDL_TRUST_PROTECTED_FILTER => "TP"

    /**
     * @type {String}
     */
    static SDDL_AUDIT_SUCCESS => "SA"

    /**
     * @type {String}
     */
    static SDDL_AUDIT_FAILURE => "FA"

    /**
     * @type {String}
     */
    static SDDL_READ_PROPERTY => "RP"

    /**
     * @type {String}
     */
    static SDDL_WRITE_PROPERTY => "WP"

    /**
     * @type {String}
     */
    static SDDL_CREATE_CHILD => "CC"

    /**
     * @type {String}
     */
    static SDDL_DELETE_CHILD => "DC"

    /**
     * @type {String}
     */
    static SDDL_LIST_CHILDREN => "LC"

    /**
     * @type {String}
     */
    static SDDL_SELF_WRITE => "SW"

    /**
     * @type {String}
     */
    static SDDL_LIST_OBJECT => "LO"

    /**
     * @type {String}
     */
    static SDDL_DELETE_TREE => "DT"

    /**
     * @type {String}
     */
    static SDDL_CONTROL_ACCESS => "CR"

    /**
     * @type {String}
     */
    static SDDL_READ_CONTROL => "RC"

    /**
     * @type {String}
     */
    static SDDL_WRITE_DAC => "WD"

    /**
     * @type {String}
     */
    static SDDL_WRITE_OWNER => "WO"

    /**
     * @type {String}
     */
    static SDDL_STANDARD_DELETE => "SD"

    /**
     * @type {String}
     */
    static SDDL_GENERIC_ALL => "GA"

    /**
     * @type {String}
     */
    static SDDL_GENERIC_READ => "GR"

    /**
     * @type {String}
     */
    static SDDL_GENERIC_WRITE => "GW"

    /**
     * @type {String}
     */
    static SDDL_GENERIC_EXECUTE => "GX"

    /**
     * @type {String}
     */
    static SDDL_FILE_ALL => "FA"

    /**
     * @type {String}
     */
    static SDDL_FILE_READ => "FR"

    /**
     * @type {String}
     */
    static SDDL_FILE_WRITE => "FW"

    /**
     * @type {String}
     */
    static SDDL_FILE_EXECUTE => "FX"

    /**
     * @type {String}
     */
    static SDDL_KEY_ALL => "KA"

    /**
     * @type {String}
     */
    static SDDL_KEY_READ => "KR"

    /**
     * @type {String}
     */
    static SDDL_KEY_WRITE => "KW"

    /**
     * @type {String}
     */
    static SDDL_KEY_EXECUTE => "KX"

    /**
     * @type {String}
     */
    static SDDL_NO_WRITE_UP => "NW"

    /**
     * @type {String}
     */
    static SDDL_NO_READ_UP => "NR"

    /**
     * @type {String}
     */
    static SDDL_NO_EXECUTE_UP => "NX"

    /**
     * @type {Integer (UInt32)}
     */
    static SDDL_ALIAS_SIZE => 2

    /**
     * @type {String}
     */
    static SDDL_DOMAIN_ADMINISTRATORS => "DA"

    /**
     * @type {String}
     */
    static SDDL_DOMAIN_GUESTS => "DG"

    /**
     * @type {String}
     */
    static SDDL_DOMAIN_USERS => "DU"

    /**
     * @type {String}
     */
    static SDDL_ENTERPRISE_DOMAIN_CONTROLLERS => "ED"

    /**
     * @type {String}
     */
    static SDDL_DOMAIN_DOMAIN_CONTROLLERS => "DD"

    /**
     * @type {String}
     */
    static SDDL_DOMAIN_COMPUTERS => "DC"

    /**
     * @type {String}
     */
    static SDDL_BUILTIN_ADMINISTRATORS => "BA"

    /**
     * @type {String}
     */
    static SDDL_BUILTIN_GUESTS => "BG"

    /**
     * @type {String}
     */
    static SDDL_BUILTIN_USERS => "BU"

    /**
     * @type {String}
     */
    static SDDL_LOCAL_ADMIN => "LA"

    /**
     * @type {String}
     */
    static SDDL_LOCAL_GUEST => "LG"

    /**
     * @type {String}
     */
    static SDDL_ACCOUNT_OPERATORS => "AO"

    /**
     * @type {String}
     */
    static SDDL_BACKUP_OPERATORS => "BO"

    /**
     * @type {String}
     */
    static SDDL_PRINTER_OPERATORS => "PO"

    /**
     * @type {String}
     */
    static SDDL_SERVER_OPERATORS => "SO"

    /**
     * @type {String}
     */
    static SDDL_AUTHENTICATED_USERS => "AU"

    /**
     * @type {String}
     */
    static SDDL_PERSONAL_SELF => "PS"

    /**
     * @type {String}
     */
    static SDDL_CREATOR_OWNER => "CO"

    /**
     * @type {String}
     */
    static SDDL_CREATOR_GROUP => "CG"

    /**
     * @type {String}
     */
    static SDDL_LOCAL_SYSTEM => "SY"

    /**
     * @type {String}
     */
    static SDDL_POWER_USERS => "PU"

    /**
     * @type {String}
     */
    static SDDL_EVERYONE => "WD"

    /**
     * @type {String}
     */
    static SDDL_REPLICATOR => "RE"

    /**
     * @type {String}
     */
    static SDDL_INTERACTIVE => "IU"

    /**
     * @type {String}
     */
    static SDDL_NETWORK => "NU"

    /**
     * @type {String}
     */
    static SDDL_SERVICE => "SU"

    /**
     * @type {String}
     */
    static SDDL_RESTRICTED_CODE => "RC"

    /**
     * @type {String}
     */
    static SDDL_WRITE_RESTRICTED_CODE => "WR"

    /**
     * @type {String}
     */
    static SDDL_ANONYMOUS => "AN"

    /**
     * @type {String}
     */
    static SDDL_SCHEMA_ADMINISTRATORS => "SA"

    /**
     * @type {String}
     */
    static SDDL_CERT_SERV_ADMINISTRATORS => "CA"

    /**
     * @type {String}
     */
    static SDDL_RAS_SERVERS => "RS"

    /**
     * @type {String}
     */
    static SDDL_ENTERPRISE_ADMINS => "EA"

    /**
     * @type {String}
     */
    static SDDL_GROUP_POLICY_ADMINS => "PA"

    /**
     * @type {String}
     */
    static SDDL_ALIAS_PREW2KCOMPACC => "RU"

    /**
     * @type {String}
     */
    static SDDL_LOCAL_SERVICE => "LS"

    /**
     * @type {String}
     */
    static SDDL_NETWORK_SERVICE => "NS"

    /**
     * @type {String}
     */
    static SDDL_REMOTE_DESKTOP => "RD"

    /**
     * @type {String}
     */
    static SDDL_NETWORK_CONFIGURATION_OPS => "NO"

    /**
     * @type {String}
     */
    static SDDL_PERFMON_USERS => "MU"

    /**
     * @type {String}
     */
    static SDDL_PERFLOG_USERS => "LU"

    /**
     * @type {String}
     */
    static SDDL_IIS_USERS => "IS"

    /**
     * @type {String}
     */
    static SDDL_CRYPTO_OPERATORS => "CY"

    /**
     * @type {String}
     */
    static SDDL_OWNER_RIGHTS => "OW"

    /**
     * @type {String}
     */
    static SDDL_EVENT_LOG_READERS => "ER"

    /**
     * @type {String}
     */
    static SDDL_ENTERPRISE_RO_DCs => "RO"

    /**
     * @type {String}
     */
    static SDDL_CERTSVC_DCOM_ACCESS => "CD"

    /**
     * @type {String}
     */
    static SDDL_ALL_APP_PACKAGES => "AC"

    /**
     * @type {String}
     */
    static SDDL_RDS_REMOTE_ACCESS_SERVERS => "RA"

    /**
     * @type {String}
     */
    static SDDL_RDS_ENDPOINT_SERVERS => "ES"

    /**
     * @type {String}
     */
    static SDDL_RDS_MANAGEMENT_SERVERS => "MS"

    /**
     * @type {String}
     */
    static SDDL_USER_MODE_DRIVERS => "UD"

    /**
     * @type {String}
     */
    static SDDL_HYPER_V_ADMINS => "HA"

    /**
     * @type {String}
     */
    static SDDL_CLONEABLE_CONTROLLERS => "CN"

    /**
     * @type {String}
     */
    static SDDL_ACCESS_CONTROL_ASSISTANCE_OPS => "AA"

    /**
     * @type {String}
     */
    static SDDL_REMOTE_MANAGEMENT_USERS => "RM"

    /**
     * @type {String}
     */
    static SDDL_AUTHORITY_ASSERTED => "AS"

    /**
     * @type {String}
     */
    static SDDL_SERVICE_ASSERTED => "SS"

    /**
     * @type {String}
     */
    static SDDL_PROTECTED_USERS => "AP"

    /**
     * @type {String}
     */
    static SDDL_KEY_ADMINS => "KA"

    /**
     * @type {String}
     */
    static SDDL_ENTERPRISE_KEY_ADMINS => "EK"

    /**
     * @type {String}
     */
    static SDDL_ML_LOW => "LW"

    /**
     * @type {String}
     */
    static SDDL_ML_MEDIUM => "ME"

    /**
     * @type {String}
     */
    static SDDL_ML_MEDIUM_PLUS => "MP"

    /**
     * @type {String}
     */
    static SDDL_ML_HIGH => "HI"

    /**
     * @type {String}
     */
    static SDDL_ML_SYSTEM => "SI"

    /**
     * @type {String}
     */
    static SDDL_SEPERATOR => ";"

    /**
     * @type {String}
     */
    static SDDL_DELIMINATOR => ":"

    /**
     * @type {String}
     */
    static SDDL_ACE_BEGIN => "("

    /**
     * @type {String}
     */
    static SDDL_ACE_END => ")"

    /**
     * @type {String}
     */
    static SDDL_ACE_COND_BEGIN => "("

    /**
     * @type {String}
     */
    static SDDL_ACE_COND_END => ")"

    /**
     * @type {String}
     */
    static SDDL_SPACE => " "

    /**
     * @type {String}
     */
    static SDDL_ACE_COND_BLOB_PREFIX => "#"

    /**
     * @type {String}
     */
    static SDDL_ACE_COND_SID_PREFIX => "SID"

    /**
     * @type {String}
     */
    static SDDL_ACE_COND_ATTRIBUTE_PREFIX => "@"

    /**
     * @type {String}
     */
    static SDDL_ACE_COND_USER_ATTRIBUTE_PREFIX => "@USER."

    /**
     * @type {String}
     */
    static SDDL_ACE_COND_RESOURCE_ATTRIBUTE_PREFIX => "@RESOURCE."

    /**
     * @type {String}
     */
    static SDDL_ACE_COND_DEVICE_ATTRIBUTE_PREFIX => "@DEVICE."

    /**
     * @type {String}
     */
    static SDDL_ACE_COND_TOKEN_ATTRIBUTE_PREFIX => "@TOKEN."

    /**
     * @type {Integer (UInt32)}
     */
    static INHERITED_ACCESS_ENTRY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INHERITED_PARENT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static INHERITED_GRANDPARENT => 536870912

    /**
     * @type {String}
     */
    static ACCCTRL_DEFAULT_PROVIDERA => "Windows NT Access Provider"

    /**
     * @type {String}
     */
    static ACCCTRL_DEFAULT_PROVIDERW => "Windows NT Access Provider"

    /**
     * @type {String}
     */
    static ACCCTRL_DEFAULT_PROVIDER => "Windows NT Access Provider"

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTEE_ACCESS_ALLOWED => 1

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTEE_ACCESS_READ => 2

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTEE_ACCESS_WRITE => 4

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTEE_ACCESS_EXPLICIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTEE_ACCESS_ALL => -1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_RESERVED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_4 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_5 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_6 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_7 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_8 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_9 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_10 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_11 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_12 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_13 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_14 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_15 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_16 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_17 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_18 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_19 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PERM_20 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_ACCESS_PROTECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SYSTEM_ACCESS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DELETE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_READ_CONTROL => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_CHANGE_ACCESS => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_CHANGE_OWNER => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SYNCHRONIZE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_STD_RIGHTS_ALL => 4160749568

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_FILE_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_FILE_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_FILE_APPEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_FILE_READ_PROP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_FILE_WRITE_PROP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_FILE_EXECUTE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_FILE_READ_ATTRIB => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_FILE_WRITE_ATTRIB => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_FILE_CREATE_PIPE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DIR_LIST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DIR_CREATE_OBJECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DIR_CREATE_CHILD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DIR_DELETE_CHILD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DIR_TRAVERSE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_TERMINATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_THREAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_VM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_VM_READ => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_VM_WRITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_DUP_HANDLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_PROCESS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_SET_INFO => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_GET_INFO => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_CONTROL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_ALERT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_GET_CONTEXT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_SET_CONTEXT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_TOKEN => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_IMPERSONATE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_KERNEL_DIMPERSONATE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PRINT_SADMIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PRINT_SLIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PRINT_PADMIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PRINT_PUSE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_PRINT_JADMIN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SVC_GET_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SVC_SET_INFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SVC_STATUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SVC_LIST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SVC_START => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SVC_STOP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SVC_PAUSE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SVC_INTERROGATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_SVC_UCONTROL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_REG_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_REG_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_REG_CREATE_CHILD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_REG_LIST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_REG_NOTIFY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_REG_LINK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_WIN_CLIPBRD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_WIN_GLOBAL_ATOMS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_WIN_CREATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_WIN_LIST_DESK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_WIN_LIST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_WIN_READ_ATTRIBS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_WIN_WRITE_ATTRIBS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_WIN_SCREEN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_WIN_EXIT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_ACCESS_NO_OPTIONS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_ACCESS_SUPPORTS_OBJECT_ENTRIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_TYPE_LEGACY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_TYPE_WMI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AP_ParamTypeBits => 8

    /**
     * @type {Integer (Int32)}
     */
    static AP_ParamTypeMask => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _AUTHZ_SS_MAXSIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static APF_AuditFailure => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APF_AuditSuccess => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APF_ValidFlags => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZP_WPD_EVENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_ALLOW_MULTIPLE_SOURCE_INSTANCES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_MIGRATED_LEGACY_PUBLISHER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_AUDIT_INSTANCE_INFORMATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SKIP_TOKEN_GROUPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_REQUIRE_S4U_LOGON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_COMPUTE_PRIVILEGES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_TYPE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_TYPE_INT64 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_TYPE_UINT64 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_TYPE_STRING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_TYPE_SID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_TYPE_BOOLEAN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_RPC_INIT_INFO_CLIENT_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_INIT_INFO_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_WPD_CATEGORY_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_FLAG_ALLOW_MULTIPLE_SOURCE_INSTANCES => 1

    /**
     * @type {Integer (Int32)}
     */
    static OLESCRIPT_E_SYNTAX => -2147352319
;@endregion Constants

;@region Methods
    /**
     * Determines which access bits can be granted to a client for a given set of security descriptors.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzaccesscheckcallback">AuthzAccessCheckCallback</a> callback function will be called if the DACL of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure pointed to by the <i>pSecurityDescriptor</i> parameter contains a callback <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entry</a> (ACE).
     * 
     * Security attribute variables must be present in the client context if referred to in a conditional expression, otherwise the conditional expression term referencing them will evaluate to unknown. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-definition-language-for-conditional-aces-">Security Descriptor Definition Language for Conditional ACEs</a> topic.
     * 
     * For more information, see the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/how-dacls-control-access-to-an-object">How AccessCheck Works</a> and <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/centralized-authorization-policy">Centralized Authorization Policy</a> overviews.
     * @param {Integer} Flags 
     * @param {Pointer<Void>} hAuthzClientContext A handle to a structure that represents the client.
     * 					
     * 
     * Starting with Windows 8 and Windows Server 2012,  the client context can be local or remote.
     * @param {Pointer<AUTHZ_ACCESS_REQUEST>} pRequest A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_access_request">AUTHZ_ACCESS_REQUEST</a> structure that specifies the desired access mask, principal self <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID), and the object type list structure, if it exists.
     * @param {Pointer<Void>} hAuditEvent A structure that contains object-specific audit information. When the value of this parameter is not <b>null</b>, an audit is automatically requested. Static audit information is read from the resource manager structure. 
     * 
     * Starting with Windows 8 and Windows Server 2012,  when you use this function with a remote context handle, the value of the parameter must be <b>NULL</b>.
     * @param {Pointer<Void>} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure to be used for access checks. The owner SID for the object is picked from this security descriptor. A <b>NULL </b><a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) in this security descriptor represents a <b>NULL</b> DACL for the entire object. Make sure the security descriptor contains OWNER and DACL information, or an error code 87 or "invalid parameter" message will be generated.
     * 
     * <div class="alert"><b>Important</b>  <b>NULL</b> DACLs permit all types of access to all users; therefore, do not use <b>NULL</b> DACLs. For information about creating a DACL, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/creating-a-dacl">Creating a DACL</a>.</div>
     * <div> </div>
     *  A <b>NULL </b><a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) in this security descriptor is treated the same way as an empty SACL.
     * @param {Pointer<Void>} OptionalSecurityDescriptorArray An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structures. <b>NULL </b><a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control lists</a> (ACLs) in these security descriptors are treated as empty ACLs. The ACL for the entire object is the logical concatenation of all of the ACLs.
     * @param {Integer} OptionalSecurityDescriptorCount The number of security descriptors not including the primary security descriptor.
     * @param {Pointer<AUTHZ_ACCESS_REPLY>} pReply A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_access_reply">AUTHZ_ACCESS_REPLY</a> structure that contains the results of the access check. Before calling the <b>AuthzAccessCheck</b> function, an application must allocate memory for the <b>GrantedAccessMask</b> and <b>SaclEvaluationResults</b> members of the <b>AUTHZ_ACCESS_REPLY</b> structure referenced by <i>pReply</i>.
     * @param {Pointer<Void>} phAccessCheckResults A pointer to return a handle to the cached results of the access check. When this parameter value is not <b>null</b>, the results of this access check call will be cached. This results in a MAXIMUM_ALLOWED check. 
     * 
     * Starting with Windows 8 and Windows Server 2012,  when you use this function with a remote context handle, the value of the parameter must be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzaccesscheck
     * @since windows5.1.2600
     */
    static AuthzAccessCheck(Flags, hAuthzClientContext, pRequest, hAuditEvent, pSecurityDescriptor, OptionalSecurityDescriptorArray, OptionalSecurityDescriptorCount, pReply, phAccessCheckResults) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzAccessCheck", "uint", Flags, "ptr", hAuthzClientContext, "ptr", pRequest, "ptr", hAuditEvent, "ptr", pSecurityDescriptor, "ptr", OptionalSecurityDescriptorArray, "uint", OptionalSecurityDescriptorCount, "ptr", pReply, "ptr", phAccessCheckResults, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Performs a fast access check based on a cached handle containing the static granted bits from a previous AuthzAccessCheck call.
     * @remarks
     * The client context pointer is stored in the <i>AuthzHandle</i> parameter. The structure of the client context must be exactly the same as it was at the time <i>AuthzHandle</i> was created. This restriction is for the following fields:
     * 
     * <ul>
     * <li>SIDs</li>
     * <li>RestrictedSids</li>
     * <li>Privileges</li>
     * </ul>
     * Pointers to the primary <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> and the optional security descriptor array are stored in <i>AuthzHandle</i> at the time of handle creation. These pointers must still be valid. 
     * 
     * The <b>AuthzCachedAccessCheck</b> function maintains a cache as a result of evaluating Central Access Policies (CAP) on objects unless CAPs are ignored, for example when the AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES flag is used. The client may call the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzfreecentralaccesspolicycache">AuthzFreeCentralAccessPolicyCache</a> function to free up this cache. Note that this requires a subsequent call to <b>AuthzCachedAccessCheck</b> to rebuild the cache if necessary. 
     * 
     * For more information, see the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/how-dacls-control-access-to-an-object">How AccessCheck Works</a> and <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/centralized-authorization-policy">Centralized Authorization Policy</a> overviews.
     * @param {Integer} Flags Reserved for future use.
     * @param {Pointer<Void>} hAccessCheckResults A handle to the cached access check results.
     * @param {Pointer<AUTHZ_ACCESS_REQUEST>} pRequest Access request handle specifying the desired <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a>, principal self <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">SID</a>, and the object type list structure (if any).
     * @param {Pointer<Void>} hAuditEvent A structure that contains object-specific audit information. When the value of this parameter is not null, an audit is automatically requested. Static audit information is read from the resource manager structure.
     * @param {Pointer<AUTHZ_ACCESS_REPLY>} pReply A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_access_reply">AUTHZ_ACCESS_REPLY</a> handle that returns the results of access check as an array of GrantedAccessMask/ErrorValue pairs. The number of pairs returned is supplied by the caller in the <b>ResultListLength</b> member of the <b>AUTHZ_ACCESS_REPLY</b> structure.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Expected values of the Error members of array elements returned are shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All the access bits, not including MAXIMUM_ALLOWED, are granted and the <b>GrantedAccessMask</b> member of the <i>pReply</i> parameter  is not zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DesiredAccess</b> member of the <i>pRequest</i> parameter includes ACCESS_SYSTEM_SECURITY, and the client does not have the SeSecurityPrivilege privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The requested bits are not granted.</li>
     * <li>The MaximumAllowed bit is on, and the granted access is zero.</li>
     * <li>The <b>DesiredAccess</b> member of the <i>pRequest</i> parameter is zero.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzcachedaccesscheck
     * @since windows5.1.2600
     */
    static AuthzCachedAccessCheck(Flags, hAccessCheckResults, pRequest, hAuditEvent, pReply) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzCachedAccessCheck", "uint", Flags, "ptr", hAccessCheckResults, "ptr", pRequest, "ptr", hAuditEvent, "ptr", pReply, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads the system access control list (SACL) of the specified security descriptor and generates any appropriate audits specified by that SACL.
     * @param {Integer} Flags Reserved for future use.
     * @param {Pointer<Void>} hAuthzClientContext A handle to the client context of the object to open.
     * @param {Pointer<AUTHZ_ACCESS_REQUEST>} pRequest A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_access_request">AUTHZ_ACCESS_REQUEST</a> structure.
     * @param {Pointer<Void>} hAuditEvent A handle to the audit event to use.
     * @param {Pointer<Void>} pSecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure for the object.
     * @param {Pointer<Void>} OptionalSecurityDescriptorArray A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structures.
     * @param {Integer} OptionalSecurityDescriptorCount The number of elements in <i>SecurityDescriptorArray</i>.
     * @param {Pointer<AUTHZ_ACCESS_REPLY>} pReply A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_access_reply">AUTHZ_ACCESS_REPLY</a> structure.
     * @returns {Integer} If the function succeeds, it returns a nonzero value. 
     * 
     * If the function fails, it returns a zero value. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzopenobjectaudit
     * @since windows5.1.2600
     */
    static AuthzOpenObjectAudit(Flags, hAuthzClientContext, pRequest, hAuditEvent, pSecurityDescriptor, OptionalSecurityDescriptorArray, OptionalSecurityDescriptorCount, pReply) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzOpenObjectAudit", "uint", Flags, "ptr", hAuthzClientContext, "ptr", pRequest, "ptr", hAuditEvent, "ptr", pSecurityDescriptor, "ptr", OptionalSecurityDescriptorArray, "uint", OptionalSecurityDescriptorCount, "ptr", pReply, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Finds and deletes a handle from the handle list.
     * @param {Pointer<Void>} hAccessCheckResults A handle to be freed.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzfreehandle
     * @since windows5.1.2600
     */
    static AuthzFreeHandle(hAccessCheckResults) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzFreeHandle", "ptr", hAccessCheckResults, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Uses Authz to verify that clients have access to various resources.
     * @param {Integer} Flags A <b>DWORD</b> value that defines how the resource manager is initialized. This parameter can contain the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default call to the function. The resource manager is initialized as the principal identified in the process token, and auditing is in effect. Note that unless the <b>AUTHZ_RM_FLAG_NO_AUDIT</b> flag is set, <b>SeAuditPrivilege</b> must be enabled for the function to succeed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_RM_FLAG_NO_AUDIT"></a><a id="authz_rm_flag_no_audit"></a><dl>
     * <dt><b>AUTHZ_RM_FLAG_NO_AUDIT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Auditing is not in effect. If this flag is set, the caller does not need to have <b>SeAuditPrivilege</b> enabled to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION"></a><a id="authz_rm_flag_initialize_under_impersonation"></a><dl>
     * <dt><b>AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource manager is initialized as the identity of the thread token.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES"></a><a id="authz_rm_flag_no_central_access_policies"></a><dl>
     * <dt><b>AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource manager ignores CAP IDs and does not evaluate centralized access policies.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * AUTHZ_RM_FLAG_NO_AUDIT and AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION can be bitwise-combined.
     * @param {Pointer<PFN_AUTHZ_DYNAMIC_ACCESS_CHECK>} pfnDynamicAccessCheck A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzaccesscheckcallback">AuthzAccessCheckCallback</a> callback function that the resource manager calls each time it encounters a callback
     * 						<a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entry</a> (ACE) during <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) evaluation in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzcachedaccesscheck">AuthzCachedAccessCheck</a>.  This parameter can be <b>NULL</b> if no access check callback function is used.
     * @param {Pointer<PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS>} pfnComputeDynamicGroups A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzcomputegroupscallback">AuthzComputeGroupsCallback</a> callback function called by the resource manager during initialization of an <i>AuthzClientContext</i> handle. This parameter can be <b>NULL</b> if no callback function is used to compute dynamic groups.
     * @param {Pointer<PFN_AUTHZ_FREE_DYNAMIC_GROUPS>} pfnFreeDynamicGroups A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzfreegroupscallback">AuthzFreeGroupsCallback</a> callback function called by the resource manager to free <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) attribute arrays allocated by the compute dynamic groups callback. This parameter can be <b>NULL</b> if no callback function is used to compute dynamic groups.
     * @param {Pointer<Char>} szResourceManagerName A string that identifies the resource manager. This parameter can be <b>NULL</b> if the resource manager does not need a name.
     * @param {Pointer<Void>} phAuthzResourceManager A pointer to the returned resource manager handle. When you have finished using the handle, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzfreeresourcemanager">AuthzFreeResourceManager</a> function.
     * @returns {Integer} If the function succeeds, the function returns a nonzero value. 
     * 
     * If the function fails, it returns a zero value. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinitializeresourcemanager
     * @since windows5.1.2600
     */
    static AuthzInitializeResourceManager(Flags, pfnDynamicAccessCheck, pfnComputeDynamicGroups, pfnFreeDynamicGroups, szResourceManagerName, phAuthzResourceManager) {
        szResourceManagerName := szResourceManagerName is String? StrPtr(szResourceManagerName) : szResourceManagerName

        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInitializeResourceManager", "uint", Flags, "ptr", pfnDynamicAccessCheck, "ptr", pfnComputeDynamicGroups, "ptr", pfnFreeDynamicGroups, "ptr", szResourceManagerName, "ptr", phAuthzResourceManager, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates and initializes a resource manager structure.
     * @remarks
     * If the AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES flag is specified, then <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> and <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzcachedaccesscheck">AuthzCachedAccessCheck</a> ignore CAPID (Central Access Policie ID) <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_scoped_policy_id_ace">SYSTEM_SCOPED_POLICY_ID_ACE</a> and will not evaluate CAPs.
     * 
     * If the AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES flag is not specified and pfnGetCentralAccessPolicy is <b>NULL</b>, then <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> and <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzcachedaccesscheck">AuthzCachedAccessCheck</a> will get CAPs from LSA. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/nf-ntlsa-lsagetappliedcapids">LsaGetAppliedCAPIDs</a>.
     * 
     * If the AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES flag is not specified and a central access policy callback is provided by the resource manager, then <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> and <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzcachedaccesscheck">AuthzCachedAccessCheck</a> will get CAPs from the resource manager by invoking the callback.
     * 
     * The LSA and the central access policy callback can indicate that CAPs are not supported, in which case <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> and <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzcachedaccesscheck">AuthzCachedAccessCheck</a> ignore CAPID ACEs and will not evaluate CAPs.
     * 
     * The LSA and the central access policy callback may fail to return a CAP that corresponds to a particular CAPID, in which case <b>AuthzAccessCheck</b> and <b>AuthzCachedAccessCheck</b> use the same default CAP as the kernel AccessCheck.
     * @param {Integer} Flags 
     * @param {Pointer<AUTHZ_INIT_INFO>} pAuthzInitInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_init_info">AUTHZ_INIT_INFO</a> structure that contains the authorization resource manager initialization information.
     * @param {Pointer<Void>} phAuthzResourceManager A pointer to the returned resource manager handle. When you have finished using the handle, free it by using the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzfreeresourcemanager">AuthzFreeResourceManager</a> function.
     * @returns {Integer} If the function succeeds, the function returns a value of <b>TRUE</b>. 
     * 
     * If the function fails, it returns a value of <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinitializeresourcemanagerex
     * @since windows8.0
     */
    static AuthzInitializeResourceManagerEx(Flags, pAuthzInitInfo, phAuthzResourceManager) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInitializeResourceManagerEx", "uint", Flags, "ptr", pAuthzInitInfo, "ptr", phAuthzResourceManager, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates and initializes a remote resource manager. The caller can use the resulting handle to make RPC calls to a remote instance of the resource manager configured on a server.
     * @param {Pointer<AUTHZ_RPC_INIT_INFO_CLIENT>} pRpcInitInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_rpc_init_info_client">AUTHZ_RPC_INIT_INFO_CLIENT</a> structure containing the initial information needed to configure the connection.
     * @param {Pointer<Void>} phAuthzResourceManager A handle to the resource manager. When you have finished using the handle, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzfreeresourcemanager">AuthzFreeResourceManager</a> function.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>. 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinitializeremoteresourcemanager
     * @since windows8.0
     */
    static AuthzInitializeRemoteResourceManager(pRpcInitInfo, phAuthzResourceManager) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInitializeRemoteResourceManager", "ptr", pRpcInitInfo, "ptr", phAuthzResourceManager, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees a resource manager object.
     * @param {Pointer<Void>} hAuthzResourceManager The <b>AUTHZ_RESOURCE_MANAGER_HANDLE</b> to be freed.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzfreeresourcemanager
     * @since windows5.1.2600
     */
    static AuthzFreeResourceManager(hAuthzResourceManager) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzFreeResourceManager", "ptr", hAuthzResourceManager, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a client authorization context from a kernel token. The kernel token must have been opened for TOKEN_QUERY.
     * @remarks
     * This function calls the  <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzcomputegroupscallback">AuthzComputeGroupsCallback</a> callback function to add <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> to the newly created context.
     * @param {Integer} Flags Reserved for future use.
     * @param {Pointer<Void>} TokenHandle A handle to the client token used to initialize the <i>pAuthzClientContext</i> parameter. The token must have been opened with TOKEN_QUERY access.
     * @param {Pointer<Void>} hAuthzResourceManager A handle to the resource manager that created this client context. This handle is stored in the client context structure.
     * @param {Pointer<Int64>} pExpirationTime Expiration date and time of the token. If no value is passed, the token never expires. Expiration time is not currently enforced.
     * @param {Pointer} Identifier Identifier that is specific to the resource manager. This parameter is not currently used.
     * @param {Pointer<Void>} DynamicGroupArgs A pointer to parameters to be passed to the callback function that computes dynamic groups.
     * @param {Pointer<Void>} phAuthzClientContext A pointer to the <i>AuthzClientContext</i> handle returned. Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzfreecontext">AuthzFreeContext</a> when done with the client context.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinitializecontextfromtoken
     * @since windows5.1.2600
     */
    static AuthzInitializeContextFromToken(Flags, TokenHandle, hAuthzResourceManager, pExpirationTime, Identifier, DynamicGroupArgs, phAuthzClientContext) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInitializeContextFromToken", "uint", Flags, "ptr", TokenHandle, "ptr", hAuthzResourceManager, "int64*", pExpirationTime, "ptr", Identifier, "ptr", DynamicGroupArgs, "ptr", phAuthzClientContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a user-mode client context from a user security identifier (SID).
     * @remarks
     * If possible, call the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzinitializecontextfromtoken">AuthzInitializeContextFromToken</a>  function instead of <b>AuthzInitializeContextFromSid</b>. <b>AuthzInitializeContextFromSid</b> attempts to retrieve the information available in a logon token had the client actually logged on. An actual logon token provides more information, such as logon type and logon properties, and reflects the behavior of the authentication package used for the logon. The client context  created by <b>AuthzInitializeContextFromToken</b> uses a logon token, and the resulting client context is more complete and accurate than a client context created by <b>AuthzInitializeContextFromSid</b>.
     * 
     * This function resolves valid user SIDs only.
     * 
     * <b>Windows XP:  </b>This function resolves group memberships for valid user and group SIDs (unless the AUTHZ_SKIP_TOKEN_GROUPS flag is used). Support for resolving memberships of group SIDs may be altered or unavailable in subsequent versions.
     * 
     * This function calls the  <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzcomputegroupscallback">AuthzComputeGroupsCallback</a> callback function to add SIDs to the newly created context.
     * 
     * <div class="alert"><b>Important</b>  Applications should not assume that the calling context has permission to use this function. The <b>AuthzInitializeContextFromSid</b> function reads the tokenGroupsGlobalAndUniversal attribute of the SID specified in the call to determine the current user's group memberships. If the user's object is in <a href="https://docs.microsoft.com/windows/desktop/AD/active-directory-domain-services">Active Directory</a>, the calling context must have read access to the tokenGroupsGlobalAndUniversal attribute on the user object. When a new domain is created, the default access compatibility selection is <b>Permissions compatible with Windows 2000 and Windows Server 2003 operating systems</b>. When this option is set, the  <b>Pre-Windows 2000 Compatible Access</b> group includes only the <b>Authenticated Users</b>  built-in security identifiers. Therefore, applications may not have access to the tokenGroupsGlobalAndUniversal attribute; in this case, the <b>AuthzInitializeContextFromSid</b> function  fails with ACCESS_DENIED. Applications that use this function should correctly handle this error and provide supporting documentation. To simplify granting accounts permission to query a user's group information, add accounts that need the ability to look up group information to the Windows Authorization Access Group.</div>
     * <div> </div>
     * @param {Integer} Flags The following flags are defined. 
     * 
     * Starting with Windows 8 and Windows Server 2012,  when you call this function on a remote context handle, the upper 16 bits must be zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default value.
     * 
     * <b>AuthzInitializeContextFromSid</b> attempts to retrieve the user's token group information by performing an S4U logon.
     * 
     * If S4U logon is not supported by the user's domain or the calling computer, <b>AuthzInitializeContextFromSid</b> queries the user's account object for group information. When an account is queried directly, some groups that represent logon characteristics, such as Network, Interactive, Anonymous, Network Service, or Local Service, are omitted. Applications can explicitly add such group SIDs by implementing the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzcomputegroupscallback">AuthzComputeGroupsCallback</a> function or calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaddsidstocontext">AuthzAddSidsToContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_SKIP_TOKEN_GROUPS"></a><a id="authz_skip_token_groups"></a><dl>
     * <dt><b>AUTHZ_SKIP_TOKEN_GROUPS</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes <b>AuthzInitializeContextFromSid</b> to skip all group evaluations. When this flag is used, the context returned contains only the SID specified by the <i>UserSid</i> parameter. The specified SID can be an arbitrary or application-specific SID. Other SIDs can be added to this context by implementing the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzcomputegroupscallback">AuthzComputeGroupsCallback</a> function or by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaddsidstocontext">AuthzAddSidsToContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_REQUIRE_S4U_LOGON"></a><a id="authz_require_s4u_logon"></a><dl>
     * <dt><b>AUTHZ_REQUIRE_S4U_LOGON</b></dt>
     * <dt>4 (0x4)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes <b>AuthzInitializeContextFromSid</b> to fail if Windows Services For User is not available to retrieve token group information.
     * 
     * <b>Windows XP:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_COMPUTE_PRIVILEGES"></a><a id="authz_compute_privileges"></a><dl>
     * <dt><b>AUTHZ_COMPUTE_PRIVILEGES</b></dt>
     * <dt>8 (0x8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes <b>AuthzInitializeContextFromSid</b> to retrieve privileges for the new context. If this function performs an S4U logon, it retrieves privileges from the token. Otherwise, the function retrieves privileges from all SIDs in the context.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} UserSid The SID of the user for whom a client context will be created. This must be a valid user or computer account unless the AUTHZ_SKIP_TOKEN_GROUPS flag is used.
     * @param {Pointer<Void>} hAuthzResourceManager A handle to the resource manager creating this client context. This handle is stored in the client context structure. 
     * 
     * Starting with Windows 8 and Windows Server 2012, the resource manager can be local or remote and is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzinitializeremoteresourcemanager">AuthzInitializeRemoteResourceManager</a> function.
     * @param {Pointer<Int64>} pExpirationTime Expiration date and time of the token. If no value is passed, the token never expires. Expiration time is not currently enforced.
     * @param {Pointer} Identifier Specific identifier of the resource manager. This parameter is not currently used.
     * @param {Pointer<Void>} DynamicGroupArgs A pointer to parameters to be passed to the callback function that computes dynamic groups. This parameter can be <b>NULL</b> if no dynamic parameters are passed to the callback function. 
     * 
     * Starting with Windows 8 and Windows Server 2012, this parameter must be  <b>NULL</b> if the resource manager is remote. Otherwise, ERROR_NOT_SUPPORTED will be set.
     * @param {Pointer<Void>} phAuthzClientContext A pointer to the handle to the client context that the <b>AuthzInitializeContextFromSid</b> function creates.  When you have finished using the handle, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzfreecontext">AuthzFreeContext</a> function.
     * @returns {Integer} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinitializecontextfromsid
     * @since windows5.1.2600
     */
    static AuthzInitializeContextFromSid(Flags, UserSid, hAuthzResourceManager, pExpirationTime, Identifier, DynamicGroupArgs, phAuthzClientContext) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInitializeContextFromSid", "uint", Flags, "ptr", UserSid, "ptr", hAuthzResourceManager, "int64*", pExpirationTime, "ptr", Identifier, "ptr", DynamicGroupArgs, "ptr", phAuthzClientContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new client context based on an existing client context.
     * @remarks
     * This function calls the  <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzcomputegroupscallback">AuthzComputeGroupsCallback</a> callback function to add <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> to the newly created context.
     * @param {Integer} Flags Reserved for future use.
     * @param {Pointer<Void>} hAuthzClientContext The handle to an existing client context.
     * @param {Pointer<Int64>} pExpirationTime Sets the time limit for how long the returned context structure is valid. If no value is passed, then the token never expires. Expiration time is not currently enforced.
     * @param {Pointer} Identifier The specific identifier for the resource manager.
     * @param {Pointer<Void>} DynamicGroupArgs A pointer to parameters to be passed to the callback function that computes dynamic groups. If the value is <b>NULL</b>, then the callback function is not called.
     * @param {Pointer<Void>} phNewAuthzClientContext A pointer to the duplicated AUTHZ_CLIENT_CONTEXT_HANDLE handle. When you have finished using the handle, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzfreecontext">AuthzFreeContext</a> function.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinitializecontextfromauthzcontext
     * @since windows5.1.2600
     */
    static AuthzInitializeContextFromAuthzContext(Flags, hAuthzClientContext, pExpirationTime, Identifier, DynamicGroupArgs, phNewAuthzClientContext) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInitializeContextFromAuthzContext", "uint", Flags, "ptr", hAuthzClientContext, "int64*", pExpirationTime, "ptr", Identifier, "ptr", DynamicGroupArgs, "ptr", phNewAuthzClientContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a user-mode context from the given user and device security contexts.
     * @param {Pointer<Void>} UserContext User context to create the compound context from.
     * @param {Pointer<Void>} DeviceContext Device context to create the compound context from. This must not be the same as the user context.
     * @param {Pointer<Void>} phCompoundContext Used to return the resultant compound context.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinitializecompoundcontext
     * @since windows8.0
     */
    static AuthzInitializeCompoundContext(UserContext, DeviceContext, phCompoundContext) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInitializeCompoundContext", "ptr", UserContext, "ptr", DeviceContext, "ptr", phCompoundContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a copy of an existing context and appends a given set of security identifiers (SIDs) and restricted SIDs.
     * @param {Pointer<Void>} hAuthzClientContext An <b>AUTHZ_CLIENT_CONTEXT_HANDLE</b> structure to be copied as the basis for <i>NewClientContext</i>.
     * @param {Pointer<SID_AND_ATTRIBUTES>} Sids A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structure containing the SIDs and attributes to be added to the unrestricted part of the client context.
     * @param {Integer} SidCount The number of SIDs to be added.
     * @param {Pointer<SID_AND_ATTRIBUTES>} RestrictedSids A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structure containing the SIDs and attributes to be added to the restricted part of the client context.
     * @param {Integer} RestrictedSidCount Number of restricted SIDs to be added.
     * @param {Pointer<Void>} phNewAuthzClientContext A pointer to the created <b>AUTHZ_CLIENT_CONTEXT_HANDLE</b> structure containing input values for expiration time, identifier, flags, additional SIDs and restricted SIDs.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzaddsidstocontext
     * @since windows5.1.2600
     */
    static AuthzAddSidsToContext(hAuthzClientContext, Sids, SidCount, RestrictedSids, RestrictedSidCount, phNewAuthzClientContext) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzAddSidsToContext", "ptr", hAuthzClientContext, "ptr", Sids, "uint", SidCount, "ptr", RestrictedSids, "uint", RestrictedSidCount, "ptr", phNewAuthzClientContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Modifies the security attribute information in the specified client context.
     * @param {Pointer<Void>} hAuthzClientContext A handle to the client context to be modified.
     * @param {Pointer<Int32>} pOperations A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_security_attribute_operation">AUTHZ_SECURITY_ATTRIBUTE_OPERATION</a> enumeration values that specify the types of modifications to make.
     * 
     * This array must have only one element if the value of that element is <b>AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE_ALL</b>. Otherwise, the array has the same number of elements as the <i>pAttributes</i> array.
     * @param {Pointer<AUTHZ_SECURITY_ATTRIBUTES_INFORMATION>} pAttributes A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure that specifies the attributes to modify.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzmodifysecurityattributes
     * @since windows6.1
     */
    static AuthzModifySecurityAttributes(hAuthzClientContext, pOperations, pAttributes) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzModifySecurityAttributes", "ptr", hAuthzClientContext, "int*", pOperations, "ptr", pAttributes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds, deletes, or modifies user and device claims in the Authz client context.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_security_attribute_operation">AUTHZ_SECURITY_ATTRIBUTE_OPERATION</a> enumeration must have only one element if 
     *     the value of that element is AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE_ALL. 
     *     Otherwise, the array has the same number of elements as the corresponding 
     *     PAUTHZ_SECURITY_ATTRIBUTES_INFORMATION.
     * 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_security_attribute_operation">AUTHZ_SECURITY_ATTRIBUTE_OPERATION</a> enumeration is AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE and the function fails, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error code is ERROR_ALREADY_EXISTS, the claim's values have duplicate entries.
     * @param {Pointer<Void>} hAuthzClientContext A handle to the client context to be modified.
     * @param {Integer} ClaimClass Type of information to be modified. The caller can specify AuthzContextInfoUserClaims or AuthzContextInfoDeviceClaims.
     * @param {Pointer<Int32>} pClaimOperations A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_security_attribute_operation">AUTHZ_SECURITY_ATTRIBUTE_OPERATION</a> enumeration values that specify the type of claim modification to make.
     * @param {Pointer<AUTHZ_SECURITY_ATTRIBUTES_INFORMATION>} pClaims A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure that specifies the claims to modify.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzmodifyclaims
     * @since windows8.0
     */
    static AuthzModifyClaims(hAuthzClientContext, ClaimClass, pClaimOperations, pClaims) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzModifyClaims", "ptr", hAuthzClientContext, "int", ClaimClass, "int*", pClaimOperations, "ptr", pClaims, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds, deletes, or modifies user and device groups in the Authz client context.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_sid_operation">AUTHZ_SID_OPERATION</a> enumeration must have only one element if the value of that element is AUTHZ_SID_OPERATION_REPLACE_ALL. Otherwise, the array has the same number of elements as the corresponding 
     * PTOKEN_GROUPS.
     * 
     * 
     * When you want to use <b>AuthzModifySids</b> to delete, the SIDs are matched but not the SID flags. If no matching SID is found, no modifications are done and the call fails.
     * @param {Pointer<Void>} hAuthzClientContext A handle to the client context to be modified.
     * @param {Integer} SidClass Type of information to be modified. The caller can specify AuthzContextInfoGroupsSids, AuthzContextInfoRestrictedSids, or AuthzContextInfoDeviceSids.
     * @param {Pointer<Int32>} pSidOperations A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_sid_operation">AUTHZ_SID_OPERATION</a> enumeration values that specify the group modifications to make.
     * @param {Pointer<TOKEN_GROUPS>} pSids A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that specifies the groups to modify.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzmodifysids
     * @since windows8.0
     */
    static AuthzModifySids(hAuthzClientContext, SidClass, pSidOperations, pSids) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzModifySids", "ptr", hAuthzClientContext, "int", SidClass, "int*", pSidOperations, "ptr", pSids, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the app container and capability information in a current Authz context.
     * @param {Pointer<Void>} hAuthzClientContext The handle to the client context to which the given app container SID and capability SIDs will be added.
     * @param {Pointer<Void>} pAppContainerSid The app container SID.
     * @param {Integer} CapabilityCount The number of capability SIDs to be added. This value can be zero if no capability is to be added.
     * @param {Pointer<SID_AND_ATTRIBUTES>} pCapabilitySids The capability SIDs to be added to the context. This value must be <b>NULL</b> when the <i>CapabilityCount</i> parameter is zero.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzsetappcontainerinformation
     * @since windows8.0
     */
    static AuthzSetAppContainerInformation(hAuthzClientContext, pAppContainerSid, CapabilityCount, pCapabilitySids) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzSetAppContainerInformation", "ptr", hAuthzClientContext, "ptr", pAppContainerSid, "uint", CapabilityCount, "ptr", pCapabilitySids, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns information about an Authz context.
     * @param {Pointer<Void>} hAuthzClientContext A handle to the context.
     * @param {Integer} InfoClass A value of the <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_context_information_class">AUTHZ_CONTEXT_INFORMATION_CLASS</a> enumeration that indicates the type of information to be returned.
     * @param {Integer} BufferSize Size of the buffer passed.
     * @param {Pointer<UInt32>} pSizeRequired A pointer to a <b>DWORD</b> of  the buffer size required for returning the structure.
     * @param {Pointer<Void>} Buffer A pointer to memory that can receive the information. The structure returned depends on the information requested in the <i>InfoClass</i> parameter.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzgetinformationfromcontext
     * @since windows5.1.2600
     */
    static AuthzGetInformationFromContext(hAuthzClientContext, InfoClass, BufferSize, pSizeRequired, Buffer) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzGetInformationFromContext", "ptr", hAuthzClientContext, "int", InfoClass, "uint", BufferSize, "uint*", pSizeRequired, "ptr", Buffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees all structures and memory associated with the client context. The list of handles for a client is freed in this call.
     * @param {Pointer<Void>} hAuthzClientContext The <b>AUTHZ_CLIENT_CONTEXT_HANDLE</b> structure to be freed.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzfreecontext
     * @since windows5.1.2600
     */
    static AuthzFreeContext(hAuthzClientContext) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzFreeContext", "ptr", hAuthzClientContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes auditing for an object.
     * @param {Integer} Flags 
     * @param {Pointer<Void>} hAuditEventType Reserved. This parameter should be set to <b>NULL</b>.
     * @param {Pointer<Char>} szOperationType String that indicates the operation that is to be audited.
     * @param {Pointer<Char>} szObjectType String that indicates the type of object being accessed.
     * @param {Pointer<Char>} szObjectName String the indicates the name of the object being accessed.
     * @param {Pointer<Char>} szAdditionalInfo String, defined by the Resource Manager, for additional audit information.
     * @param {Pointer<Void>} phAuditEvent Pointer that receives an <b>AUTHZ_AUDIT_EVENT_HANDLE</b> structure.
     * @param {Integer} dwAdditionalParameterCount Must be set to zero.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinitializeobjectaccessauditevent
     * @since windows5.1.2600
     */
    static AuthzInitializeObjectAccessAuditEvent(Flags, hAuditEventType, szOperationType, szObjectType, szObjectName, szAdditionalInfo, phAuditEvent, dwAdditionalParameterCount) {
        szOperationType := szOperationType is String? StrPtr(szOperationType) : szOperationType
        szObjectType := szObjectType is String? StrPtr(szObjectType) : szObjectType
        szObjectName := szObjectName is String? StrPtr(szObjectName) : szObjectName
        szAdditionalInfo := szAdditionalInfo is String? StrPtr(szAdditionalInfo) : szAdditionalInfo

        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInitializeObjectAccessAuditEvent", "uint", Flags, "ptr", hAuditEventType, "ptr", szOperationType, "ptr", szObjectType, "ptr", szObjectName, "ptr", szAdditionalInfo, "ptr", phAuditEvent, "uint", dwAdditionalParameterCount, "CDecl int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates and initializes an AUTHZ_AUDIT_EVENT_HANDLE handle for use with the AuthzAccessCheck function.
     * @param {Integer} Flags Flags that modify the behavior of the audit. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_NO_ALLOC_STRINGS"></a><a id="authz_no_alloc_strings"></a><dl>
     * <dt><b>AUTHZ_NO_ALLOC_STRINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses pointers to the passed strings instead of allocating memory and copying the strings. The calling application must ensure that the passed memory remains valid during access checks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_NO_FAILURE_AUDIT"></a><a id="authz_no_failure_audit"></a><dl>
     * <dt><b>AUTHZ_NO_FAILURE_AUDIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables generation of failure audits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_NO_SUCCESS_AUDIT"></a><a id="authz_no_success_audit"></a><dl>
     * <dt><b>AUTHZ_NO_SUCCESS_AUDIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables generation of success audits.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hAuditEventType Reserved. This parameter should be set to <b>NULL</b>.
     * @param {Pointer<Char>} szOperationType A pointer to a string that indicates the operation that is to be audited.
     * @param {Pointer<Char>} szObjectType A pointer to a string that indicates the type of object  accessed.
     * @param {Pointer<Char>} szObjectName A pointer to a string that indicates the name of the object  accessed.
     * @param {Pointer<Char>} szAdditionalInfo Pointer to a string defined by the Resource Manager that contains additional audit information.
     * @param {Pointer<Char>} szAdditionalInfo2 Pointer to a string defined by the Resource Manager that contains additional audit information.
     * @param {Pointer<Void>} phAuditEvent A pointer to the returned <b>AUTHZ_AUDIT_EVENT_HANDLE</b> handle.
     * @param {Integer} dwAdditionalParameterCount Must be set to zero.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinitializeobjectaccessauditevent2
     * @since windowsserver2003
     */
    static AuthzInitializeObjectAccessAuditEvent2(Flags, hAuditEventType, szOperationType, szObjectType, szObjectName, szAdditionalInfo, szAdditionalInfo2, phAuditEvent, dwAdditionalParameterCount) {
        szOperationType := szOperationType is String? StrPtr(szOperationType) : szOperationType
        szObjectType := szObjectType is String? StrPtr(szObjectType) : szObjectType
        szObjectName := szObjectName is String? StrPtr(szObjectName) : szObjectName
        szAdditionalInfo := szAdditionalInfo is String? StrPtr(szAdditionalInfo) : szAdditionalInfo
        szAdditionalInfo2 := szAdditionalInfo2 is String? StrPtr(szAdditionalInfo2) : szAdditionalInfo2

        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInitializeObjectAccessAuditEvent2", "uint", Flags, "ptr", hAuditEventType, "ptr", szOperationType, "ptr", szObjectType, "ptr", szObjectName, "ptr", szAdditionalInfo, "ptr", szAdditionalInfo2, "ptr", phAuditEvent, "uint", dwAdditionalParameterCount, "CDecl int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees the structure allocated by the AuthzInitializeObjectAccessAuditEvent function.
     * @param {Pointer<Void>} hAuditEvent A pointer to the <b>AUTHZ_AUDIT_EVENT_HANDLE</b> structure to be freed.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzfreeauditevent
     * @since windows5.1.2600
     */
    static AuthzFreeAuditEvent(hAuditEvent) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzFreeAuditEvent", "ptr", hAuditEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} AuthzClientContext 
     * @param {Pointer<AUTHZ_ACCESS_REQUEST>} pRequest 
     * @param {Pointer<ACL>} Sacl 
     * @param {Integer} GrantedAccess 
     * @param {Integer} AccessGranted 
     * @param {Pointer<Int32>} pbGenerateAudit 
     * @returns {Integer} 
     */
    static AuthzEvaluateSacl(AuthzClientContext, pRequest, Sacl, GrantedAccess, AccessGranted, pbGenerateAudit) {
        result := DllCall("AUTHZ.dll\AuthzEvaluateSacl", "ptr", AuthzClientContext, "ptr", pRequest, "ptr", Sacl, "uint", GrantedAccess, "int", AccessGranted, "int*", pbGenerateAudit, "int")
        return result
    }

    /**
     * Installs the specified source as a security event source.
     * @param {Integer} dwFlags This parameter is reserved for future use and must be set to zero.
     * @param {Pointer<AUTHZ_SOURCE_SCHEMA_REGISTRATION>} pRegistration A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_source_schema_registration">AUTHZ_SOURCE_SCHEMA_REGISTRATION</a> structure that contains information about the security event source to be added.
     * 
     * The members of the <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_source_schema_registration">AUTHZ_SOURCE_SCHEMA_REGISTRATION</a> structure are used as follows to install the security event source in the security log key:
     * 
     * <ul>
     * <li>The <b>szEventSourceName</b> member is added as a registry key under <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SYSTEM</b>
     *       <b>CurrentControlSet</b>
     *          <b>Services</b>
     *             <b>EventLog</b>
     *                <b>Security</b></pre>
     * </li>
     * <li>The <b>szEventMessageFile</b> member is added as the data in a REG_SZ value named <b>EventMessageFile</b> under the event source key.</li>
     * <li>The <b>szEventAccessStringsFile</b> member is added as the data in a REG_SZ value named <b>ParameterMessageFile</b> under the event source key.</li>
     * <li>If the registry path does not exist, it is created.</li>
     * </ul>
     * <ul>
     * <li>If the <b>szEventSourceXmlSchemaFile</b> member is not <b>NULL</b>, it is added as the data in a REG_SZ value named <b>XmlSchemaFile</b> under the event source key. This value is not used.</li>
     * <li>The <b>szExecutableImagePath</b> member may be set to <b>NULL</b>.</li>
     * </ul>
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzinstallsecurityeventsource
     * @since windowsserver2003
     */
    static AuthzInstallSecurityEventSource(dwFlags, pRegistration) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzInstallSecurityEventSource", "uint", dwFlags, "ptr", pRegistration, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes the specified source from the list of valid security event sources.
     * @param {Integer} dwFlags Reserved for future use; set this parameter to zero.
     * @param {Pointer<Char>} szEventSourceName Name of the source to remove from the list of valid security event sources. This corresponds to  the <b>szEventSourceName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_source_schema_registration">AUTHZ_SOURCE_SCHEMA_REGISTRATION</a> structure that defines the source.
     * 
     * This function removes the source information from the registry. For more information about the registry keys and values affected, see the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzinstallsecurityeventsource">AuthzInstallSecurityEventSource</a> function.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzuninstallsecurityeventsource
     * @since windowsserver2003
     */
    static AuthzUninstallSecurityEventSource(dwFlags, szEventSourceName) {
        szEventSourceName := szEventSourceName is String? StrPtr(szEventSourceName) : szEventSourceName

        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzUninstallSecurityEventSource", "uint", dwFlags, "ptr", szEventSourceName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the registered security event sources that are not installed by default.
     * @param {Integer} dwFlags Reserved for future use; set this parameter to zero.
     * @param {Pointer<AUTHZ_SOURCE_SCHEMA_REGISTRATION>} Buffer A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_source_schema_registration">AUTHZ_SOURCE_SCHEMA_REGISTRATION</a> structures that returns the registered security event sources.
     * @param {Pointer<UInt32>} pdwCount A pointer to a  variable that receives the number of event sources found.
     * @param {Pointer<UInt32>} pdwLength A pointer to a variable that specifies the length of the <i>Buffer</i> parameter in bytes. On output, this parameter receives the number of bytes used or required.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzenumeratesecurityeventsources
     * @since windowsserver2003
     */
    static AuthzEnumerateSecurityEventSources(dwFlags, Buffer, pdwCount, pdwLength) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzEnumerateSecurityEventSources", "uint", dwFlags, "ptr", Buffer, "uint*", pdwCount, "uint*", pdwLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a security event source with the Local Security Authority (LSA).
     * @remarks
     * This function  validates the <i>szEventSourceName</i> parameter  and sets up the appropriate structures and RPC connections to log events with that source name.  The validation is handled by an underlying call to an LSA API.  
     * 
     * The LSA API  verifies the following:
     * 
     * <ul>
     * <li>The caller has the  SeAuditPrivilege access right.</li>
     * <li>The event source is not already in use.</li>
     * <li>The event source is registered.</li>
     * <li>The calling application matches the executable image path in the event source registration, if one exists.</li>
     * </ul>
     * @param {Integer} dwFlags This parameter is reserved for future use. Set this parameter to zero.
     * @param {Pointer<Char>} szEventSourceName A pointer to the name of the security event source to register.
     * @param {Pointer<Void>} phEventProvider A pointer to a handle to the registered security event source.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzregistersecurityeventsource
     * @since windowsserver2003
     */
    static AuthzRegisterSecurityEventSource(dwFlags, szEventSourceName, phEventProvider) {
        szEventSourceName := szEventSourceName is String? StrPtr(szEventSourceName) : szEventSourceName

        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzRegisterSecurityEventSource", "uint", dwFlags, "ptr", szEventSourceName, "ptr", phEventProvider, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unregisters a security event source with the Local Security Authority (LSA).
     * @remarks
     * This function deallocates any resources and closes any RPC connections associated with a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzregistersecurityeventsource">AuthzRegisterSecurityEventSource</a> function.
     * @param {Integer} dwFlags This parameter is reserved for future use. Set this parameter to zero.
     * @param {Pointer<Void>} phEventProvider A pointer to a handle to the security event source to unregister.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzunregistersecurityeventsource
     * @since windowsserver2003
     */
    static AuthzUnregisterSecurityEventSource(dwFlags, phEventProvider) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzUnregisterSecurityEventSource", "uint", dwFlags, "ptr", phEventProvider, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Generates a security audit for a registered security event source.
     * @param {Integer} dwFlags Flags that specify the type of audit generated. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="APF_AuditFailure"></a><a id="apf_auditfailure"></a><a id="APF_AUDITFAILURE"></a><dl>
     * <dt><b>APF_AuditFailure</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure audits are generated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="APF_AuditSuccess"></a><a id="apf_auditsuccess"></a><a id="APF_AUDITSUCCESS"></a><dl>
     * <dt><b>APF_AuditSuccess</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success audits are generated.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hEventProvider A handle to the registered security event source to use for the audit.
     * @param {Integer} dwAuditId The identifier of the audit.
     * @param {Pointer<Void>} pUserSid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) that will be listed as the source of the audit in the event log.
     * @param {Integer} dwCount The number of AuditParamFlag  type/value pairs that appear in the variable arguments section that follows this parameter.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzreportsecurityevent
     * @since windowsserver2003
     */
    static AuthzReportSecurityEvent(dwFlags, hEventProvider, dwAuditId, pUserSid, dwCount) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzReportSecurityEvent", "uint", dwFlags, "ptr", hEventProvider, "uint", dwAuditId, "ptr", pUserSid, "uint", dwCount, "CDecl int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Generates a security audit for a registered security event source by using the specified array of audit parameters.
     * @param {Integer} dwFlags Reserved for future use.
     * @param {Pointer<Void>} hEventProvider A handle to the registered security event source to use for the audit.
     * @param {Integer} dwAuditId The identifier of the audit.
     * @param {Pointer<Void>} pUserSid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) that will be listed as the source of the audit in the event log.
     * @param {Pointer<AUDIT_PARAMS>} pParams An array of audit parameters.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzreportsecurityeventfromparams
     * @since windowsserver2003
     */
    static AuthzReportSecurityEventFromParams(dwFlags, hEventProvider, dwAuditId, pUserSid, pParams) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzReportSecurityEventFromParams", "uint", dwFlags, "ptr", hEventProvider, "uint", dwAuditId, "ptr", pUserSid, "ptr", pParams, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a CAP update notification callback.
     * @remarks
     * This function is intended for applications that manually manage CAP usage to get notified of CAP changes in the system.
     * @param {Pointer<Void>} phCapChangeSubscription Pointer to the CAP change notification subscription handle. When you have finished using the handle, unsubscribe by passing this parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzunregistercapchangenotification">AuthzUnregisterCapChangeNotification</a> function.
     * @param {Pointer<LPTHREAD_START_ROUTINE>} pfnCapChangeCallback The CAP change notification callback function.
     * @param {Pointer<Void>} pCallbackContext The context of the user to be passed to the callback function.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzregistercapchangenotification
     * @since windows8.0
     */
    static AuthzRegisterCapChangeNotification(phCapChangeSubscription, pfnCapChangeCallback, pCallbackContext) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzRegisterCapChangeNotification", "ptr", phCapChangeSubscription, "ptr", pfnCapChangeCallback, "ptr", pCallbackContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes a previously registered CAP update notification callback.
     * @remarks
     * This function blocks operations until all callbacks are complete. Do not call this function from inside a callback function because it will cause a deadlock.
     * @param {Pointer<Void>} hCapChangeSubscription Handle of the CAP change notification subscription to unregister.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzunregistercapchangenotification
     * @since windows8.0
     */
    static AuthzUnregisterCapChangeNotification(hCapChangeSubscription) {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzUnregisterCapChangeNotification", "ptr", hCapChangeSubscription, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decreases the CAP cache reference count by one so that the CAP cache can be deallocated.
     * @remarks
     * For more information, see the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/how-dacls-control-access-to-an-object">How AccessCheck Works</a> and <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/centralized-authorization-policy">Centralized Authorization Policy</a> overviews.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/authz/nf-authz-authzfreecentralaccesspolicycache
     * @since windows8.0
     */
    static AuthzFreeCentralAccessPolicyCache() {
        A_LastError := 0

        result := DllCall("AUTHZ.dll\AuthzFreeCentralAccessPolicyCache", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new access control list (ACL) by merging new access control or audit control information into an existing ACL structure. (ANSI)
     * @remarks
     * Each entry in the array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures specifies access control or audit control information for a specified trustee. A trustee can be a user, group, or other <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) value, such as a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a> or logon type (for instance, a Windows service or batch job). You can use a name or a SID to identify a trustee.
     * 
     * You can use the <b>SetEntriesInAcl</b> function to modify the list of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) in a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) or a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL). Note that <b>SetEntriesInAcl</b> does not prevent you from mixing access control and audit control information in the same 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>; however, the resulting ACL will contain meaningless entries.
     * 
     * For a DACL, the <b>grfAccessMode</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure specifies whether to allow, deny, or revoke access rights for the trustee. This member can specify one of the following values:
     * 
     * <ul>
     * <li>GRANT_ACCESS</li>
     * <li>SET_ACCESS</li>
     * <li>DENY_ACCESS</li>
     * <li>REVOKE_ACCESS</li>
     * </ul>
     *  For information about these values, see <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a>.
     * 
     * The <b>SetEntriesInAcl</b> function places any new access-denied ACEs at the beginning of the list of ACEs for the new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>. This function  places any new access-allowed ACEs just before any existing access-allowed ACEs.
     * 
     * For a SACL, the <b>grfAccessMode</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure can specify the following values:
     * 
     * <ul>
     * <li>REVOKE_ACCESS</li>
     * <li>SET_AUDIT_FAILURE</li>
     * <li>SET_AUDIT_SUCCESS</li>
     * </ul>
     * SET_AUDIT_FAILURE and  SET_AUDIT_SUCCESS can be combined. For information about these values, see <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a>.
     * 
     * The <b>SetEntriesInAcl</b> function places any new system-audit ACEs at the beginning of the list of ACEs for the new ACL.
     * @param {Integer} cCountOfExplicitEntries The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures in the <i>pListOfExplicitEntries</i> array.
     * @param {Pointer<EXPLICIT_ACCESS_A>} pListOfExplicitEntries A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe the access control information to merge into the existing ACL.
     * @param {Pointer<ACL>} OldAcl A pointer to the existing ACL. This parameter can be <b>NULL</b>, in which case, the function creates a new ACL based on the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> entries.
     * @param {Pointer<ACL>} NewAcl A pointer to a variable that receives a pointer to the new ACL. If the function succeeds, you must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the returned buffer.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-setentriesinacla
     * @since windows5.1.2600
     */
    static SetEntriesInAclA(cCountOfExplicitEntries, pListOfExplicitEntries, OldAcl, NewAcl) {
        result := DllCall("ADVAPI32.dll\SetEntriesInAclA", "uint", cCountOfExplicitEntries, "ptr", pListOfExplicitEntries, "ptr", OldAcl, "ptr", NewAcl, "uint")
        return result
    }

    /**
     * Creates a new access control list (ACL) by merging new access control or audit control information into an existing ACL structure. (Unicode)
     * @remarks
     * Each entry in the array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures specifies access control or audit control information for a specified trustee. A trustee can be a user, group, or other <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) value, such as a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a> or logon type (for instance, a Windows service or batch job). You can use a name or a SID to identify a trustee.
     * 
     * You can use the <b>SetEntriesInAcl</b> function to modify the list of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) in a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) or a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL). Note that <b>SetEntriesInAcl</b> does not prevent you from mixing access control and audit control information in the same 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>; however, the resulting ACL will contain meaningless entries.
     * 
     * For a DACL, the <b>grfAccessMode</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure specifies whether to allow, deny, or revoke access rights for the trustee. This member can specify one of the following values:
     * 
     * <ul>
     * <li>GRANT_ACCESS</li>
     * <li>SET_ACCESS</li>
     * <li>DENY_ACCESS</li>
     * <li>REVOKE_ACCESS</li>
     * </ul>
     *  For information about these values, see <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a>.
     * 
     * The <b>SetEntriesInAcl</b> function places any new access-denied ACEs at the beginning of the list of ACEs for the new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>. This function  places any new access-allowed ACEs just before any existing access-allowed ACEs.
     * 
     * For a SACL, the <b>grfAccessMode</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure can specify the following values:
     * 
     * <ul>
     * <li>REVOKE_ACCESS</li>
     * <li>SET_AUDIT_FAILURE</li>
     * <li>SET_AUDIT_SUCCESS</li>
     * </ul>
     * SET_AUDIT_FAILURE and  SET_AUDIT_SUCCESS can be combined. For information about these values, see <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a>.
     * 
     * The <b>SetEntriesInAcl</b> function places any new system-audit ACEs at the beginning of the list of ACEs for the new ACL.
     * @param {Integer} cCountOfExplicitEntries The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures in the <i>pListOfExplicitEntries</i> array.
     * @param {Pointer<EXPLICIT_ACCESS_W>} pListOfExplicitEntries A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe the access control information to merge into the existing ACL.
     * @param {Pointer<ACL>} OldAcl A pointer to the existing ACL. This parameter can be <b>NULL</b>, in which case, the function creates a new ACL based on the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> entries.
     * @param {Pointer<ACL>} NewAcl A pointer to a variable that receives a pointer to the new ACL. If the function succeeds, you must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the returned buffer.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-setentriesinaclw
     * @since windows5.1.2600
     */
    static SetEntriesInAclW(cCountOfExplicitEntries, pListOfExplicitEntries, OldAcl, NewAcl) {
        result := DllCall("ADVAPI32.dll\SetEntriesInAclW", "uint", cCountOfExplicitEntries, "ptr", pListOfExplicitEntries, "ptr", OldAcl, "ptr", NewAcl, "uint")
        return result
    }

    /**
     * Retrieves an array of structures that describe the access control entries (ACEs) in an access control list (ACL). (ANSI)
     * @remarks
     * Each entry in the array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures describes access control information from an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACE</a> for a trustee. A trustee can be a user, group, or program (such as a Windows service).
     * 
     * Each <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure specifies a set of access rights and an access mode flag that indicates whether the ACE allows, denies, or audits the specified rights.
     * 
     * For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL), the access mode flag can be  either GRANT_ACCESS or DENY_ACCESS. For information about these values, see <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a>.
     * 
     * For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL), the access mode flag can be SET_AUDIT_ACCESS, SET_AUDIT_FAILURE, or both. For information about these values, see <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines GetExplicitEntriesFromAcl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<ACL>} pacl A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure from which to get 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACE</a> information.
     * @param {Pointer<UInt32>} pcCountOfExplicitEntries A pointer to a variable that receives the number of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures returned in the <i>pListOfExplicitEntries</i> array.
     * @param {Pointer<EXPLICIT_ACCESS_A>} pListOfExplicitEntries A pointer to a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe the ACEs in the ACL. If the function succeeds, you must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the returned buffer.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-getexplicitentriesfromacla
     * @since windows5.1.2600
     */
    static GetExplicitEntriesFromAclA(pacl, pcCountOfExplicitEntries, pListOfExplicitEntries) {
        result := DllCall("ADVAPI32.dll\GetExplicitEntriesFromAclA", "ptr", pacl, "uint*", pcCountOfExplicitEntries, "ptr", pListOfExplicitEntries, "uint")
        return result
    }

    /**
     * Retrieves an array of structures that describe the access control entries (ACEs) in an access control list (ACL). (Unicode)
     * @remarks
     * Each entry in the array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures describes access control information from an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACE</a> for a trustee. A trustee can be a user, group, or program (such as a Windows service).
     * 
     * Each <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure specifies a set of access rights and an access mode flag that indicates whether the ACE allows, denies, or audits the specified rights.
     * 
     * For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL), the access mode flag can be  either GRANT_ACCESS or DENY_ACCESS. For information about these values, see <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a>.
     * 
     * For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL), the access mode flag can be SET_AUDIT_ACCESS, SET_AUDIT_FAILURE, or both. For information about these values, see <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines GetExplicitEntriesFromAcl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<ACL>} pacl A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure from which to get 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACE</a> information.
     * @param {Pointer<UInt32>} pcCountOfExplicitEntries A pointer to a variable that receives the number of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures returned in the <i>pListOfExplicitEntries</i> array.
     * @param {Pointer<EXPLICIT_ACCESS_W>} pListOfExplicitEntries A pointer to a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe the ACEs in the ACL. If the function succeeds, you must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the returned buffer.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-getexplicitentriesfromaclw
     * @since windows5.1.2600
     */
    static GetExplicitEntriesFromAclW(pacl, pcCountOfExplicitEntries, pListOfExplicitEntries) {
        result := DllCall("ADVAPI32.dll\GetExplicitEntriesFromAclW", "ptr", pacl, "uint*", pcCountOfExplicitEntries, "ptr", pListOfExplicitEntries, "uint")
        return result
    }

    /**
     * Retrieves the effective access rights that an ACL structure grants to a specified trustee. The trustee's effective access rights are the access rights that the ACL grants to the trustee or to any groups of which the trustee is a member. (ANSI)
     * @remarks
     * The <b>GetEffectiveRightsFromAcl</b> function checks all access-allowed and access-denied <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) to determine the effective rights for the trustee. For all ACEs that allow or deny rights to a group, <b>GetEffectiveRightsFromAcl</b> enumerates the members of the group to determine whether the trustee is a member. The function returns an error if it cannot enumerate the members of a group.
     * 
     * A trustee's group rights are enumerated by <b>GetEffectiveRightsFromAcl</b> on the local computer, even if the trustee is accessing objects on a remote computer. This function does not evaluate group rights on remote computers.
     * 
     * The <b>GetEffectiveRightsFromAcl</b>  function does not consider  the following:
     * 
     * <ul>
     * <li>Implicitly granted access rights, such as READ_CONTROL and WRITE_DAC, for the owner of an object when determining effective rights.</li>
     * <li>Privileges held by the trustee when determining effective access rights.</li>
     * <li>Group rights associated with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>, such as interactive, network, authenticated users, and so forth, in determining effective access rights.</li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">Resource manager</a> policy. For example, for file objects, Delete and Read attributes can be provided by the parent even if they have been denied on the object.</li>
     * </ul>
     * The <b>GetEffectiveRightsFromAcl</b> function fails and returns <b>ERROR_INVALID_ACL</b> if the specified ACL contains an inherited access-denied ACE.
     * @param {Pointer<ACL>} pacl A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure from which to get the trustee's effective access rights.
     * @param {Pointer<TRUSTEE_A>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the trustee. A trustee can be a user, group, or program (such as a Windows service). You can use a name or a security identifier (<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>) to identify a trustee.
     * @param {Pointer<UInt32>} pAccessRights A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> variable that receives the effective access rights of the trustee.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-geteffectiverightsfromacla
     * @since windows5.1.2600
     */
    static GetEffectiveRightsFromAclA(pacl, pTrustee, pAccessRights) {
        result := DllCall("ADVAPI32.dll\GetEffectiveRightsFromAclA", "ptr", pacl, "ptr", pTrustee, "uint*", pAccessRights, "uint")
        return result
    }

    /**
     * Retrieves the effective access rights that an ACL structure grants to a specified trustee. The trustee's effective access rights are the access rights that the ACL grants to the trustee or to any groups of which the trustee is a member. (Unicode)
     * @remarks
     * The <b>GetEffectiveRightsFromAcl</b> function checks all access-allowed and access-denied <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) to determine the effective rights for the trustee. For all ACEs that allow or deny rights to a group, <b>GetEffectiveRightsFromAcl</b> enumerates the members of the group to determine whether the trustee is a member. The function returns an error if it cannot enumerate the members of a group.
     * 
     * A trustee's group rights are enumerated by <b>GetEffectiveRightsFromAcl</b> on the local computer, even if the trustee is accessing objects on a remote computer. This function does not evaluate group rights on remote computers.
     * 
     * The <b>GetEffectiveRightsFromAcl</b>  function does not consider  the following:
     * 
     * <ul>
     * <li>Implicitly granted access rights, such as READ_CONTROL and WRITE_DAC, for the owner of an object when determining effective rights.</li>
     * <li>Privileges held by the trustee when determining effective access rights.</li>
     * <li>Group rights associated with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>, such as interactive, network, authenticated users, and so forth, in determining effective access rights.</li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">Resource manager</a> policy. For example, for file objects, Delete and Read attributes can be provided by the parent even if they have been denied on the object.</li>
     * </ul>
     * The <b>GetEffectiveRightsFromAcl</b> function fails and returns <b>ERROR_INVALID_ACL</b> if the specified ACL contains an inherited access-denied ACE.
     * @param {Pointer<ACL>} pacl A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure from which to get the trustee's effective access rights.
     * @param {Pointer<TRUSTEE_W>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the trustee. A trustee can be a user, group, or program (such as a Windows service). You can use a name or a security identifier (<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>) to identify a trustee.
     * @param {Pointer<UInt32>} pAccessRights A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> variable that receives the effective access rights of the trustee.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-geteffectiverightsfromaclw
     * @since windows5.1.2600
     */
    static GetEffectiveRightsFromAclW(pacl, pTrustee, pAccessRights) {
        result := DllCall("ADVAPI32.dll\GetEffectiveRightsFromAclW", "ptr", pacl, "ptr", pTrustee, "uint*", pAccessRights, "uint")
        return result
    }

    /**
     * Retrieves the audited access rights for a specified trustee. (ANSI)
     * @remarks
     * The <b>GetAuditedPermissionsFromAcl</b> function checks all system-audit ACEs in the ACL to determine the audited rights for the trustee. For all ACEs that specify audited rights for a group, <b>GetAuditedPermissionsFromAcl</b> enumerates the members of the group to determine whether the trustee is a member. The function returns an error if it cannot enumerate the members of a group.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines GetAuditedPermissionsFromAcl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<ACL>} pacl A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure from which to get the trustee's audited access rights.
     * @param {Pointer<TRUSTEE_A>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the trustee. A trustee can be a user, group, or program (such as a Windows service). You can use a name or a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) to identify a trustee. For information about SID structures, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>.
     * @param {Pointer<UInt32>} pSuccessfulAuditedRights A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that receives the successful audit mask for rights audited for the trustee specified by the <i>pTrustee</i> parameter. The system generates an audit record when the trustee successfully uses any of these access rights.
     * @param {Pointer<UInt32>} pFailedAuditRights A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that receives the failed audit mask for rights audited for the trustee specified by the <i>pTrustee</i> parameter. The system generates an audit record when the trustee fails in an attempt to use any of these rights.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-getauditedpermissionsfromacla
     * @since windows5.1.2600
     */
    static GetAuditedPermissionsFromAclA(pacl, pTrustee, pSuccessfulAuditedRights, pFailedAuditRights) {
        result := DllCall("ADVAPI32.dll\GetAuditedPermissionsFromAclA", "ptr", pacl, "ptr", pTrustee, "uint*", pSuccessfulAuditedRights, "uint*", pFailedAuditRights, "uint")
        return result
    }

    /**
     * Retrieves the audited access rights for a specified trustee. (Unicode)
     * @remarks
     * The <b>GetAuditedPermissionsFromAcl</b> function checks all system-audit ACEs in the ACL to determine the audited rights for the trustee. For all ACEs that specify audited rights for a group, <b>GetAuditedPermissionsFromAcl</b> enumerates the members of the group to determine whether the trustee is a member. The function returns an error if it cannot enumerate the members of a group.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines GetAuditedPermissionsFromAcl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<ACL>} pacl A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure from which to get the trustee's audited access rights.
     * @param {Pointer<TRUSTEE_W>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the trustee. A trustee can be a user, group, or program (such as a Windows service). You can use a name or a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) to identify a trustee. For information about SID structures, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>.
     * @param {Pointer<UInt32>} pSuccessfulAuditedRights A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that receives the successful audit mask for rights audited for the trustee specified by the <i>pTrustee</i> parameter. The system generates an audit record when the trustee successfully uses any of these access rights.
     * @param {Pointer<UInt32>} pFailedAuditRights A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that receives the failed audit mask for rights audited for the trustee specified by the <i>pTrustee</i> parameter. The system generates an audit record when the trustee fails in an attempt to use any of these rights.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-getauditedpermissionsfromaclw
     * @since windows5.1.2600
     */
    static GetAuditedPermissionsFromAclW(pacl, pTrustee, pSuccessfulAuditedRights, pFailedAuditRights) {
        result := DllCall("ADVAPI32.dll\GetAuditedPermissionsFromAclW", "ptr", pacl, "ptr", pTrustee, "uint*", pSuccessfulAuditedRights, "uint*", pFailedAuditRights, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for an object specified by name. (ANSI)
     * @remarks
     * If any of the <i>ppsidOwner</i>, <i>ppsidGroup</i>, <i>ppDacl</i>, or <i>ppSacl</i> parameters are non-<b>NULL</b>, and the <i>SecurityInfo</i> parameter specifies that they be retrieved from the object, those parameters will point to the corresponding parameters in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> returned in <i>ppSecurityDescriptor</i>. If the security descriptor does not contain the requested information, the corresponding parameter will be set to  <b>NULL</b>.
     * 
     * To read the owner, group, or DACL from the object's security descriptor, the object's DACL must grant READ_CONTROL access to the caller, or the caller must be the owner of the object.
     * 
     * To read the system access control list of the object, the SE_SECURITY_NAME privilege must be enabled for the calling process. For information about the security implications of  enabling privileges, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * You can use the <b>GetNamedSecurityInfo</b> function with the following types of objects:
     * 
     * <ul>
     * <li>Local or remote files or directories on an NTFS file system</li>
     * <li>Local or remote printers</li>
     * <li>Local or remote Windows services</li>
     * <li>Network shares</li>
     * <li>Registry keys</li>
     * <li>Semaphores, events, mutexes, and waitable timers</li>
     * <li>File-mapping objects</li>
     * <li>Directory service objects</li>
     * </ul>
     * This function does not handle race conditions. If your thread calls this function at the approximate time that another thread changes the object's security descriptor, then this function could fail.
     * 
     * This function transfers information in plaintext. The information transferred by this function is signed unless signing has been turned off for the system, but no encryption is performed.  
     * 
     * For more information about controlling access to objects through user accounts, group  accounts, or logon sessions,  see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/how-dacls-control-access-to-an-object">How DACLs Control Access to an Object</a>.
     * @param {Pointer<Byte>} pObjectName A pointer to a null-terminated string that specifies the name of the object from which to retrieve security information. For descriptions of the string formats for the different object types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>.
     * @param {Integer} ObjectType Specifies a value from the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a> enumeration that indicates the type of object named by the <i>pObjectName</i> parameter.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to retrieve. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} ppsidOwner A pointer to a variable that receives a pointer to the owner SID in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> returned in <i>ppSecurityDescriptor</i> or <b>NULL</b> if the security descriptor has no owner SID. The returned pointer is valid only if you set the OWNER_SECURITY_INFORMATION flag. Also, this parameter can be <b>NULL</b> if you do not need the owner SID.
     * @param {Pointer<Void>} ppsidGroup A pointer to a variable that receives a pointer to the primary group SID in the returned security descriptor or <b>NULL</b> if  the security descriptor has no group SID. The returned pointer is valid only if you set the GROUP_SECURITY_INFORMATION flag. Also, this parameter can be <b>NULL</b> if you do not need the group SID.
     * @param {Pointer<ACL>} ppDacl A pointer to a variable that receives a pointer to the DACL in the returned security descriptor or <b>NULL</b> if the security descriptor has no DACL. The returned pointer is valid only if you set the DACL_SECURITY_INFORMATION flag. Also, this parameter can be <b>NULL</b> if you do not need the DACL.
     * @param {Pointer<ACL>} ppSacl A pointer to a variable that receives a pointer to the SACL in the returned security descriptor  or <b>NULL</b> if the security descriptor has no SACL. The returned pointer is valid only if you set the SACL_SECURITY_INFORMATION flag. Also, this parameter can be <b>NULL</b> if you do not need the SACL.
     * @param {Pointer<Void>} ppSecurityDescriptor A pointer to a variable that receives a pointer to the security descriptor of the object. When you have finished using the pointer,  free the returned buffer by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * 
     * This parameter is required if any one of the <i>ppsidOwner</i>, <i>ppsidGroup</i>, <i>ppDacl</i>, or <i>ppSacl</i> parameters is not <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-getnamedsecurityinfoa
     * @since windows5.1.2600
     */
    static GetNamedSecurityInfoA(pObjectName, ObjectType, SecurityInfo, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\GetNamedSecurityInfoA", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "ptr", ppsidOwner, "ptr", ppsidGroup, "ptr", ppDacl, "ptr", ppSacl, "ptr", ppSecurityDescriptor, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for an object specified by name. (Unicode)
     * @remarks
     * If any of the <i>ppsidOwner</i>, <i>ppsidGroup</i>, <i>ppDacl</i>, or <i>ppSacl</i> parameters are non-<b>NULL</b>, and the <i>SecurityInfo</i> parameter specifies that they be retrieved from the object, those parameters will point to the corresponding parameters in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> returned in <i>ppSecurityDescriptor</i>. If the security descriptor does not contain the requested information, the corresponding parameter will be set to  <b>NULL</b>.
     * 
     * To read the owner, group, or DACL from the object's security descriptor, the object's DACL must grant READ_CONTROL access to the caller, or the caller must be the owner of the object.
     * 
     * To read the system access control list of the object, the SE_SECURITY_NAME privilege must be enabled for the calling process. For information about the security implications of  enabling privileges, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * You can use the <b>GetNamedSecurityInfo</b> function with the following types of objects:
     * 
     * <ul>
     * <li>Local or remote files or directories on an NTFS file system</li>
     * <li>Local or remote printers</li>
     * <li>Local or remote Windows services</li>
     * <li>Network shares</li>
     * <li>Registry keys</li>
     * <li>Semaphores, events, mutexes, and waitable timers</li>
     * <li>File-mapping objects</li>
     * <li>Directory service objects</li>
     * </ul>
     * This function does not handle race conditions. If your thread calls this function at the approximate time that another thread changes the object's security descriptor, then this function could fail.
     * 
     * This function transfers information in plaintext. The information transferred by this function is signed unless signing has been turned off for the system, but no encryption is performed.  
     * 
     * For more information about controlling access to objects through user accounts, group  accounts, or logon sessions,  see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/how-dacls-control-access-to-an-object">How DACLs Control Access to an Object</a>.
     * @param {Pointer<Char>} pObjectName A pointer to a null-terminated string that specifies the name of the object from which to retrieve security information. For descriptions of the string formats for the different object types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>.
     * @param {Integer} ObjectType Specifies a value from the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a> enumeration that indicates the type of object named by the <i>pObjectName</i> parameter.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to retrieve. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} ppsidOwner A pointer to a variable that receives a pointer to the owner SID in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> returned in <i>ppSecurityDescriptor</i> or <b>NULL</b> if the security descriptor has no owner SID. The returned pointer is valid only if you set the OWNER_SECURITY_INFORMATION flag. Also, this parameter can be <b>NULL</b> if you do not need the owner SID.
     * @param {Pointer<Void>} ppsidGroup A pointer to a variable that receives a pointer to the primary group SID in the returned security descriptor or <b>NULL</b> if  the security descriptor has no group SID. The returned pointer is valid only if you set the GROUP_SECURITY_INFORMATION flag. Also, this parameter can be <b>NULL</b> if you do not need the group SID.
     * @param {Pointer<ACL>} ppDacl A pointer to a variable that receives a pointer to the DACL in the returned security descriptor or <b>NULL</b> if the security descriptor has no DACL. The returned pointer is valid only if you set the DACL_SECURITY_INFORMATION flag. Also, this parameter can be <b>NULL</b> if you do not need the DACL.
     * @param {Pointer<ACL>} ppSacl A pointer to a variable that receives a pointer to the SACL in the returned security descriptor  or <b>NULL</b> if the security descriptor has no SACL. The returned pointer is valid only if you set the SACL_SECURITY_INFORMATION flag. Also, this parameter can be <b>NULL</b> if you do not need the SACL.
     * @param {Pointer<Void>} ppSecurityDescriptor A pointer to a variable that receives a pointer to the security descriptor of the object. When you have finished using the pointer,  free the returned buffer by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * 
     * This parameter is required if any one of the <i>ppsidOwner</i>, <i>ppsidGroup</i>, <i>ppDacl</i>, or <i>ppSacl</i> parameters is not <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-getnamedsecurityinfow
     * @since windows5.1.2600
     */
    static GetNamedSecurityInfoW(pObjectName, ObjectType, SecurityInfo, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\GetNamedSecurityInfoW", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "ptr", ppsidOwner, "ptr", ppsidGroup, "ptr", ppDacl, "ptr", ppSacl, "ptr", ppSecurityDescriptor, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for an object specified by a handle.
     * @remarks
     * If the <i>ppsidOwner</i>, <i>ppsidGroup</i>, <i>ppDacl</i>, and <i>ppSacl</i> parameters are non-<b>NULL</b>, and the <i>SecurityInfo</i> parameter specifies that they be retrieved from the object, those parameters will point to the corresponding parameters in the security descriptor returned in <i>ppSecurityDescriptor</i>.
     * 
     * To read the owner, group, or DACL from the object's security descriptor, the calling process must have been granted READ_CONTROL access when the handle was opened. To get READ_CONTROL access, the caller must be the owner of the object or the object's DACL must grant the access.
     * 
     * To read the SACL from the security descriptor, the calling process must have been granted ACCESS_SYSTEM_SECURITY access when the handle was opened. The proper way to get this access is to enable the SE_SECURITY_NAME privilege in the caller's current token, open the handle for ACCESS_SYSTEM_SECURITY access, and then disable the privilege. For information about the security implications of enabling  privileges, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * You can use the <b>GetSecurityInfo</b> function with the following types of objects:
     * 
     * <ul>
     * <li>Local or remote files or directories on an NTFS file system</li>
     * <li>Named pipes</li>
     * <li>Local or remote printers</li>
     * <li>Local or remote Windows services</li>
     * <li>Network shares</li>
     * <li>Registry keys</li>
     * <li>Semaphores, events, mutexes, and waitable timers</li>
     * <li>Processes, threads, jobs, and file-mapping objects</li>
     * <li>Interactive service window stations and desktops</li>
     * <li>Directory service objects</li>
     * </ul>
     * This function does not handle race conditions. If your thread calls this function at the approximate time that another thread changes the object's security descriptor, then this function could fail.
     * @param {Pointer<Void>} handle A handle to the object from which to retrieve security information.
     * @param {Integer} ObjectType <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a> enumeration value that indicates the type of object.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to retrieve. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} ppsidOwner A pointer to a variable that receives a pointer to the owner SID in the security descriptor returned in <i>ppSecurityDescriptor</i>. The returned pointer is valid only if you set the OWNER_SECURITY_INFORMATION flag. This parameter can be <b>NULL</b> if you do not need the owner SID.
     * @param {Pointer<Void>} ppsidGroup A pointer to a variable that receives a pointer to the primary group SID in the returned <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>. The returned pointer is valid only if you set the GROUP_SECURITY_INFORMATION flag. This parameter can be <b>NULL</b> if you do not need the group SID.
     * @param {Pointer<ACL>} ppDacl A pointer to a variable that receives a pointer to the DACL in the returned security descriptor. The returned pointer is valid only if you set the DACL_SECURITY_INFORMATION flag. This parameter can be <b>NULL</b> if you do not need the DACL.
     * @param {Pointer<ACL>} ppSacl A pointer to a variable that receives a pointer to the SACL in the returned security descriptor. The returned pointer is valid only if you set the SACL_SECURITY_INFORMATION flag. This parameter can be <b>NULL</b> if you do not need the SACL.
     * @param {Pointer<Void>} ppSecurityDescriptor A pointer to a variable that receives a pointer to the security descriptor of the object. When you have finished using the pointer,  free the returned buffer by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * 
     * This parameter is required if any one of the <i>ppsidOwner</i>, <i>ppsidGroup</i>, <i>ppDacl</i>, or <i>ppSacl</i> parameters is not <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-getsecurityinfo
     * @since windows5.1.2600
     */
    static GetSecurityInfo(handle, ObjectType, SecurityInfo, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor) {
        result := DllCall("ADVAPI32.dll\GetSecurityInfo", "ptr", handle, "int", ObjectType, "uint", SecurityInfo, "ptr", ppsidOwner, "ptr", ppsidGroup, "ptr", ppDacl, "ptr", ppSacl, "ptr", ppSecurityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified object. (ANSI)
     * @remarks
     * If you are setting the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) or any elements in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) of an object, the system automatically propagates any inheritable <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) to existing child objects, according to the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace-inheritance-rules">rules of inheritance</a>.
     * 
     * You can use the <b>SetNamedSecurityInfo</b> function with the following types of objects:
     * 
     * <ul>
     * <li>Local or remote files or directories on an NTFS</li>
     * <li>Local or remote printers</li>
     * <li>Local or remote Windows services</li>
     * <li>Network shares</li>
     * <li>Registry keys</li>
     * <li>Semaphores, events, mutexes, and waitable timers</li>
     * <li>File-mapping objects</li>
     * <li>Directory service objects</li>
     * </ul>
     * The <b>SetNamedSecurityInfo</b> function does not reorder access-allowed or access-denied ACEs based on the preferred order. When propagating inheritable ACEs to existing child objects, <b>SetNamedSecurityInfo</b> puts inherited ACEs in order after all of the noninherited ACEs in the DACLs of the child objects.
     * 
     * This function transfers information in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">plaintext</a>. The information transferred by this function is signed unless signing has been turned off for the system, but no encryption is performed.  
     * 
     * When you update access rights of a folder indicated by an UNC   path, for example \\Test\TestFolder, the original inherited ACE is removed and the full volume path is not included.
     * @param {Pointer<Byte>} pObjectName A pointer to a <b>null</b>-terminated string that specifies the name of the object for which to set security information. This can be the name of a local or remote file or directory on an NTFS file system, network share, registry key, semaphore, event, mutex, file mapping, or waitable timer. 
     * 
     * 
     * 
     * 
     * For descriptions of the string formats for the different object types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>.
     * @param {Integer} ObjectType A value of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a> enumeration that indicates the type of object named by the <i>pObjectName</i> parameter.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to set. This parameter can be a combination of the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} psidOwner A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the owner of the object. If the caller does not have the <b>SeRestorePrivilege</b> constant (see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">Privilege Constants</a>), this <b>SID</b> must be contained in the caller's token, and must have the <b>SE_GROUP_OWNER</b> permission enabled. The <i>SecurityInfo</i> parameter must include the OWNER_SECURITY_INFORMATION flag. To set the owner, the caller must have WRITE_OWNER access to the object or have the SE_TAKE_OWNERSHIP_NAME privilege enabled. If you are not setting the owner <b>SID</b>, this parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} psidGroup A pointer to a SID that identifies the primary group of the object. The <i>SecurityInfo</i> parameter must include the GROUP_SECURITY_INFORMATION flag. If you are not setting the primary group SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pDacl A pointer to the new DACL for the object. The <i>SecurityInfo</i> parameter must include the DACL_SECURITY_INFORMATION flag. The caller must have WRITE_DAC access to the object or be the owner of the object. If you are not setting the DACL, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pSacl A pointer to the new SACL for the object. The <i>SecurityInfo</i> parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. 
     * 
     * 
     * 
     * If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. If you are not setting the SACL, this parameter can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-setnamedsecurityinfoa
     * @since windows5.1.2600
     */
    static SetNamedSecurityInfoA(pObjectName, ObjectType, SecurityInfo, psidOwner, psidGroup, pDacl, pSacl) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\SetNamedSecurityInfoA", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "ptr", psidOwner, "ptr", psidGroup, "ptr", pDacl, "ptr", pSacl, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified object. (Unicode)
     * @remarks
     * If you are setting the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) or any elements in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) of an object, the system automatically propagates any inheritable <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) to existing child objects, according to the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace-inheritance-rules">rules of inheritance</a>.
     * 
     * You can use the <b>SetNamedSecurityInfo</b> function with the following types of objects:
     * 
     * <ul>
     * <li>Local or remote files or directories on an NTFS</li>
     * <li>Local or remote printers</li>
     * <li>Local or remote Windows services</li>
     * <li>Network shares</li>
     * <li>Registry keys</li>
     * <li>Semaphores, events, mutexes, and waitable timers</li>
     * <li>File-mapping objects</li>
     * <li>Directory service objects</li>
     * </ul>
     * The <b>SetNamedSecurityInfo</b> function does not reorder access-allowed or access-denied ACEs based on the preferred order. When propagating inheritable ACEs to existing child objects, <b>SetNamedSecurityInfo</b> puts inherited ACEs in order after all of the noninherited ACEs in the DACLs of the child objects.
     * 
     * This function transfers information in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">plaintext</a>. The information transferred by this function is signed unless signing has been turned off for the system, but no encryption is performed.  
     * 
     * When you update access rights of a folder indicated by an UNC   path, for example \\Test\TestFolder, the original inherited ACE is removed and the full volume path is not included.
     * @param {Pointer<Char>} pObjectName A pointer to a <b>null</b>-terminated string that specifies the name of the object for which to set security information. This can be the name of a local or remote file or directory on an NTFS file system, network share, registry key, semaphore, event, mutex, file mapping, or waitable timer. 
     * 
     * 
     * 
     * 
     * For descriptions of the string formats for the different object types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>.
     * @param {Integer} ObjectType A value of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a> enumeration that indicates the type of object named by the <i>pObjectName</i> parameter.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to set. This parameter can be a combination of the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} psidOwner A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the owner of the object. If the caller does not have the <b>SeRestorePrivilege</b> constant (see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">Privilege Constants</a>), this <b>SID</b> must be contained in the caller's token, and must have the <b>SE_GROUP_OWNER</b> permission enabled. The <i>SecurityInfo</i> parameter must include the OWNER_SECURITY_INFORMATION flag. To set the owner, the caller must have WRITE_OWNER access to the object or have the SE_TAKE_OWNERSHIP_NAME privilege enabled. If you are not setting the owner <b>SID</b>, this parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} psidGroup A pointer to a SID that identifies the primary group of the object. The <i>SecurityInfo</i> parameter must include the GROUP_SECURITY_INFORMATION flag. If you are not setting the primary group SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pDacl A pointer to the new DACL for the object. The <i>SecurityInfo</i> parameter must include the DACL_SECURITY_INFORMATION flag. The caller must have WRITE_DAC access to the object or be the owner of the object. If you are not setting the DACL, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pSacl A pointer to the new SACL for the object. The <i>SecurityInfo</i> parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. 
     * 
     * 
     * 
     * If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. If you are not setting the SACL, this parameter can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-setnamedsecurityinfow
     * @since windows5.1.2600
     */
    static SetNamedSecurityInfoW(pObjectName, ObjectType, SecurityInfo, psidOwner, psidGroup, pDacl, pSacl) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\SetNamedSecurityInfoW", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "ptr", psidOwner, "ptr", psidGroup, "ptr", pDacl, "ptr", pSacl, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified object. The caller identifies the object by a handle.
     * @remarks
     * If you are setting the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) or any elements in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) of an object, the system automatically propagates any inheritable <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) to existing child objects, according to the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace-inheritance-rules">ACE inheritance rules</a>.
     * 
     * 
     * You can use the <b>SetSecurityInfo</b> function with the following types of objects:
     * 
     * <ul>
     * <li>Local or remote files or directories on an NTFS</li>
     * <li>Named pipes</li>
     * <li>Local or remote printers</li>
     * <li>Local or remote Windows services</li>
     * <li>Network shares</li>
     * <li>Registry keys</li>
     * <li>Semaphores, events, mutexes, and waitable timers</li>
     * <li>Processes, threads, jobs, and file-mapping objects</li>
     * <li>Window stations and desktops</li>
     * <li>Directory service objects</li>
     * </ul>
     * 
     * 
     * The <b>SetSecurityInfo</b> function does not reorder access-allowed or access-denied ACEs based on the preferred order. When propagating inheritable ACEs to existing child objects, <b>SetSecurityInfo</b> puts inherited ACEs in order after all of the noninherited ACEs in the DACLs of the child objects.
     * 
     * <div class="alert"><b>Note</b>  If share access to the children of the object is not available, this function will not propagate unprotected ACEs to the children. For example, if a directory is opened with exclusive access, the operating system will not propagate unprotected ACEs to the subdirectories or files of that directory when the security on the directory is changed.</div>
     * <div> </div>
     * <div class="alert"><b>Warning</b>  If the supplied <i>handle</i> was opened with an <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> value of <b>MAXIMUM_ALLOWED</b>, then the <b>SetSecurityInfo</b> function will not propagate ACEs to children.</div>
     * <div> </div>
     * @param {Pointer<Void>} handle A handle to the object for which to set security information.
     * @param {Integer} ObjectType A member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a> enumeration that indicates the type of object identified by the <i>handle</i> parameter.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to set. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} psidOwner A pointer to a SID that identifies the owner of the object. The SID must be one that can be assigned as the owner SID of a security descriptor. The <i>SecurityInfo</i> parameter must include the OWNER_SECURITY_INFORMATION flag. This parameter can be <b>NULL</b> if you are not setting the owner SID.
     * @param {Pointer<Void>} psidGroup A pointer to a SID that identifies the primary group of the object. The <i>SecurityInfo</i> parameter must include the GROUP_SECURITY_INFORMATION flag. This parameter can be <b>NULL</b> if you are not setting the primary group SID.
     * @param {Pointer<ACL>} pDacl A pointer to the new DACL for the object. This parameter is ignored unless the value of the <i>SecurityInfo</i> parameter includes the <b>DACL_SECURITY_INFORMATION</b> flag.  If the value of the <i>SecurityInfo</i> parameter includes the <b>DACL_SECURITY_INFORMATION</b> flag and the value of this parameter is set to <b>NULL</b>, full access to the object is granted to everyone. For information about <b>null</b> DACLs, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/creating-a-dacl">Creating a DACL</a>.
     * @param {Pointer<ACL>} pSacl A pointer to the new SACL for the object. The <i>SecurityInfo</i> parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. This parameter can be <b>NULL</b> if you are not setting the SACL.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-setsecurityinfo
     * @since windows5.1.2600
     */
    static SetSecurityInfo(handle, ObjectType, SecurityInfo, psidOwner, psidGroup, pDacl, pSacl) {
        result := DllCall("ADVAPI32.dll\SetSecurityInfo", "ptr", handle, "int", ObjectType, "uint", SecurityInfo, "ptr", psidOwner, "ptr", psidGroup, "ptr", pDacl, "ptr", pSacl, "uint")
        return result
    }

    /**
     * Returns information about the source of inherited access control entries (ACEs) in an access control list (ACL). (ANSI)
     * @remarks
     * The <b>GetInheritanceSource</b> function allocates memory for the names returned in the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-inherited_froma">INHERITED_FROM</a> structure. When the function has finished using this memory, the calling program must free it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-freeinheritedfromarray">FreeInheritedFromArray</a>. Note that the caller must provide memory for the array itself. If the caller allocated the memory, the caller must free that memory after calling <b>FreeInheritedFromArray</b>.
     * 
     * This function does not handle race conditions. If your thread calls this function at the approximate time that another thread changes the object's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>, then this function could fail.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines GetInheritanceSource as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} pObjectName A pointer to the name of the object that uses the ACL to be checked.
     * @param {Integer} ObjectType The type of object indicated by <i>pObjectName</i>. The possible values are SE_FILE_OBJECT, SE_REGISTRY_KEY, SE_DS_OBJECT, and SE_DS_OBJECT_ALL.
     * @param {Integer} SecurityInfo The type of ACL used with the object. The possible values are DACL_SECURITY_INFORMATION or SACL_SECURITY_INFORMATION.
     * @param {Integer} Container <b>TRUE</b> if the object is a container object or <b>FALSE</b> if the object is a leaf object. Note that the only leaf object is SE_FILE_OBJECT.
     * @param {Pointer<Guid>} pObjectClassGuids Optional list of GUIDs that identify the object types or names associated with <i>pObjectName</i>. This may be <b>NULL</b> if the object manager only supports one object class or has no GUID associated with the object class.
     * @param {Integer} GuidCount Number of GUIDs pointed to by <i>pObjectClassGuids</i>.
     * @param {Pointer<ACL>} pAcl The ACL for the object.
     * @param {Pointer<UInt32>} pfnArray Reserved. Set this parameter to <b>NULL</b>.
     * @param {Pointer<GENERIC_MAPPING>} pGenericMapping The mapping of generic rights to specific rights for the object.
     * @param {Pointer<INHERITED_FROMA>} pInheritArray A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-inherited_froma">INHERITED_FROM</a> structures that the <b>GetInheritanceSource</b> function fills with the inheritance information. The caller must allocate enough memory for an entry for each ACE in the ACL.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-getinheritancesourcea
     * @since windows5.1.2600
     */
    static GetInheritanceSourceA(pObjectName, ObjectType, SecurityInfo, Container, pObjectClassGuids, GuidCount, pAcl, pfnArray, pGenericMapping, pInheritArray) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\GetInheritanceSourceA", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "int", Container, "ptr", pObjectClassGuids, "uint", GuidCount, "ptr", pAcl, "uint*", pfnArray, "ptr", pGenericMapping, "ptr", pInheritArray, "uint")
        return result
    }

    /**
     * Returns information about the source of inherited access control entries (ACEs) in an access control list (ACL). (Unicode)
     * @remarks
     * The <b>GetInheritanceSource</b> function allocates memory for the names returned in the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-inherited_froma">INHERITED_FROM</a> structure. When the function has finished using this memory, the calling program must free it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-freeinheritedfromarray">FreeInheritedFromArray</a>. Note that the caller must provide memory for the array itself. If the caller allocated the memory, the caller must free that memory after calling <b>FreeInheritedFromArray</b>.
     * 
     * This function does not handle race conditions. If your thread calls this function at the approximate time that another thread changes the object's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>, then this function could fail.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines GetInheritanceSource as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} pObjectName A pointer to the name of the object that uses the ACL to be checked.
     * @param {Integer} ObjectType The type of object indicated by <i>pObjectName</i>. The possible values are SE_FILE_OBJECT, SE_REGISTRY_KEY, SE_DS_OBJECT, and SE_DS_OBJECT_ALL.
     * @param {Integer} SecurityInfo The type of ACL used with the object. The possible values are DACL_SECURITY_INFORMATION or SACL_SECURITY_INFORMATION.
     * @param {Integer} Container <b>TRUE</b> if the object is a container object or <b>FALSE</b> if the object is a leaf object. Note that the only leaf object is SE_FILE_OBJECT.
     * @param {Pointer<Guid>} pObjectClassGuids Optional list of GUIDs that identify the object types or names associated with <i>pObjectName</i>. This may be <b>NULL</b> if the object manager only supports one object class or has no GUID associated with the object class.
     * @param {Integer} GuidCount Number of GUIDs pointed to by <i>pObjectClassGuids</i>.
     * @param {Pointer<ACL>} pAcl The ACL for the object.
     * @param {Pointer<UInt32>} pfnArray Reserved. Set this parameter to <b>NULL</b>.
     * @param {Pointer<GENERIC_MAPPING>} pGenericMapping The mapping of generic rights to specific rights for the object.
     * @param {Pointer<INHERITED_FROMW>} pInheritArray A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-inherited_froma">INHERITED_FROM</a> structures that the <b>GetInheritanceSource</b> function fills with the inheritance information. The caller must allocate enough memory for an entry for each ACE in the ACL.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-getinheritancesourcew
     * @since windows5.1.2600
     */
    static GetInheritanceSourceW(pObjectName, ObjectType, SecurityInfo, Container, pObjectClassGuids, GuidCount, pAcl, pfnArray, pGenericMapping, pInheritArray) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\GetInheritanceSourceW", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "int", Container, "ptr", pObjectClassGuids, "uint", GuidCount, "ptr", pAcl, "uint*", pfnArray, "ptr", pGenericMapping, "ptr", pInheritArray, "uint")
        return result
    }

    /**
     * Frees memory allocated by the GetInheritanceSource function.
     * @param {Pointer<INHERITED_FROMW>} pInheritArray A pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-inherited_froma">INHERITED_FROM</a> structures returned by <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getinheritancesourcea">GetInheritanceSource</a>.
     * @param {Integer} AceCnt Number of entries in <i>pInheritArray</i>.
     * @param {Pointer<UInt32>} pfnArray Unused. Set to <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-freeinheritedfromarray
     * @since windows5.1.2600
     */
    static FreeInheritedFromArray(pInheritArray, AceCnt, pfnArray) {
        result := DllCall("ADVAPI32.dll\FreeInheritedFromArray", "ptr", pInheritArray, "ushort", AceCnt, "uint*", pfnArray, "uint")
        return result
    }

    /**
     * Resets specified security information in the security descriptor of a specified tree of objects. (ANSI)
     * @remarks
     * Setting a <b>NULL</b> owner, group, DACL, or SACL is not supported by this function.
     * 
     * If the caller does not contain the proper privileges and permissions to support the requested owner, group, DACL, and SACL updates, then none of the updates are performed.
     * 
     * This function is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treesetnamedsecurityinfoa">TreeSetNamedSecurityInfo</a> function:
     * 
     * <ul>
     * <li>If the <i>KeepExplicit</i> parameter of <b>TreeResetNamedSecurityInfo</b> is set to <b>TRUE</b>, then the function is equivalent to  <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treesetnamedsecurityinfoa">TreeSetNamedSecurityInfo</a> with the  <i>dwAction</i> parameter set to  TREE_SEC_INFO_RESET_KEEP_EXPLICIT.</li>
     * <li>If the <i>KeepExplicit</i> parameter of <b>TreeResetNamedSecurityInfo</b> is set to <b>FALSE</b>, then the function is equivalent to  <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treesetnamedsecurityinfoa">TreeSetNamedSecurityInfo</a> with the  <i>dwAction</i> parameter set to  TREE_SEC_INFO_RESET.</li>
     * </ul>
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines TreeResetNamedSecurityInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} pObjectName Pointer to a <b>null</b>-terminated string that specifies the name of the root node object for the objects  that are to receive updated security information. Supported objects are registry keys and file objects. For descriptions of the string formats for the different object types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>.
     * @param {Integer} ObjectType A value of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>  enumeration  that indicates the type of object named by the <i>pObjectName</i> parameter. The supported values are SE_REGISTRY_KEY and SE_FILE_OBJECT, for registry keys and file objects, respectively.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to reset. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} pOwner A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the owner of the object. The SID must be one that can be assigned as the owner SID of a security descriptor. The <i>SecurityInfo</i> parameter must include the OWNER_SECURITY_INFORMATION flag. To set the owner, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the owner SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} pGroup A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the primary group of the object. The <i>SecurityInfo</i> parameter must include the GROUP_SECURITY_INFORMATION flag.  To set the group, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the primary group SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pDacl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) structure that represents the new DACL for the objects being reset. The <i>SecurityInfo</i> parameter must include the DACL_SECURITY_INFORMATION flag. The caller must have READ_CONTROL and WRITE_DAC access to each  object, including the root object. If you are not setting the DACL, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pSacl A pointer to an ACL structure that represents the new SACL for the objects being reset.  The <i>SecurityInfo</i> parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. If you are not setting the SACL, this parameter can be <b>NULL</b>.
     * @param {Integer} KeepExplicit Boolean value that defines whether explicitly defined ACEs are kept or deleted for the sub-tree. If  <i>KeepExplicit</i> is <b>TRUE</b>, then explicitly defined ACEs are kept for each subtree DACL and SACL, and inherited ACEs are replaced by the inherited ACEs from <i>pDacl</i> and <i>pSacl</i>.  If  <i>KeepExplicit</i> is <b>FALSE</b>, then explicitly defined ACEs for each subtree DACL and SACL are deleted before the inherited ACEs are replaced by the inherited ACEs from <i>pDacl</i> and <i>pSacl</i>.
     * @param {Pointer<FN_PROGRESS>} fnProgress A pointer to the function used to track the progress of the <b>TreeResetNamedSecurityInfo</b> function. The prototype of the progress function is:
     * 
     * 
     * ```cpp
     * @param {Integer} ProgressInvokeSetting A value of the <a href="https://docs.microsoft.com/windows/win32/api/accctrl/ne-accctrl-prog_invoke_setting">PROG_INVOKE_SETTING</a> enumeration that specifies the initial setting for the progress function.
     * @param {Pointer<Void>} Args A pointer to a <b>VOID</b> for progress function arguments specified by the caller.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns an error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-treeresetnamedsecurityinfoa
     * @since windows5.1.2600
     */
    static TreeResetNamedSecurityInfoA(pObjectName, ObjectType, SecurityInfo, pOwner, pGroup, pDacl, pSacl, KeepExplicit, fnProgress, ProgressInvokeSetting, Args) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\TreeResetNamedSecurityInfoA", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "ptr", pOwner, "ptr", pGroup, "ptr", pDacl, "ptr", pSacl, "int", KeepExplicit, "ptr", fnProgress, "int", ProgressInvokeSetting, "ptr", Args, "uint")
        return result
    }

    /**
     * Resets specified security information in the security descriptor of a specified tree of objects. (Unicode)
     * @remarks
     * Setting a <b>NULL</b> owner, group, DACL, or SACL is not supported by this function.
     * 
     * If the caller does not contain the proper privileges and permissions to support the requested owner, group, DACL, and SACL updates, then none of the updates are performed.
     * 
     * This function is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treesetnamedsecurityinfoa">TreeSetNamedSecurityInfo</a> function:
     * 
     * <ul>
     * <li>If the <i>KeepExplicit</i> parameter of <b>TreeResetNamedSecurityInfo</b> is set to <b>TRUE</b>, then the function is equivalent to  <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treesetnamedsecurityinfoa">TreeSetNamedSecurityInfo</a> with the  <i>dwAction</i> parameter set to  TREE_SEC_INFO_RESET_KEEP_EXPLICIT.</li>
     * <li>If the <i>KeepExplicit</i> parameter of <b>TreeResetNamedSecurityInfo</b> is set to <b>FALSE</b>, then the function is equivalent to  <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treesetnamedsecurityinfoa">TreeSetNamedSecurityInfo</a> with the <i>dwAction</i> parameter set to  TREE_SEC_INFO_RESET.</li>
     * </ul>
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines TreeResetNamedSecurityInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} pObjectName Pointer to a <b>null</b>-terminated string that specifies the name of the root node object for the objects  that are to receive updated security information. Supported objects are registry keys and file objects. For descriptions of the string formats for the different object types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>.
     * @param {Integer} ObjectType A value of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>  enumeration  that indicates the type of object named by the <i>pObjectName</i> parameter. The supported values are SE_REGISTRY_KEY and SE_FILE_OBJECT, for registry keys and file objects, respectively.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to reset. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} pOwner A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the owner of the object. The SID must be one that can be assigned as the owner SID of a security descriptor. The <i>SecurityInfo</i> parameter must include the OWNER_SECURITY_INFORMATION flag. To set the owner, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the owner SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} pGroup A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the primary group of the object. The <i>SecurityInfo</i> parameter must include the GROUP_SECURITY_INFORMATION flag.  To set the group, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the primary group SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pDacl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) structure that represents the new DACL for the objects being reset. The <i>SecurityInfo</i> parameter must include the DACL_SECURITY_INFORMATION flag. The caller must have READ_CONTROL and WRITE_DAC access to each  object, including the root object. If you are not setting the DACL, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pSacl A pointer to an ACL structure that represents the new SACL for the objects being reset.  The <i>SecurityInfo</i> parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. If you are not setting the SACL, this parameter can be <b>NULL</b>.
     * @param {Integer} KeepExplicit Boolean value that defines whether explicitly defined ACEs are kept or deleted for the sub-tree. If  <i>KeepExplicit</i> is <b>TRUE</b>, then explicitly defined ACEs are kept for each subtree DACL and SACL, and inherited ACEs are replaced by the inherited ACEs from <i>pDacl</i> and <i>pSacl</i>.  If  <i>KeepExplicit</i> is <b>FALSE</b>, then explicitly defined ACEs for each subtree DACL and SACL are deleted before the inherited ACEs are replaced by the inherited ACEs from <i>pDacl</i> and <i>pSacl</i>.
     * @param {Pointer<FN_PROGRESS>} fnProgress A pointer to the function used to track the progress of the <b>TreeResetNamedSecurityInfo</b> function. The prototype of the progress function is:
     * 
     * 
     * ```cpp
     * @param {Integer} ProgressInvokeSetting A value of the <a href="https://docs.microsoft.com/windows/win32/api/accctrl/ne-accctrl-prog_invoke_setting">PROG_INVOKE_SETTING</a> enumeration that specifies the initial setting for the progress function.
     * @param {Pointer<Void>} Args A pointer to a <b>VOID</b> for progress function arguments specified by the caller.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns an error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-treeresetnamedsecurityinfow
     * @since windows5.1.2600
     */
    static TreeResetNamedSecurityInfoW(pObjectName, ObjectType, SecurityInfo, pOwner, pGroup, pDacl, pSacl, KeepExplicit, fnProgress, ProgressInvokeSetting, Args) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\TreeResetNamedSecurityInfoW", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "ptr", pOwner, "ptr", pGroup, "ptr", pDacl, "ptr", pSacl, "int", KeepExplicit, "ptr", fnProgress, "int", ProgressInvokeSetting, "ptr", Args, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified tree of objects. (ANSI)
     * @remarks
     * Setting a <b>NULL</b> owner, group, DACL, or SACL is not supported by this function.
     * 
     * If the caller does not contain the proper privileges and permissions to support the requested owner, group, DACL, and SACL updates, then none of the updates is performed.
     * 
     * This function provides the same functionality as the <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setnamedsecurityinfoa">SetNamedSecurityInfo</a> function when the value of the <i>dwAction</i> parameter is set to <b>TREE_SEC_INFO_SET</b>, the value of the <i>ProgressInvokeSetting</i> parameter is set to <b>ProgressInvokePrePostError</b>, and the function pointed to by the <i>fnProgress</i> parameter sets the value of its <i>pInvokeSetting</i> parameter to <b>ProgressInvokePrePostError</b>.
     * 
     * This function is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treeresetnamedsecurityinfoa">TreeResetNamedSecurityInfo</a> function:
     * 
     * <ul>
     * <li>If the <i>dwAction</i> parameter of <b>TreeSetNamedSecurityInfo</b> is set to TREE_SEC_INFO_RESET_KEEP_EXPLICIT, then the function is equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treeresetnamedsecurityinfoa">TreeResetNamedSecurityInfo</a> with the <i>KeepExplicit</i> parameter set to <b>TRUE</b>.</li>
     * <li>If the <i>dwAction</i> parameter of <b>TreeSetNamedSecurityInfo</b> is set to TREE_SEC_INFO_RESET, then the function is equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treeresetnamedsecurityinfoa">TreeResetNamedSecurityInfo</a> with the <i>KeepExplicit</i> parameter set to <b>FALSE</b>.</li>
     * </ul>
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines TreeSetNamedSecurityInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} pObjectName Pointer to a <b>null</b>-terminated string that specifies the name of the root node object for the objects  that are to receive updated security information. Supported objects are registry keys and file objects. For descriptions of the string formats for the different object types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>.
     * @param {Integer} ObjectType A value of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>  enumeration  that indicates the type of object named by the <i>pObjectName</i> parameter. The supported values are SE_REGISTRY_KEY and SE_FILE_OBJECT, for registry keys and file objects, respectively.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to set. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} pOwner A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the owner of the object. The SID must be one that can be assigned as the owner SID of a security descriptor. The <i>SecurityInfo</i> parameter must include the OWNER_SECURITY_INFORMATION flag. To set the owner, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the owner SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} pGroup A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the primary group of the object. The <i>SecurityInfo</i> parameter must include the GROUP_SECURITY_INFORMATION flag.  To set the group, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the primary group SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pDacl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) structure that represents the new DACL for the objects being reset. The <i>SecurityInfo</i> parameter must include the DACL_SECURITY_INFORMATION flag. The caller must have READ_CONTROL and WRITE_DAC access to each  object, including the root object. If you are not setting the DACL, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pSacl A pointer to an ACL structure that represents the new SACL for the objects being reset. The <i>SecurityInfo</i> parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. If you are not setting the SACL, this parameter can be <b>NULL</b>.
     * @param {Integer} dwAction 
     * @param {Pointer<FN_PROGRESS>} fnProgress A pointer to the function used to track the progress of the <b>TreeSetNamedSecurityInfo</b> function. The prototype of the progress function is:
     * 
     * 
     * ```cpp
     * @param {Integer} ProgressInvokeSetting A value of the <a href="https://docs.microsoft.com/windows/win32/api/accctrl/ne-accctrl-prog_invoke_setting">PROG_INVOKE_SETTING</a> enumeration that specifies the initial setting for the progress function.
     * @param {Pointer<Void>} Args A pointer to a <b>VOID</b> for progress function arguments specified by the caller.
     * @returns {Integer} If the function succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-treesetnamedsecurityinfoa
     * @since windows6.0.6000
     */
    static TreeSetNamedSecurityInfoA(pObjectName, ObjectType, SecurityInfo, pOwner, pGroup, pDacl, pSacl, dwAction, fnProgress, ProgressInvokeSetting, Args) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\TreeSetNamedSecurityInfoA", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "ptr", pOwner, "ptr", pGroup, "ptr", pDacl, "ptr", pSacl, "uint", dwAction, "ptr", fnProgress, "int", ProgressInvokeSetting, "ptr", Args, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified tree of objects. (Unicode)
     * @remarks
     * Setting a <b>NULL</b> owner, group, DACL, or SACL is not supported by this function.
     * 
     * If the caller does not contain the proper privileges and permissions to support the requested owner, group, DACL, and SACL updates, then none of the updates is performed.
     * 
     * This function provides the same functionality as the <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setnamedsecurityinfoa">SetNamedSecurityInfo</a> function when the value of the <i>dwAction</i> parameter is set to <b>TREE_SEC_INFO_SET</b>, the value of the <i>ProgressInvokeSetting</i> parameter is set to <b>ProgressInvokePrePostError</b>, and the function pointed to by the <i>fnProgress</i> parameter sets the value of its <i>pInvokeSetting</i> parameter to <b>ProgressInvokePrePostError</b>.
     * 
     * This function is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treeresetnamedsecurityinfoa">TreeResetNamedSecurityInfo</a> function:
     * 
     * <ul>
     * <li>If the <i>dwAction</i> parameter of <b>TreeSetNamedSecurityInfo</b> is set to TREE_SEC_INFO_RESET_KEEP_EXPLICIT, then the function is equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treeresetnamedsecurityinfoa">TreeResetNamedSecurityInfo</a> with the <i>KeepExplicit</i> parameter set to <b>TRUE</b>.</li>
     * <li>If the <i>dwAction</i> parameter of <b>TreeSetNamedSecurityInfo</b> is set to TREE_SEC_INFO_RESET, then the function is equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-treeresetnamedsecurityinfoa">TreeResetNamedSecurityInfo</a> with the <i>KeepExplicit</i> parameter set to <b>FALSE</b>.</li>
     * </ul>
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines TreeSetNamedSecurityInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} pObjectName Pointer to a <b>null</b>-terminated string that specifies the name of the root node object for the objects  that are to receive updated security information. Supported objects are registry keys and file objects. For descriptions of the string formats for the different object types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>.
     * @param {Integer} ObjectType A value of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a>  enumeration  that indicates the type of object named by the <i>pObjectName</i> parameter. The supported values are SE_REGISTRY_KEY and SE_FILE_OBJECT, for registry keys and file objects, respectively.
     * @param {Integer} SecurityInfo A set of 
     * bit flags that indicate the type of security information to set. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} pOwner A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the owner of the object. The SID must be one that can be assigned as the owner SID of a security descriptor. The <i>SecurityInfo</i> parameter must include the OWNER_SECURITY_INFORMATION flag. To set the owner, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the owner SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} pGroup A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the primary group of the object. The <i>SecurityInfo</i> parameter must include the GROUP_SECURITY_INFORMATION flag.  To set the group, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the primary group SID, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pDacl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) structure that represents the new DACL for the objects being reset. The <i>SecurityInfo</i> parameter must include the DACL_SECURITY_INFORMATION flag. The caller must have READ_CONTROL and WRITE_DAC access to each  object, including the root object. If you are not setting the DACL, this parameter can be <b>NULL</b>.
     * @param {Pointer<ACL>} pSacl A pointer to an ACL structure that represents the new SACL for the objects being reset. The <i>SecurityInfo</i> parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. If you are not setting the SACL, this parameter can be <b>NULL</b>.
     * @param {Integer} dwAction 
     * @param {Pointer<FN_PROGRESS>} fnProgress A pointer to the function used to track the progress of the <b>TreeSetNamedSecurityInfo</b> function. The prototype of the progress function is:
     * 
     * 
     * ```cpp
     * @param {Integer} ProgressInvokeSetting A value of the <a href="https://docs.microsoft.com/windows/win32/api/accctrl/ne-accctrl-prog_invoke_setting">PROG_INVOKE_SETTING</a> enumeration that specifies the initial setting for the progress function.
     * @param {Pointer<Void>} Args A pointer to a <b>VOID</b> for progress function arguments specified by the caller.
     * @returns {Integer} If the function succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-treesetnamedsecurityinfow
     * @since windows6.0.6000
     */
    static TreeSetNamedSecurityInfoW(pObjectName, ObjectType, SecurityInfo, pOwner, pGroup, pDacl, pSacl, dwAction, fnProgress, ProgressInvokeSetting, Args) {
        pObjectName := pObjectName is String? StrPtr(pObjectName) : pObjectName

        result := DllCall("ADVAPI32.dll\TreeSetNamedSecurityInfoW", "ptr", pObjectName, "int", ObjectType, "uint", SecurityInfo, "ptr", pOwner, "ptr", pGroup, "ptr", pDacl, "ptr", pSacl, "uint", dwAction, "ptr", fnProgress, "int", ProgressInvokeSetting, "ptr", Args, "uint")
        return result
    }

    /**
     * Allocates and initializes a new security descriptor. (ANSI)
     * @remarks
     * The <b>BuildSecurityDescriptor</b> function is intended for trusted servers that implement or expose security on their own objects. The function uses self-relative security descriptors suitable for serializing into a stream and storing to disk, as a trusted server might require.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines BuildSecurityDescriptor as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_A>} pOwner A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the owner for the new security descriptor. If the structure uses the TRUSTEE_IS_NAME form, <b>BuildSecurityDescriptor</b> looks up the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) associated with the specified trustee name. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the function uses the owner SID from the original security descriptor pointed to by <i>pOldSD</i>. If <i>pOldSD</i> is <b>NULL</b>, or if the owner SID in <i>pOldSD</i> is <b>NULL</b>, the owner SID is <b>NULL</b> in the new security descriptor.
     * @param {Pointer<TRUSTEE_A>} pGroup A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the primary group SID for the new security descriptor. If the structure uses the TRUSTEE_IS_NAME form, <b>BuildSecurityDescriptor</b> looks up the SID associated with the specified trustee name. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the function uses the group SID from the original security descriptor pointed to by <i>pOldSD</i>. If <i>pOldSD</i> is <b>NULL</b>, or if the group SID in <i>pOldSD</i> is <b>NULL</b>, the group SID is <b>NULL</b> in the new security descriptor.
     * @param {Integer} cCountOfAccessEntries The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures in the <i>pListOfAccessEntries</i> array.
     * @param {Pointer<EXPLICIT_ACCESS_A>} pListOfAccessEntries A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe access control information for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) of the new security descriptor. The function creates the new DACL by merging the information in the array with the DACL in <i>pOldSD</i>, if any. If <i>pOldSD</i> is <b>NULL</b>, or if the DACL in <i>pOldSD</i> is <b>NULL</b>, the function creates a new DACL based solely on the information in the array. For a description of the rules for creating an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> from an array of <b>EXPLICIT_ACCESS</b> structures, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setentriesinacla">SetEntriesInAcl</a> function. 
     * 
     * 
     * 
     * 
     * If <i>pListOfAccessEntries</i> is <b>NULL</b>, the new security descriptor gets the DACL from <i>pOldSD</i>. In this case, if <i>pOldSD</i> is <b>NULL</b>, or if the DACL in <i>pOldSD</i> is <b>NULL</b>, the new DACL is <b>NULL</b>.
     * @param {Integer} cCountOfAuditEntries The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures in the <i>pListOfAuditEntries</i> array.
     * @param {Pointer<EXPLICIT_ACCESS_A>} pListOfAuditEntries A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe audit control information for the SACL of the new security descriptor. The function creates the new SACL by merging the information in the array with the SACL in <i>pOldSD</i>, if any. If <i>pOldSD</i> is <b>NULL</b>, or the SACL in <i>pOldSD</i> is <b>NULL</b>, the function creates a new SACL based solely on the information in the array. 
     * 
     * 
     * 
     * 
     * If <i>pListOfAuditEntries</i> is <b>NULL</b>, the new security descriptor gets the SACL from <i>pOldSD</i>. In this case, if <i>pOldSD</i> is <b>NULL</b>, or the SACL in <i>pOldSD</i> is <b>NULL</b>, the new SACL is <b>NULL</b>.
     * @param {Pointer<Void>} pOldSD A pointer to an existing self-relative 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure and its associated security information. The function builds the new security descriptor by merging the specified owner, group, access control, and audit-control information with the information in this security descriptor. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} pSizeNewSD A pointer to a variable that receives the size, in bytes, of the security descriptor.
     * @param {Pointer<Void>} pNewSD A pointer to a variable that receives a pointer to the new security descriptor. The function allocates memory for the new security descriptor. You must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the returned buffer.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildsecuritydescriptora
     * @since windows5.1.2600
     */
    static BuildSecurityDescriptorA(pOwner, pGroup, cCountOfAccessEntries, pListOfAccessEntries, cCountOfAuditEntries, pListOfAuditEntries, pOldSD, pSizeNewSD, pNewSD) {
        result := DllCall("ADVAPI32.dll\BuildSecurityDescriptorA", "ptr", pOwner, "ptr", pGroup, "uint", cCountOfAccessEntries, "ptr", pListOfAccessEntries, "uint", cCountOfAuditEntries, "ptr", pListOfAuditEntries, "ptr", pOldSD, "uint*", pSizeNewSD, "ptr", pNewSD, "uint")
        return result
    }

    /**
     * Allocates and initializes a new security descriptor. (Unicode)
     * @remarks
     * The <b>BuildSecurityDescriptor</b> function is intended for trusted servers that implement or expose security on their own objects. The function uses self-relative security descriptors suitable for serializing into a stream and storing to disk, as a trusted server might require.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines BuildSecurityDescriptor as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_W>} pOwner A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the owner for the new security descriptor. If the structure uses the TRUSTEE_IS_NAME form, <b>BuildSecurityDescriptor</b> looks up the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) associated with the specified trustee name. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the function uses the owner SID from the original security descriptor pointed to by <i>pOldSD</i>. If <i>pOldSD</i> is <b>NULL</b>, or if the owner SID in <i>pOldSD</i> is <b>NULL</b>, the owner SID is <b>NULL</b> in the new security descriptor.
     * @param {Pointer<TRUSTEE_W>} pGroup A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the primary group SID for the new security descriptor. If the structure uses the TRUSTEE_IS_NAME form, <b>BuildSecurityDescriptor</b> looks up the SID associated with the specified trustee name. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the function uses the group SID from the original security descriptor pointed to by <i>pOldSD</i>. If <i>pOldSD</i> is <b>NULL</b>, or if the group SID in <i>pOldSD</i> is <b>NULL</b>, the group SID is <b>NULL</b> in the new security descriptor.
     * @param {Integer} cCountOfAccessEntries The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures in the <i>pListOfAccessEntries</i> array.
     * @param {Pointer<EXPLICIT_ACCESS_W>} pListOfAccessEntries A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe access control information for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) of the new security descriptor. The function creates the new DACL by merging the information in the array with the DACL in <i>pOldSD</i>, if any. If <i>pOldSD</i> is <b>NULL</b>, or if the DACL in <i>pOldSD</i> is <b>NULL</b>, the function creates a new DACL based solely on the information in the array. For a description of the rules for creating an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> from an array of <b>EXPLICIT_ACCESS</b> structures, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setentriesinacla">SetEntriesInAcl</a> function. 
     * 
     * 
     * 
     * 
     * If <i>pListOfAccessEntries</i> is <b>NULL</b>, the new security descriptor gets the DACL from <i>pOldSD</i>. In this case, if <i>pOldSD</i> is <b>NULL</b>, or if the DACL in <i>pOldSD</i> is <b>NULL</b>, the new DACL is <b>NULL</b>.
     * @param {Integer} cCountOfAuditEntries The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures in the <i>pListOfAuditEntries</i> array.
     * @param {Pointer<EXPLICIT_ACCESS_W>} pListOfAuditEntries A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe audit control information for the SACL of the new security descriptor. The function creates the new SACL by merging the information in the array with the SACL in <i>pOldSD</i>, if any. If <i>pOldSD</i> is <b>NULL</b>, or the SACL in <i>pOldSD</i> is <b>NULL</b>, the function creates a new SACL based solely on the information in the array. 
     * 
     * 
     * 
     * 
     * If <i>pListOfAuditEntries</i> is <b>NULL</b>, the new security descriptor gets the SACL from <i>pOldSD</i>. In this case, if <i>pOldSD</i> is <b>NULL</b>, or the SACL in <i>pOldSD</i> is <b>NULL</b>, the new SACL is <b>NULL</b>.
     * @param {Pointer<Void>} pOldSD A pointer to an existing self-relative 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure and its associated security information. The function builds the new security descriptor by merging the specified owner, group, access control, and audit-control information with the information in this security descriptor. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} pSizeNewSD A pointer to a variable that receives the size, in bytes, of the security descriptor.
     * @param {Pointer<Void>} pNewSD A pointer to a variable that receives a pointer to the new security descriptor. The function allocates memory for the new security descriptor. You must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the returned buffer.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildsecuritydescriptorw
     * @since windows5.1.2600
     */
    static BuildSecurityDescriptorW(pOwner, pGroup, cCountOfAccessEntries, pListOfAccessEntries, cCountOfAuditEntries, pListOfAuditEntries, pOldSD, pSizeNewSD, pNewSD) {
        result := DllCall("ADVAPI32.dll\BuildSecurityDescriptorW", "ptr", pOwner, "ptr", pGroup, "uint", cCountOfAccessEntries, "ptr", pListOfAccessEntries, "uint", cCountOfAuditEntries, "ptr", pListOfAuditEntries, "ptr", pOldSD, "uint*", pSizeNewSD, "ptr", pNewSD, "uint")
        return result
    }

    /**
     * Retrieves security information from a self-relative security descriptor. (ANSI)
     * @remarks
     * The <b>LookupSecurityDescriptorParts</b> function retrieves the names of the owner and primary group of the security descriptor. This function also returns descriptions of the ACEs in the DACL and audit-control entries in the SACL of the security descriptor.
     * 
     * The parameters other than <i>pSD</i> can be <b>NULL</b> if you are not interested in the information. If you do not want information about the DACL, both <i>pListOfAccessEntries</i> and <i>cCountOfAuditEntries</i> must be <b>NULL</b>. If you do not want information about the SACL, both <i>pListOfAuditEntries</i> and <i>cCountOfAuditEntries</i> must be <b>NULL</b>. Similarly, if you do want DACL or SACL information, both of the corresponding parameters must not be <b>NULL</b>.
     * 
     * When you have finished using any of the buffers returned by the <i>pOwner</i>, <i>pGroup</i>, <i>pListOfAccessEntries</i>, or <i>pListOfAuditEntries</i> parameters, free them by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * 
     * The <b>LookupSecurityDescriptorParts</b> function is intended for trusted servers that implement or expose security on their own objects. The function works with a self-relative security descriptor suitable for serializing into a stream and storing to disk, as a trusted server might require.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines LookupSecurityDescriptorParts as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_A>} ppOwner A pointer to a variable that receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The function looks up the name associated with the owner 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID)  in the <i>pSD</i> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>, and returns a pointer to the name in the <b>ptstrName</b> member of the <b>TRUSTEE</b> structure. The function sets the <b>TrusteeForm</b> member to TRUSTEE_IS_NAME. 
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b> if you are not interested in the name of the owner.
     * @param {Pointer<TRUSTEE_A>} ppGroup A pointer to a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The function looks up the name associated with the primary group SID of the security descriptor, and returns a pointer to the name in the <b>ptstrName</b> member of the <b>TRUSTEE</b> structure. The function sets the <b>TrusteeForm</b> member to TRUSTEE_IS_NAME.  
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b> if you are not interested in the name of the group.
     * @param {Pointer<UInt32>} pcCountOfAccessEntries A pointer to a <b>ULONG</b> that receives the number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures returned in the <i>pListOfAccessEntries</i> array. This parameter can be <b>NULL</b> only if the <i>pListOfAccessEntries</i> parameter is also <b>NULL</b>.
     * @param {Pointer<EXPLICIT_ACCESS_A>} ppListOfAccessEntries A pointer to a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) of the security descriptor. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure in these <b>EXPLICIT_ACCESS</b> structures use the TRUSTEE_IS_NAME form. For a description of how an array of <b>EXPLICIT_ACCESS</b> structures describes the ACEs in an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL), see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getexplicitentriesfromacla">GetExplicitEntriesFromAcl</a> function. If this parameter is <b>NULL</b>, the <i>cCountOfAccessEntries</i> parameter must also be <b>NULL</b>.
     * @param {Pointer<UInt32>} pcCountOfAuditEntries A pointer to a <b>ULONG</b> that receives the number of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures returned in the <i>pListOfAuditEntries</i> array. This parameter can be <b>NULL</b> only if the <i>pListOfAuditEntries</i> parameter is also <b>NULL</b>.
     * @param {Pointer<EXPLICIT_ACCESS_A>} ppListOfAuditEntries A pointer to a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe the ACEs in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) of the security descriptor. The <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure in these <b>EXPLICIT_ACCESS</b> structures uses the TRUSTEE_IS_NAME form. If this parameter is <b>NULL</b>, the <i>cCountOfAuditEntries</i> parameter must also be <b>NULL</b>.
     * @param {Pointer<Void>} pSD A pointer to an existing <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative security descriptor</a> from which the function retrieves security information.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-lookupsecuritydescriptorpartsa
     * @since windows5.1.2600
     */
    static LookupSecurityDescriptorPartsA(ppOwner, ppGroup, pcCountOfAccessEntries, ppListOfAccessEntries, pcCountOfAuditEntries, ppListOfAuditEntries, pSD) {
        result := DllCall("ADVAPI32.dll\LookupSecurityDescriptorPartsA", "ptr", ppOwner, "ptr", ppGroup, "uint*", pcCountOfAccessEntries, "ptr", ppListOfAccessEntries, "uint*", pcCountOfAuditEntries, "ptr", ppListOfAuditEntries, "ptr", pSD, "uint")
        return result
    }

    /**
     * Retrieves security information from a self-relative security descriptor. (Unicode)
     * @remarks
     * The <b>LookupSecurityDescriptorParts</b> function retrieves the names of the owner and primary group of the security descriptor. This function also returns descriptions of the ACEs in the DACL and audit-control entries in the SACL of the security descriptor.
     * 
     * The parameters other than <i>pSD</i> can be <b>NULL</b> if you are not interested in the information. If you do not want information about the DACL, both <i>pListOfAccessEntries</i> and <i>cCountOfAuditEntries</i> must be <b>NULL</b>. If you do not want information about the SACL, both <i>pListOfAuditEntries</i> and <i>cCountOfAuditEntries</i> must be <b>NULL</b>. Similarly, if you do want DACL or SACL information, both of the corresponding parameters must not be <b>NULL</b>.
     * 
     * When you have finished using any of the buffers returned by the <i>pOwner</i>, <i>pGroup</i>, <i>pListOfAccessEntries</i>, or <i>pListOfAuditEntries</i> parameters, free them by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * 
     * The <b>LookupSecurityDescriptorParts</b> function is intended for trusted servers that implement or expose security on their own objects. The function works with a self-relative security descriptor suitable for serializing into a stream and storing to disk, as a trusted server might require.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines LookupSecurityDescriptorParts as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_W>} ppOwner A pointer to a variable that receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The function looks up the name associated with the owner 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID)  in the <i>pSD</i> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>, and returns a pointer to the name in the <b>ptstrName</b> member of the <b>TRUSTEE</b> structure. The function sets the <b>TrusteeForm</b> member to TRUSTEE_IS_NAME. 
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b> if you are not interested in the name of the owner.
     * @param {Pointer<TRUSTEE_W>} ppGroup A pointer to a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The function looks up the name associated with the primary group SID of the security descriptor, and returns a pointer to the name in the <b>ptstrName</b> member of the <b>TRUSTEE</b> structure. The function sets the <b>TrusteeForm</b> member to TRUSTEE_IS_NAME.  
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b> if you are not interested in the name of the group.
     * @param {Pointer<UInt32>} pcCountOfAccessEntries A pointer to a <b>ULONG</b> that receives the number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures returned in the <i>pListOfAccessEntries</i> array. This parameter can be <b>NULL</b> only if the <i>pListOfAccessEntries</i> parameter is also <b>NULL</b>.
     * @param {Pointer<EXPLICIT_ACCESS_W>} ppListOfAccessEntries A pointer to a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) of the security descriptor. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure in these <b>EXPLICIT_ACCESS</b> structures use the TRUSTEE_IS_NAME form. For a description of how an array of <b>EXPLICIT_ACCESS</b> structures describes the ACEs in an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL), see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getexplicitentriesfromacla">GetExplicitEntriesFromAcl</a> function. If this parameter is <b>NULL</b>, the <i>cCountOfAccessEntries</i> parameter must also be <b>NULL</b>.
     * @param {Pointer<UInt32>} pcCountOfAuditEntries A pointer to a <b>ULONG</b> that receives the number of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures returned in the <i>pListOfAuditEntries</i> array. This parameter can be <b>NULL</b> only if the <i>pListOfAuditEntries</i> parameter is also <b>NULL</b>.
     * @param {Pointer<EXPLICIT_ACCESS_W>} ppListOfAuditEntries A pointer to a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structures that describe the ACEs in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) of the security descriptor. The <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure in these <b>EXPLICIT_ACCESS</b> structures uses the TRUSTEE_IS_NAME form. If this parameter is <b>NULL</b>, the <i>cCountOfAuditEntries</i> parameter must also be <b>NULL</b>.
     * @param {Pointer<Void>} pSD A pointer to an existing <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative security descriptor</a> from which the function retrieves security information.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-lookupsecuritydescriptorpartsw
     * @since windows5.1.2600
     */
    static LookupSecurityDescriptorPartsW(ppOwner, ppGroup, pcCountOfAccessEntries, ppListOfAccessEntries, pcCountOfAuditEntries, ppListOfAuditEntries, pSD) {
        result := DllCall("ADVAPI32.dll\LookupSecurityDescriptorPartsW", "ptr", ppOwner, "ptr", ppGroup, "uint*", pcCountOfAccessEntries, "ptr", ppListOfAccessEntries, "uint*", pcCountOfAuditEntries, "ptr", ppListOfAuditEntries, "ptr", pSD, "uint")
        return result
    }

    /**
     * Initializes an EXPLICIT_ACCESS structure with data specified by the caller. The trustee is identified by a name string. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines BuildExplicitAccessWithName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<EXPLICIT_ACCESS_A>} pExplicitAccess A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure to initialize. The <b>BuildExplicitAccessWithName</b> function does not allocate any memory. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Byte>} pTrusteeName A pointer to a <b>null</b>-terminated string that contains the name of the trustee for the <b>ptstrName</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The <b>BuildExplicitAccessWithName</b> function sets the other members of the <b>TRUSTEE</b> structure as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="pMultipleTrustee"></a><a id="pmultipletrustee"></a><a id="PMULTIPLETRUSTEE"></a><dl>
     * <dt><b><b>pMultipleTrustee</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MultipleTrusteeOperation"></a><a id="multipletrusteeoperation"></a><a id="MULTIPLETRUSTEEOPERATION"></a><dl>
     * <dt><b><b>MultipleTrusteeOperation</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NO_MULTIPLE_TRUSTEE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeForm"></a><a id="trusteeform"></a><a id="TRUSTEEFORM"></a><dl>
     * <dt><b><b>TrusteeForm</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_NAME
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeType"></a><a id="trusteetype"></a><a id="TRUSTEETYPE"></a><dl>
     * <dt><b><b>TrusteeType</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_UNKNOWN
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} AccessPermissions Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> for the <b>grfAccessPermissions</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure. The mask is a set of bit flags that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> format to specify the access rights that an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACE</a> allows, denies, or audits for the trustee. The functions that use the <b>EXPLICIT_ACCESS</b> structure do not convert, interpret, or validate the bits in this mask.
     * @param {Integer} AccessMode Specifies an access mode for the <b>grfAccessMode</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure. The access mode indicates whether the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entry</a> (ACE) allows, denies, or audits the specified rights. For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL), this parameter can be one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a> enumeration. For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL), this parameter can be a combination of <b>ACCESS_MODE</b> values.
     * @param {Integer} Inheritance Specifies an inheritance type for the <b>grfInheritance</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure. This value is a set of bit flags that determine whether other containers or objects can inherit the ACE from the primary object to which the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> is attached. The value of this member corresponds to the inheritance portion (low-order byte) of the <b>AceFlags</b> member of the
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildexplicitaccesswithnamea
     * @since windows5.1.2600
     */
    static BuildExplicitAccessWithNameA(pExplicitAccess, pTrusteeName, AccessPermissions, AccessMode, Inheritance) {
        pTrusteeName := pTrusteeName is String? StrPtr(pTrusteeName) : pTrusteeName

        DllCall("ADVAPI32.dll\BuildExplicitAccessWithNameA", "ptr", pExplicitAccess, "ptr", pTrusteeName, "uint", AccessPermissions, "int", AccessMode, "uint", Inheritance)
    }

    /**
     * Initializes an EXPLICIT_ACCESS structure with data specified by the caller. The trustee is identified by a name string. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines BuildExplicitAccessWithName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<EXPLICIT_ACCESS_W>} pExplicitAccess A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure to initialize. The <b>BuildExplicitAccessWithName</b> function does not allocate any memory. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Char>} pTrusteeName A pointer to a <b>null</b>-terminated string that contains the name of the trustee for the <b>ptstrName</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The <b>BuildExplicitAccessWithName</b> function sets the other members of the <b>TRUSTEE</b> structure as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="pMultipleTrustee"></a><a id="pmultipletrustee"></a><a id="PMULTIPLETRUSTEE"></a><dl>
     * <dt><b><b>pMultipleTrustee</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MultipleTrusteeOperation"></a><a id="multipletrusteeoperation"></a><a id="MULTIPLETRUSTEEOPERATION"></a><dl>
     * <dt><b><b>MultipleTrusteeOperation</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NO_MULTIPLE_TRUSTEE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeForm"></a><a id="trusteeform"></a><a id="TRUSTEEFORM"></a><dl>
     * <dt><b><b>TrusteeForm</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_NAME
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeType"></a><a id="trusteetype"></a><a id="TRUSTEETYPE"></a><dl>
     * <dt><b><b>TrusteeType</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_UNKNOWN
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} AccessPermissions Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> for the <b>grfAccessPermissions</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure. The mask is a set of bit flags that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> format to specify the access rights that an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACE</a> allows, denies, or audits for the trustee. The functions that use the <b>EXPLICIT_ACCESS</b> structure do not convert, interpret, or validate the bits in this mask.
     * @param {Integer} AccessMode Specifies an access mode for the <b>grfAccessMode</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure. The access mode indicates whether the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entry</a> (ACE) allows, denies, or audits the specified rights. For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL), this parameter can be one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a> enumeration. For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL), this parameter can be a combination of <b>ACCESS_MODE</b> values.
     * @param {Integer} Inheritance Specifies an inheritance type for the <b>grfInheritance</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure. This value is a set of bit flags that determine whether other containers or objects can inherit the ACE from the primary object to which the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> is attached. The value of this member corresponds to the inheritance portion (low-order byte) of the <b>AceFlags</b> member of the
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildexplicitaccesswithnamew
     * @since windows5.1.2600
     */
    static BuildExplicitAccessWithNameW(pExplicitAccess, pTrusteeName, AccessPermissions, AccessMode, Inheritance) {
        pTrusteeName := pTrusteeName is String? StrPtr(pTrusteeName) : pTrusteeName

        DllCall("ADVAPI32.dll\BuildExplicitAccessWithNameW", "ptr", pExplicitAccess, "ptr", pTrusteeName, "uint", AccessPermissions, "int", AccessMode, "uint", Inheritance)
    }

    /**
     * 
     * @param {Pointer<EXPLICIT_ACCESS_A>} pExplicitAccess 
     * @param {Pointer<Byte>} pTrusteeName 
     * @param {Pointer<TRUSTEE_A>} pTrustee 
     * @param {Integer} AccessPermissions 
     * @param {Integer} AccessMode 
     * @param {Integer} Inheritance 
     * @returns {String} Nothing - always returns an empty string
     */
    static BuildImpersonateExplicitAccessWithNameA(pExplicitAccess, pTrusteeName, pTrustee, AccessPermissions, AccessMode, Inheritance) {
        pTrusteeName := pTrusteeName is String? StrPtr(pTrusteeName) : pTrusteeName

        DllCall("ADVAPI32.dll\BuildImpersonateExplicitAccessWithNameA", "ptr", pExplicitAccess, "ptr", pTrusteeName, "ptr", pTrustee, "uint", AccessPermissions, "int", AccessMode, "uint", Inheritance)
    }

    /**
     * 
     * @param {Pointer<EXPLICIT_ACCESS_W>} pExplicitAccess 
     * @param {Pointer<Char>} pTrusteeName 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Integer} AccessPermissions 
     * @param {Integer} AccessMode 
     * @param {Integer} Inheritance 
     * @returns {String} Nothing - always returns an empty string
     */
    static BuildImpersonateExplicitAccessWithNameW(pExplicitAccess, pTrusteeName, pTrustee, AccessPermissions, AccessMode, Inheritance) {
        pTrusteeName := pTrusteeName is String? StrPtr(pTrusteeName) : pTrusteeName

        DllCall("ADVAPI32.dll\BuildImpersonateExplicitAccessWithNameW", "ptr", pExplicitAccess, "ptr", pTrusteeName, "ptr", pTrustee, "uint", AccessPermissions, "int", AccessMode, "uint", Inheritance)
    }

    /**
     * Initializes a TRUSTEE structure. The caller specifies the trustee name. The function sets other members of the structure to default values. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines BuildTrusteeWithName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_A>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure to initialize. The <b>BuildTrusteeWithName</b> function does not allocate any memory. If this parameter is <b>NULL</b> or a pointer that is not valid, the results are undefined.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that contains the name of the trustee for the <b>ptstrName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The <b>BuildTrusteeWithName</b> function sets the other members of the <b>TRUSTEE</b> structure as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="pMultipleTrustee"></a><a id="pmultipletrustee"></a><a id="PMULTIPLETRUSTEE"></a><dl>
     * <dt><b><b>pMultipleTrustee</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MultipleTrusteeOperation"></a><a id="multipletrusteeoperation"></a><a id="MULTIPLETRUSTEEOPERATION"></a><dl>
     * <dt><b><b>MultipleTrusteeOperation</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NO_MULTIPLE_TRUSTEE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeForm"></a><a id="trusteeform"></a><a id="TRUSTEEFORM"></a><dl>
     * <dt><b><b>TrusteeForm</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_NAME
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeType"></a><a id="trusteetype"></a><a id="TRUSTEETYPE"></a><dl>
     * <dt><b><b>TrusteeType</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_UNKNOWN
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildtrusteewithnamea
     * @since windows5.1.2600
     */
    static BuildTrusteeWithNameA(pTrustee, pName) {
        pName := pName is String? StrPtr(pName) : pName

        DllCall("ADVAPI32.dll\BuildTrusteeWithNameA", "ptr", pTrustee, "ptr", pName)
    }

    /**
     * Initializes a TRUSTEE structure. The caller specifies the trustee name. The function sets other members of the structure to default values. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines BuildTrusteeWithName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_W>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure to initialize. The <b>BuildTrusteeWithName</b> function does not allocate any memory. If this parameter is <b>NULL</b> or a pointer that is not valid, the results are undefined.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that contains the name of the trustee for the <b>ptstrName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The <b>BuildTrusteeWithName</b> function sets the other members of the <b>TRUSTEE</b> structure as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="pMultipleTrustee"></a><a id="pmultipletrustee"></a><a id="PMULTIPLETRUSTEE"></a><dl>
     * <dt><b><b>pMultipleTrustee</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MultipleTrusteeOperation"></a><a id="multipletrusteeoperation"></a><a id="MULTIPLETRUSTEEOPERATION"></a><dl>
     * <dt><b><b>MultipleTrusteeOperation</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NO_MULTIPLE_TRUSTEE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeForm"></a><a id="trusteeform"></a><a id="TRUSTEEFORM"></a><dl>
     * <dt><b><b>TrusteeForm</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_NAME
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeType"></a><a id="trusteetype"></a><a id="TRUSTEETYPE"></a><dl>
     * <dt><b><b>TrusteeType</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_UNKNOWN
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildtrusteewithnamew
     * @since windows5.1.2600
     */
    static BuildTrusteeWithNameW(pTrustee, pName) {
        pName := pName is String? StrPtr(pName) : pName

        DllCall("ADVAPI32.dll\BuildTrusteeWithNameW", "ptr", pTrustee, "ptr", pName)
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_A>} pTrustee 
     * @param {Pointer<TRUSTEE_A>} pImpersonateTrustee 
     * @returns {String} Nothing - always returns an empty string
     */
    static BuildImpersonateTrusteeA(pTrustee, pImpersonateTrustee) {
        DllCall("ADVAPI32.dll\BuildImpersonateTrusteeA", "ptr", pTrustee, "ptr", pImpersonateTrustee)
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Pointer<TRUSTEE_W>} pImpersonateTrustee 
     * @returns {String} Nothing - always returns an empty string
     */
    static BuildImpersonateTrusteeW(pTrustee, pImpersonateTrustee) {
        DllCall("ADVAPI32.dll\BuildImpersonateTrusteeW", "ptr", pTrustee, "ptr", pImpersonateTrustee)
    }

    /**
     * Initializes a TRUSTEE structure. The caller specifies the security identifier (SID) of the trustee. The function sets other members of the structure to default values and does not look up the name associated with the SID. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines BuildTrusteeWithSid as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_A>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure to initialize. The <b>BuildTrusteeWithSid</b> function does not allocate any memory. If this parameter is <b>NULL</b> or a pointer that is not valid, the results are undefined.
     * @param {Pointer<Void>} pSid A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the trustee. The <b>BuildTrusteeWithSid</b> function assigns this pointer to the <b>ptstrName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The function sets the other members of the <b>TRUSTEE</b> structure as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="pMultipleTrustee"></a><a id="pmultipletrustee"></a><a id="PMULTIPLETRUSTEE"></a><dl>
     * <dt><b><b>pMultipleTrustee</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MultipleTrusteeOperation"></a><a id="multipletrusteeoperation"></a><a id="MULTIPLETRUSTEEOPERATION"></a><dl>
     * <dt><b><b>MultipleTrusteeOperation</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NO_MULTIPLE_TRUSTEE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeForm"></a><a id="trusteeform"></a><a id="TRUSTEEFORM"></a><dl>
     * <dt><b><b>TrusteeForm</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_SID
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeType"></a><a id="trusteetype"></a><a id="TRUSTEETYPE"></a><dl>
     * <dt><b><b>TrusteeType</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_UNKNOWN
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildtrusteewithsida
     * @since windows5.1.2600
     */
    static BuildTrusteeWithSidA(pTrustee, pSid) {
        DllCall("ADVAPI32.dll\BuildTrusteeWithSidA", "ptr", pTrustee, "ptr", pSid)
    }

    /**
     * Initializes a TRUSTEE structure. The caller specifies the security identifier (SID) of the trustee. The function sets other members of the structure to default values and does not look up the name associated with the SID. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines BuildTrusteeWithSid as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_W>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure to initialize. The <b>BuildTrusteeWithSid</b> function does not allocate any memory. If this parameter is <b>NULL</b> or a pointer that is not valid, the results are undefined.
     * @param {Pointer<Void>} pSid A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the trustee. The <b>BuildTrusteeWithSid</b> function assigns this pointer to the <b>ptstrName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure. The function sets the other members of the <b>TRUSTEE</b> structure as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="pMultipleTrustee"></a><a id="pmultipletrustee"></a><a id="PMULTIPLETRUSTEE"></a><dl>
     * <dt><b><b>pMultipleTrustee</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MultipleTrusteeOperation"></a><a id="multipletrusteeoperation"></a><a id="MULTIPLETRUSTEEOPERATION"></a><dl>
     * <dt><b><b>MultipleTrusteeOperation</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NO_MULTIPLE_TRUSTEE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeForm"></a><a id="trusteeform"></a><a id="TRUSTEEFORM"></a><dl>
     * <dt><b><b>TrusteeForm</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_SID
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TrusteeType"></a><a id="trusteetype"></a><a id="TRUSTEETYPE"></a><dl>
     * <dt><b><b>TrusteeType</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TRUSTEE_IS_UNKNOWN
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildtrusteewithsidw
     * @since windows5.1.2600
     */
    static BuildTrusteeWithSidW(pTrustee, pSid) {
        DllCall("ADVAPI32.dll\BuildTrusteeWithSidW", "ptr", pTrustee, "ptr", pSid)
    }

    /**
     * Initializes a TRUSTEE structure with the object-specific access control entry (ACE) information and initializes the remaining members of the structure to default values. (ANSI)
     * @remarks
     * This function does not allocate memory for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_sid">OBJECTS_AND_SID</a> structures.
     * 
     * For more information about object-specific ACEs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/object-specific-aces">Object-specific ACEs</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines BuildTrusteeWithObjectsAndSid as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_A>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure to initialize. The <b>BuildTrusteeWithObjectsAndSid</b> function does not allocate any memory. If this parameter is <b>NULL</b> or a pointer that is not valid, the results are undefined.
     * @param {Pointer<OBJECTS_AND_SID>} pObjSid A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_sid">OBJECTS_AND_SID</a> structure that contains information about the trustee and the securable object.
     * @param {Pointer<Guid>} pObjectGuid A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that describes the ObjectType GUID to be added to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @param {Pointer<Guid>} pInheritedObjectGuid A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that describes the InheritedObjectType GUID to be added to the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @param {Pointer<Void>} pSid A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the trustee.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildtrusteewithobjectsandsida
     * @since windows5.1.2600
     */
    static BuildTrusteeWithObjectsAndSidA(pTrustee, pObjSid, pObjectGuid, pInheritedObjectGuid, pSid) {
        DllCall("ADVAPI32.dll\BuildTrusteeWithObjectsAndSidA", "ptr", pTrustee, "ptr", pObjSid, "ptr", pObjectGuid, "ptr", pInheritedObjectGuid, "ptr", pSid)
    }

    /**
     * Initializes a TRUSTEE structure with the object-specific access control entry (ACE) information and initializes the remaining members of the structure to default values. (Unicode)
     * @remarks
     * This function does not allocate memory for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_sid">OBJECTS_AND_SID</a> structures.
     * 
     * For more information about object-specific ACEs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/object-specific-aces">Object-specific ACEs</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines BuildTrusteeWithObjectsAndSid as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_W>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure to initialize. The <b>BuildTrusteeWithObjectsAndSid</b> function does not allocate any memory. If this parameter is <b>NULL</b> or a pointer that is not valid, the results are undefined.
     * @param {Pointer<OBJECTS_AND_SID>} pObjSid A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_sid">OBJECTS_AND_SID</a> structure that contains information about the trustee and the securable object.
     * @param {Pointer<Guid>} pObjectGuid A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that describes the ObjectType GUID to be added to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @param {Pointer<Guid>} pInheritedObjectGuid A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that describes the InheritedObjectType GUID to be added to the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @param {Pointer<Void>} pSid A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies the trustee.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildtrusteewithobjectsandsidw
     * @since windows5.1.2600
     */
    static BuildTrusteeWithObjectsAndSidW(pTrustee, pObjSid, pObjectGuid, pInheritedObjectGuid, pSid) {
        DllCall("ADVAPI32.dll\BuildTrusteeWithObjectsAndSidW", "ptr", pTrustee, "ptr", pObjSid, "ptr", pObjectGuid, "ptr", pInheritedObjectGuid, "ptr", pSid)
    }

    /**
     * Initializes a TRUSTEE structure with the object-specific access control entry (ACE) information and initializes the remaining members of the structure to default values. The caller also specifies the name of the trustee. (ANSI)
     * @remarks
     * This function does not allocate memory for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_name_a">OBJECTS_AND_NAME</a> structures.
     * 
     * For more information about object-specific ACEs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/object-specific-aces">Object-specific ACEs</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines BuildTrusteeWithObjectsAndName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_A>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that will be initialized by this function. If the value of this parameter is <b>NULL</b> or a pointer that is not valid, the results are undefined.
     * @param {Pointer<OBJECTS_AND_NAME_A>} pObjName A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_name_a">OBJECTS_AND_NAME</a> structure that contains information about the trustee and the securable object.
     * @param {Integer} ObjectType A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a> enumeration that contains information about the type of securable object.
     * @param {Pointer<Byte>} ObjectTypeName A pointer to a string that specifies the name that corresponds to the ObjectType GUID to be added to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure returned in the <i>pTrustee</i> parameter. This function determines the ObjectType GUID that corresponds to this name.
     * @param {Pointer<Byte>} InheritedObjectTypeName A pointer to a string that specifies the name that corresponds to the InheritedObjectType GUID to be added to the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure returned in the <i>pTrustee</i> parameter. This function determines the InheritedObjectType GUID that corresponds to this name.
     * @param {Pointer<Byte>} Name A pointer to a string that specifies the name used to identify the trustee.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildtrusteewithobjectsandnamea
     * @since windows5.1.2600
     */
    static BuildTrusteeWithObjectsAndNameA(pTrustee, pObjName, ObjectType, ObjectTypeName, InheritedObjectTypeName, Name) {
        ObjectTypeName := ObjectTypeName is String? StrPtr(ObjectTypeName) : ObjectTypeName
        InheritedObjectTypeName := InheritedObjectTypeName is String? StrPtr(InheritedObjectTypeName) : InheritedObjectTypeName
        Name := Name is String? StrPtr(Name) : Name

        DllCall("ADVAPI32.dll\BuildTrusteeWithObjectsAndNameA", "ptr", pTrustee, "ptr", pObjName, "int", ObjectType, "ptr", ObjectTypeName, "ptr", InheritedObjectTypeName, "ptr", Name)
    }

    /**
     * Initializes a TRUSTEE structure with the object-specific access control entry (ACE) information and initializes the remaining members of the structure to default values. The caller also specifies the name of the trustee. (Unicode)
     * @remarks
     * This function does not allocate memory for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_name_a">OBJECTS_AND_NAME</a> structures.
     * 
     * For more information about object-specific ACEs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/object-specific-aces">Object-specific ACEs</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines BuildTrusteeWithObjectsAndName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_W>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that will be initialized by this function. If the value of this parameter is <b>NULL</b> or a pointer that is not valid, the results are undefined.
     * @param {Pointer<OBJECTS_AND_NAME_W>} pObjName A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_name_a">OBJECTS_AND_NAME</a> structure that contains information about the trustee and the securable object.
     * @param {Integer} ObjectType A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a> enumeration that contains information about the type of securable object.
     * @param {Pointer<Char>} ObjectTypeName A pointer to a string that specifies the name that corresponds to the ObjectType GUID to be added to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure returned in the <i>pTrustee</i> parameter. This function determines the ObjectType GUID that corresponds to this name.
     * @param {Pointer<Char>} InheritedObjectTypeName A pointer to a string that specifies the name that corresponds to the InheritedObjectType GUID to be added to the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure returned in the <i>pTrustee</i> parameter. This function determines the InheritedObjectType GUID that corresponds to this name.
     * @param {Pointer<Char>} Name A pointer to a string that specifies the name used to identify the trustee.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-buildtrusteewithobjectsandnamew
     * @since windows5.1.2600
     */
    static BuildTrusteeWithObjectsAndNameW(pTrustee, pObjName, ObjectType, ObjectTypeName, InheritedObjectTypeName, Name) {
        ObjectTypeName := ObjectTypeName is String? StrPtr(ObjectTypeName) : ObjectTypeName
        InheritedObjectTypeName := InheritedObjectTypeName is String? StrPtr(InheritedObjectTypeName) : InheritedObjectTypeName
        Name := Name is String? StrPtr(Name) : Name

        DllCall("ADVAPI32.dll\BuildTrusteeWithObjectsAndNameW", "ptr", pTrustee, "ptr", pObjName, "int", ObjectType, "ptr", ObjectTypeName, "ptr", InheritedObjectTypeName, "ptr", Name)
    }

    /**
     * Retrieves the trustee name from the specified TRUSTEE structure. (ANSI)
     * @remarks
     * The <b>GetTrusteeName</b> function does not allocate any memory.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines GetTrusteeName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_A>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @returns {Pointer<Byte>} If the <b>TrusteeForm</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure is TRUSTEE_IS_NAME, the return value is the pointer assigned to the <b>ptstrName</b> member of the structure.
     * 
     * If the <b>TrusteeForm</b> member is TRUSTEE_IS_SID, the return value is <b>NULL</b>. The function does not look up the name associated with a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-gettrusteenamea
     * @since windows5.1.2600
     */
    static GetTrusteeNameA(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetTrusteeNameA", "ptr", pTrustee, "char*")
        return result
    }

    /**
     * Retrieves the trustee name from the specified TRUSTEE structure. (Unicode)
     * @remarks
     * The <b>GetTrusteeName</b> function does not allocate any memory.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The aclapi.h header defines GetTrusteeName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_W>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @returns {Pointer<Char>} If the <b>TrusteeForm</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure is TRUSTEE_IS_NAME, the return value is the pointer assigned to the <b>ptstrName</b> member of the structure.
     * 
     * If the <b>TrusteeForm</b> member is TRUSTEE_IS_SID, the return value is <b>NULL</b>. The function does not look up the name associated with a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-gettrusteenamew
     * @since windows5.1.2600
     */
    static GetTrusteeNameW(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetTrusteeNameW", "ptr", pTrustee, "char*")
        return result
    }

    /**
     * Retrieves the trustee type from the specified TRUSTEE structure. This value indicates whether the trustee is a user, a group, or the trustee type is unknown. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines GetTrusteeType as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_A>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @returns {Integer} The return value is one of the constants from the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-trustee_type">TRUSTEE_TYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-gettrusteetypea
     * @since windows5.1.2600
     */
    static GetTrusteeTypeA(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetTrusteeTypeA", "ptr", pTrustee, "int")
        return result
    }

    /**
     * Retrieves the trustee type from the specified TRUSTEE structure. This value indicates whether the trustee is a user, a group, or the trustee type is unknown. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines GetTrusteeType as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_W>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @returns {Integer} The return value is one of the constants from the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-trustee_type">TRUSTEE_TYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-gettrusteetypew
     * @since windows5.1.2600
     */
    static GetTrusteeTypeW(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetTrusteeTypeW", "ptr", pTrustee, "int")
        return result
    }

    /**
     * Retrieves the trustee name from the specified TRUSTEE structure. This value indicates whether the structure uses a name string or a security identifier (SID) to identify the trustee. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines GetTrusteeForm as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_A>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @returns {Integer} The return value is one of the constants from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-trustee_form">TRUSTEE_FORM</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-gettrusteeforma
     * @since windows5.1.2600
     */
    static GetTrusteeFormA(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetTrusteeFormA", "ptr", pTrustee, "int")
        return result
    }

    /**
     * Retrieves the trustee name from the specified TRUSTEE structure. This value indicates whether the structure uses a name string or a security identifier (SID) to identify the trustee. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The aclapi.h header defines GetTrusteeForm as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<TRUSTEE_W>} pTrustee A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure.
     * @returns {Integer} The return value is one of the constants from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-trustee_form">TRUSTEE_FORM</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-gettrusteeformw
     * @since windows5.1.2600
     */
    static GetTrusteeFormW(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetTrusteeFormW", "ptr", pTrustee, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_A>} pTrustee 
     * @returns {Integer} 
     */
    static GetMultipleTrusteeOperationA(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetMultipleTrusteeOperationA", "ptr", pTrustee, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @returns {Integer} 
     */
    static GetMultipleTrusteeOperationW(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetMultipleTrusteeOperationW", "ptr", pTrustee, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_A>} pTrustee 
     * @returns {Pointer<TRUSTEE_A>} 
     */
    static GetMultipleTrusteeA(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetMultipleTrusteeA", "ptr", pTrustee, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @returns {Pointer<TRUSTEE_W>} 
     */
    static GetMultipleTrusteeW(pTrustee) {
        result := DllCall("ADVAPI32.dll\GetMultipleTrusteeW", "ptr", pTrustee, "ptr")
        return result
    }

    /**
     * Converts a security identifier (SID) to a string format suitable for display, storage, or transmission. (ANSI)
     * @remarks
     * The <b>ConvertSidToStringSid</b> function uses the standard S-<i>R</i>-<i>I</i>-<i>S</i>-<i>S</i>… format for SID strings. For more information about SID string notation, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The sddl.h header defines ConvertSidToStringSid as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} Sid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure to be converted.
     * @param {Pointer<Byte>} StringSid A pointer to a variable that receives a pointer to a null-terminated SID string. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The <b>GetLastError</b> function may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters contains a value that is not valid. This is most often a pointer that is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sddl/nf-sddl-convertsidtostringsida
     * @since windows5.1.2600
     */
    static ConvertSidToStringSidA(Sid, StringSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ConvertSidToStringSidA", "ptr", Sid, "ptr", StringSid, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a security identifier (SID) to a string format suitable for display, storage, or transmission. (Unicode)
     * @remarks
     * The <b>ConvertSidToStringSid</b> function uses the standard S-<i>R</i>-<i>I</i>-<i>S</i>-<i>S</i>… format for SID strings. For more information about SID string notation, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The sddl.h header defines ConvertSidToStringSid as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} Sid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure to be converted.
     * @param {Pointer<Char>} StringSid A pointer to a variable that receives a pointer to a null-terminated SID string. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The <b>GetLastError</b> function may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters contains a value that is not valid. This is most often a pointer that is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sddl/nf-sddl-convertsidtostringsidw
     * @since windows5.1.2600
     */
    static ConvertSidToStringSidW(Sid, StringSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ConvertSidToStringSidW", "ptr", Sid, "ptr", StringSid, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a string-format security identifier (SID) into a valid, functional SID. You can use this function to retrieve a SID that the ConvertSidToStringSid function converted to string format. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The sddl.h header defines ConvertStringSidToSid as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} StringSid A pointer to a null-terminated string containing the string-format SID to convert. 
     * 
     * 
     * The SID string can use either the standard 
     * 							S-<i>R</i>-<i>I</i>-<i>S</i>-<i>S</i>… format for SID strings, or the SID string constant format, such as "BA" for  built-in administrators. For more information about SID string notation, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * @param {Pointer<Void>} Sid A pointer to a variable that receives a pointer to the converted SID. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The <b>GetLastError</b> function may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid SID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sddl/nf-sddl-convertstringsidtosida
     * @since windows5.1.2600
     */
    static ConvertStringSidToSidA(StringSid, Sid) {
        StringSid := StringSid is String? StrPtr(StringSid) : StringSid

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ConvertStringSidToSidA", "ptr", StringSid, "ptr", Sid, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a string-format security identifier (SID) into a valid, functional SID. You can use this function to retrieve a SID that the ConvertSidToStringSid function converted to string format. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The sddl.h header defines ConvertStringSidToSid as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} StringSid A pointer to a null-terminated string containing the string-format SID to convert. 
     * 
     * 
     * The SID string can use either the standard 
     * 							S-<i>R</i>-<i>I</i>-<i>S</i>-<i>S</i>… format for SID strings, or the SID string constant format, such as "BA" for  built-in administrators. For more information about SID string notation, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * @param {Pointer<Void>} Sid A pointer to a variable that receives a pointer to the converted SID. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The <b>GetLastError</b> function may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid SID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sddl/nf-sddl-convertstringsidtosidw
     * @since windows5.1.2600
     */
    static ConvertStringSidToSidW(StringSid, Sid) {
        StringSid := StringSid is String? StrPtr(StringSid) : StringSid

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ConvertStringSidToSidW", "ptr", StringSid, "ptr", Sid, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a string-format security descriptor into a valid, functional security descriptor. (ANSI)
     * @remarks
     * If <b>ace_type</b> is ACCESS_ALLOWED_OBJECT_ACE_TYPE
     * and neither <b>object_guid</b> nor <b>inherit_object_guid</b> has a  <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> specified, then <b>ConvertStringSecurityDescriptorToSecurityDescriptor</b> converts <b>ace_type</b> to ACCESS_ALLOWED_ACE_TYPE. For information about the  <b>ace_type</b>,  <b>object_guid</b>, and <b>inherit_object_guid</b> fields, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace-strings">Ace Strings</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The sddl.h header defines ConvertStringSecurityDescriptorToSecurityDescriptor as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} StringSecurityDescriptor A pointer to a null-terminated string containing the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">string-format security descriptor</a> to convert.
     * @param {Integer} StringSDRevision Specifies the revision level of the <i>StringSecurityDescriptor</i> string. Currently this value must be SDDL_REVISION_1.
     * @param {Pointer<Void>} SecurityDescriptor A pointer to a variable that receives a pointer to the converted security descriptor. The returned security descriptor is <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a>. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function. To convert the security descriptor to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">absolute security descriptor</a>, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-makeabsolutesd">MakeAbsoluteSD</a> function.
     * @param {Pointer<UInt32>} SecurityDescriptorSize A pointer to a variable that receives the size, in bytes, of the converted security descriptor. This parameter can be NULL.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_REVISION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SDDL revision level is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NONE_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) in the input security descriptor string could not be found in an account lookup operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sddl/nf-sddl-convertstringsecuritydescriptortosecuritydescriptora
     * @since windows5.1.2600
     */
    static ConvertStringSecurityDescriptorToSecurityDescriptorA(StringSecurityDescriptor, StringSDRevision, SecurityDescriptor, SecurityDescriptorSize) {
        StringSecurityDescriptor := StringSecurityDescriptor is String? StrPtr(StringSecurityDescriptor) : StringSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ConvertStringSecurityDescriptorToSecurityDescriptorA", "ptr", StringSecurityDescriptor, "uint", StringSDRevision, "ptr", SecurityDescriptor, "uint*", SecurityDescriptorSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a string-format security descriptor into a valid, functional security descriptor. (Unicode)
     * @remarks
     * If <b>ace_type</b> is ACCESS_ALLOWED_OBJECT_ACE_TYPE
     * and neither <b>object_guid</b> nor <b>inherit_object_guid</b> has a  <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> specified, then <b>ConvertStringSecurityDescriptorToSecurityDescriptor</b> converts <b>ace_type</b> to ACCESS_ALLOWED_ACE_TYPE. For information about the  <b>ace_type</b>,  <b>object_guid</b>, and <b>inherit_object_guid</b> fields, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace-strings">Ace Strings</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The sddl.h header defines ConvertStringSecurityDescriptorToSecurityDescriptor as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} StringSecurityDescriptor A pointer to a null-terminated string containing the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">string-format security descriptor</a> to convert.
     * @param {Integer} StringSDRevision Specifies the revision level of the <i>StringSecurityDescriptor</i> string. Currently this value must be SDDL_REVISION_1.
     * @param {Pointer<Void>} SecurityDescriptor A pointer to a variable that receives a pointer to the converted security descriptor. The returned security descriptor is <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a>. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function. To convert the security descriptor to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">absolute security descriptor</a>, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-makeabsolutesd">MakeAbsoluteSD</a> function.
     * @param {Pointer<UInt32>} SecurityDescriptorSize A pointer to a variable that receives the size, in bytes, of the converted security descriptor. This parameter can be NULL.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_REVISION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SDDL revision level is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NONE_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) in the input security descriptor string could not be found in an account lookup operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sddl/nf-sddl-convertstringsecuritydescriptortosecuritydescriptorw
     * @since windows5.1.2600
     */
    static ConvertStringSecurityDescriptorToSecurityDescriptorW(StringSecurityDescriptor, StringSDRevision, SecurityDescriptor, SecurityDescriptorSize) {
        StringSecurityDescriptor := StringSecurityDescriptor is String? StrPtr(StringSecurityDescriptor) : StringSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ConvertStringSecurityDescriptorToSecurityDescriptorW", "ptr", StringSecurityDescriptor, "uint", StringSDRevision, "ptr", SecurityDescriptor, "uint*", SecurityDescriptorSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a security descriptor to a string format. You can use the string format to store or transmit the security descriptor. (ANSI)
     * @remarks
     * If the DACL is <b>NULL</b>, and the SE_DACL_PRESENT control bit is set in the input security descriptor, the function fails.
     * 
     * If the DACL is <b>NULL</b>, and the SE_DACL_PRESENT control bit is not set in the input security descriptor, the resulting security descriptor string does not have a D: component. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor String Format</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The sddl.h header defines ConvertSecurityDescriptorToStringSecurityDescriptor as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} SecurityDescriptor A pointer to the security descriptor to convert. The security descriptor can be in 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/absolute-and-self-relative-security-descriptors">absolute or self-relative format</a>.
     * @param {Integer} RequestedStringSDRevision Specifies the revision level of the output <i>StringSecurityDescriptor</i> string. Currently this value must be SDDL_REVISION_1.
     * @param {Integer} SecurityInformation Specifies a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags to indicate the components of the security descriptor to include in the output string. 
     * 
     * The BACKUP_SECURITY_INFORMATION flag is not applicable to this function. If the BACKUP_SECURITY_INFORMATION flag is passed in, the <i>SecurityInformation</i> parameter returns TRUE with <b>null</b> string output.
     * @param {Pointer<Byte>} StringSecurityDescriptor A pointer to a variable that receives a pointer to a <b>null</b>-terminated security descriptor string. For a description of the string format, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor String Format</a>. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @param {Pointer<UInt32>} StringSecurityDescriptorLen A pointer to a variable that receives the size, in <b>TCHAR</b>s, of the security descriptor string returned in the <i>StringSecurityDescriptor</i> buffer. This parameter can be <b>NULL</b> if you do not need to retrieve the size. The size represents the size of the buffer in <b>WCHAR</b>s, not the number of <b>WCHAR</b>s in the string.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The <b>GetLastError</b> function may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_REVISION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revision level is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NONE_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) in the input security descriptor could not be found in an account lookup operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) is not valid. This error is returned if the SE_DACL_PRESENT flag is set in the input security descriptor and the DACL is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sddl/nf-sddl-convertsecuritydescriptortostringsecuritydescriptora
     * @since windows5.1.2600
     */
    static ConvertSecurityDescriptorToStringSecurityDescriptorA(SecurityDescriptor, RequestedStringSDRevision, SecurityInformation, StringSecurityDescriptor, StringSecurityDescriptorLen) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ConvertSecurityDescriptorToStringSecurityDescriptorA", "ptr", SecurityDescriptor, "uint", RequestedStringSDRevision, "uint", SecurityInformation, "ptr", StringSecurityDescriptor, "uint*", StringSecurityDescriptorLen, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a security descriptor to a string format. You can use the string format to store or transmit the security descriptor. (Unicode)
     * @remarks
     * If the DACL is <b>NULL</b>, and the SE_DACL_PRESENT control bit is set in the input security descriptor, the function fails.
     * 
     * If the DACL is <b>NULL</b>, and the SE_DACL_PRESENT control bit is not set in the input security descriptor, the resulting security descriptor string does not have a D: component. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor String Format</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The sddl.h header defines ConvertSecurityDescriptorToStringSecurityDescriptor as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} SecurityDescriptor A pointer to the security descriptor to convert. The security descriptor can be in 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/absolute-and-self-relative-security-descriptors">absolute or self-relative format</a>.
     * @param {Integer} RequestedStringSDRevision Specifies the revision level of the output <i>StringSecurityDescriptor</i> string. Currently this value must be SDDL_REVISION_1.
     * @param {Integer} SecurityInformation Specifies a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags to indicate the components of the security descriptor to include in the output string. 
     * 
     * The BACKUP_SECURITY_INFORMATION flag is not applicable to this function. If the BACKUP_SECURITY_INFORMATION flag is passed in, the <i>SecurityInformation</i> parameter returns TRUE with <b>null</b> string output.
     * @param {Pointer<Char>} StringSecurityDescriptor A pointer to a variable that receives a pointer to a <b>null</b>-terminated security descriptor string. For a description of the string format, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor String Format</a>. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @param {Pointer<UInt32>} StringSecurityDescriptorLen A pointer to a variable that receives the size, in <b>TCHAR</b>s, of the security descriptor string returned in the <i>StringSecurityDescriptor</i> buffer. This parameter can be <b>NULL</b> if you do not need to retrieve the size. The size represents the size of the buffer in <b>WCHAR</b>s, not the number of <b>WCHAR</b>s in the string.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The <b>GetLastError</b> function may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_REVISION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revision level is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NONE_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) in the input security descriptor could not be found in an account lookup operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) is not valid. This error is returned if the SE_DACL_PRESENT flag is set in the input security descriptor and the DACL is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sddl/nf-sddl-convertsecuritydescriptortostringsecuritydescriptorw
     * @since windows5.1.2600
     */
    static ConvertSecurityDescriptorToStringSecurityDescriptorW(SecurityDescriptor, RequestedStringSDRevision, SecurityInformation, StringSecurityDescriptor, StringSecurityDescriptorLen) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ConvertSecurityDescriptorToStringSecurityDescriptorW", "ptr", SecurityDescriptor, "uint", RequestedStringSDRevision, "uint", SecurityInformation, "ptr", StringSecurityDescriptor, "uint*", StringSecurityDescriptorLen, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}

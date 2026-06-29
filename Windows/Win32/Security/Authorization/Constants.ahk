#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global SDDL_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global SDDL_REVISION := 1

/**
 * @type {String}
 */
export global SDDL_OWNER := "O"

/**
 * @type {String}
 */
export global SDDL_GROUP := "G"

/**
 * @type {String}
 */
export global SDDL_DACL := "D"

/**
 * @type {String}
 */
export global SDDL_SACL := "S"

/**
 * @type {String}
 */
export global SDDL_PROTECTED := "P"

/**
 * @type {String}
 */
export global SDDL_AUTO_INHERIT_REQ := "AR"

/**
 * @type {String}
 */
export global SDDL_AUTO_INHERITED := "AI"

/**
 * @type {String}
 */
export global SDDL_NULL_ACL := "NO_ACCESS_CONTROL"

/**
 * @type {String}
 */
export global SDDL_ACCESS_ALLOWED := "A"

/**
 * @type {String}
 */
export global SDDL_ACCESS_DENIED := "D"

/**
 * @type {String}
 */
export global SDDL_OBJECT_ACCESS_ALLOWED := "OA"

/**
 * @type {String}
 */
export global SDDL_OBJECT_ACCESS_DENIED := "OD"

/**
 * @type {String}
 */
export global SDDL_AUDIT := "AU"

/**
 * @type {String}
 */
export global SDDL_ALARM := "AL"

/**
 * @type {String}
 */
export global SDDL_OBJECT_AUDIT := "OU"

/**
 * @type {String}
 */
export global SDDL_OBJECT_ALARM := "OL"

/**
 * @type {String}
 */
export global SDDL_MANDATORY_LABEL := "ML"

/**
 * @type {String}
 */
export global SDDL_PROCESS_TRUST_LABEL := "TL"

/**
 * @type {String}
 */
export global SDDL_CALLBACK_ACCESS_ALLOWED := "XA"

/**
 * @type {String}
 */
export global SDDL_CALLBACK_ACCESS_DENIED := "XD"

/**
 * @type {String}
 */
export global SDDL_RESOURCE_ATTRIBUTE := "RA"

/**
 * @type {String}
 */
export global SDDL_SCOPED_POLICY_ID := "SP"

/**
 * @type {String}
 */
export global SDDL_CALLBACK_AUDIT := "XU"

/**
 * @type {String}
 */
export global SDDL_CALLBACK_OBJECT_ACCESS_ALLOWED := "ZA"

/**
 * @type {String}
 */
export global SDDL_ACCESS_FILTER := "FL"

/**
 * @type {String}
 */
export global SDDL_INT := "TI"

/**
 * @type {String}
 */
export global SDDL_UINT := "TU"

/**
 * @type {String}
 */
export global SDDL_WSTRING := "TS"

/**
 * @type {String}
 */
export global SDDL_SID := "TD"

/**
 * @type {String}
 */
export global SDDL_BLOB := "TX"

/**
 * @type {String}
 */
export global SDDL_BOOLEAN := "TB"

/**
 * @type {String}
 */
export global SDDL_CONTAINER_INHERIT := "CI"

/**
 * @type {String}
 */
export global SDDL_OBJECT_INHERIT := "OI"

/**
 * @type {String}
 */
export global SDDL_NO_PROPAGATE := "NP"

/**
 * @type {String}
 */
export global SDDL_INHERIT_ONLY := "IO"

/**
 * @type {String}
 */
export global SDDL_INHERITED := "ID"

/**
 * @type {String}
 */
export global SDDL_CRITICAL := "CR"

/**
 * @type {String}
 */
export global SDDL_TRUST_PROTECTED_FILTER := "TP"

/**
 * @type {String}
 */
export global SDDL_AUDIT_SUCCESS := "SA"

/**
 * @type {String}
 */
export global SDDL_AUDIT_FAILURE := "FA"

/**
 * @type {String}
 */
export global SDDL_READ_PROPERTY := "RP"

/**
 * @type {String}
 */
export global SDDL_WRITE_PROPERTY := "WP"

/**
 * @type {String}
 */
export global SDDL_CREATE_CHILD := "CC"

/**
 * @type {String}
 */
export global SDDL_DELETE_CHILD := "DC"

/**
 * @type {String}
 */
export global SDDL_LIST_CHILDREN := "LC"

/**
 * @type {String}
 */
export global SDDL_SELF_WRITE := "SW"

/**
 * @type {String}
 */
export global SDDL_LIST_OBJECT := "LO"

/**
 * @type {String}
 */
export global SDDL_DELETE_TREE := "DT"

/**
 * @type {String}
 */
export global SDDL_CONTROL_ACCESS := "CR"

/**
 * @type {String}
 */
export global SDDL_READ_CONTROL := "RC"

/**
 * @type {String}
 */
export global SDDL_WRITE_DAC := "WD"

/**
 * @type {String}
 */
export global SDDL_WRITE_OWNER := "WO"

/**
 * @type {String}
 */
export global SDDL_STANDARD_DELETE := "SD"

/**
 * @type {String}
 */
export global SDDL_GENERIC_ALL := "GA"

/**
 * @type {String}
 */
export global SDDL_GENERIC_READ := "GR"

/**
 * @type {String}
 */
export global SDDL_GENERIC_WRITE := "GW"

/**
 * @type {String}
 */
export global SDDL_GENERIC_EXECUTE := "GX"

/**
 * @type {String}
 */
export global SDDL_FILE_ALL := "FA"

/**
 * @type {String}
 */
export global SDDL_FILE_READ := "FR"

/**
 * @type {String}
 */
export global SDDL_FILE_WRITE := "FW"

/**
 * @type {String}
 */
export global SDDL_FILE_EXECUTE := "FX"

/**
 * @type {String}
 */
export global SDDL_KEY_ALL := "KA"

/**
 * @type {String}
 */
export global SDDL_KEY_READ := "KR"

/**
 * @type {String}
 */
export global SDDL_KEY_WRITE := "KW"

/**
 * @type {String}
 */
export global SDDL_KEY_EXECUTE := "KX"

/**
 * @type {String}
 */
export global SDDL_NO_WRITE_UP := "NW"

/**
 * @type {String}
 */
export global SDDL_NO_READ_UP := "NR"

/**
 * @type {String}
 */
export global SDDL_NO_EXECUTE_UP := "NX"

/**
 * @type {Integer (UInt32)}
 */
export global SDDL_ALIAS_SIZE := 2

/**
 * @type {String}
 */
export global SDDL_DOMAIN_ADMINISTRATORS := "DA"

/**
 * @type {String}
 */
export global SDDL_DOMAIN_GUESTS := "DG"

/**
 * @type {String}
 */
export global SDDL_DOMAIN_USERS := "DU"

/**
 * @type {String}
 */
export global SDDL_ENTERPRISE_DOMAIN_CONTROLLERS := "ED"

/**
 * @type {String}
 */
export global SDDL_DOMAIN_DOMAIN_CONTROLLERS := "DD"

/**
 * @type {String}
 */
export global SDDL_DOMAIN_COMPUTERS := "DC"

/**
 * @type {String}
 */
export global SDDL_BUILTIN_ADMINISTRATORS := "BA"

/**
 * @type {String}
 */
export global SDDL_BUILTIN_GUESTS := "BG"

/**
 * @type {String}
 */
export global SDDL_BUILTIN_USERS := "BU"

/**
 * @type {String}
 */
export global SDDL_LOCAL_ADMIN := "LA"

/**
 * @type {String}
 */
export global SDDL_LOCAL_GUEST := "LG"

/**
 * @type {String}
 */
export global SDDL_ACCOUNT_OPERATORS := "AO"

/**
 * @type {String}
 */
export global SDDL_BACKUP_OPERATORS := "BO"

/**
 * @type {String}
 */
export global SDDL_PRINTER_OPERATORS := "PO"

/**
 * @type {String}
 */
export global SDDL_SERVER_OPERATORS := "SO"

/**
 * @type {String}
 */
export global SDDL_AUTHENTICATED_USERS := "AU"

/**
 * @type {String}
 */
export global SDDL_PERSONAL_SELF := "PS"

/**
 * @type {String}
 */
export global SDDL_CREATOR_OWNER := "CO"

/**
 * @type {String}
 */
export global SDDL_CREATOR_GROUP := "CG"

/**
 * @type {String}
 */
export global SDDL_LOCAL_SYSTEM := "SY"

/**
 * @type {String}
 */
export global SDDL_POWER_USERS := "PU"

/**
 * @type {String}
 */
export global SDDL_EVERYONE := "WD"

/**
 * @type {String}
 */
export global SDDL_REPLICATOR := "RE"

/**
 * @type {String}
 */
export global SDDL_INTERACTIVE := "IU"

/**
 * @type {String}
 */
export global SDDL_NETWORK := "NU"

/**
 * @type {String}
 */
export global SDDL_SERVICE := "SU"

/**
 * @type {String}
 */
export global SDDL_RESTRICTED_CODE := "RC"

/**
 * @type {String}
 */
export global SDDL_WRITE_RESTRICTED_CODE := "WR"

/**
 * @type {String}
 */
export global SDDL_ANONYMOUS := "AN"

/**
 * @type {String}
 */
export global SDDL_SCHEMA_ADMINISTRATORS := "SA"

/**
 * @type {String}
 */
export global SDDL_CERT_SERV_ADMINISTRATORS := "CA"

/**
 * @type {String}
 */
export global SDDL_RAS_SERVERS := "RS"

/**
 * @type {String}
 */
export global SDDL_ENTERPRISE_ADMINS := "EA"

/**
 * @type {String}
 */
export global SDDL_GROUP_POLICY_ADMINS := "PA"

/**
 * @type {String}
 */
export global SDDL_ALIAS_PREW2KCOMPACC := "RU"

/**
 * @type {String}
 */
export global SDDL_LOCAL_SERVICE := "LS"

/**
 * @type {String}
 */
export global SDDL_NETWORK_SERVICE := "NS"

/**
 * @type {String}
 */
export global SDDL_REMOTE_DESKTOP := "RD"

/**
 * @type {String}
 */
export global SDDL_NETWORK_CONFIGURATION_OPS := "NO"

/**
 * @type {String}
 */
export global SDDL_PERFMON_USERS := "MU"

/**
 * @type {String}
 */
export global SDDL_PERFLOG_USERS := "LU"

/**
 * @type {String}
 */
export global SDDL_IIS_USERS := "IS"

/**
 * @type {String}
 */
export global SDDL_CRYPTO_OPERATORS := "CY"

/**
 * @type {String}
 */
export global SDDL_OWNER_RIGHTS := "OW"

/**
 * @type {String}
 */
export global SDDL_EVENT_LOG_READERS := "ER"

/**
 * @type {String}
 */
export global SDDL_ENTERPRISE_RO_DCs := "RO"

/**
 * @type {String}
 */
export global SDDL_CERTSVC_DCOM_ACCESS := "CD"

/**
 * @type {String}
 */
export global SDDL_ALL_APP_PACKAGES := "AC"

/**
 * @type {String}
 */
export global SDDL_RDS_REMOTE_ACCESS_SERVERS := "RA"

/**
 * @type {String}
 */
export global SDDL_RDS_ENDPOINT_SERVERS := "ES"

/**
 * @type {String}
 */
export global SDDL_RDS_MANAGEMENT_SERVERS := "MS"

/**
 * @type {String}
 */
export global SDDL_USER_MODE_DRIVERS := "UD"

/**
 * @type {String}
 */
export global SDDL_HYPER_V_ADMINS := "HA"

/**
 * @type {String}
 */
export global SDDL_CLONEABLE_CONTROLLERS := "CN"

/**
 * @type {String}
 */
export global SDDL_ACCESS_CONTROL_ASSISTANCE_OPS := "AA"

/**
 * @type {String}
 */
export global SDDL_REMOTE_MANAGEMENT_USERS := "RM"

/**
 * @type {String}
 */
export global SDDL_AUTHORITY_ASSERTED := "AS"

/**
 * @type {String}
 */
export global SDDL_SERVICE_ASSERTED := "SS"

/**
 * @type {String}
 */
export global SDDL_PROTECTED_USERS := "AP"

/**
 * @type {String}
 */
export global SDDL_KEY_ADMINS := "KA"

/**
 * @type {String}
 */
export global SDDL_ENTERPRISE_KEY_ADMINS := "EK"

/**
 * @type {String}
 */
export global SDDL_USER_MODE_HARDWARE_OPERATORS := "HO"

/**
 * @type {String}
 */
export global SDDL_OPENSSH_USERS := "SH"

/**
 * @type {String}
 */
export global SDDL_ML_LOW := "LW"

/**
 * @type {String}
 */
export global SDDL_ML_MEDIUM := "ME"

/**
 * @type {String}
 */
export global SDDL_ML_MEDIUM_PLUS := "MP"

/**
 * @type {String}
 */
export global SDDL_ML_HIGH := "HI"

/**
 * @type {String}
 */
export global SDDL_ML_SYSTEM := "SI"

/**
 * @type {String}
 */
export global SDDL_SEPERATOR := ";"

/**
 * @type {String}
 */
export global SDDL_DELIMINATOR := ":"

/**
 * @type {String}
 */
export global SDDL_ACE_BEGIN := "("

/**
 * @type {String}
 */
export global SDDL_ACE_END := ")"

/**
 * @type {String}
 */
export global SDDL_ACE_COND_BEGIN := "("

/**
 * @type {String}
 */
export global SDDL_ACE_COND_END := ")"

/**
 * @type {String}
 */
export global SDDL_SPACE := " "

/**
 * @type {String}
 */
export global SDDL_ACE_COND_BLOB_PREFIX := "#"

/**
 * @type {String}
 */
export global SDDL_ACE_COND_SID_PREFIX := "SID"

/**
 * @type {String}
 */
export global SDDL_ACE_COND_ATTRIBUTE_PREFIX := "@"

/**
 * @type {String}
 */
export global SDDL_ACE_COND_USER_ATTRIBUTE_PREFIX := "@USER."

/**
 * @type {String}
 */
export global SDDL_ACE_COND_RESOURCE_ATTRIBUTE_PREFIX := "@RESOURCE."

/**
 * @type {String}
 */
export global SDDL_ACE_COND_DEVICE_ATTRIBUTE_PREFIX := "@DEVICE."

/**
 * @type {String}
 */
export global SDDL_ACE_COND_TOKEN_ATTRIBUTE_PREFIX := "@TOKEN."

/**
 * @type {Integer (UInt32)}
 */
export global INHERITED_ACCESS_ENTRY := 16

/**
 * @type {Integer (UInt32)}
 */
export global INHERITED_PARENT := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global INHERITED_GRANDPARENT := 536870912

/**
 * @type {String}
 */
export global ACCCTRL_DEFAULT_PROVIDERA := "Windows NT Access Provider"

/**
 * @type {String}
 */
export global ACCCTRL_DEFAULT_PROVIDERW := "Windows NT Access Provider"

/**
 * @type {String}
 */
export global ACCCTRL_DEFAULT_PROVIDER := "Windows NT Access Provider"

/**
 * @type {Integer (Int32)}
 */
export global TRUSTEE_ACCESS_ALLOWED := 1

/**
 * @type {Integer (Int32)}
 */
export global TRUSTEE_ACCESS_READ := 2

/**
 * @type {Integer (Int32)}
 */
export global TRUSTEE_ACCESS_WRITE := 4

/**
 * @type {Integer (Int32)}
 */
export global TRUSTEE_ACCESS_EXPLICIT := 1

/**
 * @type {Integer (Int32)}
 */
export global TRUSTEE_ACCESS_ALL := -1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_RESERVED := 0

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_3 := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_4 := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_5 := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_6 := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_7 := 64

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_8 := 128

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_9 := 256

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_10 := 512

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_11 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_12 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_13 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_14 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_15 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_16 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_17 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_18 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_19 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PERM_20 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_ACCESS_PROTECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SYSTEM_ACCESS := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DELETE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_READ_CONTROL := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_CHANGE_ACCESS := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_CHANGE_OWNER := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SYNCHRONIZE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_STD_RIGHTS_ALL := 4160749568

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_FILE_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_FILE_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_FILE_APPEND := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_FILE_READ_PROP := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_FILE_WRITE_PROP := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_FILE_EXECUTE := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_FILE_READ_ATTRIB := 128

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_FILE_WRITE_ATTRIB := 256

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_FILE_CREATE_PIPE := 512

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DIR_LIST := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DIR_CREATE_OBJECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DIR_CREATE_CHILD := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DIR_DELETE_CHILD := 64

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DIR_TRAVERSE := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_TERMINATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_THREAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_VM := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_VM_READ := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_VM_WRITE := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_DUP_HANDLE := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_PROCESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_SET_INFO := 128

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_GET_INFO := 256

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_CONTROL := 512

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_ALERT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_GET_CONTEXT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_SET_CONTEXT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_TOKEN := 8192

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_IMPERSONATE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_KERNEL_DIMPERSONATE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PRINT_SADMIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PRINT_SLIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PRINT_PADMIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PRINT_PUSE := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_PRINT_JADMIN := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SVC_GET_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SVC_SET_INFO := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SVC_STATUS := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SVC_LIST := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SVC_START := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SVC_STOP := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SVC_PAUSE := 64

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SVC_INTERROGATE := 128

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_SVC_UCONTROL := 256

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_REG_QUERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_REG_SET := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_REG_CREATE_CHILD := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_REG_LIST := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_REG_NOTIFY := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_REG_LINK := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_WIN_CLIPBRD := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_WIN_GLOBAL_ATOMS := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_WIN_CREATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_WIN_LIST_DESK := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_WIN_LIST := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_WIN_READ_ATTRIBS := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_WIN_WRITE_ATTRIBS := 64

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_WIN_SCREEN := 128

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_WIN_EXIT := 256

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_ACCESS_NO_OPTIONS := 0

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_ACCESS_SUPPORTS_OBJECT_ENTRIES := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUDIT_TYPE_LEGACY := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUDIT_TYPE_WMI := 2

/**
 * @type {Integer (UInt32)}
 */
export global AP_ParamTypeBits := 8

/**
 * @type {Integer (Int32)}
 */
export global AP_ParamTypeMask := 255

/**
 * @type {Integer (UInt32)}
 */
export global _AUTHZ_SS_MAXSIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global APF_AuditFailure := 0

/**
 * @type {Integer (UInt32)}
 */
export global APF_AuditSuccess := 1

/**
 * @type {Integer (UInt32)}
 */
export global APF_ValidFlags := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZP_WPD_EVENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_ALLOW_MULTIPLE_SOURCE_INSTANCES := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_MIGRATED_LEGACY_PUBLISHER := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_AUDIT_INSTANCE_INFORMATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SKIP_TOKEN_GROUPS := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_REQUIRE_S4U_LOGON := 4

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_COMPUTE_PRIVILEGES := 8

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTE_TYPE_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTE_TYPE_INT64 := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTE_TYPE_UINT64 := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTE_TYPE_STRING := 3

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN := 4

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTE_TYPE_SID := 5

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTE_TYPE_BOOLEAN := 6

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING := 16

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_RPC_INIT_INFO_CLIENT_VERSION_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_INIT_INFO_VERSION_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_WPD_CATEGORY_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global AUTHZ_FLAG_ALLOW_MULTIPLE_SOURCE_INSTANCES := 1

/**
 * @type {Integer (Int32)}
 */
export global OLESCRIPT_E_SYNTAX := -2147352319
;@endregion Constants

#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WNGETCON_CONNECTED := 0

/**
 * @type {Integer (UInt32)}
 */
export global WNGETCON_DISCONNECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_SPEC_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_SPEC_VERSION51 := 327681

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_DRIVER_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_USER := 4

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_USR_GETUSER := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CONNECTION := 6

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CON_ADDCONNECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CON_CANCELCONNECTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CON_GETCONNECTIONS := 4

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CON_ADDCONNECTION3 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CON_ADDCONNECTION4 := 16

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CON_CANCELCONNECTION2 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CON_GETPERFORMANCE := 64

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CON_DEFER := 128

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_DIALOG := 8

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_DLG_DEVICEMODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_DLG_PROPERTYDIALOG := 32

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_DLG_SEARCHDIALOG := 64

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_DLG_FORMATNETWORKNAME := 128

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_DLG_PERMISSIONEDITOR := 256

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_DLG_GETRESOURCEPARENT := 512

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_DLG_GETRESOURCEINFORMATION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_ADMIN := 9

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_ADM_GETDIRECTORYTYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_ADM_DIRECTORYNOTIFY := 2

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_ENUMERATION := 11

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_ENUM_GLOBAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_ENUM_LOCAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_ENUM_CONTEXT := 4

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_ENUM_SHAREABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_START := 12

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_WAIT_FOR_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CONNECTION_FLAGS := 13

/**
 * @type {Integer (UInt32)}
 */
export global WNTYPE_DRIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNTYPE_FILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WNTYPE_PRINTER := 3

/**
 * @type {Integer (UInt32)}
 */
export global WNTYPE_COMM := 4

/**
 * @type {Integer (UInt32)}
 */
export global WNSRCH_REFRESH_FIRST_LEVEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNDT_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global WNDT_NETWORK := 1

/**
 * @type {Integer (UInt32)}
 */
export global WN_NETWORK_CLASS := 1

/**
 * @type {Integer (UInt32)}
 */
export global WN_CREDENTIAL_CLASS := 2

/**
 * @type {Integer (UInt32)}
 */
export global WN_PRIMARY_AUTHENT_CLASS := 4

/**
 * @type {Integer (UInt32)}
 */
export global WN_SERVICE_CLASS := 8

/**
 * @type {Integer (UInt32)}
 */
export global WN_VALID_LOGON_ACCOUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WN_NT_PASSWORD_CHANGED := 2

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFY_PRE := 1

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFY_POST := 2

/**
 * @type {Integer (UInt32)}
 */
export global WNPERMC_PERM := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNPERMC_AUDIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WNPERMC_OWNER := 4

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_RECENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCETYPE_RESERVED := 8

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCETYPE_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCEUSAGE_NOLOCALDEVICE := 4

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCEUSAGE_SIBLING := 8

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCEUSAGE_RESERVED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCEDISPLAYTYPE_NETWORK := 6

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCEDISPLAYTYPE_ROOT := 7

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCEDISPLAYTYPE_SHAREADMIN := 8

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCEDISPLAYTYPE_DIRECTORY := 9

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCEDISPLAYTYPE_NDSCONTAINER := 11

/**
 * @type {Integer (UInt32)}
 */
export global NETPROPERTY_PERSISTENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNFMT_INENUM := 16

/**
 * @type {Integer (UInt32)}
 */
export global WNFMT_CONNECTION := 32

/**
 * @type {Integer (UInt32)}
 */
export global WNCON_FORNETCARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNCON_NOTROUTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WNCON_SLOWLINK := 4

/**
 * @type {Integer (UInt32)}
 */
export global WNCON_DYNAMIC := 8
;@endregion Constants

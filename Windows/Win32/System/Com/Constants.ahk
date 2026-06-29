#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Com
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global COLE_DEFAULT_PRINCIPAL := -1

/**
 * @type {Integer (Int32)}
 */
export global COLE_DEFAULT_AUTHINFO := -1

/**
 * @type {Guid}
 */
export global CLSID_GlobalOptions := Guid("{0000034b-0000-0000-c000-000000000046}")

/**
 * @type {Integer (UInt32)}
 */
export global MARSHALINTERFACE_MIN := 500

/**
 * @type {Integer (Int32)}
 */
export global ASYNC_MODE_COMPATIBILITY := 1

/**
 * @type {Integer (Int32)}
 */
export global ASYNC_MODE_DEFAULT := 0

/**
 * @type {Integer (Int32)}
 */
export global STGTY_REPEAT := 256

/**
 * @type {Integer (Int32)}
 */
export global STG_TOEND := -1

/**
 * @type {Integer (Int32)}
 */
export global STG_LAYOUT_SEQUENTIAL := 0

/**
 * @type {Integer (Int32)}
 */
export global STG_LAYOUT_INTERLEAVED := 1

/**
 * @type {Integer (UInt32)}
 */
export global COM_RIGHTS_EXECUTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global COM_RIGHTS_EXECUTE_LOCAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global COM_RIGHTS_EXECUTE_REMOTE := 4

/**
 * @type {Integer (UInt32)}
 */
export global COM_RIGHTS_ACTIVATE_LOCAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global COM_RIGHTS_ACTIVATE_REMOTE := 16

/**
 * @type {Integer (UInt32)}
 */
export global COM_RIGHTS_RESERVED1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global COM_RIGHTS_RESERVED2 := 64

/**
 * @type {Integer (UInt32)}
 */
export global CWMO_MAX_HANDLES := 56

/**
 * @type {Integer (UInt32)}
 */
export global ROTREGFLAGS_ALLOWANYCLIENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_ACTIVATE_IUSERVER_INDESKTOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_SECURE_SERVER_PROCESS_SD_AND_BIND := 2

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_ISSUE_ACTIVATION_RPC_AT_IDENTIFY := 4

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_IUSERVER_UNMODIFIED_LOGON_TOKEN := 8

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_IUSERVER_SELF_SID_IN_LAUNCH_PERMISSION := 16

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_IUSERVER_ACTIVATE_IN_CLIENT_SESSION_ONLY := 32

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_RESERVED1 := 64

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_RESERVED2 := 128

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_RESERVED3 := 256

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_RESERVED4 := 512

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_RESERVED5 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_AAA_NO_IMPLICIT_ACTIVATE_AS_IU := 2048

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_RESERVED7 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_RESERVED8 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_RESERVED9 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global APPIDREGFLAGS_RESERVED10 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DCOMSCM_ACTIVATION_USE_ALL_AUTHNSERVICES := 1

/**
 * @type {Integer (UInt32)}
 */
export global DCOMSCM_ACTIVATION_DISALLOW_UNSECURE_CALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DCOMSCM_RESOLVE_USE_ALL_AUTHNSERVICES := 4

/**
 * @type {Integer (UInt32)}
 */
export global DCOMSCM_RESOLVE_DISALLOW_UNSECURE_CALL := 8

/**
 * @type {Integer (UInt32)}
 */
export global DCOMSCM_PING_USE_MID_AUTHNSERVICE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DCOMSCM_PING_DISALLOW_UNSECURE_CALL := 32

/**
 * @type {Integer (UInt64)}
 */
export global MAXLSN := 9223372036854775807

/**
 * @type {Integer (UInt32)}
 */
export global DMUS_ERRBASE := 4096
;@endregion Constants

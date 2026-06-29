#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Data.RightsManagement
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global DRMHANDLE_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRMENVHANDLE_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRMQUERYHANDLE_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRMHSESSION_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRMPUBHANDLE_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRM_AL_NONSILENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_AL_NOPERSIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRM_AL_CANCEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global DRM_AL_FETCHNOADVISORY := 8

/**
 * @type {Integer (UInt32)}
 */
export global DRM_AL_NOUI := 16

/**
 * @type {Integer (UInt32)}
 */
export global DRM_ACTIVATE_MACHINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_ACTIVATE_GROUPIDENTITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRM_ACTIVATE_TEMPORARY := 4

/**
 * @type {Integer (UInt32)}
 */
export global DRM_ACTIVATE_CANCEL := 8

/**
 * @type {Integer (UInt32)}
 */
export global DRM_ACTIVATE_SILENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DRM_ACTIVATE_SHARED_GROUPIDENTITY := 32

/**
 * @type {Integer (UInt32)}
 */
export global DRM_ACTIVATE_DELAYED := 64

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_MACHINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_GROUPIDENTITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_GROUPIDENTITY_NAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_GROUPIDENTITY_LID := 8

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_SPECIFIED_GROUPIDENTITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_EUL := 32

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_EUL_LID := 64

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_CLIENTLICENSOR := 128

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_CLIENTLICENSOR_LID := 256

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_SPECIFIED_CLIENTLICENSOR := 512

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_REVOCATIONLIST := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_REVOCATIONLIST_LID := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_EXPIRED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_ISSUERNAME := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_ISSUANCELICENSE_TEMPLATE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DRM_EL_ISSUANCELICENSE_TEMPLATE_LID := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DRM_ADD_LICENSE_NOPERSIST := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRM_ADD_LICENSE_PERSIST := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SERVICE_TYPE_ACTIVATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SERVICE_TYPE_CERTIFICATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SERVICE_TYPE_PUBLISHING := 4

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SERVICE_TYPE_CLIENTLICENSOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SERVICE_TYPE_SILENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SERVICE_LOCATION_INTERNET := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SERVICE_LOCATION_ENTERPRISE := 2

/**
 * @type {String}
 */
export global DRM_DEFAULTGROUPIDTYPE_WINDOWSAUTH := "WindowsAuthProvider"

/**
 * @type {String}
 */
export global DRM_DEFAULTGROUPIDTYPE_PASSPORT := "PassportAuthProvider"

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SIGN_ONLINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SIGN_OFFLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SIGN_CANCEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global DRM_SERVER_ISSUANCELICENSE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DRM_AUTO_GENERATE_KEY := 16

/**
 * @type {Integer (UInt32)}
 */
export global DRM_OWNER_LICENSE_NOPERSIST := 32

/**
 * @type {Integer (UInt32)}
 */
export global DRM_REUSE_KEY := 64

/**
 * @type {Integer (UInt32)}
 */
export global DRM_LOCKBOXTYPE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRM_LOCKBOXTYPE_WHITEBOX := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_LOCKBOXTYPE_BLACKBOX := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRM_LOCKBOXTYPE_DEFAULT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRM_AILT_NONSILENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_AILT_OBTAIN_ALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRM_AILT_CANCEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global MSDRM_CLIENT_ZONE := 52992

/**
 * @type {Integer (UInt32)}
 */
export global MSDRM_POLICY_ZONE := 37632

/**
 * @type {Integer (UInt32)}
 */
export global DRMIDVERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRMBOUNDLICENSEPARAMSVERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRMBINDINGFLAGS_IGNORE_VALIDITY_INTERVALS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRMLICENSEACQDATAVERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRMACTSERVINFOVERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRMCLIENTSTRUCTVERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRMCALLBACKVERSION := 1
;@endregion Constants

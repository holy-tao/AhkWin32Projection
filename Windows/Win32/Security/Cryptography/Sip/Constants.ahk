#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MSSIP_FLAGS_PROHIBIT_RESIZE_ON_CREATE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global MSSIP_FLAGS_USE_CATALOG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global MSSIP_FLAGS_MULTI_HASH := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SPC_RELAXED_PE_MARKER_CHECK := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SPC_MARKER_CHECK_SKIP_SIP_INDIRECT_DATA_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPC_MARKER_CHECK_CURRENTLY_SUPPORTED_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MSSIP_ADDINFO_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MSSIP_ADDINFO_FLAT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MSSIP_ADDINFO_CATMEMBER := 2

/**
 * @type {Integer (UInt32)}
 */
export global MSSIP_ADDINFO_BLOB := 3

/**
 * @type {Integer (UInt32)}
 */
export global MSSIP_ADDINFO_DETACHEDSIG := 4

/**
 * @type {Integer (UInt32)}
 */
export global MSSIP_ADDINFO_NONMSSIP := 500

/**
 * @type {Integer (UInt32)}
 */
export global SIP_CAP_SET_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global SIP_CAP_SET_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global SIP_CAP_SET_CUR_VER := 3

/**
 * @type {Integer (UInt32)}
 */
export global SIP_CAP_FLAG_SEALING := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIP_MAX_MAGIC_NUMBER := 4
;@endregion Constants

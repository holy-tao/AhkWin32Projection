#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_RUNTIME_POLICY_ALLOW_FULL_DEBUG := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_RUNTIME_POLICY_ALLOW_DYNAMIC_DEBUG := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_UNSEAL_FLAG_STALE_KEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_FLAG_FULL_DEBUG_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_FLAG_DYNAMIC_DEBUG_ENABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_FLAG_DYNAMIC_DEBUG_ACTIVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global VBS_ENCLAVE_REPORT_PKG_HEADER_VERSION_CURRENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global VBS_ENCLAVE_REPORT_SIGNATURE_SCHEME_SHA256_RSA_PSS_SHA256 := 1

/**
 * @type {Integer (UInt32)}
 */
export global VBS_ENCLAVE_REPORT_VERSION_CURRENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_REPORT_DATA_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global VBS_ENCLAVE_VARDATA_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global VBS_ENCLAVE_VARDATA_MODULE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_VBS_BASIC_KEY_FLAG_MEASUREMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_VBS_BASIC_KEY_FLAG_FAMILY_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_VBS_BASIC_KEY_FLAG_IMAGE_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global ENCLAVE_VBS_BASIC_KEY_FLAG_DEBUG_KEY := 8
;@endregion Constants

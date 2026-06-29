#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.TpmBaseServices
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global TBS_CONTEXT_VERSION_ONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBS_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBS_OWNERAUTH_TYPE_FULL := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBS_OWNERAUTH_TYPE_ADMIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBS_OWNERAUTH_TYPE_USER := 3

/**
 * @type {Integer (UInt32)}
 */
export global TBS_OWNERAUTH_TYPE_ENDORSEMENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global TBS_OWNERAUTH_TYPE_ENDORSEMENT_20 := 12

/**
 * @type {Integer (UInt32)}
 */
export global TBS_OWNERAUTH_TYPE_STORAGE_20 := 13

/**
 * @type {Integer (UInt32)}
 */
export global TBS_CONTEXT_VERSION_TWO := 2

/**
 * @type {Integer (UInt32)}
 */
export global TPM_WNF_INFO_CLEAR_SUCCESSFUL := 1

/**
 * @type {Integer (UInt32)}
 */
export global TPM_WNF_INFO_OWNERSHIP_SUCCESSFUL := 2

/**
 * @type {Integer (UInt32)}
 */
export global TPM_WNF_INFO_NO_REBOOT_REQUIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global TPM_VERSION_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global TPM_VERSION_12 := 1

/**
 * @type {Integer (UInt32)}
 */
export global TPM_VERSION_20 := 2

/**
 * @type {Integer (UInt32)}
 */
export global TPM_IFTYPE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global TPM_IFTYPE_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global TPM_IFTYPE_TRUSTZONE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TPM_IFTYPE_HW := 3

/**
 * @type {Integer (UInt32)}
 */
export global TPM_IFTYPE_EMULATOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global TPM_IFTYPE_SPB := 5

/**
 * @type {Integer (UInt32)}
 */
export global TBS_TCGLOG_SRTM_CURRENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBS_TCGLOG_DRTM_CURRENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBS_TCGLOG_SRTM_BOOT := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBS_TCGLOG_SRTM_RESUME := 3

/**
 * @type {Integer (UInt32)}
 */
export global TBS_TCGLOG_DRTM_BOOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global TBS_TCGLOG_DRTM_RESUME := 5
;@endregion Constants

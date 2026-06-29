#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileHistory
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_CORRUPT_CONFIG_FILE := -2147220736

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_CONFIG_FILE_NOT_FOUND := -2147220735

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_CONFIG_ALREADY_EXISTS := -2147220734

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_NO_VALID_CONFIGURATION_LOADED := -2147220733

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_TARGET_NOT_CONNECTED := -2147220732

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_CONFIGURATION_PREVIOUSLY_LOADED := -2147220731

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_TARGET_VERIFICATION_FAILED := -2147220730

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_TARGET_NOT_CONFIGURED := -2147220729

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_TARGET_NOT_ENOUGH_FREE_SPACE := -2147220728

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_TARGET_CANNOT_BE_USED := -2147220727

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_INVALID_REHYDRATION_STATE := -2147220726

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_RECOMMENDATION_CHANGE_NOT_ALLOWED := -2147220720

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_TARGET_REHYDRATED_ELSEWHERE := -2147220719

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_LEGACY_TARGET_UNSUPPORTED := -2147220718

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_LEGACY_TARGET_VALIDATION_UNSUPPORTED := -2147220717

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_LEGACY_BACKUP_USER_EXCLUDED := -2147220716

/**
 * @type {Integer (Int32)}
 */
export global FHCFG_E_LEGACY_BACKUP_NOT_FOUND := -2147220715

/**
 * @type {Integer (Int32)}
 */
export global FHSVC_E_BACKUP_BLOCKED := -2147219968

/**
 * @type {Integer (Int32)}
 */
export global FHSVC_E_NOT_CONFIGURED := -2147219967

/**
 * @type {Integer (Int32)}
 */
export global FHSVC_E_CONFIG_DISABLED := -2147219966

/**
 * @type {Integer (Int32)}
 */
export global FHSVC_E_CONFIG_DISABLED_GP := -2147219965

/**
 * @type {Integer (Int32)}
 */
export global FHSVC_E_FATAL_CONFIG_ERROR := -2147219964

/**
 * @type {Integer (Int32)}
 */
export global FHSVC_E_CONFIG_REHYDRATING := -2147219963

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_NOT_TRACKED := 0

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_OFF := 1

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_DISABLED_BY_GP := 2

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_FATAL_CONFIG_ERROR := 3

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_MIGRATING := 4

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_REHYDRATING := 5

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_TARGET_FS_LIMITATION := 13

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_TARGET_ACCESS_DENIED := 14

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_TARGET_VOLUME_DIRTY := 15

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_TARGET_FULL_RETENTION_MAX := 16

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_TARGET_FULL := 17

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_STAGING_FULL := 18

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_TARGET_LOW_SPACE_RETENTION_MAX := 19

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_TARGET_LOW_SPACE := 20

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_TARGET_ABSENT := 21

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_TOO_MUCH_BEHIND := 240

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_NO_ERROR := 255

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_BACKUP_NOT_SUPPORTED := 2064

/**
 * @type {Integer (UInt32)}
 */
export global FH_STATE_RUNNING := 256
;@endregion Constants

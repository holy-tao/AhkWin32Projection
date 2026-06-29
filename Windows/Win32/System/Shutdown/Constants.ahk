#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Shutdown
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MAX_REASON_NAME_LEN := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_REASON_DESC_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_REASON_BUGID_LEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_REASON_COMMENT_LEN := 512

/**
 * @type {Integer (UInt32)}
 */
export global SHUTDOWN_TYPE_LEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_SHOWREASONUI_NEVER := 0

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_SHOWREASONUI_ALWAYS := 1

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_SHOWREASONUI_WORKSTATIONONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_SHOWREASONUI_SERVERONLY := 3

/**
 * @type {Integer (UInt32)}
 */
export global SNAPSHOT_POLICY_NEVER := 0

/**
 * @type {Integer (UInt32)}
 */
export global SNAPSHOT_POLICY_ALWAYS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SNAPSHOT_POLICY_UNPLANNED := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_NUM_REASONS := 256
;@endregion Constants

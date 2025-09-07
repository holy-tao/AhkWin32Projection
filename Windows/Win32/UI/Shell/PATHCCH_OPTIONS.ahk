#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PATHCCH_OPTIONS{

    /**
     * @type {Integer (UInt32)}
     */
    static PATHCCH_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PATHCCH_ALLOW_LONG_PATHS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PATHCCH_FORCE_ENABLE_LONG_NAME_PROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PATHCCH_FORCE_DISABLE_LONG_NAME_PROCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PATHCCH_DO_NOT_NORMALIZE_SEGMENTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PATHCCH_ENSURE_IS_EXTENDED_LENGTH_PATH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PATHCCH_ENSURE_TRAILING_SLASH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PATHCCH_CANONICALIZE_SLASHES => 64
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class PATHCCH_OPTIONS extends Win32BitflagEnum {

    /**
     * Native name: PATHCCH_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: PATHCCH_ALLOW_LONG_PATHS
     * @type {Integer (UInt32)}
     */
    static ALLOW_LONG_PATHS => 1

    /**
     * Native name: PATHCCH_FORCE_ENABLE_LONG_NAME_PROCESS
     * @type {Integer (UInt32)}
     */
    static FORCE_ENABLE_LONG_NAME_PROCESS => 2

    /**
     * Native name: PATHCCH_FORCE_DISABLE_LONG_NAME_PROCESS
     * @type {Integer (UInt32)}
     */
    static FORCE_DISABLE_LONG_NAME_PROCESS => 4

    /**
     * Native name: PATHCCH_DO_NOT_NORMALIZE_SEGMENTS
     * @type {Integer (UInt32)}
     */
    static DO_NOT_NORMALIZE_SEGMENTS => 8

    /**
     * Native name: PATHCCH_ENSURE_IS_EXTENDED_LENGTH_PATH
     * @type {Integer (UInt32)}
     */
    static ENSURE_IS_EXTENDED_LENGTH_PATH => 16

    /**
     * Native name: PATHCCH_ENSURE_TRAILING_SLASH
     * @type {Integer (UInt32)}
     */
    static ENSURE_TRAILING_SLASH => 32

    /**
     * Native name: PATHCCH_CANONICALIZE_SLASHES
     * @type {Integer (UInt32)}
     */
    static CANONICALIZE_SLASHES => 64
}

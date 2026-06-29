#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PATHCCH_OPTIONS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

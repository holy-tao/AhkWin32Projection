#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct SYM_LOAD_FLAGS {
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
    static SLMFLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SLMFLAG_VIRTUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SLMFLAG_ALT_INDEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SLMFLAG_NO_SYMBOLS => 4
}

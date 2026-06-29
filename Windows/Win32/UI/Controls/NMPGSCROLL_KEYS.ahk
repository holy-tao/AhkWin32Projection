#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMPGSCROLL_KEYS {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static PGK_NONE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static PGK_SHIFT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PGK_CONTROL => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PGK_MENU => 4
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DFC_TYPE {
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
    static DFC_CAPTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DFC_MENU => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DFC_SCROLL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DFC_BUTTON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DFC_POPUPMENU => 5
}

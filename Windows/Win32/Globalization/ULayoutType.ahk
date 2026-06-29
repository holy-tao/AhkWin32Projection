#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct ULayoutType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_LTR => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_RTL => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_TTB => 2

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_BTT => 3

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_UNKNOWN => 4
}

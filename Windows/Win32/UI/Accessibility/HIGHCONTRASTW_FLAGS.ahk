#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct HIGHCONTRASTW_FLAGS {
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
    static HCF_HIGHCONTRASTON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_AVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_HOTKEYACTIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_CONFIRMHOTKEY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_HOTKEYSOUND => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_INDICATOR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_HOTKEYAVAILABLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_OPTION_NOTHEMECHANGE => 4096
}

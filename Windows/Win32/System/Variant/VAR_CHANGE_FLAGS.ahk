#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Variant
 */
export default struct VAR_CHANGE_FLAGS {
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
    static VARIANT_NOVALUEPROP => 1

    /**
     * @type {Integer (UInt16)}
     */
    static VARIANT_ALPHABOOL => 2

    /**
     * @type {Integer (UInt16)}
     */
    static VARIANT_NOUSEROVERRIDE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static VARIANT_CALENDAR_HIJRI => 8

    /**
     * @type {Integer (UInt16)}
     */
    static VARIANT_LOCALBOOL => 16

    /**
     * @type {Integer (UInt16)}
     */
    static VARIANT_CALENDAR_THAI => 32

    /**
     * @type {Integer (UInt16)}
     */
    static VARIANT_CALENDAR_GREGORIAN => 64

    /**
     * @type {Integer (UInt16)}
     */
    static VARIANT_USE_NLS => 128
}

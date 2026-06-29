#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct PROPDESC_DISPLAYTYPE {
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
    static PDDT_STRING => 0

    /**
     * @type {Integer (Int32)}
     */
    static PDDT_NUMBER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PDDT_BOOLEAN => 2

    /**
     * @type {Integer (Int32)}
     */
    static PDDT_DATETIME => 3

    /**
     * @type {Integer (Int32)}
     */
    static PDDT_ENUMERATED => 4
}

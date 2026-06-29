#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UMessagePatternArgType {
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
    static UMSGPAT_ARG_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_ARG_TYPE_SIMPLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_ARG_TYPE_CHOICE => 2

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_ARG_TYPE_PLURAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_ARG_TYPE_SELECT => 4

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_ARG_TYPE_SELECTORDINAL => 5
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UPropertyNameChoice {
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
    static U_SHORT_PROPERTY_NAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_LONG_PROPERTY_NAME => 1
}

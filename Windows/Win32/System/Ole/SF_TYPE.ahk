#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct SF_TYPE {
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
    static SF_ERROR => 10

    /**
     * @type {Integer (Int32)}
     */
    static SF_I1 => 16

    /**
     * @type {Integer (Int32)}
     */
    static SF_I2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static SF_I4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static SF_I8 => 20

    /**
     * @type {Integer (Int32)}
     */
    static SF_BSTR => 8

    /**
     * @type {Integer (Int32)}
     */
    static SF_UNKNOWN => 13

    /**
     * @type {Integer (Int32)}
     */
    static SF_DISPATCH => 9

    /**
     * @type {Integer (Int32)}
     */
    static SF_VARIANT => 12

    /**
     * @type {Integer (Int32)}
     */
    static SF_RECORD => 36

    /**
     * @type {Integer (Int32)}
     */
    static SF_HAVEIID => 32781
}

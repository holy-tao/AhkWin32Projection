#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EXTENDED_AGP_REGISTER {
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
    static IsochStatus => 0

    /**
     * @type {Integer (Int32)}
     */
    static AgpControl => 1

    /**
     * @type {Integer (Int32)}
     */
    static ApertureSize => 2

    /**
     * @type {Integer (Int32)}
     */
    static AperturePageSize => 3

    /**
     * @type {Integer (Int32)}
     */
    static GartLow => 4

    /**
     * @type {Integer (Int32)}
     */
    static GartHigh => 5

    /**
     * @type {Integer (Int32)}
     */
    static IsochCommand => 6
}

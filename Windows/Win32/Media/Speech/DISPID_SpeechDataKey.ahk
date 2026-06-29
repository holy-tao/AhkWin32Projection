#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechDataKey {
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
    static DISPID_SDKSetBinaryValue => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKGetBinaryValue => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKSetStringValue => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKGetStringValue => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKSetLongValue => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKGetlongValue => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKOpenKey => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKCreateKey => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKDeleteKey => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKDeleteValue => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKEnumKeys => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SDKEnumValues => 12
}

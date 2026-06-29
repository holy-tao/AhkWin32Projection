#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_ENUM_JOB_SEND_ATTRIBUTES {
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
    static JSA_NOW => 0

    /**
     * @type {Integer (Int32)}
     */
    static JSA_SPECIFIC_TIME => 1

    /**
     * @type {Integer (Int32)}
     */
    static JSA_DISCOUNT_PERIOD => 2
}

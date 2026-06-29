#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_ENUM_DELIVERY_REPORT_TYPES {
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
    static DRT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DRT_EMAIL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DRT_INBOX => 2
}

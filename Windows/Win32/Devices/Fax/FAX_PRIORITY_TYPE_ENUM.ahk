#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FAX_PRIORITY_TYPE_ENUM enumeration defines the types of priorities for outbound faxes.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_priority_type_enum
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_PRIORITY_TYPE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The fax will be sent with a low priority. All faxes that have a normal or a high priority will be sent before a fax that has a low priority.
     * @type {Integer (Int32)}
     */
    static fptLOW => 0

    /**
     * The fax will be sent with a normal priority. All faxes that have a high priority will be sent before a fax that has a normal priority.
     * @type {Integer (Int32)}
     */
    static fptNORMAL => 1

    /**
     * The fax will be sent with a high priority.
     * @type {Integer (Int32)}
     */
    static fptHIGH => 2
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FAX_PRIORITY_TYPE_ENUM enumeration defines the types of priorities for outbound faxes.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_priority_type_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_PRIORITY_TYPE_ENUM{

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

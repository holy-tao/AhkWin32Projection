#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FAX_SCHEDULE_TYPE_ENUM enumeration defines the types of scheduling for outbound faxes.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_schedule_type_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_SCHEDULE_TYPE_ENUM{

    /**
     * Send the fax as soon as a device is available.
     * @type {Integer (Int32)}
     */
    static fstNOW => 0

    /**
     * Send the fax no sooner than the specified time. The actual time that the fax will be sent depends on device availability and fax priority.
     * @type {Integer (Int32)}
     */
    static fstSPECIFIC_TIME => 1

    /**
     * Send the fax during the discount rate period.
     * @type {Integer (Int32)}
     */
    static fstDISCOUNT_PERIOD => 2
}

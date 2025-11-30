#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ENUM_DELIVERY_REPORT_TYPES extends Win32Enum{

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

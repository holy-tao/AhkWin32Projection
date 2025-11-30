#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ENUM_LOG_CATEGORIES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_CATEGORY_INIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_CATEGORY_OUTBOUND => 2

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_CATEGORY_INBOUND => 3

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_CATEGORY_UNKNOWN => 4
}

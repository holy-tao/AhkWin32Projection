#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ENUM_JOB_COMMANDS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static JC_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static JC_DELETE => 1

    /**
     * @type {Integer (Int32)}
     */
    static JC_PAUSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static JC_RESUME => 3
}

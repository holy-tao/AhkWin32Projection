#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class HIDP_REPORT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HidP_Input => 0

    /**
     * @type {Integer (Int32)}
     */
    static HidP_Output => 1

    /**
     * @type {Integer (Int32)}
     */
    static HidP_Feature => 2
}

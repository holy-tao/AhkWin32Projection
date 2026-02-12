#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies a [HID report type](/windows-hardware/drivers/hid/introduction-to-hid-concepts#reports).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidreporttype
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidReportType extends Win32Enum{

    /**
     * The report is an Input Report.
     * @type {Integer (Int32)}
     */
    static Input => 0

    /**
     * The report is an Output Report.
     * @type {Integer (Int32)}
     */
    static Output => 1

    /**
     * The report is a Feature Report.
     * @type {Integer (Int32)}
     */
    static Feature => 2
}

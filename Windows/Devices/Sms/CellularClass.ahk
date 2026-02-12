#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This enumerated type defines the type of radio standard in a device.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.cellularclass
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class CellularClass extends Win32Enum{

    /**
     * The device type corresponds to no cellular class.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The device type is GSM cellular class.
     * @type {Integer (Int32)}
     */
    static Gsm => 1

    /**
     * The device type is CDMA cellular class.
     * @type {Integer (Int32)}
     */
    static Cdma => 2
}

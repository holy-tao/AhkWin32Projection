#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class WINUSB_POWER_POLICY extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_SUSPEND => 129

    /**
     * @type {Integer (UInt32)}
     */
    static SUSPEND_DELAY => 131
}

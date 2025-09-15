#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<HANDLE>}
     */
    TimeTrackingHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    IsStartupDelayTolerable {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}

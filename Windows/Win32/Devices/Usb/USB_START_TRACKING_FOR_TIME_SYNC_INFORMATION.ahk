#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION extends Win32Struct
{
    static sizeof => 9

    static packingSize => 1

    /**
     * @type {HANDLE}
     */
    TimeTrackingHandle{
        get {
            if(!this.HasProp("__TimeTrackingHandle"))
                this.__TimeTrackingHandle := HANDLE(this.ptr + 0)
            return this.__TimeTrackingHandle
        }
    }

    /**
     * @type {Integer}
     */
    IsStartupDelayTolerable {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}

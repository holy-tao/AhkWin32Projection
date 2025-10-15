#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
     * @type {BOOLEAN}
     */
    IsStartupDelayTolerable{
        get {
            if(!this.HasProp("__IsStartupDelayTolerable"))
                this.__IsStartupDelayTolerable := BOOLEAN(this.ptr + 8)
            return this.__IsStartupDelayTolerable
        }
    }
}

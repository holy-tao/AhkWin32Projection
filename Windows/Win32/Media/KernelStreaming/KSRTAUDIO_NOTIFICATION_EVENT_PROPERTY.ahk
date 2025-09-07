#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSRTAUDIO_NOTIFICATION_EVENT_PROPERTY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {HANDLE}
     */
    NotificationEvent{
        get {
            if(!this.HasProp("__NotificationEvent"))
                this.__NotificationEvent := HANDLE(this.ptr + 8)
            return this.__NotificationEvent
        }
    }
}

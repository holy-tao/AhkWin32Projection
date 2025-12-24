#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_NOTIFICATION_FLAGS.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_NOTIFICATION_DESCRIPTOR.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEAP_BAD_HEST_NOTIFY_DATA_EVENT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_EVENT_LOG_ENTRY>}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SourceId {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {WHEA_NOTIFICATION_DESCRIPTOR}
     */
    NotifyDesc{
        get {
            if(!this.HasProp("__NotifyDesc"))
                this.__NotifyDesc := WHEA_NOTIFICATION_DESCRIPTOR(12, this)
            return this.__NotifyDesc
        }
    }
}

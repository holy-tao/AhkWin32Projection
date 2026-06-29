#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Identifies the kernel event for which you want to enable call stack tracing.
 * @remarks
 * To enable the [read](/windows/desktop/ETW/diskio-typegroup1) event type for
 * [disk IO](/windows/desktop/ETW/diskio) events, set **GUID** to
 * `3d6fa8d4-fe05-11d0-9dda-00c04fd7ba7c` and **Type** to 10.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-classic_event_id
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class CLASSIC_EVENT_ID extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * The GUID that identifies the kernel event class.
     * @type {Guid}
     */
    EventGuid {
        get {
            if(!this.HasProp("__EventGuid"))
                this.__EventGuid := Guid(0, this)
            return this.__EventGuid
        }
    }

    /**
     * The event type that identifies the event within the kernel event class to
     * enable.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 17, 7, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}

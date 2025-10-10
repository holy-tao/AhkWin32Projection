#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Identifies the kernel event for which you want to enable call stack tracing.
 * @remarks
 * 
  * To enable the <a href="https://docs.microsoft.com/windows/desktop/ETW/diskio-typegroup1">read</a> event type for <a href="https://docs.microsoft.com/windows/desktop/ETW/diskio">disk IO </a>events, set <b>GUID</b> to 3d6fa8d4-fe05-11d0-9dda-00c04fd7ba7c and <b>Type</b> to 10.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-classic_event_id
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class CLASSIC_EVENT_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The GUID that identifies the kernel event class.
     * @type {Pointer<Guid>}
     */
    EventGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The event type that identifies the event within the kernel event class to enable.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 9, 7, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}

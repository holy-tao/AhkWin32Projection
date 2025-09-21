#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The EVENT_INSTANCE_INFO structure maps a unique transaction identifier to a registered event trace class for TraceEventInstance.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
  * members.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-event_instance_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_INSTANCE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Handle to a registered event trace class.
     * @type {Pointer<Void>}
     */
    RegHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Unique transaction identifier that maps an event to a specific transaction.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

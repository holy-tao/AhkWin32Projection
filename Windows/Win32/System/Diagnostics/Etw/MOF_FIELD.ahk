#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * You may use the MOF_FIELD structures to append event data to the EVENT_TRACE_HEADER or EVENT_INSTANCE_HEADER structures.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
  * members.
  * 
  * If you use **MOF_FIELD** structures, you must set the **WNODE_FLAG_USE_MOF_PTR**
  * flag in the **Flags** member of the
  * [EVENT_TRACE_HEADER](/windows/win32/api/evntrace/ns-evntrace-event_trace_header)
  * or
  * [EVENT_INSTANCE_HEADER](/windows/win32/api/evntrace/ns-evntrace-event_instance_header)
  * structures.
  * 
  * The event tracing session automatically dereferences **MOF_FIELD** data pointers
  * before passing the data to event trace consumers using
  * [EVENT_TRACE](/windows/win32/api/evntrace/ns-evntrace-event_trace) structures.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-mof_field
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class MOF_FIELD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a event data item.
     * @type {Integer}
     */
    DataPtr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Length of the item pointed to by **DataPtr**, in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    DataType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

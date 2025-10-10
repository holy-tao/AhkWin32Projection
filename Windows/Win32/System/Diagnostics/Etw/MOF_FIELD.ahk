#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * You may use the MOF_FIELD structures to append event data to the EVENT_TRACE_HEADER or EVENT_INSTANCE_HEADER structures.
 * @remarks
 * 
  * Be sure to initialize the memory for this structure to zero before setting any members.
  * 
  * If you use 
  * <b>MOF_FIELD</b> structures, you must set the <b>WNODE_FLAG_USE_MOF_PTR</b> flag in the <b>Flags</b> member of the 
  * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a> or 
  * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-instance-header">EVENT_INSTANCE_HEADER</a> structure.
  * 
  * The event tracing session automatically dereferences 
  * <b>MOF_FIELD</b> data pointers before passing the data to event trace consumers using 
  * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace">EVENT_TRACE</a> structures.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-mof_field
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
     * Length of the item pointed to by <b>DataPtr</b>, in bytes.
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

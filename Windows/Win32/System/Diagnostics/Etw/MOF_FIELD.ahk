#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct MOF_FIELD {
    #StructPack 8

    /**
     * Pointer to a event data item.
     */
    DataPtr : Int64

    /**
     * Length of the item pointed to by **DataPtr**, in bytes.
     */
    Length : UInt32

    /**
     * Reserved.
     */
    DataType : UInt32

}

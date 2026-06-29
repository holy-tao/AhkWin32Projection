#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The EVENT_INSTANCE_INFO structure maps a unique transaction identifier to a registered event trace class for TraceEventInstance.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
 * members.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-event_instance_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_INSTANCE_INFO {
    #StructPack 8

    /**
     * Handle to a registered event trace class.
     */
    RegHandle : HANDLE

    /**
     * Unique transaction identifier that maps an event to a specific transaction.
     */
    InstanceId : UInt32

}

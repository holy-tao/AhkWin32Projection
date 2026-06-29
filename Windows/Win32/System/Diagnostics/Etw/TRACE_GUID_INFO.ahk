#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Returned by EnumerateTraceGuidsEx. Defines the header to the list of sessions that enabled a provider.
 * @remarks
 * Use the size of this structure to access the first
 * [TRACE_PROVIDER_INSTANCE_INFO](/windows/desktop/ETW/trace-provider-instance-info)
 * block in the list.
 * 
 * For an example, see
 * [EnumerateTraceGuidsEx](/windows/win32/api/evntrace/nf-evntrace-enumeratetraceguidsex).
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_guid_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_GUID_INFO {
    #StructPack 4

    /**
     * The number of
     * [TRACE_PROVIDER_INSTANCE_INFO](/windows/desktop/ETW/trace-provider-instance-info)
     * blocks contained in the list. You can have multiple instances of the same
     * provider if the provider lives in a DLL that is loaded by multiple processes.
     */
    InstanceCount : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

}

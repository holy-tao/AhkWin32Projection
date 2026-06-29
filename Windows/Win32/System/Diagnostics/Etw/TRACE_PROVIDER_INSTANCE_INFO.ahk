#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines an instance of the provider GUID.
 * @remarks
 * If more than one event provider has registered using the same provider GUID, the
 * [TRACE_GUID_INFO](/windows/desktop/ETW/trace-guid-info) block contains more than
 * one **TRACE_PROVIDER_INSTANCE_INFO** structure.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_provider_instance_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_PROVIDER_INSTANCE_INFO {
    #StructPack 4

    /**
     * Offset, in bytes, from the beginning of this structure to the next
     * **TRACE_PROVIDER_INSTANCE_INFO** structure. The value is zero if there is not
     * another instance info block.
     */
    NextOffset : UInt32

    /**
     * Number of [TRACE_ENABLE_INFO](/windows/desktop/ETW/trace-enable-info) structures
     * in this block. Each structure represents a session that enabled the provider.
     */
    EnableCount : UInt32

    /**
     * Process identifier of the process that registered the provider.
     */
    Pid : UInt32

    /**
     * Can be one of the following flags.
     * 
     * - **TRACE_PROVIDER_FLAG_LEGACY**: The provider used
     *   [RegisterTraceGuids](/windows/desktop/ETW/registertraceguids) instead of
     *   [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister) to
     *   register itself.
     * 
     * - **TRACE_PROVIDER_FLAG_PRE_ENABLE**: The provider is not registered; however,
     *   one or more sessions have enabled the provider.
     */
    Flags : UInt32

}

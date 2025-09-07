#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines an instance of the provider GUID.
 * @remarks
 * If more than one event provider has registered using the same provider GUID, the
  * [TRACE_GUID_INFO](/windows/desktop/ETW/trace-guid-info) block contains more than
  * one **TRACE_PROVIDER_INSTANCE_INFO** structure.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_provider_instance_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_PROVIDER_INSTANCE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Offset, in bytes, from the beginning of this structure to the next
     * **TRACE_PROVIDER_INSTANCE_INFO** structure. The value is zero if there is not
     * another instance info block.
     * @type {Integer}
     */
    NextOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of [TRACE_ENABLE_INFO](/windows/desktop/ETW/trace-enable-info) structures
     * in this block. Each structure represents a session that enabled the provider.
     * @type {Integer}
     */
    EnableCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Process identifier of the process that registered the provider.
     * @type {Integer}
     */
    Pid {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

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
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines an instance of the provider GUID.
 * @remarks
 * 
 *  If more than one provider uses the same GUID, the <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-guid-info">TRACE_GUID_INFO</a> block contains more than one <b>TRACE_PROVIDER_INSTANCE_INFO</b> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-trace_provider_instance_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_PROVIDER_INSTANCE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Offset, in bytes, from the beginning of this structure to the next <b>TRACE_PROVIDER_INSTANCE_INFO</b> structure. The value is zero if there is not another instance info block.
     * @type {Integer}
     */
    NextOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-enable-info">TRACE_ENABLE_INFO</a> structures in this block. Each structure represents a session that enabled the provider.
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
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_PROVIDER_FLAG_LEGACY"></a><a id="trace_provider_flag_legacy"></a><dl>
     * <dt><b>TRACE_PROVIDER_FLAG_LEGACY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider used <a href="https://docs.microsoft.com/windows/desktop/ETW/registertraceguids">RegisterTraceGuids</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nf-evntprov-eventregister">EventRegister</a> to register itself. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_PROVIDER_FLAG_PRE_ENABLE"></a><a id="trace_provider_flag_pre_enable"></a><dl>
     * <dt><b>TRACE_PROVIDER_FLAG_PRE_ENABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider is not registered; however, one or more sessions have enabled the provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

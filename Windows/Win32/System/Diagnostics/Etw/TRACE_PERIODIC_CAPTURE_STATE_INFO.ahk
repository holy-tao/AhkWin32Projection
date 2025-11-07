#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Information relating to a periodic capture state.
 * @remarks
 * 
 * Periodic capture state is a way to allow capture state notifications to be routinely sent to providers. When this is enabled,  notifications will only be sent to provider registrations that have been previously enabled to the current session. Each provider can define its own response (if any) to a notification. Note that events logged by the provider in response to a notification will be sent to every ETW session that the provider is enabled to, similar to a manually requested capture state.
 * 
 *  To use periodic capture state:<ul>
 * <li>Allocate a buffer of type <b>TRACE_PERIODIC_CAPTURE_STATE_INFO</b>. The size of the buffer should be: sizeof(<b>TRACE_PERIODIC_CAPTURE_STATE_INFO</b>) + (x * sizeof(GUID)), where x is the number of providers you would like to enable.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/ETW/tracequeryinformation">TraceQueryInformation</a> using <b>TracePeriodicCaptureStateInfo</b> for the <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-info-class">TRACE_INFO_CLASS</a> enumeration. Pass the buffer and its size as the <i>TraceInformation</i> and <i>InformationLength</i> parameters of <b>TraceQueryInformation</b>.</li>
 * <li>Set <b>CaptureStateFrequencyInSeconds</b> from <b>TRACE_PERIODIC_CAPTURE_STATE_INFO</b> to the minimum frequency supported by the version of Windows. This value may change in the future, so hard coding it is not recommended. If the frequency is below the minimum, the call to <a href="https://docs.microsoft.com/windows/desktop/ETW/tracesetinformation">TraceSetInformation</a> will fail. </li>
 * <li>Set the <b>ProviderCount</b> from  <b>TRACE_PERIODIC_CAPTURE_STATE_INFO</b> to the number of provider GUIDs being passed. </li>
 * <li>Add the GUIDs of each provider after the end of the <b>TRACE_PERIODIC_CAPTURE_STATE_INFO</b> structure. This uses the extra space allocated from (x * sizeof(GUID) from the first step.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/ETW/tracesetinformation">TraceSetInformation</a> using <b>TracePeriodicCaptureStateListInfo</b> from the <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-info-class">TRACE_INFO_CLASS</a> enumeration. </li>
 * <li>To turn periodic capture state off, call <a href="https://docs.microsoft.com/windows/desktop/ETW/tracesetinformation">TraceSetInformation</a> again with <b>TracePeriodicCaptureStateListInfo</b> from the <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-info-class">TRACE_INFO_CLASS</a>, NULL for the <b>TraceInformation</b>, and 0 as the <b>InformationLength</b>.</li>
 * </ul>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-trace_periodic_capture_state_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_PERIODIC_CAPTURE_STATE_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The frequency of state captures in seconds.
     * @type {Integer}
     */
    CaptureStateFrequencyInSeconds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of providers.
     * @type {Integer}
     */
    ProviderCount {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}

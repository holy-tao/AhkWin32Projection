#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used with TraceQueryInformation and TraceSetInformation to get or set information relating to a periodic capture state.
 * @remarks
 * Periodic capture state is a way to allow capture state notifications to be
 * routinely sent to providers. When this is enabled, notifications will only be
 * sent to provider registrations that have been previously enabled to the current
 * session. Each provider can define its own response (if any) to a notification.
 * Note that events logged by the provider in response to a notification will be
 * sent to every ETW session that the provider is enabled to, similar to a manually
 * requested capture state.
 * 
 * To use periodic capture state:
 * 
 * 1. Allocate a buffer of type **TRACE_PERIODIC_CAPTURE_STATE_INFO**. The size of
 *    the buffer should be: sizeof(**TRACE_PERIODIC_CAPTURE_STATE_INFO**) + (x \*
 *    sizeof(GUID)), where x is the number of providers you would like to enable.
 * 1. Call
 *    [TraceQueryInformation](/windows/win32/api/evntrace/nf-evntrace-tracequeryinformation)
 *    using **TracePeriodicCaptureStateInfo** for the
 *    [TRACE_INFO_CLASS](/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class)
 *    enumeration. Pass the buffer and its size as the _TraceInformation_ and
 *    _InformationLength_ parameters of **TraceQueryInformation**.
 * 1. Set **CaptureStateFrequencyInSeconds** from
 *    **TRACE_PERIODIC_CAPTURE_STATE_INFO** to the minimum frequency supported by
 *    the version of Windows. This value may change in the future, so hard coding
 *    it is not recommended. If the frequency is below the minimum, the call to
 *    [TraceSetInformation](/windows/win32/api/evntrace/nf-evntrace-tracesetinformation)
 *    will fail.
 * 1. Set the **ProviderCount** from **TRACE_PERIODIC_CAPTURE_STATE_INFO** to the
 *    number of provider GUIDs being passed.
 * 1. Add the GUIDs of each provider after the end of the
 *    **TRACE_PERIODIC_CAPTURE_STATE_INFO** structure. This uses the extra space
 *    allocated from (x \* sizeof(GUID)) from the first step.
 * 1. Call **TraceSetInformation** using **TracePeriodicCaptureStateListInfo** from
 *    the
 *    [TRACE_INFO_CLASS](/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class)
 *    enumeration.
 * 1. To turn periodic capture state off, call **TraceSetInformation** again with
 *    **TracePeriodicCaptureStateListInfo** from the
 *    [TRACE_INFO_CLASS](/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class),
 *    NULL for the **TraceInformation**, and 0 as the **InformationLength**.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_periodic_capture_state_info
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

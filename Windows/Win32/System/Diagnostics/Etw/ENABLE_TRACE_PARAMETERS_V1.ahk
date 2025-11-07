#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the information used to enable a provider.
 * @remarks
 * 
 * The <b>ENABLE_TRACE_PARAMETERS_V1</b> structure  is used with the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletrace">EnableTrace</a> and <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex-func">EnableTraceEx</a> functions. The <a href="https://docs.microsoft.com/windows/desktop/ETW/enable-trace-parameters">ENABLE_TRACE_PARAMETERS</a> structure is a version 2 structure and replaces the <b>ENABLE_TRACE_PARAMETERS_V1</b> structure for use with the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function.
 * 
 * Typically, on 64-bit computers, you cannot capture the kernel stack in certain contexts when page faults are not allowed. To enable walking the kernel stack on x64, set the <b>DisablePagingExecutive</b> Memory Management registry value to 1. The <b>DisablePagingExecutive</b> registry value is located under the following registry key:<b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management</b></p>You should consider the cost of setting this registry value before doing so.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-enable_trace_parameters_v1
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ENABLE_TRACE_PARAMETERS_V1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Set to <b>ENABLE_TRACE_PARAMETERS_VERSION</b>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Optional information that ETW can include when writing the event. The data is written to the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header_extended_data_item">extended data item</a> section of the event. To include the optional information, specify one or more of the following flags; otherwise, set to zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_ENABLE_PROPERTY_SID"></a><a id="event_enable_property_sid"></a><dl>
     * <dt><b>EVENT_ENABLE_PROPERTY_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include in the extended data the security identifier (SID) of the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_ENABLE_PROPERTY_TS_ID"></a><a id="event_enable_property_ts_id"></a><dl>
     * <dt><b>EVENT_ENABLE_PROPERTY_TS_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include in the extended data the terminal session identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_ENABLE_PROPERTY_STACK_TRACE"></a><a id="event_enable_property_stack_trace"></a><dl>
     * <dt><b>EVENT_ENABLE_PROPERTY_STACK_TRACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include in the extended data a call stack trace for events written using <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nf-evntprov-eventwrite">EventWrite</a>.
     * 
     * If you set <b>EVENT_ENABLE_PROPERTY_STACK_TRACE</b>, ETW will drop the event if the total event size exceeds 64K. If the provider is logging events close in size to 64K maximum, it is possible that enabling stack capture will cause the event to be lost.
     * 
     * If the stack is longer than the maximum number of frames (192), the frames will be cut from the bottom of the stack.
     * 
     * For consumers,  the events will include the <a href="https://docs.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_stack_trace64">EVENT_EXTENDED_ITEM_STACK_TRACE32</a> or <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_extended_item_stack_trace64">EVENT_EXTENDED_ITEM_STACK_TRACE64</a> extended item. Note that on 64-bit computers, 32-bit processes will receive 64-bit stack traces.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    EnableProperty {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved. Set to 0.
     * @type {Integer}
     */
    ControlFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A GUID that uniquely identifies the session that is enabling or disabling the provider. If the provider does not implement <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nc-evntprov-penablecallback">EnableCallback</a>, the GUID is not used.
     * @type {Pointer<Guid>}
     */
    SourceId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structure that points to the filter data. The provider uses filter data to prevent events that match the filter criteria from being written to the session. The provider determines the layout of the data and how it applies the filter to the event's data. A session can pass only one filter to the provider.
     * 
     * A session can call the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviderfilters">TdhEnumerateProviderFilters</a> function to determine the schematized filters that it can pass to the provider.
     * @type {Pointer<EVENT_FILTER_DESCRIPTOR>}
     */
    EnableFilterDesc {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

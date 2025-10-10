#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EVENT_DESCRIPTOR.ahk

/**
 * Defines information about the event.
 * @remarks
 * 
  * You can use the <b>KernelTime</b> and <b>UserTime</b> members to determine the CPU cost in units for a set of instructions (the values indicate the CPU usage charged to that thread at the time of logging). For example, if Event A and Event B are consecutively logged by the same thread and they have CPU usage numbers 150 and 175, then the activity that was performed by that thread between events A and B cost 25 CPU time units (175 – 150).
  * 
  * The <b>TimerResolution</b> of the <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-logfile-header">TRACE_LOGFILE_HEADER</a> structure contains the resolution of the CPU usage timer in 100-nanosecond units. You can use the timer resolution with the kernel time and user time values to determine the amount of CPU time that the set of instructions used. For example, if the timer resolution is 156,250, then 25 CPU time units is 0.39 seconds (156,250 * 25 * 100 / 1,000,000,000). This is the amount of CPU time (not elapsed wall clock time) used by the set of instructions between events A and B.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntcons/ns-evntcons-event_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_HEADER extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Size of the event record, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    HeaderType {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Flags that provide information about the event such as the type of session it was logged to and if the event contains extended data. This member can contain one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_FLAG_EXTENDED_INFO"></a><a id="event_header_flag_extended_info"></a><dl>
     * <dt><b>EVENT_HEADER_FLAG_EXTENDED_INFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ExtendedData</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> contains data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_FLAG_PRIVATE_SESSION"></a><a id="event_header_flag_private_session"></a><dl>
     * <dt><b>EVENT_HEADER_FLAG_PRIVATE_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event was logged to a private session. Use <b>ProcessorTime</b> for  elapsed execution time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_FLAG_STRING_ONLY"></a><a id="event_header_flag_string_only"></a><dl>
     * <dt><b>EVENT_HEADER_FLAG_STRING_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event data is a null-terminated Unicode string. You do not need a manifest to parse the <b>UserData</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_FLAG_TRACE_MESSAGE"></a><a id="event_header_flag_trace_message"></a><dl>
     * <dt><b>EVENT_HEADER_FLAG_TRACE_MESSAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider used <a href="https://docs.microsoft.com/windows/desktop/ETW/tracemessage">TraceMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/ETW/tracemessageva">TraceMessageVa</a> to log the event. Most providers do not use these functions to write events, so this flag typically indicates that the event was written by <a href="https://docs.microsoft.com/windows/desktop/ETW/windows-software-trace-preprocessor">Windows Software Trace Preprocessor</a> (WPP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_FLAG_NO_CPUTIME"></a><a id="event_header_flag_no_cputime"></a><dl>
     * <dt><b>EVENT_HEADER_FLAG_NO_CPUTIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use <b>ProcessorTime</b> for  elapsed execution time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_FLAG_32_BIT_HEADER"></a><a id="event_header_flag_32_bit_header"></a><dl>
     * <dt><b>EVENT_HEADER_FLAG_32_BIT_HEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the provider was running on a 32-bit computer or in a WOW64 session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_FLAG_64_BIT_HEADER"></a><a id="event_header_flag_64_bit_header"></a><dl>
     * <dt><b>EVENT_HEADER_FLAG_64_BIT_HEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the provider was running on a 64-bit computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_FLAG_CLASSIC_HEADER"></a><a id="event_header_flag_classic_header"></a><dl>
     * <dt><b>EVENT_HEADER_FLAG_CLASSIC_HEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that provider used <a href="https://docs.microsoft.com/windows/desktop/ETW/traceevent">TraceEvent</a> to log the event.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Indicates the source to use for parsing the event data.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_PROPERTY_XML"></a><a id="event_header_property_xml"></a><dl>
     * <dt><b>EVENT_HEADER_PROPERTY_XML</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that you need a manifest to parse the event data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_PROPERTY_FORWARDED_XML"></a><a id="event_header_property_forwarded_xml"></a><dl>
     * <dt><b>EVENT_HEADER_PROPERTY_FORWARDED_XML</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the event data contains within itself a fully-rendered XML description of the data, so you do  not need a manifest to parse the event data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_HEADER_PROPERTY_LEGACY_EVENTLOG"></a><a id="event_header_property_legacy_eventlog"></a><dl>
     * <dt><b>EVENT_HEADER_PROPERTY_LEGACY_EVENTLOG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that you need a WMI MOF class to parse the event data.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    EventProperty {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Identifies the thread that generated the event.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Identifies the process that generated the event.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Contains the time that the event occurred. The resolution is system time unless the <b>ProcessTraceMode</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-logfile">EVENT_TRACE_LOGFILE</a> contains the PROCESS_TRACE_MODE_RAW_TIMESTAMP flag, in which case the resolution depends on the value of the <b>Wnode.ClientContext</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> at the time the controller created the session.
     * @type {Integer}
     */
    TimeStamp {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * GUID that uniquely identifies the provider that logged the event.
     * @type {Pointer<Guid>}
     */
    ProviderId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Defines the information about the event such as the event identifier and severity level. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_descriptor">EVENT_DESCRIPTOR</a>.
     * @type {EVENT_DESCRIPTOR}
     */
    EventDescriptor{
        get {
            if(!this.HasProp("__EventDescriptor"))
                this.__EventDescriptor := EVENT_DESCRIPTOR(this.ptr + 32)
            return this.__EventDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    KernelTime {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    UserTime {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    ProcessorTime {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Identifier that relates two events. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nf-evntprov-eventwritetransfer">EventWriteTransfer</a>.
     * @type {Pointer<Guid>}
     */
    ActivityId {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}

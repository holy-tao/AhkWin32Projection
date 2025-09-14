#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EVENT_TRACE_HEADER.ahk
#Include .\ETW_BUFFER_CONTEXT.ahk
#Include .\EVENT_TRACE.ahk
#Include ..\..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\Time\TIME_ZONE_INFORMATION.ahk
#Include .\TRACE_LOGFILE_HEADER.ahk

/**
 * The EVENT_TRACE_LOGFILEA (ANSI) structure (evntrace.h) stores information about a trace data source.
 * @remarks
 * Event consumers should:
  * 
  * 1. Initialize the memory for this structure to zero.
  * 1. If reading from an ETL file, set **LogFileName** to the path to the file.
  *    Otherwise (i.e. if reading from a real-time session), set **LoggerName** to
  *    the name of the session and set **ProcessTraceMode** to
  *    `PROCESS_TRACE_MODE_REAL_TIME`.
  * 1. If using
  *    [EventRecordCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_record_callback)
  *    (recommended), set **EventRecordCallback** to the address of your event
  *    record callback function, set **Context** to a value to be provided to your
  *    callback, and add `PROCESS_TRACE_MODE_EVENT_RECORD` to **ProcessTraceMode**.
  *    Otherwise (i.e. if using
  *    [EventCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_callback)),
  *    set **EventCallback** to the address of your event callback function.
  * 1. If you need a callback after each buffer is processed, set **BufferCallback**
  *    to the address of your buffer callback function.
  * 1. If you want the original raw timestamp data instead of the processed
  *    timestamp, add `PROCESS_TRACE_MODE_RAW_TIMESTAMP` to **ProcessTraceMode**.
  * 1. Call [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea). Note
  *    that if successful, **OpenTrace** function will fill in members of this
  *    structure with information from the trace data source.
  * 1. Call [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
  *    with the handle returned by **OpenTrace**.
  *    - **ProcessTrace** will invoke your event callback function for each event.
  *    - **ProcessTrace** will invoke your buffer callback function (if provided)
  *      after finishing each buffer and will include an instance of the
  *      **EVENT_TRACE_LOGFILE** structure with trace processing status information.
  * 1. After trace processing completes, call
  *    [CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace) to close the
  *    handle that was returned by **OpenTrace**.
  * 
  * > [!NOTE]
  * > The evntrace.h header defines EVENT_TRACE_LOGFILE as an alias which
  * > automatically selects the ANSI or Unicode version of this function based on
  * > the definition of the UNICODE preprocessor constant. Mixing usage of the
  * > encoding-neutral alias with code that not encoding-neutral can lead to
  * > mismatches that result in compilation or runtime errors. For more information,
  * > see
  * > [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilea
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 * @charset ANSI
 */
class EVENT_TRACE_LOGFILEA extends Win32Struct
{
    static sizeof => 432

    static packingSize => 8

    /**
     * Name of the log file being processed, or **NULL** if processing data from a
     * real-time tracing session. Specify a value for this member if you are calling
     * **OpenTrace** to consume data from a log file.
     * 
     * When calling **OpenTrace**, if _LoggerName_ is non-**NULL** then _LogFileName_
     * must be **NULL**.
     * 
     * When calling **OpenTrace**, the user consuming the events must have permissions
     * to read the file.
     * 
     * > [!Note]
     * The filename provided to OpenTrace via the _LogFileName_ field must be
     * > the full file name, including any suffixes. Some trace file creation APIs can
     * > silently add a suffix to the user-specified filename. For example, if the
     * > controller logged events to a private session (the controller set the
     * > **LogFileMode** member of
     * > [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * > to **EVENT_TRACE_PRIVATE_LOGGER_MODE** when calling **StartTrace**), the
     * > generated ETL file will include a process ID suffix, e.g. `mytrace.etl_123`.
     * > This can also occur if the file was created using the
     * > **EVENT_TRACE_FILE_MODE_NEWFILE** mode, in which case the generated ETL file
     * > will include a sequence number.
     * @type {Pointer<PSTR>}
     */
    LogFileName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Name of the real-time event tracing session, or **NULL** if processing data from
     * a log file. Specify a value for this member if you are calling **OpenTrace** to
     * consume data from a real-time session.
     * 
     * When calling **OpenTrace**, if _LogFileName_ is non-**NULL** then _LoggerName_
     * must be **NULL**.
     * 
     * You can only consume events in real time if the trace controller has set the
     * **LogFileMode** member of
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * to include the **EVENT_TRACE_REAL_TIME_MODE** flag.
     * 
     * Only users with administrative privileges, users in the Performance Log Users
     * group, and applications running as LocalSystem, LocalService, NetworkService can
     * consume events in real time. To grant a restricted user the ability to consume
     * events in real time, add them to the Performance Log Users group or call
     * [EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
     * 
     * **Windows XP and Windows 2000:** Anyone can consume real time events.
     * @type {Pointer<PSTR>}
     */
    LoggerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * On output, the current time, in 100-nanosecond intervals since midnight, January
     * 1, 1601.
     * @type {Integer}
     */
    CurrentTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * On output, the number of buffers processed.
     * @type {Integer}
     */
    BuffersRead {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    LogFileMode {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    ProcessTraceMode {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * On output, an [EVENT_TRACE](/windows/win32/api/evntrace/ns-evntrace-event_trace)
     * structure that contains the last event processed.
     * @type {EVENT_TRACE}
     */
    CurrentEvent{
        get {
            if(!this.HasProp("__CurrentEvent"))
                this.__CurrentEvent := EVENT_TRACE(this.ptr + 32)
            return this.__CurrentEvent
        }
    }

    /**
     * On output, a
     * [TRACE_LOGFILE_HEADER](/windows/win32/api/evntrace/ns-evntrace-trace_logfile_header)
     * structure that contains general information about the session and the computer
     * on which the session ran.
     * @type {TRACE_LOGFILE_HEADER}
     */
    LogfileHeader{
        get {
            if(!this.HasProp("__LogfileHeader"))
                this.__LogfileHeader := TRACE_LOGFILE_HEADER(this.ptr + 104)
            return this.__LogfileHeader
        }
    }

    /**
     * Pointer to the
     * [BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka)
     * function that receives buffer-related statistics for each buffer ETW flushes.
     * ETW calls this callback after it delivers all the events in the buffer. This
     * callback is optional.
     * @type {Pointer<PEVENT_TRACE_BUFFER_CALLBACKA>}
     */
    BufferCallback {
        get => NumGet(this, 384, "ptr")
        set => NumPut("ptr", value, this, 384)
    }

    /**
     * On output, contains the size of each buffer, in bytes.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 392, "uint")
        set => NumPut("uint", value, this, 392)
    }

    /**
     * On output, contains the number of bytes in the buffer that contain valid
     * information.
     * @type {Integer}
     */
    Filled {
        get => NumGet(this, 396, "uint")
        set => NumPut("uint", value, this, 396)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    EventsLost {
        get => NumGet(this, 400, "uint")
        set => NumPut("uint", value, this, 400)
    }

    /**
     * @type {Pointer<PEVENT_CALLBACK>}
     */
    EventCallback {
        get => NumGet(this, 408, "ptr")
        set => NumPut("ptr", value, this, 408)
    }

    /**
     * @type {Pointer<PEVENT_RECORD_CALLBACK>}
     */
    EventRecordCallback {
        get => NumGet(this, 408, "ptr")
        set => NumPut("ptr", value, this, 408)
    }

    /**
     * On output, if this member is **TRUE**, the event tracing session is the NT
     * Kernel Logger. Otherwise, it is another event tracing session.
     * @type {Integer}
     */
    IsKernelTrace {
        get => NumGet(this, 416, "uint")
        set => NumPut("uint", value, this, 416)
    }

    /**
     * Context data that a consumer can specify when calling
     * [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea). If the consumer
     * uses
     * [EventRecordCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_record_callback)
     * to consume events, ETW sets the **UserContext** member of the
     * [EVENT_RECORD](/windows/desktop/api/evntcons/ns-evntcons-event_record) structure
     * to this value.
     * 
     * **Prior to Windows Vista:** Not supported.
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 424, "ptr")
        set => NumPut("ptr", value, this, 424)
    }
}

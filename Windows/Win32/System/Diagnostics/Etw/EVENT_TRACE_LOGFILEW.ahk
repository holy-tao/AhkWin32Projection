#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EVENT_TRACE_HEADER.ahk
#Include .\ETW_BUFFER_CONTEXT.ahk
#Include .\EVENT_TRACE.ahk
#Include ..\..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\Time\TIME_ZONE_INFORMATION.ahk
#Include .\TRACE_LOGFILE_HEADER.ahk

/**
 * The EVENT_TRACE_LOGFILE structure specifies how the consumer wants to read events (from a log file or in real-time) and the callbacks that will receive the events.
 * @remarks
 * 
  * Be sure to initialize the memory for this structure to zero before setting any members.
  * 
  * Consumers pass this structure to the 
  * <a href="https://docs.microsoft.com/windows/desktop/ETW/opentrace">OpenTrace</a> function. 
  * 
  * When ETW flushes a buffer, it passes the structure to the 
  * consumer's <a href="https://docs.microsoft.com/windows/desktop/ETW/buffercallback">BufferCallback</a> function.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The evntrace.h header defines EVENT_TRACE_LOGFILE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-event_trace_logfilew
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 * @charset Unicode
 */
class EVENT_TRACE_LOGFILEW extends Win32Struct
{
    static sizeof => 440

    static packingSize => 8

    /**
     * Name of the log file used by the event tracing session. Specify a value for this member if you are consuming from a log file. 
     * 
     * 
     * This member must be <b>NULL</b> if <b>LoggerName</b> is specified.
     * 
     * You must know the log file name the controller specified. If the controller logged events to a private session (the controller set the <b>LogFileMode</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> to  <b>EVENT_TRACE_PRIVATE_LOGGER_MODE</b>), the file name must include the process identifier that ETW appended to the log file name. For example, if the controller named the log file xyz.etl and the process identifier is 123, ETW uses xyz.etl_123 as the file name.
     * 
     * If the controller set the <b>LogFileMode</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> to  <b>EVENT_TRACE_FILE_MODE_NEWFILE</b>, the log file name must include the sequential serial number used to create each new log file.
     * 
     * The user consuming the events must have permissions to read the file.
     * @type {Pointer<Char>}
     */
    LogFileName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Name of the event tracing session. Specify a value for this member if you want to consume events in real time. This member must be <b>NULL</b> if <b>LogFileName</b> is specified.
     * 
     * You can only consume events in real  time if the controller set the <b>LogFileMode</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> to  <b>EVENT_TRACE_REAL_TIME_MODE</b>.
     * 
     * Only users with administrative privileges, users in the Performance Log Users group, and applications running as LocalSystem, LocalService, NetworkService can consume events in real time. To grant a restricted user the ability to consume events in real time, add them to the Performance Log Users group or call <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a>.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can consume real time events.
     * @type {Pointer<Char>}
     */
    LoggerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * On output, the current time, in 100-nanosecond intervals since midnight, January 1, 1601.
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
     * On output, an 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace">EVENT_TRACE</a> structure that contains the last event processed.
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
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-logfile-header">TRACE_LOGFILE_HEADER</a> structure that contains general information about the session and the computer on which the session ran.
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
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/buffercallback">BufferCallback</a> function that receives buffer-related statistics for each buffer ETW flushes. ETW calls this callback after it delivers all the events in the buffer. This callback is optional.
     * @type {Pointer<PEVENT_TRACE_BUFFER_CALLBACKW>}
     */
    BufferCallback {
        get => NumGet(this, 392, "ptr")
        set => NumPut("ptr", value, this, 392)
    }

    /**
     * On output, contains the size of each buffer, in bytes.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 400, "uint")
        set => NumPut("uint", value, this, 400)
    }

    /**
     * On output, contains the number of bytes in the buffer that contain valid information.
     * @type {Integer}
     */
    Filled {
        get => NumGet(this, 404, "uint")
        set => NumPut("uint", value, this, 404)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    EventsLost {
        get => NumGet(this, 408, "uint")
        set => NumPut("uint", value, this, 408)
    }

    /**
     * @type {Pointer<PEVENT_CALLBACK>}
     */
    EventCallback {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * @type {Pointer<PEVENT_RECORD_CALLBACK>}
     */
    EventRecordCallback {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * On output, if this member is <b>TRUE</b>, the event tracing session is the NT Kernel Logger. Otherwise, it is another event tracing session.
     * @type {Integer}
     */
    IsKernelTrace {
        get => NumGet(this, 424, "uint")
        set => NumPut("uint", value, this, 424)
    }

    /**
     * Context data that a consumer can specify when calling <a href="https://docs.microsoft.com/windows/desktop/ETW/opentrace">OpenTrace</a>. If the consumer uses <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> to consume events, ETW sets the <b>UserContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> structure to this value.
     * 
     * <b>Prior to Windows Vista:  </b>Not supported.
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 432, "ptr")
        set => NumPut("ptr", value, this, 432)
    }
}

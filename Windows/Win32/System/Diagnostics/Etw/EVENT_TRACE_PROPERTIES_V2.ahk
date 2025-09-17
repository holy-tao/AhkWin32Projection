#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WNODE_HEADER.ahk

/**
 * The EVENT_TRACE_PROPERTIES_V2 structure contains information about an event tracing session and is used with APIs such as StartTrace and ControlTrace.
 * @remarks
 * This structure behaves similarly to
  * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
  * with a few exceptions.
  * 
  * The beginning of the structure is defined exactly as
  * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
  * to allow this new structure to be compatible with systems running versions of
  * Windows before Windows 10, version 1703 and will be treated as
  * **EVENT_TRACE_PROPERTIES**.
  * 
  * When using this structure, be sure to include `WNODE_FLAG_VERSIONED_PROPERTIES`
  * in Wnode.Flags to indicate that this is the version-2 structure.
  * 
  * Note that the filters passed into
  * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) and
  * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracea) via this
  * structure have the same semantics as filters consumed by the
  * [EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2) function.
  * 
  * When you allocate the memory for this structure, you must allocate enough memory
  * to include the session name and log file name following the structure. The
  * session name must come before the log file name in memory. You must copy the log
  * file name to the offset but you do not copy the session name to the offset. The
  * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function
  * copies the name for you.
  * 
  * Be sure to initialize the memory for this structure to zero before setting any
  * members. For example:
  * 
  * ```C
  * typedef struct EventTracePropertyData2 {
  *     EVENT_TRACE_PROPERTIES_V2 Props;
  *     WCHAR LoggerName[128];
  *     WCHAR LogFileName[1024];
  * } EventTracePropertyData2;
  * 
  * EventTracePropertyData2 data = { 0 };
  * data.Props.Wnode.BufferSize = sizeof(data);
  * data.Props.Wnode.Flags = WNODE_FLAG_TRACED_GUID | WNODE_FLAG_VERSIONED_PROPERTIES;
  * data.Props.LogFileNameOffset = offsetof(EventTracePropertyData2, LogFileName);
  * data.Props.LoggerNameOffset = offsetof(EventTracePropertyData2, LoggerName);
  * ```
  * 
  * Events from providers are written to a session's buffers. When a buffer in a
  * file or real-time session is full (or when the FlushTimer expires), the session
  * flushes the buffer either by writing the events to a log file, delivering them
  * to a real-time consumer, or both. If a session's buffers are filled faster than
  * they can be flushed, new buffers are allocated and added to the session's buffer
  * pool, up to **MaximumBuffers**. Beyond this limit, the session discards incoming
  * events until a buffer becomes available. Each session keeps a record of the
  * number of events discarded (see the **EventsLost** member).
  * 
  * ETW does not free unused buffers.
  * 
  * **Windows 2000:** ETW frees unused buffers based on the **AgeLimit** member
  * value.
  * 
  * To view session statistics, such as **EventsLost** while the session is running,
  * call the [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracea)
  * function and set the _ControlCode_ parameter to `EVENT_TRACE_CONTROL_QUERY`.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-event_trace_properties_v2
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_TRACE_PROPERTIES_V2 extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * A [WNODE_HEADER](/windows/win32/etw/wnode-header) structure. You must specify
     * the **BufferSize**, **Flags**, and **Guid** members. You may optionally specify
     * the **ClientContext** member.
     * 
     * > [!Important]
     * > In order for the version-2 fields (e.g. **FilterDesc** and
     * > **V2Options**) to be recognized, you must set the
     * > `WNODE_FLAG_VERSIONED_PROPERTIES` flag in `Wnode.Flags`.
     * @type {WNODE_HEADER}
     */
    Wnode{
        get {
            if(!this.HasProp("__Wnode"))
                this.__Wnode := WNODE_HEADER(this.ptr + 0)
            return this.__Wnode
        }
    }

    /**
     * Kilobytes of memory allocated for each event tracing session buffer. The minimum
     * buffer size is 4 (4KB). The maximum buffer size is 16384 (16MB). Most trace
     * sessions should use a buffer size of 64KB or less to avoid wasting memory and
     * disk space. **Prior to Windows 8:** The maximum buffer size is 1024 (1MB).
     * 
     * Smaller buffer sizes reduce session memory usage. Larger buffer sizes (up to
     * 64KB) support collection of larger events -- ETW cannot collect events larger
     * than the buffer size and cannot collect events larger than 64KB regardless of
     * buffer size. In scenarios involving extremely high data throughput, larger
     * buffer sizes can reduce CPU overhead.
     * 
     * - A session with small events and a low event rate (a few KB/s) should use a
     *   small buffer size (4KB to 16KB).
     * - A session with small events and a moderate event rate should use a medium
     *   buffer size (16KB to 32KB).
     * - A session with large events or a high event rate (a few MB/s) should use a
     *   large buffer size (64KB to 128KB).
     * - In rare cases when a large amount of memory should be reserved for a
     *   diagnostic trace with hundreds of megabytes of data per second, a huge buffer
     *   size (256KB to 1024KB) can reduce CPU overhead.
     * 
     * ETW may adjust the requested **BufferSize** upwards in certain scenarios. For
     * example, when writing a trace file to a disk, ETW may increase the buffer size
     * to a multiple of the disk's physical block size.
     * 
     * > [!Important]
     * > **BufferSize** is one of the most important parameters for a
     * > trace session. Large buffers usually waste memory and disk space. Trace
     * > sessions with large buffers (256KB or larger) should be used only for
     * > diagnostic investigations or testing, not for production tracing.
     * 
     * > [!Tip]
     * > Do not use **BufferSize** to control the trace session's memory usage.
     * > Instead, select the buffer size based on your session's event size and event
     * > rate, then use the **MinimumBuffers** and **MaximumBuffers** parameters to
     * > adjust session memory usage.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Minimum number of buffers reserved for the tracing session's buffer pool.
     * 
     * ETW may adjust this value in certain scenarios.
     * 
     * - If the logging mode includes the `EVENT_TRACE_NO_PER_PROCESSOR_BUFFERING`
     *   flag, ETW will reserve at least 2 buffers.
     * - If the logging mode does not include the
     *   `EVENT_TRACE_NO_PER_PROCESSOR_BUFFERING` flag, ETW will reserve at least 2
     *   buffers for each logical processor.
     * - If this value is larger than an ETW-determined limit, ETW may reduce it to the
     *   limit to avoid excessive memory usage.
     * 
     * For file-mode and real-time traces with moderate event rates, most users should
     * minimize memory usage by setting **MinimumBuffers** to 0 or to a small minimum
     * (e.g. 4 or 8), allowing ETW to adjust the value upwards based on the number of
     * processors. ETW will reserve the (adjusted) minimum number of buffers when the
     * trace is started. If the buffers are filled more quickly than they can be
     * processed, ETW will allocate addition buffers, up the the number specified by
     * **MaximumBuffers**.
     * 
     * For buffering-mode (circular in-memory) traces, users should set the
     * **MinimumBuffers** parameter according to the total amount of memory that you
     * want ETW to reserve for the session. This is usually calculated based on the
     * expected event rate and the amount of time you want the trace to cover. For
     * example, if you expect a data rate of 16KB per second and you want your trace to
     * record at least 60 seconds of data, you would need 960KB. Assuming a buffer size
     * of 32KB, you would set **MinimumBuffers** to 30 (960KB total / 32KB per buffer =
     * 30 buffers). ETW will reserve the (adjusted) minimum number of buffers when the
     * trace is started. When all buffers are filled, ETW will reuse the oldest filled
     * buffer for new events. Note that ETW will not allocate additional buffers (ETW
     * ignores **MaximumBuffers** for buffering-mode traces).
     * @type {Integer}
     */
    MinimumBuffers {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Maximum number of buffers to be allocated for the tracing session's buffer pool.
     * 
     * ETW may adjust this value in certain scenarios.
     * 
     * - If this value is less than the adjusted value of **MinimumBuffers**, ETW may
     *   increase it to a suitable value equal to or larger than **MinimumBuffers**.
     * - If this value is larger than an ETW-determined limit, ETW may reduce it to the
     *   limit.
     * 
     * Most users should start tuning their session by setting **MinimumBuffers** and
     * **MaximumBuffers** to the same value. You might then increase the value of
     * **MaximumBuffers** if the trace drops events during event rate peaks.
     * 
     * > [!Note]
     * > ETW ignores this field for buffering-mode sessions (sessions that
     * > include logging mode `EVENT_TRACE_BUFFERING_MODE`). Buffering-mode sessions
     * > always allocate **MinimumBuffers** at the start of the trace collection and
     * > never allocate additional buffers.
     * @type {Integer}
     */
    MaximumBuffers {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Maximum size of the file used to log events, in megabytes, or zero for no size
     * limit. Typically, you use this member to limit the size of a circular log file
     * when you set **LogFileMode** to `EVENT_TRACE_FILE_MODE_CIRCULAR`. This member
     * must be set to a nonzero value if **LogFileMode** contains
     * `EVENT_TRACE_FILE_MODE_PREALLOCATE`, `EVENT_TRACE_FILE_MODE_CIRCULAR` or
     * `EVENT_TRACE_FILE_MODE_NEWFILE`.
     * 
     * If you are using the system drive (the drive that contains the operating system)
     * for logging, ETW checks for an additional 200MB of disk space, regardless of
     * whether you are using the maximum file size parameter. Therefore, if you specify
     * 100MB as the maximum file size for the trace file in the system drive, you need
     * to have 300MB of free space on the drive.
     * @type {Integer}
     */
    MaximumFileSize {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Logging flags for the event tracing session. You use this member to specify
     * whether you want events written to an in-memory circular buffer, a log file, or
     * a real-time consumer. You can also use this member to specify other session
     * characteristics, e.g. that the session is a private logger session. For a list
     * of possible flags, see
     * [Logging Mode Constants](/windows/win32/etw/logging-mode-constants).
     * 
     * Do not specify real-time logging unless a real-time consumer is ready to consume
     * the events. ETW buffers events for real-time sessions when there are no
     * real-time consumers. for the session. A real-time session with no consumers will
     * waste system resources. Note that this buffering is limited. If the limit is
     * reached, new events will be ignored and the logging functions fail with
     * `STATUS_LOG_FILE_FULL`. **Prior to Windows Vista:** If there is no real-time
     * consumer, events are discarded and logging continues.
     * 
     * If a consumer begins processing real-time events, the events in the playback
     * file are consumed first. After all events in the playback file are consumed, the
     * session will begin reporting new events.
     * @type {Integer}
     */
    LogFileMode {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * How often, in seconds, any non-empty trace buffer are flushed.
     * 
     * - For file-mode sessions, the minimum flush time is 1 second. Setting
     *   **FlushTimer** to 0 will disable time-based flushes (flush will occur when the
     *   buffer is filled, when the session is stopped, or when the session is
     *   explicitly flushed). Most file-mode traces should set **FlushTimer** to 0 to
     *   avoid wasted space in the trace file. You might want to set the timer to a
     *   non-zero value if there is a chance the trace might not be closed (e.g. if you
     *   want to be sure to get events even if the system crashes).
     * - For real-time sessions, the minimum flush time is 1 second. If **FlushTimer**
     *   is set to 0, a default timeout of 1 second will be used. Real-time sessions
     *   should set the flush timer based on how quickly the data needs to be received.
     *   Note that a higher timer value will reduce CPU overhead for the trace. Most
     *   real-time traces should start with a timer of 5 or 10 seconds and tune the
     *   timer based on need.
     * - For buffered (circular in-memory) sessions, **FlushTimer** is not used. The
     *   trace data will only be flushed on-demand (i.e. flushed to a file via
     *   [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracea)).
     * @type {Integer}
     */
    FlushTimer {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * A _system_ logger session may set **EnableFlags** to indicate which
     * SystemTraceProvider events should be included in the trace.
     * 
     * > [!Note]
     * > **EnableFlags** is only valid for system loggers, i.e. trace sessions
     * > that are started using the `EVENT_TRACE_SYSTEM_LOGGER_MODE` logger mode flag,
     * > the `KERNEL_LOGGER_NAME` session name, the `SystemTraceControlGuid` session
     * > GUID, or the `GlobalLoggerGuid` session GUID.
     * @type {Integer}
     */
    EnableFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    AgeLimit {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    FlushThreshold {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * On output, the number of buffers allocated for the event tracing session's
     * buffer pool.
     * @type {Integer}
     */
    NumberOfBuffers {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * On output, the number of buffers that are allocated but unused in the event
     * tracing session's buffer pool.
     * @type {Integer}
     */
    FreeBuffers {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * On output, the number of events that were not recorded.
     * @type {Integer}
     */
    EventsLost {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * On output, the number of buffers written.
     * @type {Integer}
     */
    BuffersWritten {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * On output, the number of buffers that could not be written to the log file.
     * @type {Integer}
     */
    LogBuffersLost {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * On output, the number of buffers that could not be delivered in real-time to the
     * consumer.
     * @type {Integer}
     */
    RealTimeBuffersLost {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * On output, the thread identifier for the event tracing session.
     * @type {Pointer<Void>}
     */
    LoggerThreadId {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Offset (in bytes) from the start of this structure's allocated memory to
     * beginning of the nul-terminated string that contains the log file name.
     * 
     * The file name normally has an `.etl` extension. All folders in the path must
     * already exist (ETW will not create folders for you). The path can be relative,
     * absolute, local, or remote. Environment variables in the path will not be
     * expanded. The user must have permission to write to the folder.
     * 
     * The log file name is limited to 1,024 characters. If you set **LogFileMode** to
     * **EVENT_TRACE_PRIVATE_LOGGER_MODE** or **EVENT_TRACE_FILE_MODE_NEWFILE**, be
     * sure to reserve enough memory to include the process identifier that will be
     * appended to the file name for private loggers sessions and the sequential number
     * that is added to log files created using the new file log mode.
     * 
     * If you do not want to log events to a log file (for example, if you specify
     * **EVENT_TRACE_REAL_TIME_MODE** only), set **LogFileNameOffset** to 0. If you
     * specify only real-time logging and also provide an offset with a valid log file
     * name, ETW will use the log file name to create a sequential log file and log
     * events to the log file in addition to sending the events to real-time consumers.
     * ETW also creates the sequential log file if **LogFileMode** is 0 and you provide
     * an offset with a valid log file name.
     * 
     * If you want to log events to a log file, you must reserve enough memory for this
     * structure to include the log file name and session name following the structure.
     * The log file name must follow the session name in memory. See remarks for an
     * example.
     * 
     * Trace files are created using the default security descriptor, meaning that the
     * log file will have the same ACL as the parent directory. If you want access to
     * the files restricted, create a parent directory with the appropriate ACLs.
     * @type {Integer}
     */
    LogFileNameOffset {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Offset (in bytes) from the start of the structure's allocated memory to the
     * beginning of the nul-terminated string that contains the session name.
     * 
     * > [!Important]
     * > Use a descriptive name for your session so that the session's
     * > ownership and usage can be determined from the session name. Do not use a GUID
     * > or other non-descriptive value. Do not append random digits to make your
     * > session name unique. ETW sessions are a limited resource so your component
     * > should not be starting multiple sessions. If your component's session is
     * > already running when your component starts, your component should clean up the
     * > orphaned session rather than creating a second session.
     * 
     * The session name is limited to 1,024 characters. The session name is
     * case-insensitive. The system will not start a new session if another session
     * with the same name is already running.
     * 
     * **Windows 2000:** Session names are case-sensitive. As a result, sessions with
     * names differing only in case are allowed. However, to reduce confusion, you
     * should make sure your session names are unique.
     * @type {Integer}
     */
    LoggerNameOffset {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    V2Control {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The number of filters that the **FilterDesc** points to. This should be zero
     * unless configuring a system-wide private logger.
     * @type {Integer}
     */
    FilterDescCount {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Supported
     * [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor)
     * filter types for system-wide private loggers:
     * **EVENT_FILTER_TYPE_EXECUTABLE_NAME** and **EVENT_FILTER_TYPE_PID**
     * 
     * A pointer to an array of
     * [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor)
     * structures that points to the filter data. The number of elements in the array
     * is specified in the **FilterDescCount** member. There can only be one filter for
     * a specific filter type as specified by the **Type** member of the
     * **EVENT_FILTER_DESCRIPTOR** structure.
     * 
     * This should be NULL unless configuring a system-wide private logger.
     * @type {Pointer<EVENT_FILTER_DESCRIPTOR>}
     */
    FilterDesc {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    V2Options {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }
}

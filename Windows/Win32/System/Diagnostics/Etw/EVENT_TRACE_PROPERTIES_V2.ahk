#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\WNODE_HEADER.ahk

/**
 * The EVENT_TRACE_PROPERTIES_V2 structure contains information about an event tracing session.
 * @remarks
 * 
 * This structure behaves similarly to <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> with a few exceptions.
 * 
 * The beginning of the structure is defined exactly as <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> to allow this new structure to be compatible with systems running versions of Windows before Windows 10, version 1703 and will be treated as <b>EVENT_TRACE_PROPERTIES</b>.
 * 
 * When using this structure, be sure to include WNODE_FLAG_VERSIONED_PROPERTIES in Wnode.Flags to indicate that this is the version two structure.
 * 
 * Note that the filters  passed into <a href="https://docs.microsoft.com/windows/desktop/ETW/controltrace">ControlTrace</a>, <a href="https://docs.microsoft.com/windows/desktop/ETW/querytrace">QueryTrace</a>, <a href="https://docs.microsoft.com/windows/desktop/ETW/starttrace">StartTrace</a>, and <a href="https://docs.microsoft.com/windows/desktop/ETW/stoptrace">StopTrace</a> by this structure are the same format as filters consumed by the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-event_trace_properties_v2
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_TRACE_PROPERTIES_V2 extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/wnode-header">WNODE_HEADER</a> structure. You must specify the <b>BufferSize</b>, <b>Flags</b>, and <b>Guid</b> members, and optionally the  <b>ClientContext</b> member.
     * @type {WNODE_HEADER}
     */
    Wnode{
        get {
            if(!this.HasProp("__Wnode"))
                this.__Wnode := WNODE_HEADER(0, this)
            return this.__Wnode
        }
    }

    /**
     * Amount of memory allocated for each event tracing session buffer, in kilobytes. The maximum buffer size is 1 MB. ETW uses the size of physical memory to calculate this value. For more information, see Remarks.
     * 
     * If an application expects a relatively low event rate, the buffer size should be set to the memory page size. If the event rate is expected to be relatively high, the application should specify a larger buffer size, and should increase the maximum number of buffers. 
     * 
     * The buffer size affects the rate at which buffers fill and must be flushed. Although a small buffer size requires less memory, it increases the rate at which buffers must be flushed.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Minimum number of buffers allocated for the event tracing session's buffer pool. The minimum number of buffers that you can specify is two buffers per processor. For example, on a single processor computer, the minimum number of buffers is two. Note that if you use the EVENT_TRACE_NO_PER_PROCESSOR_BUFFERING logging mode, the number of processors is assumed to be 1.
     * @type {Integer}
     */
    MinimumBuffers {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Maximum number of buffers allocated for the event tracing session's buffer pool. Typically, this value is the minimum number of buffers plus twenty. ETW uses the buffer size and the size of physical memory to calculate this value. This value must be greater than or equal to the value for <b>MinimumBuffers</b>. Note that  you do not need to set this value if <b>LogFileMode</b> contains <b>EVENT_TRACE_BUFFERING_MODE</b>; instead, the total memory buffer size is instead the product of  <b>MinimumBuffers</b> and <b>BufferSize</b>.
     * @type {Integer}
     */
    MaximumBuffers {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Maximum size of the file used to log events, in megabytes. Typically, you use this member to limit the size of a circular log file when you set <b>LogFileMode</b> to <b>EVENT_TRACE_FILE_MODE_CIRCULAR</b>. This member must be specified if <b>LogFileMode</b> contains <b>EVENT_TRACE_FILE_MODE_PREALLOCATE</b>, <b>EVENT_TRACE_FILE_MODE_CIRCULAR</b> or <b>EVENT_TRACE_FILE_MODE_NEWFILE</b>
     * 
     * If you are using the system drive (the drive that contains the operating system) for logging, ETW checks for an additional 200MB of disk space, regardless of whether you are using the maximum file size parameter. Therefore, if you specify 100MB as the maximum file size for the trace file in the system drive, you need to have 300MB of free space on the drive.
     * @type {Integer}
     */
    MaximumFileSize {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Logging modes for the event tracing session. You use this member to specify that you want events written to a log file, a real-time consumer, or both. You can also use this member to specify that the session is a private logger session. You can specify one or more modes. For a list of possible modes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/logging-mode-constants">Logging Mode Constants</a>.
     * 
     * Do not specify real-time logging unless there are real-time consumers ready to consume the events. If there are no real-time consumers, ETW writes the events to a playback file. However, the size of the playback file is limited. If the limit is reached, no new events are logged (to the log file or playback file) and the logging functions fail with STATUS_LOG_FILE_FULL.<b>Prior to Windows Vista:  </b>If there was no real-time consumer, the events were discarded and logging continues.</p>If a consumer begins processing real-time events, the events in the playback file are consumed first. After all events in the playback file are consumed, the session will begin logging new events.
     * @type {Integer}
     */
    LogFileMode {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * How often, in seconds, the trace buffers are forcibly flushed. The minimum flush time is 1 second.
     * This forced flush is in addition to the automatic flush that occurs whenever a buffer is full and when the trace session stops.
     * 
     * 
     * 
     * If zero, ETW flushes buffers as soon as they become full. If nonzero, ETW flushes all buffers that contain events based on the timer value. Typically, you want to flush buffers only when they become full. Forcing the buffers to flush (either by setting this member to a nonzero value or by calling <a href="https://docs.microsoft.com/windows/desktop/ETW/flushtrace">FlushTrace</a>) can increase the file size of the log file with unfilled buffer space. 
     * 
     * If the consumer is consuming events in real time, you may want to set this member to a nonzero value if the event rate is low to force events to be delivered before the buffer is full.
     * 
     * For the case of a realtime logger,  a value of zero (the default value) means that the flush time will be set to 1 second. A realtime logger is when <b>LogFileMode</b> is set to <b>EVENT_TRACE_REAL_TIME_MODE</b>.
     * @type {Integer}
     */
    FlushTimer {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * A system logger must set <b>EnableFlags</b> to indicate which SystemTraceProvider events should be included in the trace. This is also used for NT Kernel Logger sessions.
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
     * On output, the number of buffers allocated for the event tracing session's buffer pool.
     * @type {Integer}
     */
    NumberOfBuffers {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * On output, the number of buffers that are allocated but unused in the event tracing session's buffer pool.
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
     * On output, the number of buffers that could not be delivered in real-time to the consumer.
     * @type {Integer}
     */
    RealTimeBuffersLost {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * On output, the thread identifier for the event tracing session.
     * @type {HANDLE}
     */
    LoggerThreadId{
        get {
            if(!this.HasProp("__LoggerThreadId"))
                this.__LoggerThreadId := HANDLE(96, this)
            return this.__LoggerThreadId
        }
    }

    /**
     * Offset from the start of the structure's allocated memory to beginning of the null-terminated string that contains the log file name. 
     * 
     * The file name should use the .etl extension. All folders in the path must exist. The path can be relative, absolute, local, or remote. The path cannot contain environment variables (they are not expanded). The user must have permission to write to the folder.
     * 
     * The log file name is limited to 1,024 characters. If you set <b>LogFileMode</b> to  <b>EVENT_TRACE_PRIVATE_LOGGER_MODE</b> or <b>EVENT_TRACE_FILE_MODE_NEWFILE</b>, be sure to allocate enough memory to include the process identifier that is appended to the file name for private loggers sessions, and the sequential number that is added to log files created using the new file log mode. 
     * 						
     * 					
     * 
     * If you do not want to log events to a log file (for example, you specify <b>EVENT_TRACE_REAL_TIME_MODE</b> only), set <i>LogFileNameOffset</i> to 0. If you specify only real-time logging and also provide an offset with a valid log file name, ETW will use the log file name to create a sequential log file and log events to the log file. ETW also creates the sequential log file if <b>LogFileMode</b> is 0 and you provide an offset with a valid log file name.
     * 
     * If you want to log events to a log file, you must allocate enough memory for this structure to include the log file name and session name following the structure. The log file name must follow the session name in memory.
     * 
     * Trace files are created using the default security descriptor, meaning that the log file will have the same ACL as the parent directory. If you want access to the files restricted, create a parent directory with the appropriate ACLs.
     * @type {Integer}
     */
    LogFileNameOffset {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Offset from the start of the structure's allocated memory to beginning of the null-terminated string that contains the session name. 
     * 
     * The session name is limited to 1,024 characters. The session name is case-insensitive and must be unique.
     * 
     * <b>Windows 2000:  </b>Session names are case-sensitive. As a result, duplicate session names are allowed. However, to reduce confusion, you should make sure your session names are unique.
     * 
     * When you allocate the memory for this structure, you must allocate enough memory to include the session name and log file name following the structure. The session name must come before the log file name in memory. You must copy the log file name to the offset but you do not copy the session name to the offset—the <a href="https://docs.microsoft.com/windows/desktop/ETW/starttrace">StartTrace</a> function copies the name for you.
     * @type {Integer}
     */
    LoggerNameOffset {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * This bitfield backs the following members:
     * - VersionNumber
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    VersionNumber {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    V2Control {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The number of filters that the <b>FilterDesc</b> points to. The only time this should not be zero is for system wide Private Loggers.
     * @type {Integer}
     */
    FilterDescCount {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Supported <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> filter types for system wide private loggers: <b>EVENT_FILTER_TYPE_EXECUTABLE_NAME</b> and <b>EVENT_FILTER_TYPE_PID</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structures that points to the filter data. The number of elements in the array is specified in the <b>FilterDescCount</b> member. There can only be one filter for a specific filter type as specified by the <b>Type</b> member of the <b>EVENT_FILTER_DESCRIPTOR</b> structure. 
     * 
     * This is only applicable to Private Loggers. The only time this should not be null is when it is used for system wide Private Loggers.
     * @type {Pointer<EVENT_FILTER_DESCRIPTOR>}
     */
    FilterDesc {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * This bitfield backs the following members:
     * - Wow
     * - QpcDeltaTracking
     * - LargeMdlPages
     * - ExcludeKernelStack
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    Wow {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    QpcDeltaTracking {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    LargeMdlPages {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ExcludeKernelStack {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    V2Options {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }
}

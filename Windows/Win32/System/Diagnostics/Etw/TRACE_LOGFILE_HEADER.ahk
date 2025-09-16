#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\Time\TIME_ZONE_INFORMATION.ahk

/**
 * The TRACE_LOGFILE_HEADER structure contains information about an event tracing session and its events.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
  * members.
  * 
  * The first event from any log file contains the data defined in this structure.
  * You can use this structure to access the event data or you can use the
  * [EventTrace_Header](/windows/desktop/ETW/eventtrace-header) MOF class to decode
  * the event data. Using this structure to read the event data may return
  * unexpected results if the consumer is on a different computer from the one that
  * generated the log file or the log file was written in a WOW (32-bit) session on
  * a 64-bit computer. This is because the **LoggerName** and **LogFileName**
  * members are pointers and can vary in size depending on the **PointerSize**
  * member.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_logfile_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_LOGFILE_HEADER extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * Size of the event tracing session's buffers, in bytes.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    SubVersion {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    SubMinorVersion {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * Build number of the operating system where the trace was collected.
     * @type {Integer}
     */
    ProviderVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of processors on the system where the trace was collected.
     * @type {Integer}
     */
    NumberOfProcessors {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Time at which the event tracing session stopped, in 100-nanosecond intervals
     * since midnight, January 1, 1601. This value may be 0 if you are consuming events
     * in real time or from a log file that was not finalized (i.e. was not properly
     * closed).
     * @type {Integer}
     */
    EndTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Resolution of the hardware timer, in units of 100 nanoseconds. For usage, see
     * the Remarks for [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header).
     * @type {Integer}
     */
    TimerResolution {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Maximum size of the log file, in megabytes.
     * @type {Integer}
     */
    MaximumFileSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Logging mode for the event tracing session. For a list of values, see
     * [Logging Mode Constants](/windows/desktop/ETW/logging-mode-constants).
     * @type {Integer}
     */
    LogFileMode {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Total number of buffers written by the event tracing session.
     * @type {Integer}
     */
    BuffersWritten {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LogInstanceGuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    StartBuffers {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    PointerSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    EventsLost {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    CpuSpeedInMHz {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Do not use this field.
     * 
     * The name of the event tracing session is the first null-terminated string
     * following this structure in memory.
     * @type {Pointer<PWSTR>}
     */
    LoggerName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Do not use this field.
     * 
     * The name of the event tracing log file is the second null-terminated string
     * following this structure in memory. The first string is the name of the session.
     * @type {Pointer<PWSTR>}
     */
    LogFileName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A
     * [TIME_ZONE_INFORMATION](/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information)
     * structure that contains the time zone for the **BootTime**, **EndTime** and
     * **StartTime** members.
     * @type {TIME_ZONE_INFORMATION}
     */
    TimeZone{
        get {
            if(!this.HasProp("__TimeZone"))
                this.__TimeZone := TIME_ZONE_INFORMATION(this.ptr + 64)
            return this.__TimeZone
        }
    }

    /**
     * Time at which the system was started, in 100-nanosecond intervals since
     * midnight, January 1, 1601. **BootTime** is supported only for traces written to
     * the Global Logger session.
     * @type {Integer}
     */
    BootTime {
        get => NumGet(this, 248, "int64")
        set => NumPut("int64", value, this, 248)
    }

    /**
     * Frequency of the high-resolution performance counter, if one exists.
     * @type {Integer}
     */
    PerfFreq {
        get => NumGet(this, 256, "int64")
        set => NumPut("int64", value, this, 256)
    }

    /**
     * Time at which the event tracing session started, in 100-nanosecond intervals
     * since midnight, January 1, 1601.
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 264, "int64")
        set => NumPut("int64", value, this, 264)
    }

    /**
     * Specifies the clock type. For details, see the **ClientContext** member of
     * [WNODE_HEADER](/windows/win32/etw/wnode-header).
     * @type {Integer}
     */
    ReservedFlags {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * Total number of buffers lost during the event tracing session.
     * @type {Integer}
     */
    BuffersLost {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Time\TIME_ZONE_INFORMATION.ahk" { TIME_ZONE_INFORMATION }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

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
 */
export default struct TRACE_LOGFILE_HEADER {
    #StructPack 8


    struct _VersionDetail {
        MajorVersion : Int8

        MinorVersion : Int8

        SubVersion : Int8

        SubMinorVersion : Int8

    }

    /**
     * Size of the event tracing session's buffers, in bytes.
     */
    BufferSize : UInt32

    Version : UInt32

    /**
     * Build number of the operating system where the trace was collected.
     */
    ProviderVersion : UInt32

    /**
     * Number of processors on the system where the trace was collected.
     */
    NumberOfProcessors : UInt32

    /**
     * Time at which the event tracing session stopped, in 100-nanosecond intervals
     * since midnight, January 1, 1601. This value may be 0 if you are consuming events
     * in real time or from a log file that was not finalized (i.e. was not properly
     * closed).
     */
    EndTime : Int64

    /**
     * Resolution of the hardware timer, in units of 100 nanoseconds. For usage, see
     * the Remarks for [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header).
     */
    TimerResolution : UInt32

    /**
     * Maximum size of the log file, in megabytes.
     */
    MaximumFileSize : UInt32

    /**
     * Logging mode for the event tracing session. For a list of values, see
     * [Logging Mode Constants](/windows/desktop/ETW/logging-mode-constants).
     */
    LogFileMode : UInt32

    /**
     * Total number of buffers written by the event tracing session.
     */
    BuffersWritten : UInt32

    LogInstanceGuid : Guid

    /**
     * Do not use this field.
     * 
     * The name of the event tracing session is the first null-terminated string
     * following this structure in memory.
     */
    LoggerName : PWSTR

    /**
     * Do not use this field.
     * 
     * The name of the event tracing log file is the second null-terminated string
     * following this structure in memory. The first string is the name of the session.
     */
    LogFileName : PWSTR

    /**
     * A
     * [TIME_ZONE_INFORMATION](/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information)
     * structure that contains the time zone for the **BootTime**, **EndTime** and
     * **StartTime** members.
     */
    TimeZone : TIME_ZONE_INFORMATION

    /**
     * Time at which the system was started, in 100-nanosecond intervals since
     * midnight, January 1, 1601. **BootTime** is supported only for traces written to
     * the Global Logger session.
     */
    BootTime : Int64

    /**
     * Frequency of the high-resolution performance counter, if one exists.
     */
    PerfFreq : Int64

    /**
     * Time at which the event tracing session started, in 100-nanosecond intervals
     * since midnight, January 1, 1601.
     */
    StartTime : Int64

    /**
     * Specifies the clock type. For details, see the **ClientContext** member of
     * [WNODE_HEADER](/windows/win32/etw/wnode-header).
     */
    ReservedFlags : UInt32

    /**
     * Total number of buffers lost during the event tracing session.
     */
    BuffersLost : UInt32

    static __New() {
        DefineProp(this.Prototype, 'VersionDetail', { type: TRACE_LOGFILE_HEADER._VersionDetail, offset: 4 })
        DefineProp(this.Prototype, 'StartBuffers', { type: UInt32, offset: 40 })
        DefineProp(this.Prototype, 'PointerSize', { type: UInt32, offset: 44 })
        DefineProp(this.Prototype, 'EventsLost', { type: UInt32, offset: 48 })
        DefineProp(this.Prototype, 'CpuSpeedInMHz', { type: UInt32, offset: 52 })
        this.DeleteProp("__New")
    }
}

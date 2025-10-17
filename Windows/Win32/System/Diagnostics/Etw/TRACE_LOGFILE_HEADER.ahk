#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\Time\TIME_ZONE_INFORMATION.ahk

/**
 * The TRACE_LOGFILE_HEADER structure contains information about an event tracing session and its events.
 * @remarks
 * 
  * Be sure to initialize the memory for this structure to zero before setting any members.
  * 
  * The first event from any log file contains the data defined in this structure. You can use this structure to access the  event data or you can use the <a href="https://docs.microsoft.com/windows/desktop/ETW/eventtrace-header">EventTrace_Header</a> MOF class to decode the event data. Using this structure to read the event data may return unexpected results if the consumer is on a different computer from the one that generated the log file or the log file was written in a WOW (32-bit) session on a 64-bit computer. This is because the <b>LoggerName</b> and <b>LogFileName</b> members are pointers and can vary in size depending on the <b>PointerSize</b> member.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-trace_logfile_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_LOGFILE_HEADER extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * Size of the event tracing session's buffers, in bytes.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _VersionDetail extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        MajorVersion {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MinorVersion {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        SubVersion {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        SubMinorVersion {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_VersionDetail}
     */
    VersionDetail{
        get {
            if(!this.HasProp("__VersionDetail"))
                this.__VersionDetail := %this.__Class%._VersionDetail(4, this)
            return this.__VersionDetail
        }
    }

    /**
     * Build number of the operating system.
     * @type {Integer}
     */
    ProviderVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of processors on the system.
     * @type {Integer}
     */
    NumberOfProcessors {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Time at which the event tracing session stopped, in 100-nanosecond intervals since midnight, January 1, 1601. This value may be 0 if you are consuming events in real time or from a log file to which the provide is still logging events.
     * @type {Integer}
     */
    EndTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Resolution of the hardware timer, in units of 100 nanoseconds. For usage, see the Remarks for <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a>.
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
     * Current logging mode for the event tracing session. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/logging-mode-constants">Logging Mode Constants</a>.
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
     * Do not use.
     * 
     * The name of the event tracing session is the first null-terminated string following this structure in memory.
     * @type {PWSTR}
     */
    LoggerName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Do Not use.
     * 
     * The name of the event tracing log file is the second null-terminated string following this structure in memory. The first string is the name of the session.
     * @type {PWSTR}
     */
    LogFileName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a> structure that contains the time zone for the <b>BootTime</b>, <b>EndTime</b> and <b>StartTime</b> members.
     * @type {TIME_ZONE_INFORMATION}
     */
    TimeZone{
        get {
            if(!this.HasProp("__TimeZone"))
                this.__TimeZone := TIME_ZONE_INFORMATION(72, this)
            return this.__TimeZone
        }
    }

    /**
     * Time at which the system was started, in 100-nanosecond intervals since midnight, January 1, 1601. <b>BootTime</b> is  supported only for traces written to the Global Logger session.
     * @type {Integer}
     */
    BootTime {
        get => NumGet(this, 256, "int64")
        set => NumPut("int64", value, this, 256)
    }

    /**
     * Frequency of the high-resolution performance counter, if one exists.
     * @type {Integer}
     */
    PerfFreq {
        get => NumGet(this, 264, "int64")
        set => NumPut("int64", value, this, 264)
    }

    /**
     * Time at which the event tracing session started, in 100-nanosecond intervals since midnight, January 1, 1601.
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 272, "int64")
        set => NumPut("int64", value, this, 272)
    }

    /**
     * Specifies the clock type. For details, see the <b>ClientContext</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/wnode-header">WNODE_HEADER</a>.
     * @type {Integer}
     */
    ReservedFlags {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * Total number of buffers lost during the event tracing session.
     * @type {Integer}
     */
    BuffersLost {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }
}

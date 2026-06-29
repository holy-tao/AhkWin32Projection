#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Time\TIME_ZONE_INFORMATION.ahk" { TIME_ZONE_INFORMATION }
#Import "..\..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_LOGFILE_HEADER64 {
    #StructPack 8


    struct _VersionDetail {
        MajorVersion : Int8

        MinorVersion : Int8

        SubVersion : Int8

        SubMinorVersion : Int8

    }

    BufferSize : UInt32

    Version : UInt32

    ProviderVersion : UInt32

    NumberOfProcessors : UInt32

    EndTime : Int64

    TimerResolution : UInt32

    MaximumFileSize : UInt32

    LogFileMode : UInt32

    BuffersWritten : UInt32

    LogInstanceGuid : Guid

    LoggerName : Int64

    LogFileName : Int64

    TimeZone : TIME_ZONE_INFORMATION

    BootTime : Int64

    PerfFreq : Int64

    StartTime : Int64

    ReservedFlags : UInt32

    BuffersLost : UInt32

    static __New() {
        DefineProp(this.Prototype, 'VersionDetail', { type: TRACE_LOGFILE_HEADER64._VersionDetail, offset: 4 })
        DefineProp(this.Prototype, 'StartBuffers', { type: UInt32, offset: 40 })
        DefineProp(this.Prototype, 'PointerSize', { type: UInt32, offset: 44 })
        DefineProp(this.Prototype, 'EventsLost', { type: UInt32, offset: 48 })
        DefineProp(this.Prototype, 'CpuSpeedInMHz', { type: UInt32, offset: 52 })
        this.DeleteProp("__New")
    }
}

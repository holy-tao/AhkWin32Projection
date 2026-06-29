#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Time\TIME_ZONE_INFORMATION.ahk" { TIME_ZONE_INFORMATION }
#Import "..\..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_MISC_INFO_3 {
    #StructPack 4

    SizeOfInfo : UInt32

    Flags1 : UInt32

    ProcessId : UInt32

    ProcessCreateTime : UInt32

    ProcessUserTime : UInt32

    ProcessKernelTime : UInt32

    ProcessorMaxMhz : UInt32

    ProcessorCurrentMhz : UInt32

    ProcessorMhzLimit : UInt32

    ProcessorMaxIdleState : UInt32

    ProcessorCurrentIdleState : UInt32

    ProcessIntegrityLevel : UInt32

    ProcessExecuteFlags : UInt32

    ProtectedProcess : UInt32

    TimeZoneId : UInt32

    TimeZone : TIME_ZONE_INFORMATION

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Time\TIME_ZONE_INFORMATION.ahk" { TIME_ZONE_INFORMATION }
#Import "..\..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\XSTATE_CONFIG_FEATURE_MSC_INFO.ahk" { XSTATE_CONFIG_FEATURE_MSC_INFO }
#Import ".\XSTATE_FEATURE.ahk" { XSTATE_FEATURE }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_MISC_INFO_5 {
    #StructPack 8

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

    BuildString : WCHAR[260]

    DbgBldStr : WCHAR[40]

    XStateData : XSTATE_CONFIG_FEATURE_MSC_INFO

    ProcessCookie : UInt32

}

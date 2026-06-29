#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SERVERSILO_DIAGNOSTIC_INFORMATION {
    #StructPack 4

    ReportId : Guid

    ExitStatus : UInt32

    CriticalProcessName : WCHAR[15]

}

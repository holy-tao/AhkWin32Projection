#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EVENTLOGRECORD.ahk" { EVENTLOGRECORD }
#Import ".\REPORT_EVENT_TYPE.ahk" { REPORT_EVENT_TYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.EventLog
 * @deprecated struct EVENTSFORLOGFILE is deprecated and might not work on all platforms. For more info, see MSDN.
 */
export default struct EVENTSFORLOGFILE {
    #StructPack 4

    ulSize : UInt32

    szLogicalLogFile : WCHAR[256]

    ulNumRecords : UInt32

    pEventLogRecords : EVENTLOGRECORD[1]

}

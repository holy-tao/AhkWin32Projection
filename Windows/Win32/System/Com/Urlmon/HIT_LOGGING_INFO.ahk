#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct HIT_LOGGING_INFO {
    #StructPack 8

    dwStructSize : UInt32

    lpszLoggedUrlName : PSTR

    StartTime : SYSTEMTIME

    EndTime : SYSTEMTIME

    lpszExtendedInfo : PSTR

}

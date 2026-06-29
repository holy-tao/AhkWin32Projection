#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APPSTATISTICS.ahk" { APPSTATISTICS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct APPDATA {
    #StructPack 4

    m_idApp : UInt32

    m_szAppGuid : WCHAR[40]

    m_dwAppProcessId : UInt32

    m_AppStatistics : APPSTATISTICS

}

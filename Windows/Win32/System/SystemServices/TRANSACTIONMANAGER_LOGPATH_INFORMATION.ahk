#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTIONMANAGER_LOGPATH_INFORMATION {
    #StructPack 4

    LogPathLength : UInt32

    LogPath : WCHAR[1]

}

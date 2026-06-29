#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SYNC_VERSION.ahk" { SYNC_VERSION }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SYNC_FILTER_CHANGE {
    #StructPack 8

    fMoveIn : BOOL

    moveVersion : SYNC_VERSION

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLTBINFO {
    #StructPack 4

    uDockType : UInt32

    rcTbPos : RECT

}

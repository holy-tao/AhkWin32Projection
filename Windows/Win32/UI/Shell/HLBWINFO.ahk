#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HLTBINFO.ahk" { HLTBINFO }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLBWINFO {
    #StructPack 4

    cbSize : UInt32 := this.Size

    grfHLBWIF : UInt32

    rcFramePos : RECT

    rcDocPos : RECT

    hltbinfo : HLTBINFO

}

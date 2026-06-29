#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_AC3_ERROR_CONCEALMENT {
    #StructPack 4

    fRepeatPreviousBlock : BOOL

    fErrorInCurrentBlock : BOOL

}

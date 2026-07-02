#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDHALPALCB_SETENTRIES.ahk" { LPDDHALPALCB_SETENTRIES }
#Import ".\LPDDHALPALCB_DESTROYPALETTE.ahk" { LPDDHALPALCB_DESTROYPALETTE }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DDPALETTECALLBACKS {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    DestroyPalette : LPDDHALPALCB_DESTROYPALETTE

    SetEntries : LPDDHALPALCB_SETENTRIES

}

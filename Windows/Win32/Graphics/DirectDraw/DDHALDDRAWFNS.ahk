#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDHAL_VIDMEMFREE.ahk" { LPDDHAL_VIDMEMFREE }
#Import ".\LPDDHAL_VIDMEMALLOC.ahk" { LPDDHAL_VIDMEMALLOC }
#Import ".\LPDDHAL_SETINFO.ahk" { LPDDHAL_SETINFO }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHALDDRAWFNS {
    #StructPack 8

    dwSize : UInt32

    lpSetInfo : LPDDHAL_SETINFO

    lpVidMemAlloc : LPDDHAL_VIDMEMALLOC

    lpVidMemFree : LPDDHAL_VIDMEMFREE

}

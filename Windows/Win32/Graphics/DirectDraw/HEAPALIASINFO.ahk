#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HEAPALIAS.ahk" { HEAPALIAS }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct HEAPALIASINFO {
    #StructPack 8

    dwRefCnt : UInt32

    dwFlags : UInt32

    dwNumHeaps : UInt32

    lpAliases : HEAPALIAS.Ptr

}

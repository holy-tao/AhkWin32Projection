#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HDC.ahk" { HDC }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct WGLSWAP {
    #StructPack 8

    hdc : HDC

    uiFlags : UInt32

}

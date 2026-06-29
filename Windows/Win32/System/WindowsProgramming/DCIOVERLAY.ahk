#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DCISURFACEINFO.ahk" { DCISURFACEINFO }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct DCIOVERLAY {
    #StructPack 8

    dciInfo : DCISURFACEINFO

    dwChromakeyValue : UInt32

    dwChromakeyMask : UInt32

}

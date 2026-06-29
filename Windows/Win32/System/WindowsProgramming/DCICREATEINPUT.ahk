#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DCICMD.ahk" { DCICMD }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct DCICREATEINPUT {
    #StructPack 8

    cmd : DCICMD

    dwCompression : UInt32

    dwMask : UInt32[3]

    dwWidth : UInt32

    dwHeight : UInt32

    dwDCICaps : UInt32

    dwBitCount : UInt32

    lpSurface : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIDMEM.ahk" { VIDMEM }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct VIDMEMINFO {
    #StructPack 8

    fpPrimary : IntPtr

    dwFlags : UInt32

    dwDisplayWidth : UInt32

    dwDisplayHeight : UInt32

    lDisplayPitch : Int32

    ddpfDisplay : DDPIXELFORMAT

    dwOffscreenAlign : UInt32

    dwOverlayAlign : UInt32

    dwTextureAlign : UInt32

    dwZBufferAlign : UInt32

    dwAlphaAlign : UInt32

    dwNumHeaps : UInt32

    pvmList : VIDMEM.Ptr

}

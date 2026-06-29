#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS2.ahk" { DDSCAPS2 }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDMCCOMPBUFFERINFO {
    #StructPack 4

    dwSize : UInt32

    dwNumCompBuffers : UInt32

    dwWidthToCreate : UInt32

    dwHeightToCreate : UInt32

    dwBytesToAllocate : UInt32

    ddCompCaps : DDSCAPS2

    ddPixelFormat : DDPIXELFORMAT

}

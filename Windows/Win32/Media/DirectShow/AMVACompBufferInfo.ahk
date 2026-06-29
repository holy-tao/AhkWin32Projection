#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\DirectDraw\DDSCAPS2.ahk" { DDSCAPS2 }
#Import "..\..\Graphics\DirectDraw\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }

/**
 * The AMVACompBufferInfo structure describes the allocated surfaces and compressed buffer information.
 * @see https://learn.microsoft.com/windows/win32/api/amva/ns-amva-amvacompbufferinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVACompBufferInfo {
    #StructPack 4

    /**
     * Number of buffers requested for compressed data.
     */
    dwNumCompBuffers : UInt32

    /**
     * Width of surface to create.
     */
    dwWidthToCreate : UInt32

    /**
     * Height of surface to create.
     */
    dwHeightToCreate : UInt32

    /**
     * Total number of bytes used by each surface.
     */
    dwBytesToAllocate : UInt32

    /**
     * <b>DDSCAPS2</b> structure defining the capabilities of the DirectDraw surface created to store compressed data.
     */
    ddCompCaps : DDSCAPS2

    /**
     * <b>DDPIXELFORMAT</b> structure, describing the pixel format used to create surfaces to store compressed data.
     */
    ddPixelFormat : DDPIXELFORMAT

}

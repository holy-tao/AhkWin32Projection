#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\DirectDraw\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }

/**
 * The AMVAUncompDataInfo structure specifies the dimensions and pixel format of the uncompressed surfaces for DirectX Video Acceleration (DXVA) video decoding.
 * @see https://learn.microsoft.com/windows/win32/api/amva/ns-amva-amvauncompdatainfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVAUncompDataInfo {
    #StructPack 4

    /**
     * Width of the decoded, uncompressed data, in pixels.
     */
    dwUncompWidth : UInt32

    /**
     * Height of the decoded, uncompressed data, in pixels.
     */
    dwUncompHeight : UInt32

    /**
     * A <b>DDPIXELFORMAT</b> structure that specifies the pixel format of the uncompressed data.
     */
    ddUncompPixelFormat : DDPIXELFORMAT

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Specifies the dimensions and pixel format of the uncompressed surfaces for DirectX Video Acceleration (DXVA) video decoding.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxvauncompdatainfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAUncompDataInfo {
    #StructPack 4

    /**
     * The width of the uncompressed data, in pixels.
     */
    UncompWidth : UInt32

    /**
     * The height of the uncompressed data, in pixels.
     */
    UncompHeight : UInt32

    /**
     * The pixel format of the uncompressed data, specified as a <b>D3DFORMAT</b> value.
     */
    UncompFormat : D3DFORMAT

}

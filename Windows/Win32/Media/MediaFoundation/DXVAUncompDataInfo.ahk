#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Direct3D9\D3DFORMAT.ahk

/**
 * Specifies the dimensions and pixel format of the uncompressed surfaces for DirectX Video Acceleration (DXVA) video decoding.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxvauncompdatainfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVAUncompDataInfo extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * The width of the uncompressed data, in pixels.
     * @type {Integer}
     */
    UncompWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height of the uncompressed data, in pixels.
     * @type {Integer}
     */
    UncompHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The pixel format of the uncompressed data, specified as a <b>D3DFORMAT</b> value.
     * @type {D3DFORMAT}
     */
    UncompFormat {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

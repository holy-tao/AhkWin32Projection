#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the DDS image dimension, DXGI_FORMAT and alpha mode of contained data.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicddsparameters
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICDdsParameters extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Type: <b>UINT</b>
     * 
     * The width, in pixels, of the texture at the largest mip size (mip level 0).
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The height, in pixels, of the texture at the largest mip size (mip level 0). When the DDS image contains a 1-dimensional texture, this value is equal to 1.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The number of slices in the 3D texture. This is equivalent to the depth, in pixels, of the 3D texture at the largest mip size (mip level 0). When the DDS image contains a 1- or 2-dimensional texture, this value is equal to 1.
     * @type {Integer}
     */
    Depth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The number of mip levels contained in the DDS image.
     * @type {Integer}
     */
    MipLevels {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The number of textures in the array in the DDS image.
     * @type {Integer}
     */
    ArraySize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> of the DDS pixel data.
     * @type {Integer}
     */
    DxgiFormat {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicddsdimension">WICDdsDimension</a></b>
     * 
     * Specifies the dimension type of the data contained in DDS image (1D, 2D, 3D or cube texture).
     * @type {Integer}
     */
    Dimension {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicddsalphamode">WICDdsAlphaMode</a></b>
     * 
     * Specifies the alpha behavior of the DDS image.
     * @type {Integer}
     */
    AlphaMode {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WICDdsAlphaMode.ahk" { WICDdsAlphaMode }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\WICDdsDimension.ahk" { WICDdsDimension }

/**
 * Specifies the DDS image dimension, DXGI_FORMAT and alpha mode of contained data.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicddsparameters
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICDdsParameters {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * The width, in pixels, of the texture at the largest mip size (mip level 0).
     */
    Width : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The height, in pixels, of the texture at the largest mip size (mip level 0). When the DDS image contains a 1-dimensional texture, this value is equal to 1.
     */
    Height : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The number of slices in the 3D texture. This is equivalent to the depth, in pixels, of the 3D texture at the largest mip size (mip level 0). When the DDS image contains a 1- or 2-dimensional texture, this value is equal to 1.
     */
    Depth : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The number of mip levels contained in the DDS image.
     */
    MipLevels : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The number of textures in the array in the DDS image.
     */
    ArraySize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> of the DDS pixel data.
     */
    DxgiFormat : DXGI_FORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicddsdimension">WICDdsDimension</a></b>
     * 
     * Specifies the dimension type of the data contained in DDS image (1D, 2D, 3D or cube texture).
     */
    Dimension : WICDdsDimension

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicddsalphamode">WICDdsAlphaMode</a></b>
     * 
     * Specifies the alpha behavior of the DDS image.
     */
    AlphaMode : WICDdsAlphaMode

}

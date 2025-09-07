#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the dimension type of the data contained in DDS image.
 * @remarks
 * Both <b>WICDdsTexture2d</b> and <b>WICDdsTextureCube</b> correspond to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_dimension">D3D11_RESOURCE_DIMENSION_TEXTURE2D</a>. When using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a>, they are distinguished by the flag <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_TEXTURECUBE</a> in the structure <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicddsdimension
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICDdsDimension{

    /**
     * DDS image contains a 1-dimensional texture .
     * @type {Integer (Int32)}
     */
    static WICDdsTexture1D => 0

    /**
     * DDS image contains a 2-dimensional texture .
     * @type {Integer (Int32)}
     */
    static WICDdsTexture2D => 1

    /**
     * DDS image contains a 3-dimensional texture .
     * @type {Integer (Int32)}
     */
    static WICDdsTexture3D => 2

    /**
     * The DDS image contains a cube texture represented as an array of 6 faces.
     * @type {Integer (Int32)}
     */
    static WICDdsTextureCube => 3
}

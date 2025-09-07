#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of resource being used. (D3D10_RESOURCE_DIMENSION)
 * @remarks
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10resource-gettype">ID3D10Resource::GetType</a>, and <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10-image-info">D3DX10_IMAGE_INFO</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_resource_dimension
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_RESOURCE_DIMENSION{

    /**
     * Resource is of unknown type.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_DIMENSION_UNKNOWN => 0

    /**
     * Resource is a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">buffer</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_DIMENSION_BUFFER => 1

    /**
     * Resource is a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">1D texture</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_DIMENSION_TEXTURE1D => 2

    /**
     * Resource is a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">2D texture</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_DIMENSION_TEXTURE2D => 3

    /**
     * Resource is a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">3D texture</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_DIMENSION_TEXTURE3D => 4
}

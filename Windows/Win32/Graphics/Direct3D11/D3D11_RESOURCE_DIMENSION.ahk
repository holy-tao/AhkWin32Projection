#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of resource being used.
 * @remarks
 * 
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11resource-gettype">ID3D11Resource::GetType</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_resource_dimension
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_RESOURCE_DIMENSION extends Win32Enum{

    /**
     * Resource is of unknown type.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_DIMENSION_UNKNOWN => 0

    /**
     * Resource is a buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_DIMENSION_BUFFER => 1

    /**
     * Resource is a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_DIMENSION_TEXTURE1D => 2

    /**
     * Resource is a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_DIMENSION_TEXTURE2D => 3

    /**
     * Resource is a 3D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_DIMENSION_TEXTURE3D => 4
}

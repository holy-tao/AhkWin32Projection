#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of resource being used. (D3D12_RESOURCE_DIMENSION)
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_desc">D3D12_RESOURCE_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_dimension
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_RESOURCE_DIMENSION extends Win32Enum {

    /**
     * Resource is of unknown type.
     * Native name: D3D12_RESOURCE_DIMENSION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Resource is a buffer.
     * Native name: D3D12_RESOURCE_DIMENSION_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 1

    /**
     * Resource is a 1D texture.
     * Native name: D3D12_RESOURCE_DIMENSION_TEXTURE1D
     * @type {Integer (Int32)}
     */
    static TEXTURE1D => 2

    /**
     * Resource is a 2D texture.
     * Native name: D3D12_RESOURCE_DIMENSION_TEXTURE2D
     * @type {Integer (Int32)}
     */
    static TEXTURE2D => 3

    /**
     * Resource is a 3D texture.
     * Native name: D3D12_RESOURCE_DIMENSION_TEXTURE3D
     * @type {Integer (Int32)}
     */
    static TEXTURE3D => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of resource that will be viewed as a shader resource.
 * @remarks
 * These values are used by a shader-resource-view description, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc">D3D12_SHADER_RESOURCE_VIEW_DESC</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_srv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_SRV_DIMENSION extends Win32Enum {

    /**
     * The type is unknown.
     * Native name: D3D12_SRV_DIMENSION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The resource is a buffer.
     * Native name: D3D12_SRV_DIMENSION_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 1

    /**
     * The resource is a 1D texture.
     * Native name: D3D12_SRV_DIMENSION_TEXTURE1D
     * @type {Integer (Int32)}
     */
    static TEXTURE1D => 2

    /**
     * The resource is an array of 1D textures.
     * Native name: D3D12_SRV_DIMENSION_TEXTURE1DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE1DARRAY => 3

    /**
     * The resource is a 2D texture.
     * Native name: D3D12_SRV_DIMENSION_TEXTURE2D
     * @type {Integer (Int32)}
     */
    static TEXTURE2D => 4

    /**
     * The resource is an array of 2D textures.
     * Native name: D3D12_SRV_DIMENSION_TEXTURE2DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DARRAY => 5

    /**
     * The resource is a multisampling 2D texture.
     * Native name: D3D12_SRV_DIMENSION_TEXTURE2DMS
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMS => 6

    /**
     * The resource is an array of multisampling 2D textures.
     * Native name: D3D12_SRV_DIMENSION_TEXTURE2DMSARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMSARRAY => 7

    /**
     * The resource is a 3D texture.
     * Native name: D3D12_SRV_DIMENSION_TEXTURE3D
     * @type {Integer (Int32)}
     */
    static TEXTURE3D => 8

    /**
     * The resource is a cube texture.
     * Native name: D3D12_SRV_DIMENSION_TEXTURECUBE
     * @type {Integer (Int32)}
     */
    static TEXTURECUBE => 9

    /**
     * The resource is an array of cube textures.
     * Native name: D3D12_SRV_DIMENSION_TEXTURECUBEARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURECUBEARRAY => 10

    /**
     * The resource is a raytracing acceleration structure.
     * Native name: D3D12_SRV_DIMENSION_RAYTRACING_ACCELERATION_STRUCTURE
     * @type {Integer (Int32)}
     */
    static RAYTRACING_ACCELERATION_STRUCTURE => 11

    /**
     * Native name: D3D12_SRV_DIMENSION_BUFFER_BYTE_OFFSET
     * @type {Integer (Int32)}
     */
    static BUFFER_BYTE_OFFSET => 12
}

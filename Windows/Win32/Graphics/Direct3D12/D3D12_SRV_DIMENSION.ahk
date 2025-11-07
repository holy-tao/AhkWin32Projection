#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of resource that will be viewed as a shader resource.
 * @remarks
 * 
 * These values are used by a shader-resource-view description, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc">D3D12_SHADER_RESOURCE_VIEW_DESC</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_srv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SRV_DIMENSION{

    /**
     * The type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_UNKNOWN => 0

    /**
     * The resource is a buffer.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_BUFFER => 1

    /**
     * The resource is a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_TEXTURE1D => 2

    /**
     * The resource is an array of 1D textures.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_TEXTURE1DARRAY => 3

    /**
     * The resource is a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_TEXTURE2D => 4

    /**
     * The resource is an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_TEXTURE2DARRAY => 5

    /**
     * The resource is a multisampling 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_TEXTURE2DMS => 6

    /**
     * The resource is an array of multisampling 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_TEXTURE2DMSARRAY => 7

    /**
     * The resource is a 3D texture.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_TEXTURE3D => 8

    /**
     * The resource is a cube texture.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_TEXTURECUBE => 9

    /**
     * The resource is an array of cube textures.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_TEXTURECUBEARRAY => 10

    /**
     * The resource is a raytracing acceleration structure.
     * @type {Integer (Int32)}
     */
    static D3D12_SRV_DIMENSION_RAYTRACING_ACCELERATION_STRUCTURE => 11
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that identify the type of resource to be viewed as a shader resource.
 * @remarks
 * 
  * A <b>D3D_SRV_DIMENSION</b>-typed value is specified in the <b>ViewDimension</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_input_bind_desc">D3D11_SHADER_RESOURCE_VIEW_DESC</a> structure or the  <b>Dimension</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_input_bind_desc">D3D11_SHADER_INPUT_BIND_DESC</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_srv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SRV_DIMENSION{

    /**
     * The type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_UNKNOWN => 0

    /**
     * The resource is a buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_BUFFER => 1

    /**
     * The resource is a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_TEXTURE1D => 2

    /**
     * The resource is an array of 1D textures.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_TEXTURE1DARRAY => 3

    /**
     * The resource is a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_TEXTURE2D => 4

    /**
     * The resource is an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_TEXTURE2DARRAY => 5

    /**
     * The resource is a multisampling 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_TEXTURE2DMS => 6

    /**
     * The resource is an array of multisampling 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_TEXTURE2DMSARRAY => 7

    /**
     * The resource is a 3D texture.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_TEXTURE3D => 8

    /**
     * The resource is a cube texture.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_TEXTURECUBE => 9

    /**
     * The resource is an array of cube textures.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_TEXTURECUBEARRAY => 10

    /**
     * The resource is a raw buffer. For more info about raw viewing of buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Raw Views of Buffers</a>.
     * @type {Integer (Int32)}
     */
    static D3D_SRV_DIMENSION_BUFFEREX => 11

    /**
     * The type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_UNKNOWN => 0

    /**
     * The resource is a buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_BUFFER => 1

    /**
     * The resource is a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_TEXTURE1D => 2

    /**
     * The resource is an array of 1D textures.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_TEXTURE1DARRAY => 3

    /**
     * The resource is a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_TEXTURE2D => 4

    /**
     * The resource is an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_TEXTURE2DARRAY => 5

    /**
     * The resource is a multisampling 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_TEXTURE2DMS => 6

    /**
     * The resource is an array of multisampling 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_TEXTURE2DMSARRAY => 7

    /**
     * The resource is a 3D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_TEXTURE3D => 8

    /**
     * The resource is a cube texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SRV_DIMENSION_TEXTURECUBE => 9

    /**
     * The type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_UNKNOWN => 0

    /**
     * The resource is a buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_BUFFER => 1

    /**
     * The resource is a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_TEXTURE1D => 2

    /**
     * The resource is an array of 1D textures.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_TEXTURE1DARRAY => 3

    /**
     * The resource is a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_TEXTURE2D => 4

    /**
     * The resource is an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_TEXTURE2DARRAY => 5

    /**
     * The resource is a multisampling 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_TEXTURE2DMS => 6

    /**
     * The resource is an array of multisampling 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_TEXTURE2DMSARRAY => 7

    /**
     * The resource is a 3D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_TEXTURE3D => 8

    /**
     * The resource is a cube texture.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_TEXTURECUBE => 9

    /**
     * The resource is an array of cube textures.
     * @type {Integer (Int32)}
     */
    static D3D10_1_SRV_DIMENSION_TEXTURECUBEARRAY => 10

    /**
     * The type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_UNKNOWN => 0

    /**
     * The resource is a buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_BUFFER => 1

    /**
     * The resource is a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_TEXTURE1D => 2

    /**
     * The resource is an array of 1D textures.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_TEXTURE1DARRAY => 3

    /**
     * The resource is a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_TEXTURE2D => 4

    /**
     * The resource is an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_TEXTURE2DARRAY => 5

    /**
     * The resource is a multisampling 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_TEXTURE2DMS => 6

    /**
     * The resource is an array of multisampling 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_TEXTURE2DMSARRAY => 7

    /**
     * The resource is a 3D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_TEXTURE3D => 8

    /**
     * The resource is a cube texture.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_TEXTURECUBE => 9

    /**
     * The resource is an array of cube textures.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_TEXTURECUBEARRAY => 10

    /**
     * The resource is a raw buffer. For more info about raw viewing of buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Raw Views of Buffers</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_SRV_DIMENSION_BUFFEREX => 11
}

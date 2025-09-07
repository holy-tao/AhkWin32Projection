#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates shader type.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/ne-d3d11shader-d3d11_shader_version_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHADER_VERSION_TYPE{

    /**
     * Pixel shader.
     * @type {Integer (Int32)}
     */
    static D3D11_SHVER_PIXEL_SHADER => 0

    /**
     * Vertex shader.
     * @type {Integer (Int32)}
     */
    static D3D11_SHVER_VERTEX_SHADER => 1

    /**
     * Geometry shader.
     * @type {Integer (Int32)}
     */
    static D3D11_SHVER_GEOMETRY_SHADER => 2

    /**
     * Hull shader.
     * @type {Integer (Int32)}
     */
    static D3D11_SHVER_HULL_SHADER => 3

    /**
     * Domain shader.
     * @type {Integer (Int32)}
     */
    static D3D11_SHVER_DOMAIN_SHADER => 4

    /**
     * Compute shader.
     * @type {Integer (Int32)}
     */
    static D3D11_SHVER_COMPUTE_SHADER => 5

    /**
     * Indicates the end of the enumeration constants.
     * @type {Integer (Int32)}
     */
    static D3D11_SHVER_RESERVED0 => 65520
}

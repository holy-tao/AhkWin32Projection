#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates shader type.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/ne-d3d11shader-d3d11_shader_version_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_SHADER_VERSION_TYPE extends Win32Enum {

    /**
     * Pixel shader.
     * Native name: D3D11_SHVER_PIXEL_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_PIXEL_SHADER => 0

    /**
     * Vertex shader.
     * Native name: D3D11_SHVER_VERTEX_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_VERTEX_SHADER => 1

    /**
     * Geometry shader.
     * Native name: D3D11_SHVER_GEOMETRY_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_GEOMETRY_SHADER => 2

    /**
     * Hull shader.
     * Native name: D3D11_SHVER_HULL_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_HULL_SHADER => 3

    /**
     * Domain shader.
     * Native name: D3D11_SHVER_DOMAIN_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_DOMAIN_SHADER => 4

    /**
     * Compute shader.
     * Native name: D3D11_SHVER_COMPUTE_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_COMPUTE_SHADER => 5

    /**
     * Indicates the end of the enumeration constants.
     * Native name: D3D11_SHVER_RESERVED0
     * @type {Integer (Int32)}
     */
    static SHVER_RESERVED0 => 65520
}

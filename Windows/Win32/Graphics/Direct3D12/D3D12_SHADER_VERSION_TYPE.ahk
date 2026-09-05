#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the types of shaders that Direct3D recognizes. Used to encode the Version member of the D3D12_SHADER_DESC structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ne-d3d12shader-d3d12_shader_version_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_SHADER_VERSION_TYPE extends Win32Enum {

    /**
     * Pixel shader.
     * Native name: D3D12_SHVER_PIXEL_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_PIXEL_SHADER => 0

    /**
     * Vertex shader.
     * Native name: D3D12_SHVER_VERTEX_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_VERTEX_SHADER => 1

    /**
     * Geometry shader.
     * Native name: D3D12_SHVER_GEOMETRY_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_GEOMETRY_SHADER => 2

    /**
     * Hull shader.
     * Native name: D3D12_SHVER_HULL_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_HULL_SHADER => 3

    /**
     * Domain shader.
     * Native name: D3D12_SHVER_DOMAIN_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_DOMAIN_SHADER => 4

    /**
     * Compute shader.
     * Native name: D3D12_SHVER_COMPUTE_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_COMPUTE_SHADER => 5

    /**
     * Native name: D3D12_SHVER_LIBRARY
     * @type {Integer (Int32)}
     */
    static SHVER_LIBRARY => 6

    /**
     * Native name: D3D12_SHVER_RAY_GENERATION_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_RAY_GENERATION_SHADER => 7

    /**
     * Native name: D3D12_SHVER_INTERSECTION_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_INTERSECTION_SHADER => 8

    /**
     * Native name: D3D12_SHVER_ANY_HIT_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_ANY_HIT_SHADER => 9

    /**
     * Native name: D3D12_SHVER_CLOSEST_HIT_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_CLOSEST_HIT_SHADER => 10

    /**
     * Native name: D3D12_SHVER_MISS_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_MISS_SHADER => 11

    /**
     * Native name: D3D12_SHVER_CALLABLE_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_CALLABLE_SHADER => 12

    /**
     * Native name: D3D12_SHVER_MESH_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_MESH_SHADER => 13

    /**
     * Native name: D3D12_SHVER_AMPLIFICATION_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_AMPLIFICATION_SHADER => 14

    /**
     * Native name: D3D12_SHVER_NODE_SHADER
     * @type {Integer (Int32)}
     */
    static SHVER_NODE_SHADER => 15

    /**
     * Indicates the end of the enumeration.
     * Native name: D3D12_SHVER_RESERVED0
     * @type {Integer (Int32)}
     */
    static SHVER_RESERVED0 => 65520
}

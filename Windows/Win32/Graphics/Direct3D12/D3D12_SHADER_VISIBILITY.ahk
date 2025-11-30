#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the shaders that can access the contents of a given root signature slot.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter">D3D12_ROOT_PARAMETER</a> structure.
 * 
 * The compute queue always uses <b>D3D12_SHADER_VISIBILITY_ALL</b> because it has only one active stage. The 3D queue can choose values, but if it uses <b>D3D12_SHADER_VISIBILITY_ALL</b>, all shader stages can access whatever is bound at the root signature slot.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_shader_visibility
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_VISIBILITY extends Win32Enum{

    /**
     * Specifies that all shader stages can access whatever is bound at the root signature slot.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_VISIBILITY_ALL => 0

    /**
     * Specifies that the vertex shader stage can access whatever is bound at the root signature slot.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_VISIBILITY_VERTEX => 1

    /**
     * Specifies that the hull shader stage can access whatever is bound at the root signature slot.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_VISIBILITY_HULL => 2

    /**
     * Specifies that the domain shader stage can access whatever is bound at the root signature slot.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_VISIBILITY_DOMAIN => 3

    /**
     * Specifies that the geometry shader stage can access whatever is bound at the root signature slot.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_VISIBILITY_GEOMETRY => 4

    /**
     * Specifies that the pixel shader stage can access whatever is bound at the root signature slot.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_VISIBILITY_PIXEL => 5

    /**
     * Specifies that the amplification shader stage can access whatever is bound at the root signature slot.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_VISIBILITY_AMPLIFICATION => 6

    /**
     * Specifies that the mesh shader stage can access whatever is bound at the root signature slot.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_VISIBILITY_MESH => 7
}

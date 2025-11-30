#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_mesh_shader_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MESH_SHADER_TIER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MESH_SHADER_TIER_NOT_SUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MESH_SHADER_TIER_1 => 10
}

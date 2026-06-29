#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify mesh and amplification shader support.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_mesh_shader_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_MESH_SHADER_TIER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies that mesh and amplification shaders are not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_MESH_SHADER_TIER_NOT_SUPPORTED => 0

    /**
     * Specifies that mesh and amplification shaders are supported.
     * @type {Integer (Int32)}
     */
    static D3D12_MESH_SHADER_TIER_1 => 10
}

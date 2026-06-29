#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes shader data. (D3D12_SHADER_BYTECODE)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc">D3D12_COMPUTE_PIPELINE_STATE_DESC</a> objects contain <b>D3D12_SHADER_BYTECODE</b> structures that describe various shader types.
 * 
 * When loading a shader from FXC/DXC, this may be the entire compiled blob as is loaded from disk.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SHADER_BYTECODE {
    #StructPack 8

    /**
     * A pointer to a memory block that contains the shader data.
     */
    pShaderBytecode : IntPtr

    /**
     * The size, in bytes, of the shader data that the <b>pShaderBytecode</b> member points to.
     */
    BytecodeLength : IntPtr

}

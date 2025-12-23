#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes shader data. (D3D12_SHADER_BYTECODE)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc">D3D12_COMPUTE_PIPELINE_STATE_DESC</a> objects contain <b>D3D12_SHADER_BYTECODE</b> structures that describe various shader types.
 * 
 * When loading a shader from FXC/DXC, this may be the entire compiled blob as is loaded from disk.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_BYTECODE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a memory block that contains the shader data.
     * @type {Pointer<Void>}
     */
    pShaderBytecode {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size, in bytes, of the shader data that the <b>pShaderBytecode</b> member points to.
     * @type {Pointer}
     */
    BytecodeLength {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

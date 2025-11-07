#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes shader data.
 * @remarks
 * 
 * An array of <b>D3D_SHADER_DATA</b> structures is passed to <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompressshaders">D3DCompressShaders</a> to compress the shader data into a more compact form.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/ns-d3dcompiler-d3d_shader_data
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 * @version v4.0.30319
 */
class D3D_SHADER_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to shader data.
     * @type {Pointer<Void>}
     */
    pBytecode {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Length of shader data that <b>pBytecode</b> points to.
     * @type {Pointer}
     */
    BytecodeLength {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

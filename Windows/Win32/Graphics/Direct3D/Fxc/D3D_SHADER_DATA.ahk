#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes shader data. (D3D_SHADER_DATA)
 * @remarks
 * An array of <b>D3D_SHADER_DATA</b> structures is passed to <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompressshaders">D3DCompressShaders</a> to compress the shader data into a more compact form.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcompiler/ns-d3dcompiler-d3d_shader_data
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 */
export default struct D3D_SHADER_DATA {
    #StructPack 8

    /**
     * A pointer to shader data.
     */
    pBytecode : IntPtr

    /**
     * Length of shader data that <b>pBytecode</b> points to.
     */
    BytecodeLength : IntPtr

}

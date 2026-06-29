#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Values that identify the intended use of a constant-data buffer.
 * @remarks
 * <b>D3D_SHADER_CBUFFER_FLAGS</b>-typed values are specified in the <b>uFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_buffer_desc">D3D11_SHADER_BUFFER_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_shader_cbuffer_flags
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_SHADER_CBUFFER_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Bind the constant buffer to an input slot defined in HLSL code (instead of letting the compiler choose the input slot).
     * @type {Integer (Int32)}
     */
    static D3D_CBF_USERPACKED => 1

    /**
     * Bind the constant buffer to an input slot defined in HLSL code (instead of letting the compiler choose the input slot).
     * @type {Integer (Int32)}
     */
    static D3D10_CBF_USERPACKED => 1
}

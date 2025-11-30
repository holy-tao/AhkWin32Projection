#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that identify the indended use of a constant-data buffer.
 * @remarks
 * 
 * <b>D3D_SHADER_CBUFFER_FLAGS</b>-typed values are specified in the <b>uFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_buffer_desc">D3D11_SHADER_BUFFER_DESC</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_shader_cbuffer_flags
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_CBUFFER_FLAGS extends Win32Enum{

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

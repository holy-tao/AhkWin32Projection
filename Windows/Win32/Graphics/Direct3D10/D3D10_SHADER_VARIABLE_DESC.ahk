#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a shader variable. (D3D10_SHADER_VARIABLE_DESC)
 * @remarks
 * Get a shader-variable description using reflection, by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionvariable-getdesc">ID3D10ShaderReflectionVariable::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_variable_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_VARIABLE_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The variable name.
     */
    Name : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset from the start of the parent structure, to the beginning of the variable.
     */
    StartOffset : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the variable (in bytes).
     */
    Size : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags, which identify shader-variable properties (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_flags">D3D10_SHADER_VARIABLE_FLAGS</a>).
     */
    uFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPVOID</a></b>
     * 
     * The default value for initializing the variable.
     */
    DefaultValue : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_INTERPOLATION_MODE.ahk" { D3D_INTERPOLATION_MODE }
#Import "..\Direct3D\D3D_SHADER_VARIABLE_TYPE.ahk" { D3D_SHADER_VARIABLE_TYPE }
#Import "..\Direct3D\D3D_SHADER_VARIABLE_CLASS.ahk" { D3D_SHADER_VARIABLE_CLASS }
#Import "..\Direct3D\D3D_PARAMETER_FLAGS.ahk" { D3D_PARAMETER_FLAGS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a function parameter. (D3D11_PARAMETER_DESC)
 * @remarks
 * Get a function-parameter description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionparameterreflection-getdesc">ID3D11FunctionParameterReflection::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_parameter_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_PARAMETER_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the function parameter.
     */
    Name : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The HLSL <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">semantic</a> that is associated with this function parameter. This name includes the index, for example, SV_Target[n].
     */
    SemanticName : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D_SHADER_VARIABLE_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D_SHADER_VARIABLE_TYPE</a>-typed value that identifies the variable type for the parameter.
     */
    Type : D3D_SHADER_VARIABLE_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D_SHADER_VARIABLE_CLASS</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D_SHADER_VARIABLE_CLASS</a>-typed value that identifies the variable class for the parameter as one of scalar, vector, matrix, object, and so on.
     */
    Class : D3D_SHADER_VARIABLE_CLASS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of rows for a matrix parameter.
     */
    Rows : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of columns for a matrix parameter.
     */
    Columns : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_interpolation_mode">D3D_INTERPOLATION_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_interpolation_mode">D3D_INTERPOLATION_MODE</a>-typed value that identifies the interpolation mode for the parameter.
     */
    InterpolationMode : D3D_INTERPOLATION_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_parameter_flags">D3D_PARAMETER_FLAGS</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_parameter_flags">D3D_PARAMETER_FLAGS</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies semantic flags for the parameter.
     */
    Flags : D3D_PARAMETER_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first input register for this parameter.
     */
    FirstInRegister : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first input register component for this parameter.
     */
    FirstInComponent : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first output register for this parameter.
     */
    FirstOutRegister : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first output register component for this parameter.
     */
    FirstOutComponent : UInt32

}

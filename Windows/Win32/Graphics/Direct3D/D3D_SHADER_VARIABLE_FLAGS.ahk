#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that identify information about a shader variable.
 * @remarks
 * 
 * A call to the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-getdesc">ID3D11ShaderReflectionVariable::GetDesc</a> method returns <b>D3D_SHADER_VARIABLE_FLAGS</b> values in the  <b>uFlags</b> member of a  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_variable_desc">D3D11_SHADER_VARIABLE_DESC</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_shader_variable_flags
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_VARIABLE_FLAGS extends Win32Enum{

    /**
     * Indicates that the registers assigned to this shader variable were explicitly declared in shader code (instead of automatically assigned by the compiler).
     * @type {Integer (Int32)}
     */
    static D3D_SVF_USERPACKED => 1

    /**
     * Indicates that this variable is used by this shader. This value confirms that a particular shader variable (which can be common to many different shaders) is indeed used by a particular shader.
     * @type {Integer (Int32)}
     */
    static D3D_SVF_USED => 2

    /**
     * Indicates that this variable is an interface.
     * @type {Integer (Int32)}
     */
    static D3D_SVF_INTERFACE_POINTER => 4

    /**
     * Indicates that this variable is a parameter of an interface.
     * @type {Integer (Int32)}
     */
    static D3D_SVF_INTERFACE_PARAMETER => 8

    /**
     * Indicates that the registers assigned to this shader variable were explicitly declared in shader code (instead of automatically assigned by the compiler).
     * @type {Integer (Int32)}
     */
    static D3D10_SVF_USERPACKED => 1

    /**
     * Indicates that this variable is used by this shader. This value confirms that a particular shader variable (which can be common to many different shaders) is indeed used by a particular shader.
     * @type {Integer (Int32)}
     */
    static D3D10_SVF_USED => 2

    /**
     * Indicates that this variable is an interface.
     * @type {Integer (Int32)}
     */
    static D3D11_SVF_INTERFACE_POINTER => 4

    /**
     * Indicates that this variable is a parameter of an interface.
     * @type {Integer (Int32)}
     */
    static D3D11_SVF_INTERFACE_PARAMETER => 8
}

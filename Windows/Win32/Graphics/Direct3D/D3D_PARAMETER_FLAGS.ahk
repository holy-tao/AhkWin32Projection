#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates semantic flags for function parameters.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_parameter_flags
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_PARAMETER_FLAGS extends Win32Enum{

    /**
     * The parameter has no semantic flags.
     * @type {Integer (Int32)}
     */
    static D3D_PF_NONE => 0

    /**
     * Indicates an input parameter.
     * @type {Integer (Int32)}
     */
    static D3D_PF_IN => 1

    /**
     * Indicates an output parameter.
     * @type {Integer (Int32)}
     */
    static D3D_PF_OUT => 2
}

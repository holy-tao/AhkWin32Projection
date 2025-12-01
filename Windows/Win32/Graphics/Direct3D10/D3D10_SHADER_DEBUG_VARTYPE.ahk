#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Distinguishes variables from functions in a scope.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_vartype
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_DEBUG_VARTYPE extends Win32Enum{

    /**
     * Element is a variable.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_VAR_VARIABLE => 0

    /**
     * Element is a function.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_VAR_FUNCTION => 1
}

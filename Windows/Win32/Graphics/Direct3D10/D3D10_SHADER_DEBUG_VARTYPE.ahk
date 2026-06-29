#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Distinguishes variables from functions in a scope.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_vartype
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_DEBUG_VARTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

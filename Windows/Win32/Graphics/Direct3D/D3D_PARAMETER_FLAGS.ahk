#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates semantic flags for function parameters.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_parameter_flags
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_PARAMETER_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

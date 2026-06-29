#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the supported culling modes.
 * @remarks
 * The values in this enumerated type are used by the D3DRS\_CULLMODE render state. The culling modes define how back faces are culled when rendering a geometry.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcull
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DCULL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static D3DCULL_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCULL_CW => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCULL_CCW => 3
}

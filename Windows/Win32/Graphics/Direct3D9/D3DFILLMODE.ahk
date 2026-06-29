#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants describing the fill mode.
 * @remarks
 * The values in this enumerated type are used by the D3DRS\_FILLMODE render state.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dfillmode
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DFILLMODE {
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
    static D3DFILL_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DFILL_WIREFRAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFILL_SOLID => 3
}

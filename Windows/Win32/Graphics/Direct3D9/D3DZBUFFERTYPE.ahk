#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that describe depth-buffer formats.
 * @remarks
 * Members of this enumerated type are used with the D3DRS\_ZENABLE render state.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dzbuffertype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DZBUFFERTYPE {
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
    static D3DZB_FALSE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DZB_TRUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DZB_USEW => 2
}

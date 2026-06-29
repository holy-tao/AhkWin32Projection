#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that describe the supported texture-addressing modes.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtextureaddress
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DTEXTUREADDRESS {
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
    static D3DTADDRESS_WRAP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTADDRESS_MIRROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTADDRESS_CLAMP => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTADDRESS_BORDER => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DTADDRESS_MIRRORONCE => 5
}

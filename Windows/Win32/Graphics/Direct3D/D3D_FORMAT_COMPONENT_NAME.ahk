#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_FORMAT_COMPONENT_NAME {
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
    static D3DFCN_R => -4

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCN_G => -3

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCN_B => -2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCN_A => -1

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCN_D => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCN_S => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCN_X => 2
}

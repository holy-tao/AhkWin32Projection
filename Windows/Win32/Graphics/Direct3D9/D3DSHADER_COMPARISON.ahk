#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSHADER_COMPARISON {
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
    static D3DSPC_RESERVED0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_GT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_EQ => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_GE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_LT => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_NE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_LE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_RESERVED1 => 7
}

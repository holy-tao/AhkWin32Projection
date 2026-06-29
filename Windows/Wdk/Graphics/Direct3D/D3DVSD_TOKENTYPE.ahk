#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DVSD_TOKENTYPE {
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
    static D3DVSD_TOKEN_NOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_STREAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_STREAMDATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_TESSELLATOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_CONSTMEM => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_EXT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_END => 7
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Sampler states define texture sampling operations such as texture addressing and texture filtering.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dsamplerstatetype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSAMPLERSTATETYPE {
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
    static D3DSAMP_ADDRESSU => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_ADDRESSV => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_ADDRESSW => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_BORDERCOLOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_MAGFILTER => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_MINFILTER => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_MIPFILTER => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_MIPMAPLODBIAS => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_MAXMIPLEVEL => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_MAXANISOTROPY => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_SRGBTEXTURE => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_ELEMENTINDEX => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DSAMP_DMAPOFFSET => 13
}

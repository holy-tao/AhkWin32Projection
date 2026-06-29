#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_PRESENT_PATH_SCALING {
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
    static D3DKMDT_VPPS_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPS_IDENTITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPS_CENTERED => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPS_STRETCHED => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPS_ASPECTRATIOCENTEREDMAX => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPS_CUSTOM => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPS_RESERVED1 => 253

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPS_UNPINNED => 254

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPS_NOTSPECIFIED => 255
}

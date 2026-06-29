#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_PRESENT_PATH_IMPORTANCE {
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
    static D3DKMDT_VPPI_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_PRIMARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_SECONDARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_TERTIARY => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_QUATERNARY => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_QUINARY => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_SENARY => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_SEPTENARY => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_OCTONARY => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_NONARY => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPI_DENARY => 10
}

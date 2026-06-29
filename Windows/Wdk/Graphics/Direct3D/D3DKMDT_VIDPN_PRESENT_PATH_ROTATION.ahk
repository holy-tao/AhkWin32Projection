#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_PRESENT_PATH_ROTATION {
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
    static D3DKMDT_VPPR_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_IDENTITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE90 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE180 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE270 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_IDENTITY_OFFSET90 => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE90_OFFSET90 => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE180_OFFSET90 => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE270_OFFSET90 => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_IDENTITY_OFFSET180 => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE90_OFFSET180 => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE180_OFFSET180 => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE270_OFFSET180 => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_IDENTITY_OFFSET270 => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE90_OFFSET270 => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE180_OFFSET270 => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_ROTATE270_OFFSET270 => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_UNPINNED => 254

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPR_NOTSPECIFIED => 255
}

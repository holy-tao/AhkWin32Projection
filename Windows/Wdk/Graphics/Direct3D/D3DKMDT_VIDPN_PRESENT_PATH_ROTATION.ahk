#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDPN_PRESENT_PATH_ROTATION extends Win32Enum {

    /**
     * Native name: D3DKMDT_VPPR_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static VPPR_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_VPPR_IDENTITY
     * @type {Integer (Int32)}
     */
    static VPPR_IDENTITY => 1

    /**
     * Native name: D3DKMDT_VPPR_ROTATE90
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE90 => 2

    /**
     * Native name: D3DKMDT_VPPR_ROTATE180
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE180 => 3

    /**
     * Native name: D3DKMDT_VPPR_ROTATE270
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE270 => 4

    /**
     * Native name: D3DKMDT_VPPR_IDENTITY_OFFSET90
     * @type {Integer (Int32)}
     */
    static VPPR_IDENTITY_OFFSET90 => 5

    /**
     * Native name: D3DKMDT_VPPR_ROTATE90_OFFSET90
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE90_OFFSET90 => 6

    /**
     * Native name: D3DKMDT_VPPR_ROTATE180_OFFSET90
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE180_OFFSET90 => 7

    /**
     * Native name: D3DKMDT_VPPR_ROTATE270_OFFSET90
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE270_OFFSET90 => 8

    /**
     * Native name: D3DKMDT_VPPR_IDENTITY_OFFSET180
     * @type {Integer (Int32)}
     */
    static VPPR_IDENTITY_OFFSET180 => 9

    /**
     * Native name: D3DKMDT_VPPR_ROTATE90_OFFSET180
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE90_OFFSET180 => 10

    /**
     * Native name: D3DKMDT_VPPR_ROTATE180_OFFSET180
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE180_OFFSET180 => 11

    /**
     * Native name: D3DKMDT_VPPR_ROTATE270_OFFSET180
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE270_OFFSET180 => 12

    /**
     * Native name: D3DKMDT_VPPR_IDENTITY_OFFSET270
     * @type {Integer (Int32)}
     */
    static VPPR_IDENTITY_OFFSET270 => 13

    /**
     * Native name: D3DKMDT_VPPR_ROTATE90_OFFSET270
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE90_OFFSET270 => 14

    /**
     * Native name: D3DKMDT_VPPR_ROTATE180_OFFSET270
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE180_OFFSET270 => 15

    /**
     * Native name: D3DKMDT_VPPR_ROTATE270_OFFSET270
     * @type {Integer (Int32)}
     */
    static VPPR_ROTATE270_OFFSET270 => 16

    /**
     * Native name: D3DKMDT_VPPR_UNPINNED
     * @type {Integer (Int32)}
     */
    static VPPR_UNPINNED => 254

    /**
     * Native name: D3DKMDT_VPPR_NOTSPECIFIED
     * @type {Integer (Int32)}
     */
    static VPPR_NOTSPECIFIED => 255
}

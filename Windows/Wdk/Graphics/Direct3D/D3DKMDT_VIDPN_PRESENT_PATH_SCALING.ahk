#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDPN_PRESENT_PATH_SCALING extends Win32Enum {

    /**
     * Native name: D3DKMDT_VPPS_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static VPPS_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_VPPS_IDENTITY
     * @type {Integer (Int32)}
     */
    static VPPS_IDENTITY => 1

    /**
     * Native name: D3DKMDT_VPPS_CENTERED
     * @type {Integer (Int32)}
     */
    static VPPS_CENTERED => 2

    /**
     * Native name: D3DKMDT_VPPS_STRETCHED
     * @type {Integer (Int32)}
     */
    static VPPS_STRETCHED => 3

    /**
     * Native name: D3DKMDT_VPPS_ASPECTRATIOCENTEREDMAX
     * @type {Integer (Int32)}
     */
    static VPPS_ASPECTRATIOCENTEREDMAX => 4

    /**
     * Native name: D3DKMDT_VPPS_CUSTOM
     * @type {Integer (Int32)}
     */
    static VPPS_CUSTOM => 5

    /**
     * Native name: D3DKMDT_VPPS_RESERVED1
     * @type {Integer (Int32)}
     */
    static VPPS_RESERVED1 => 253

    /**
     * Native name: D3DKMDT_VPPS_UNPINNED
     * @type {Integer (Int32)}
     */
    static VPPS_UNPINNED => 254

    /**
     * Native name: D3DKMDT_VPPS_NOTSPECIFIED
     * @type {Integer (Int32)}
     */
    static VPPS_NOTSPECIFIED => 255
}

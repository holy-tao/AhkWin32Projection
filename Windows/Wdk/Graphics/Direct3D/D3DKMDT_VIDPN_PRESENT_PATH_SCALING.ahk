#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_VIDPN_PRESENT_PATH_SCALING extends Win32Enum{

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

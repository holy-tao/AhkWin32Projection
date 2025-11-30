#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_VIDPN_PRESENT_PATH_IMPORTANCE extends Win32Enum{

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

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDPN_PRESENT_PATH_IMPORTANCE extends Win32Enum {

    /**
     * Native name: D3DKMDT_VPPI_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static VPPI_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_VPPI_PRIMARY
     * @type {Integer (Int32)}
     */
    static VPPI_PRIMARY => 1

    /**
     * Native name: D3DKMDT_VPPI_SECONDARY
     * @type {Integer (Int32)}
     */
    static VPPI_SECONDARY => 2

    /**
     * Native name: D3DKMDT_VPPI_TERTIARY
     * @type {Integer (Int32)}
     */
    static VPPI_TERTIARY => 3

    /**
     * Native name: D3DKMDT_VPPI_QUATERNARY
     * @type {Integer (Int32)}
     */
    static VPPI_QUATERNARY => 4

    /**
     * Native name: D3DKMDT_VPPI_QUINARY
     * @type {Integer (Int32)}
     */
    static VPPI_QUINARY => 5

    /**
     * Native name: D3DKMDT_VPPI_SENARY
     * @type {Integer (Int32)}
     */
    static VPPI_SENARY => 6

    /**
     * Native name: D3DKMDT_VPPI_SEPTENARY
     * @type {Integer (Int32)}
     */
    static VPPI_SEPTENARY => 7

    /**
     * Native name: D3DKMDT_VPPI_OCTONARY
     * @type {Integer (Int32)}
     */
    static VPPI_OCTONARY => 8

    /**
     * Native name: D3DKMDT_VPPI_NONARY
     * @type {Integer (Int32)}
     */
    static VPPI_NONARY => 9

    /**
     * Native name: D3DKMDT_VPPI_DENARY
     * @type {Integer (Int32)}
     */
    static VPPI_DENARY => 10
}

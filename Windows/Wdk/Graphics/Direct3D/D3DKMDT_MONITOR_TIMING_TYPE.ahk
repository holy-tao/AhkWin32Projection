#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_TIMING_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMDT_MTT_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static MTT_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_MTT_ESTABLISHED
     * @type {Integer (Int32)}
     */
    static MTT_ESTABLISHED => 1

    /**
     * Native name: D3DKMDT_MTT_STANDARD
     * @type {Integer (Int32)}
     */
    static MTT_STANDARD => 2

    /**
     * Native name: D3DKMDT_MTT_EXTRASTANDARD
     * @type {Integer (Int32)}
     */
    static MTT_EXTRASTANDARD => 3

    /**
     * Native name: D3DKMDT_MTT_DETAILED
     * @type {Integer (Int32)}
     */
    static MTT_DETAILED => 4

    /**
     * Native name: D3DKMDT_MTT_DEFAULTMONITORPROFILE
     * @type {Integer (Int32)}
     */
    static MTT_DEFAULTMONITORPROFILE => 5

    /**
     * Native name: D3DKMDT_MTT_DRIVER
     * @type {Integer (Int32)}
     */
    static MTT_DRIVER => 6
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_MONITOR_TIMING_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_ESTABLISHED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_STANDARD => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_EXTRASTANDARD => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_DETAILED => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_DEFAULTMONITORPROFILE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MTT_DRIVER => 6
}

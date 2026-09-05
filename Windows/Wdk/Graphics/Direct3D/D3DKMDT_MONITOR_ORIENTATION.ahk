#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_ORIENTATION extends Win32Enum {

    /**
     * Native name: D3DKMDT_MO_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static MO_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_MO_0DEG
     * @type {Integer (Int32)}
     */
    static MO_0DEG => 1

    /**
     * Native name: D3DKMDT_MO_90DEG
     * @type {Integer (Int32)}
     */
    static MO_90DEG => 2

    /**
     * Native name: D3DKMDT_MO_180DEG
     * @type {Integer (Int32)}
     */
    static MO_180DEG => 3

    /**
     * Native name: D3DKMDT_MO_270DEG
     * @type {Integer (Int32)}
     */
    static MO_270DEG => 4
}

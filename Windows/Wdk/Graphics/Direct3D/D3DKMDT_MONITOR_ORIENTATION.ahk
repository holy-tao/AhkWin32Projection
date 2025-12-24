#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_MONITOR_ORIENTATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MO_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MO_0DEG => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MO_90DEG => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MO_180DEG => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MO_270DEG => 4
}

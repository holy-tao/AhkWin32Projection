#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_CONNECTIVITY_CHECKS extends Win32Enum {

    /**
     * Native name: D3DKMDT_MCC_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static MCC_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_MCC_IGNORE
     * @type {Integer (Int32)}
     */
    static MCC_IGNORE => 1

    /**
     * Native name: D3DKMDT_MCC_ENFORCE
     * @type {Integer (Int32)}
     */
    static MCC_ENFORCE => 2
}

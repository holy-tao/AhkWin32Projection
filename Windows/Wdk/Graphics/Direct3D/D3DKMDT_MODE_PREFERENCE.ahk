#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MODE_PREFERENCE extends Win32Enum {

    /**
     * Native name: D3DKMDT_MP_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static MP_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_MP_PREFERRED
     * @type {Integer (Int32)}
     */
    static MP_PREFERRED => 1

    /**
     * Native name: D3DKMDT_MP_NOTPREFERRED
     * @type {Integer (Int32)}
     */
    static MP_NOTPREFERRED => 2
}

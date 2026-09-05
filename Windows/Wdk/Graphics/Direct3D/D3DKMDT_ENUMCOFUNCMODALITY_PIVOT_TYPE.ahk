#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_ENUMCOFUNCMODALITY_PIVOT_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMDT_EPT_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static EPT_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_EPT_VIDPNSOURCE
     * @type {Integer (Int32)}
     */
    static EPT_VIDPNSOURCE => 1

    /**
     * Native name: D3DKMDT_EPT_VIDPNTARGET
     * @type {Integer (Int32)}
     */
    static EPT_VIDPNTARGET => 2

    /**
     * Native name: D3DKMDT_EPT_SCALING
     * @type {Integer (Int32)}
     */
    static EPT_SCALING => 3

    /**
     * Native name: D3DKMDT_EPT_ROTATION
     * @type {Integer (Int32)}
     */
    static EPT_ROTATION => 4

    /**
     * Native name: D3DKMDT_EPT_NOPIVOT
     * @type {Integer (Int32)}
     */
    static EPT_NOPIVOT => 5
}

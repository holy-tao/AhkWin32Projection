#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DEVICEESCAPE_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_DEVICEESCAPE_VIDPNFROMALLOCATION
     * @type {Integer (Int32)}
     */
    static VIDPNFROMALLOCATION => 0

    /**
     * Native name: D3DKMT_DEVICEESCAPE_RESTOREGAMMA
     * @type {Integer (Int32)}
     */
    static RESTOREGAMMA => 1
}

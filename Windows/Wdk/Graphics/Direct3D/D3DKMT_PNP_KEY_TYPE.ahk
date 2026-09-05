#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_PNP_KEY_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_PNP_KEY_HARDWARE
     * @type {Integer (Int32)}
     */
    static HARDWARE => 1

    /**
     * Native name: D3DKMT_PNP_KEY_SOFTWARE
     * @type {Integer (Int32)}
     */
    static SOFTWARE => 2
}

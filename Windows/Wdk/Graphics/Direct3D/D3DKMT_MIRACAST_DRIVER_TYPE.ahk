#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MIRACAST_DRIVER_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_MIRACAST_DRIVER_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 0

    /**
     * Native name: D3DKMT_MIRACAST_DRIVER_IHV
     * @type {Integer (Int32)}
     */
    static IHV => 1

    /**
     * Native name: D3DKMT_MIRACAST_DRIVER_MS
     * @type {Integer (Int32)}
     */
    static MS => 2
}

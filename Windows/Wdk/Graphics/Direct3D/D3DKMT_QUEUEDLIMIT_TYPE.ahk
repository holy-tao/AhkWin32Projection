#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUEUEDLIMIT_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_SET_QUEUEDLIMIT_PRESENT
     * @type {Integer (Int32)}
     */
    static SET_QUEUEDLIMIT_PRESENT => 1

    /**
     * Native name: D3DKMT_GET_QUEUEDLIMIT_PRESENT
     * @type {Integer (Int32)}
     */
    static GET_QUEUEDLIMIT_PRESENT => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_RECLAIM_RESULT extends Win32Enum {

    /**
     * Native name: D3DDDI_RECLAIM_RESULT_OK
     * @type {Integer (Int32)}
     */
    static OK => 0

    /**
     * Native name: D3DDDI_RECLAIM_RESULT_DISCARDED
     * @type {Integer (Int32)}
     */
    static DISCARDED => 1

    /**
     * Native name: D3DDDI_RECLAIM_RESULT_NOT_COMMITTED
     * @type {Integer (Int32)}
     */
    static NOT_COMMITTED => 2
}

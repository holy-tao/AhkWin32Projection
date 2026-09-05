#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_PAGINGQUEUE_PRIORITY extends Win32Enum {

    /**
     * Native name: D3DDDI_PAGINGQUEUE_PRIORITY_BELOW_NORMAL
     * @type {Integer (Int32)}
     */
    static BELOW_NORMAL => -1

    /**
     * Native name: D3DDDI_PAGINGQUEUE_PRIORITY_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: D3DDDI_PAGINGQUEUE_PRIORITY_ABOVE_NORMAL
     * @type {Integer (Int32)}
     */
    static ABOVE_NORMAL => 1
}

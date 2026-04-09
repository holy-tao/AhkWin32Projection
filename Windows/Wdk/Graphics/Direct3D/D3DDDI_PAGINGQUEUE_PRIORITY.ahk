#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_PAGINGQUEUE_PRIORITY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_PAGINGQUEUE_PRIORITY_BELOW_NORMAL => -1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_PAGINGQUEUE_PRIORITY_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_PAGINGQUEUE_PRIORITY_ABOVE_NORMAL => 1
}

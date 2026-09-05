#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_CANCEL_PRESENTS_OPERATION extends Win32Enum {

    /**
     * Native name: D3DKMT_CANCEL_PRESENTS_OPERATION_CANCEL_FROM
     * @type {Integer (Int32)}
     */
    static CANCEL_FROM => 0

    /**
     * Native name: D3DKMT_CANCEL_PRESENTS_OPERATION_REPROGRAM_INTERRUPT
     * @type {Integer (Int32)}
     */
    static REPROGRAM_INTERRUPT => 1
}

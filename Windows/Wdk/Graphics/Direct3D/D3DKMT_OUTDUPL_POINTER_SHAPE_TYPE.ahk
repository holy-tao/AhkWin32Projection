#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_OUTDUPL_POINTER_SHAPE_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_OUTDUPL_POINTER_SHAPE_TYPE_MONOCHROME
     * @type {Integer (Int32)}
     */
    static MONOCHROME => 1

    /**
     * Native name: D3DKMT_OUTDUPL_POINTER_SHAPE_TYPE_COLOR
     * @type {Integer (Int32)}
     */
    static COLOR => 2

    /**
     * Native name: D3DKMT_OUTDUPL_POINTER_SHAPE_TYPE_MASKED_COLOR
     * @type {Integer (Int32)}
     */
    static MASKED_COLOR => 4
}

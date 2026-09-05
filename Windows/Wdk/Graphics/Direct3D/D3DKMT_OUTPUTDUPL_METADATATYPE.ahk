#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_OUTPUTDUPL_METADATATYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_OUTPUTDUPL_METADATATYPE_DIRTY_RECTS
     * @type {Integer (Int32)}
     */
    static DIRTY_RECTS => 0

    /**
     * Native name: D3DKMT_OUTPUTDUPL_METADATATYPE_MOVE_RECTS
     * @type {Integer (Int32)}
     */
    static MOVE_RECTS => 1
}

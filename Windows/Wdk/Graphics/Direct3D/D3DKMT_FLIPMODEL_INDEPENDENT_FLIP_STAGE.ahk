#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE extends Win32Enum {

    /**
     * Native name: D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE_FLIP_SUBMITTED
     * @type {Integer (Int32)}
     */
    static FLIP_SUBMITTED => 0

    /**
     * Native name: D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE_FLIP_COMPLETE
     * @type {Integer (Int32)}
     */
    static FLIP_COMPLETE => 1
}

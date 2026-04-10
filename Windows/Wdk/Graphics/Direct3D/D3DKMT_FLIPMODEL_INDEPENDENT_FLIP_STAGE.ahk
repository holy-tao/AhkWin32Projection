#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE_FLIP_SUBMITTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE_FLIP_COMPLETE => 1
}

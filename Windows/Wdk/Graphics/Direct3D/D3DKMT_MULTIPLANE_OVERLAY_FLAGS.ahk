#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MULTIPLANE_OVERLAY_FLAGS extends Win32Enum {

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_FLAG_VERTICAL_FLIP
     * @type {Integer (Int32)}
     */
    static FLAG_VERTICAL_FLIP => 1

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_FLAG_HORIZONTAL_FLIP
     * @type {Integer (Int32)}
     */
    static FLAG_HORIZONTAL_FLIP => 2

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_FLAG_STATIC_CHECK
     * @type {Integer (Int32)}
     */
    static FLAG_STATIC_CHECK => 4
}

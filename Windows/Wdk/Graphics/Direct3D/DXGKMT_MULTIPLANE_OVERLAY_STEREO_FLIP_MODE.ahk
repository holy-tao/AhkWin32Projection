#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_MODE extends Win32Enum {

    /**
     * Native name: DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_FRAME0
     * @type {Integer (Int32)}
     */
    static FRAME0 => 1

    /**
     * Native name: DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_FRAME1
     * @type {Integer (Int32)}
     */
    static FRAME1 => 2
}

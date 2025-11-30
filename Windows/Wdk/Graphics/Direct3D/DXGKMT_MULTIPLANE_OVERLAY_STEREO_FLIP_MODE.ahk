#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_FRAME0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_FRAME1 => 2
}

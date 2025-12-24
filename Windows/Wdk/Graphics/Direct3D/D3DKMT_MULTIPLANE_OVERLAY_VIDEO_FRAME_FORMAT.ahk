#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_MULTIPLANE_OVERLAY_VIDEO_FRAME_FORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MULIIPLANE_OVERLAY_VIDEO_FRAME_FORMAT_PROGRESSIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MULTIPLANE_OVERLAY_VIDEO_FRAME_FORMAT_INTERLACED_TOP_FIELD_FIRST => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MULTIPLANE_OVERLAY_VIDEO_FRAME_FORMAT_INTERLACED_BOTTOM_FIELD_FIRST => 2
}

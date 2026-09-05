#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_MONO => 0

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_HORIZONTAL
     * @type {Integer (Int32)}
     */
    static HORIZONTAL => 1

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_VERTICAL
     * @type {Integer (Int32)}
     */
    static VERTICAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_SEPARATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_MONO_OFFSET => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_ROW_INTERLEAVED => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_COLUMN_INTERLEAVED => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_CHECKERBOARD => 7
}

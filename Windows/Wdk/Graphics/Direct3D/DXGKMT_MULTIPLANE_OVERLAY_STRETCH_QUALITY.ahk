#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY extends Win32Enum {

    /**
     * Native name: DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY_BILINEAR
     * @type {Integer (Int32)}
     */
    static BILINEAR => 1

    /**
     * Native name: DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MULTIPLANE_OVERLAY_YCbCr_FLAGS extends Win32Enum {

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_YCbCr_FLAG_NOMINAL_RANGE
     * @type {Integer (Int32)}
     */
    static FLAG_NOMINAL_RANGE => 1

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_YCbCr_FLAG_BT709
     * @type {Integer (Int32)}
     */
    static FLAG_BT709 => 2

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_YCbCr_FLAG_xvYCC
     * @type {Integer (Int32)}
     */
    static FLAG_xvYCC => 4
}

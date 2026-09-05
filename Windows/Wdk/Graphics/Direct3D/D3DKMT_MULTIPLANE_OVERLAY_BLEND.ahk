#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MULTIPLANE_OVERLAY_BLEND extends Win32Enum {

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_BLEND_OPAQUE
     * @type {Integer (Int32)}
     */
    static OPAQUE => 0

    /**
     * Native name: D3DKMT_MULTIPLANE_OVERLAY_BLEND_ALPHABLEND
     * @type {Integer (Int32)}
     */
    static ALPHABLEND => 1
}

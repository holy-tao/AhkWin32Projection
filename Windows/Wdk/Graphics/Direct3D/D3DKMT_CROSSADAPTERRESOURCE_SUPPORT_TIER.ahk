#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER extends Win32Enum {

    /**
     * Native name: D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 1

    /**
     * Native name: D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER_TEXTURE
     * @type {Integer (Int32)}
     */
    static TEXTURE => 2

    /**
     * Native name: D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER_SCANOUT
     * @type {Integer (Int32)}
     */
    static SCANOUT => 3
}

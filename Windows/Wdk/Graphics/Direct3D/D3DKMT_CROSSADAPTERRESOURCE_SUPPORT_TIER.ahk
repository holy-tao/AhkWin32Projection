#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER_COPY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER_TEXTURE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER_SCANOUT => 3
}

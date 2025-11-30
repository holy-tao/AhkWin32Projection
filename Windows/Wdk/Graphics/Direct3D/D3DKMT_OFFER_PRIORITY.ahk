#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_OFFER_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_OFFER_PRIORITY_LOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_OFFER_PRIORITY_NORMAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_OFFER_PRIORITY_HIGH => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_OFFER_PRIORITY_AUTO => 4
}

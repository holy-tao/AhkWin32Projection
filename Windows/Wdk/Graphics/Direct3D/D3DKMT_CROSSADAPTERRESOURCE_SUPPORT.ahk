#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_CROSSADAPTERRESOURCE_SUPPORT extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER}
     */
    SupportTier {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}

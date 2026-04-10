#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DHAL_DP2LINESTRIP extends Win32Struct {
    static sizeof => 2

    static packingSize => 2

    /**
     * @type {Integer}
     */
    wVStart {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}

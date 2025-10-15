#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS18 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    RenderPassesValid{
        get {
            if(!this.HasProp("__RenderPassesValid"))
                this.__RenderPassesValid := BOOL(this.ptr + 0)
            return this.__RenderPassesValid
        }
    }
}

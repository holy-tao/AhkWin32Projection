#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_DISPLAYABLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    DisplayableTexture{
        get {
            if(!this.HasProp("__DisplayableTexture"))
                this.__DisplayableTexture := BOOL(this.ptr + 0)
            return this.__DisplayableTexture
        }
    }

    /**
     * @type {Integer}
     */
    SharedResourceCompatibilityTier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

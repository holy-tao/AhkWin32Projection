#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS14 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    AdvancedTextureOpsSupported{
        get {
            if(!this.HasProp("__AdvancedTextureOpsSupported"))
                this.__AdvancedTextureOpsSupported := BOOL(this.ptr + 0)
            return this.__AdvancedTextureOpsSupported
        }
    }

    /**
     * @type {BOOL}
     */
    WriteableMSAATexturesSupported{
        get {
            if(!this.HasProp("__WriteableMSAATexturesSupported"))
                this.__WriteableMSAATexturesSupported := BOOL(this.ptr + 4)
            return this.__WriteableMSAATexturesSupported
        }
    }

    /**
     * @type {BOOL}
     */
    IndependentFrontAndBackStencilRefMaskSupported{
        get {
            if(!this.HasProp("__IndependentFrontAndBackStencilRefMaskSupported"))
                this.__IndependentFrontAndBackStencilRefMaskSupported := BOOL(this.ptr + 8)
            return this.__IndependentFrontAndBackStencilRefMaskSupported
        }
    }
}

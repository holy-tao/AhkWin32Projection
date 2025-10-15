#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS21 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    WorkGraphsTier {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ExecuteIndirectTier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    SampleCmpGradientAndBiasSupported{
        get {
            if(!this.HasProp("__SampleCmpGradientAndBiasSupported"))
                this.__SampleCmpGradientAndBiasSupported := BOOL(this.ptr + 8)
            return this.__SampleCmpGradientAndBiasSupported
        }
    }

    /**
     * @type {BOOL}
     */
    ExtendedCommandInfoSupported{
        get {
            if(!this.HasProp("__ExtendedCommandInfoSupported"))
                this.__ExtendedCommandInfoSupported := BOOL(this.ptr + 12)
            return this.__ExtendedCommandInfoSupported
        }
    }
}

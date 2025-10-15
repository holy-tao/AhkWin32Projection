#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS12 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MSPrimitivesPipelineStatisticIncludesCulledPrimitives {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    EnhancedBarriersSupported{
        get {
            if(!this.HasProp("__EnhancedBarriersSupported"))
                this.__EnhancedBarriersSupported := BOOL(this.ptr + 4)
            return this.__EnhancedBarriersSupported
        }
    }

    /**
     * @type {BOOL}
     */
    RelaxedFormatCastingSupported{
        get {
            if(!this.HasProp("__RelaxedFormatCastingSupported"))
                this.__RelaxedFormatCastingSupported := BOOL(this.ptr + 8)
            return this.__RelaxedFormatCastingSupported
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS19 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    MismatchingOutputDimensionsSupported{
        get {
            if(!this.HasProp("__MismatchingOutputDimensionsSupported"))
                this.__MismatchingOutputDimensionsSupported := BOOL(this.ptr + 0)
            return this.__MismatchingOutputDimensionsSupported
        }
    }

    /**
     * @type {Integer}
     */
    SupportedSampleCountsWithNoOutputs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    PointSamplingAddressesNeverRoundUp{
        get {
            if(!this.HasProp("__PointSamplingAddressesNeverRoundUp"))
                this.__PointSamplingAddressesNeverRoundUp := BOOL(this.ptr + 8)
            return this.__PointSamplingAddressesNeverRoundUp
        }
    }

    /**
     * @type {BOOL}
     */
    RasterizerDesc2Supported{
        get {
            if(!this.HasProp("__RasterizerDesc2Supported"))
                this.__RasterizerDesc2Supported := BOOL(this.ptr + 12)
            return this.__RasterizerDesc2Supported
        }
    }

    /**
     * @type {BOOL}
     */
    NarrowQuadrilateralLinesSupported{
        get {
            if(!this.HasProp("__NarrowQuadrilateralLinesSupported"))
                this.__NarrowQuadrilateralLinesSupported := BOOL(this.ptr + 16)
            return this.__NarrowQuadrilateralLinesSupported
        }
    }

    /**
     * @type {BOOL}
     */
    AnisoFilterWithPointMipSupported{
        get {
            if(!this.HasProp("__AnisoFilterWithPointMipSupported"))
                this.__AnisoFilterWithPointMipSupported := BOOL(this.ptr + 20)
            return this.__AnisoFilterWithPointMipSupported
        }
    }

    /**
     * @type {Integer}
     */
    MaxSamplerDescriptorHeapSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MaxSamplerDescriptorHeapSizeWithStaticSamplers {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    MaxViewDescriptorHeapSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {BOOL}
     */
    ComputeOnlyCustomHeapSupported{
        get {
            if(!this.HasProp("__ComputeOnlyCustomHeapSupported"))
                this.__ComputeOnlyCustomHeapSupported := BOOL(this.ptr + 36)
            return this.__ComputeOnlyCustomHeapSupported
        }
    }
}

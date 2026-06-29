#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS19 {
    #StructPack 4

    MismatchingOutputDimensionsSupported : BOOL

    SupportedSampleCountsWithNoOutputs : UInt32

    PointSamplingAddressesNeverRoundUp : BOOL

    RasterizerDesc2Supported : BOOL

    NarrowQuadrilateralLinesSupported : BOOL

    AnisoFilterWithPointMipSupported : BOOL

    MaxSamplerDescriptorHeapSize : UInt32

    MaxSamplerDescriptorHeapSizeWithStaticSamplers : UInt32

    MaxViewDescriptorHeapSize : UInt32

    ComputeOnlyCustomHeapSupported : BOOL

}

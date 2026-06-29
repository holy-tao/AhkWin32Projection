#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_WORK_GRAPHS_TIER.ahk" { D3D12_WORK_GRAPHS_TIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_EXECUTE_INDIRECT_TIER.ahk" { D3D12_EXECUTE_INDIRECT_TIER }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS21 {
    #StructPack 4

    WorkGraphsTier : D3D12_WORK_GRAPHS_TIER

    ExecuteIndirectTier : D3D12_EXECUTE_INDIRECT_TIER

    SampleCmpGradientAndBiasSupported : BOOL

    ExtendedCommandInfoSupported : BOOL

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RECREATE_AT_TIER.ahk" { D3D12_RECREATE_AT_TIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS20 {
    #StructPack 4

    ComputeOnlyWriteWatchSupported : BOOL

    RecreateAtTier : D3D12_RECREATE_AT_TIER

}

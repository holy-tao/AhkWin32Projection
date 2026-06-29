#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_TIGHT_ALIGNMENT_TIER.ahk" { D3D12_TIGHT_ALIGNMENT_TIER }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_TIGHT_ALIGNMENT {
    #StructPack 4

    SupportTier : D3D12_TIGHT_ALIGNMENT_TIER

}

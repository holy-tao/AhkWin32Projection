#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_SHADER_ACCESS_RESTRICTED_RESOURCE_TIER.ahk" { D3D11_SHADER_ACCESS_RESTRICTED_RESOURCE_TIER }

/**
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FEATURE_DATA_D3D11_OPTIONS6 {
    #StructPack 4

    ShaderAccessRestrictedResourceTier : D3D11_SHADER_ACCESS_RESTRICTED_RESOURCE_TIER

}

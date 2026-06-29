#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER.ahk" { D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CROSSADAPTERRESOURCE_SUPPORT {
    #StructPack 4

    SupportTier : D3DKMT_CROSSADAPTERRESOURCE_SUPPORT_TIER

}

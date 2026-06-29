#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_VIDPN_PRESENT_PATH_IMPORTANCE.ahk" { D3DKMDT_VIDPN_PRESENT_PATH_IMPORTANCE }
#Import ".\D3DKMDT_VIDPN_PRESENT_PATH_CONTENT.ahk" { D3DKMDT_VIDPN_PRESENT_PATH_CONTENT }
#Import ".\D3DKMDT_COLOR_BASIS.ahk" { D3DKMDT_COLOR_BASIS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_PRESENT_PATH {
    #StructPack 8

    VidPnSourceId : UInt32

    VidPnTargetId : UInt32

    ImportanceOrdinal : D3DKMDT_VIDPN_PRESENT_PATH_IMPORTANCE

    ContentTransformation : IntPtr

    VisibleFromActiveTLOffset : IntPtr

    VisibleFromActiveBROffset : IntPtr

    VidPnTargetColorBasis : D3DKMDT_COLOR_BASIS

    VidPnTargetColorCoeffDynamicRanges : IntPtr

    Content : D3DKMDT_VIDPN_PRESENT_PATH_CONTENT

    CopyProtection : IntPtr

    GammaRamp : IntPtr

}

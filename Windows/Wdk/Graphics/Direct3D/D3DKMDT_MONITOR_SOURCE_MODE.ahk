#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_MONITOR_CAPABILITIES_ORIGIN.ahk" { D3DKMDT_MONITOR_CAPABILITIES_ORIGIN }
#Import ".\D3DKMDT_MODE_PREFERENCE.ahk" { D3DKMDT_MODE_PREFERENCE }
#Import ".\D3DKMDT_COLOR_BASIS.ahk" { D3DKMDT_COLOR_BASIS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_MONITOR_SOURCE_MODE {
    #StructPack 8

    Id : UInt32

    VideoSignalInfo : IntPtr

    ColorBasis : D3DKMDT_COLOR_BASIS

    ColorCoeffDynamicRanges : IntPtr

    Origin : D3DKMDT_MONITOR_CAPABILITIES_ORIGIN

    Preference : D3DKMDT_MODE_PREFERENCE

}

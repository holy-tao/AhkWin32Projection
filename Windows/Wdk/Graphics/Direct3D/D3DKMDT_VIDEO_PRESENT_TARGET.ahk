#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_VIDEO_OUTPUT_TECHNOLOGY.ahk" { D3DKMDT_VIDEO_OUTPUT_TECHNOLOGY }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\D3DKMDT_MONITOR_ORIENTATION_AWARENESS.ahk" { D3DKMDT_MONITOR_ORIENTATION_AWARENESS }
#Import ".\DXGK_CHILD_DEVICE_HPD_AWARENESS.ahk" { DXGK_CHILD_DEVICE_HPD_AWARENESS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDEO_PRESENT_TARGET {
    #StructPack 4

    Id : UInt32

    VideoOutputTechnology : D3DKMDT_VIDEO_OUTPUT_TECHNOLOGY

    VideoOutputHpdAwareness : DXGK_CHILD_DEVICE_HPD_AWARENESS

    MonitorOrientationAwareness : D3DKMDT_MONITOR_ORIENTATION_AWARENESS

    SupportsSdtvModes : BOOLEAN

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_VIDEO_SIGNAL_STANDARD.ahk" { D3DKMDT_VIDEO_SIGNAL_STANDARD }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_TARGETMODE_DETAIL_TIMING {
    #StructPack 8

    VideoStandard : D3DKMDT_VIDEO_SIGNAL_STANDARD

    TimingId : UInt32

    DetailTiming : IntPtr

}

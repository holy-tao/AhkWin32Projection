#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_FEATURE_AREA_SUPPORT {
    #StructPack 4

    NodeIndex : UInt32

    VideoDecodeSupport : BOOL

    VideoProcessSupport : BOOL

    VideoEncodeSupport : BOOL

}

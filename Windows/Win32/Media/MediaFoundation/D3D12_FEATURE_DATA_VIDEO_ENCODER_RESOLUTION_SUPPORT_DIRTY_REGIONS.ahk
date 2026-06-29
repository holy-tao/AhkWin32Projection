#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAGS }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_DIRTY_REGIONS {
    #StructPack 4

    DirtyRegionsSupportFlags : D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAGS

    MapSourcePreferenceRanking : UInt32

}

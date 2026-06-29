#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines subregions as slices for codecs that support this partitioning mode.
 * @remarks
 * For modes that imply a fixed number of slices, the number of slices selected must be less than indicated by [D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS.MaxSubregionsNumber](ns-d3d12video-d3d12_feature_data_video_encoder_resolution_support_limits.md) and the selected resolution.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_subregions_layout_data_slices
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_SLICES {
    #StructPack 4

    MaxBytesPerSlice : UInt32

    static __New() {
        DefineProp(this.Prototype, 'NumberOfCodingUnitsPerSlice', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'NumberOfRowsPerSlice', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'NumberOfSlicesPerFrame', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}

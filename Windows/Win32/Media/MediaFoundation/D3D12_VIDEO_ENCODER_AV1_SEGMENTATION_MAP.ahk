#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MAP {
    #StructPack 8

    SegmentsMapByteSize : UInt32

    pSegmentsMap : IntPtr

}

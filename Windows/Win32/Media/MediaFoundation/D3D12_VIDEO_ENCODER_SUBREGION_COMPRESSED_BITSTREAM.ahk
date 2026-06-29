#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D12\ID3D12Fence.ahk" { ID3D12Fence }
#Import ".\D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM_BUFFER_MODE.ahk" { D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM_BUFFER_MODE }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM {
    #StructPack 8

    BufferMode : D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM_BUFFER_MODE

    ExpectedSubregionCount : UInt32

    pSubregionBitstreamsBaseOffsets : IntPtr

    ppSubregionBitstreams : ID3D12Resource.Ptr

    ppSubregionSizes : ID3D12Resource.Ptr

    ppSubregionOffsets : ID3D12Resource.Ptr

    ppSubregionFences : ID3D12Fence.Ptr

    pSubregionFenceValues : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk" { D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS1 {
    #StructPack 8

    ResolvedLayoutMetadata : D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER

    pOutputQPMap : ID3D12Resource

    pOutputSATDMap : ID3D12Resource

    pOutputBitAllocationMap : ID3D12Resource

    ResolvedFramePSNRData : D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER

    ResolvedSubregionsPSNRData : D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER

}

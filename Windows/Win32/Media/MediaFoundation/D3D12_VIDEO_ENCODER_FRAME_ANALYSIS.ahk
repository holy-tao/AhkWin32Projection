#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODE_REFERENCE_FRAMES.ahk" { D3D12_VIDEO_ENCODE_REFERENCE_FRAMES }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_FRAME_ANALYSIS {
    #StructPack 8

    pDownscaledFrame : ID3D12Resource

    Subresource : Int64

    DownscaledReferences : D3D12_VIDEO_ENCODE_REFERENCE_FRAMES

}

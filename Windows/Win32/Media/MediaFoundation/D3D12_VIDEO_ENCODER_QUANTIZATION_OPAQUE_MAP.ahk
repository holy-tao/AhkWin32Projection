#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_QUANTIZATION_OPAQUE_MAP {
    #StructPack 8

    pOpaqueQuantizationMap : ID3D12Resource

}

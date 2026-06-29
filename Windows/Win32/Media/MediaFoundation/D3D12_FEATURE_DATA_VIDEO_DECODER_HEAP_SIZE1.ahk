#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk" { D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE }
#Import ".\D3D12_VIDEO_DECODE_CONFIGURATION.ahk" { D3D12_VIDEO_DECODE_CONFIGURATION }
#Import ".\D3D12_VIDEO_DECODER_HEAP_DESC.ahk" { D3D12_VIDEO_DECODER_HEAP_DESC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk" { D3D12_BITSTREAM_ENCRYPTION_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_DECODER_HEAP_SIZE1 {
    #StructPack 8

    VideoDecoderHeapDesc : D3D12_VIDEO_DECODER_HEAP_DESC

    Protected : BOOL

    MemoryPoolL0Size : Int64

    MemoryPoolL1Size : Int64

}

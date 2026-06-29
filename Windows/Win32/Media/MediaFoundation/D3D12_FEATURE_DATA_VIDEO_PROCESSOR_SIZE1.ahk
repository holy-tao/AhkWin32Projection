#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC.ahk" { D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC }
#Import ".\D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC.ahk" { D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_PROCESSOR_SIZE1 {
    #StructPack 8

    NodeMask : UInt32

    pOutputStreamDesc : D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC.Ptr

    NumInputStreamDescs : UInt32

    pInputStreamDescs : D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC.Ptr

    Protected : BOOL

    MemoryPoolL0Size : Int64

    MemoryPoolL1Size : Int64

}

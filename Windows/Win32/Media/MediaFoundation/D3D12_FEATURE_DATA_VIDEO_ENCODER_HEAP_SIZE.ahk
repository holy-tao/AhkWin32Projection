#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.ahk" { D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_HEAP_DESC.ahk" { D3D12_VIDEO_ENCODER_HEAP_DESC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk" { D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC }
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.ahk" { D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_LEVELS_H264.ahk" { D3D12_VIDEO_ENCODER_LEVELS_H264 }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_HEAP_FLAGS.ahk" { D3D12_VIDEO_ENCODER_HEAP_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk" { D3D12_VIDEO_ENCODER_LEVEL_SETTING }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }

/**
 * Retrieves a value indicating if the specified codec is supported for video encoding as well as the L0 and L1 sizes of the heap object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_heap_size
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_HEAP_SIZE {
    #StructPack 8

    /**
     * A [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) structure specifying the creation properties for a video encoder heap. The driver should map these creation properties to size and assume the maximum resolution allowed for such heap.
     */
    HeapDesc : D3D12_VIDEO_ENCODER_HEAP_DESC

    /**
     * Receives a boolean value indicating if the encoder creation properties provided in **HeapDesc** are supported.
     */
    IsSupported : BOOL

    /**
     * Receives the L0 size of the heap object. Memory Pool L0 is the memory pool “closest” to the GPU. In the case of UMA adapters, this is the amount of system memory used. For discrete adapters, this is the amount of discrete memory used.
     */
    MemoryPoolL0Size : Int64

    /**
     * Receives the L1 size of the heap object. Memory Pool L1 is the memory pool “second closest” to the GPU. In the case of UMA adapters, this value is zero. In the case of discrete adapters, this is the amount of system memory used.
     */
    MemoryPoolL1Size : Int64

}

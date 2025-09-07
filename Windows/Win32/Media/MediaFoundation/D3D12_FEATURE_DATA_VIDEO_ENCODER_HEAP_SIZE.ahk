#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_HEAP_DESC.ahk

/**
 * Retrieves a value indicating if the specified codec is supported for video encoding as well as the L0 and L1 sizes of the heap object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_heap_size
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_HEAP_SIZE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) structure specifying the creation properties for a video encoder heap. The driver should map these creation properties to size and assume the maximum resolution allowed for such heap.
     * @type {D3D12_VIDEO_ENCODER_HEAP_DESC}
     */
    HeapDesc{
        get {
            if(!this.HasProp("__HeapDesc"))
                this.__HeapDesc := D3D12_VIDEO_ENCODER_HEAP_DESC(this.ptr + 0)
            return this.__HeapDesc
        }
    }

    /**
     * Receives a boolean value indicating if the encoder creation properties provided in **HeapDesc** are supported.
     * @type {Integer}
     */
    IsSupported {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Receives the L0 size of the heap object. Memory Pool L0 is the memory pool “closest” to the GPU. In the case of UMA adapters, this is the amount of system memory used. For discrete adapters, this is the amount of discrete memory used.
     * @type {Integer}
     */
    MemoryPoolL0Size {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Receives the L1 size of the heap object. Memory Pool L1 is the memory pool “second closest” to the GPU. In the case of UMA adapters, this value is zero. In the case of discrete adapters, this is the amount of system memory used.
     * @type {Integer}
     */
    MemoryPoolL1Size {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_SIZE_RANGE.ahk

/**
 * Provides data for calls to ID3D12VideoDevice::CheckFeatureSupport when the feature specified is D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR. Retrieves the motion estimation capabilities for a video encoder.
 * @remarks
 * When the format is not supported with motion estimation, *BlockSizeFlags* will be set to [D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAG_NONE](ne-d3d12video-d3d12_video_motion_estimator_search_block_size_flags.md), *PrecisionFlags* will be set to [D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_FLAG_NONE](ne-d3d12video-d3d12_video_motion_estimator_vector_precision_flags.md), and the *SizeRange* will be set to all zeros.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_motion_estimator
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * In multi-adapter operation, identifies the physical adapter of the device this operation applies to.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) structure specifying the format of the input resources.
     * @type {Integer}
     */
    InputFormat {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAGS](ne-d3d12video-d3d12_video_motion_estimator_search_block_size_flags.md) enumeration specifying the encoder's supported search block sizes for motion estimation.
     * @type {Integer}
     */
    BlockSizeFlags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_FLAGS](ne-d3d12video-d3d12_video_motion_estimator_vector_precision_flags.md) enumeration specifying the encoder's supported vector precision for motion estimation.
     * @type {Integer}
     */
    PrecisionFlags {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure representing the minimum and maximum input size supported by the driver. The driver sets the fields of this structure to zero if motion estimation is unsupported.
     * @type {D3D12_VIDEO_SIZE_RANGE}
     */
    SizeRange{
        get {
            if(!this.HasProp("__SizeRange"))
                this.__SizeRange := D3D12_VIDEO_SIZE_RANGE(this.ptr + 16)
            return this.__SizeRange
        }
    }
}

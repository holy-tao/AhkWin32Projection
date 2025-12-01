#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_SIZE_RANGE.ahk

/**
 * Describes a ID3D12VideoMotionEstimatorHeap. Pass this structure into ID3D12VideoDevice1::CreateVideoMotionEstimatorHeap to create an instance of ID3D12VideoMotionEstimatorHeap.
 * @remarks
 * Call [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) and specify [D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR](ne-d3d12video-d3d12_feature_video.md) as the feature to determine supported values.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_motion_vector_heap_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value from the [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) enumeration specifying the format of the input and reference frames.
     * @type {Integer}
     */
    InputFormat {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A value from the [D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE](ne-d3d12video-d3d12_video_motion_estimator_search_block_size.md) enumeration specifying the search block size the video motion estimator will use.
     * @type {Integer}
     */
    BlockSize {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A value from the [D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION](ne-d3d12video-d3d12_video_motion_estimator_vector_precision.md) enumeration specifying the vector precision the video motion estimator will use.
     * @type {Integer}
     */
    Precision {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure representing the minimum and maximum input and reference frame size, in pixels, that the motion estimator will accept.
     * @type {D3D12_VIDEO_SIZE_RANGE}
     */
    SizeRange{
        get {
            if(!this.HasProp("__SizeRange"))
                this.__SizeRange := D3D12_VIDEO_SIZE_RANGE(16, this)
            return this.__SizeRange
        }
    }
}

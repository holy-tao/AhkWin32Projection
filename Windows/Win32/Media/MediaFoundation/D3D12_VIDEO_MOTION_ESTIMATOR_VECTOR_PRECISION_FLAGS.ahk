#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the motion estimation vector precision that a video encoder supports.
 * @remarks
 * Query for supported vector precision values by calling [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) and specifying the feature value of [D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR](ne-d3d12video-d3d12_feature_video.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_motion_estimator_vector_precision_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_FLAGS extends Win32BitflagEnum{

    /**
     * Vector precision is not supported by the encoder.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_FLAG_NONE => 0

    /**
     * The vector precision is quarter-pixel motion.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_FLAG_QUARTER_PEL => 1
}

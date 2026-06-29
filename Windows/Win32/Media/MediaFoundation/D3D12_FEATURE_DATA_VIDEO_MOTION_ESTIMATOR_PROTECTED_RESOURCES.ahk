#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS }

/**
 * Provides data for calls to ID3D12VideoDevice::CheckFeatureSupport when the feature specified is D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR_PROTECTED_RESOURCES. Retrieves the protected resources support for video motion estimation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_motion_estimator_protected_resources
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR_PROTECTED_RESOURCES {
    #StructPack 4

    /**
     * In multi-adapter operation, identifies the physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS](ne-d3d12video-d3d12_video_protected_resource_support_flags.md) enumeration specifying support for protected resources.
     */
    SupportFlags : D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS

}

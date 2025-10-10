#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides data for calls to ID3D12VideoDevice::CheckFeatureSupport when the feature specified is D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR_PROTECTED_RESOURCES. Retrieves the protected resources support for video motion estimation.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_feature_data_video_motion_estimator_protected_resources
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR_PROTECTED_RESOURCES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * In multi-adapter operation, identifies the physical adapter of the device this operation applies to.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A member of the [D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS](ne-d3d12video-d3d12_video_protected_resource_support_flags.md) enumeration specifying support for protected resources.
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

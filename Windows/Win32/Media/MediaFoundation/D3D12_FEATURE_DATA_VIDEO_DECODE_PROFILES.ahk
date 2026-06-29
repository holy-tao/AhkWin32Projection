#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Retrieves the list of supported profiles. (D3D12_FEATURE_DATA_VIDEO_DECODE_PROFILES)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_decode_profiles
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_DECODE_PROFILES {
    #StructPack 8

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeIndex : UInt32

    /**
     * The number of profiles to retrieve.  This number must match the value returned from a call [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) when the feature specified is [D3D12\_FEATURE\_VIDEO\_DECODE\_PROFILE\_COUNT](ne-d3d12video-d3d12_feature_video.md).
     */
    ProfileCount : UInt32

    /**
     * A list of GUIDs representing the supported profiles.  The calling application must allocate storage for the profile list before calling **CheckFeatureSupport**.
     */
    pProfiles : Guid.Ptr

}

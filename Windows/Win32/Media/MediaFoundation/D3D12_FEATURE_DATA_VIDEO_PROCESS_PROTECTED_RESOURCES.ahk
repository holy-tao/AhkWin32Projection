#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_PROCESS_PROTECTED_RESOURCES {
    #StructPack 4

    NodeIndex : UInt32

    SupportFlags : D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS

}

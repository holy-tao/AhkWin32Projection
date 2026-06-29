#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAGS.ahk" { D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAGS }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Provides data for calls to ID3D12VideoDevice::CheckFeatureSupport when the feature specified is D3D12_FEATURE_VIDEO_DECODE_HISTOGRAM.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_decode_histogram
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_DECODE_HISTOGRAM {
    #StructPack 4

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeIndex : UInt32

    /**
     * A GUID representing the decode profile for which histogram capabilities will be queried. Get a list of available profile GUIDs by calling [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) when the feature specified is [D3D12\_FEATURE\_VIDEO\_DECODE\_PROFILES](ne-d3d12video-d3d12_feature_video.md).
     */
    DecodeProfile : Guid

    /**
     * The decode width of the source stream.
     */
    Width : UInt32

    /**
     * The decode height of the source stream.
     */
    Height : UInt32

    /**
     * The [DXGI\_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) representing the decode format.
     */
    DecodeFormat : DXGI_FORMAT

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAGS](ne-d3d12video-d3d12_video_decode_histogram_component_flags.md) enumeration specifying the components of a DXGI_FORMAT for which histogram support will be queried.
     */
    Components : D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAGS

    /**
     * The number of per component bins supported. This value must be greater than or equal to 64 and must be a power of 2 (e.g. 64, 128, 256, 512...).
     */
    BinCount : UInt32

    /**
     * The bit depth of the bin counter.  The counter is always stored in a 32-bit value and therefore this value must specify 32 bits or less. The counter is stored in the lower bits of the 32-bit storage.  The upper bits are set to zero.  If the bin count exceeds this bit depth, the value is set to the maximum counter value. Valid values for *CounterBitDepth* are 16, 24, and 32.
     */
    CounterBitDepth : UInt32

}

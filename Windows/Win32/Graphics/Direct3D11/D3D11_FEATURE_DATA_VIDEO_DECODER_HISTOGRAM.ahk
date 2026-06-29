#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_VIDEO_DECODER_DESC.ahk" { D3D11_VIDEO_DECODER_DESC }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS.ahk" { D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Provides data for calls to ID3D11VideoDevice2::CheckFeatureSupport when the feature specified is D3D11_FEATURE_VIDEO_DECODER_HISTOGRAM.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/ns-d3d11_4-d3d11_feature_data_video_decoder_histogram
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FEATURE_DATA_VIDEO_DECODER_HISTOGRAM {
    #StructPack 4

    /**
     * A [D3D11_VIDEO_DECODER_DESC](../d3d11/ns-d3d11-d3d11_video_decoder_desc.md) structure containing the decoder description for the decoder to be used with decode histogram.
     */
    DecoderDesc : D3D11_VIDEO_DECODER_DESC

    /**
     * A bitwise OR combination of values from the [D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS](ne-d3d11_4-d3d11_video_decoder_histogram_component_flags.md) enumeration specifying the components of a DXGI_FORMAT for which histogram support will be queried.
     */
    Components : D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS

    /**
     * The number of per component bins supported. This value must be greater than or equal to 64 and must be a power of 2 (e.g. 64, 128, 256, 512...).
     */
    BinCount : UInt32

    /**
     * The bit depth of the bin counter.  The counter is always stored in a 32-bit value and therefore this value must specify 32 bits or less. The counter is stored in the lower bits of the 32-bit storage.  The upper bits are set to zero.  If the bin count exceeds this bit depth, the value is set to the maximum counter value. Valid values for *CounterBitDepth* are 16, 24, and 32.
     */
    CounterBitDepth : UInt32

}

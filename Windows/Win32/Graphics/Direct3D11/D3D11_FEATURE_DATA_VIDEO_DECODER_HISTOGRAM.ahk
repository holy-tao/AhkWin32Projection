#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_VIDEO_DECODER_DESC.ahk

/**
 * Provides data for calls to ID3D11VideoDevice2::CheckFeatureSupport when the feature specified is D3D11_FEATURE_VIDEO_DECODER_HISTOGRAM.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/ns-d3d11_4-d3d11_feature_data_video_decoder_histogram
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_VIDEO_DECODER_HISTOGRAM extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A [D3D11_VIDEO_DECODER_DESC](../d3d11/ns-d3d11-d3d11_video_decoder_desc.md) structure containing the decoder description for the decoder to be used with decode histogram.
     * @type {D3D11_VIDEO_DECODER_DESC}
     */
    DecoderDesc{
        get {
            if(!this.HasProp("__DecoderDesc"))
                this.__DecoderDesc := D3D11_VIDEO_DECODER_DESC(this.ptr + 0)
            return this.__DecoderDesc
        }
    }

    /**
     * A bitwise OR combination of values from the [D3D11_VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS](ne-d3d11_4-d3d11_video_decoder_histogram_component_flags.md) enumeration specifying the components of a DXGI_FORMAT for which histogram support will be queried.
     * @type {Integer}
     */
    Components {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The number of per component bins supported. This value must be greater than or equal to 64 and must be a power of 2 (e.g. 64, 128, 256, 512...).
     * @type {Integer}
     */
    BinCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The bit depth of the bin counter.  The counter is always stored in a 32-bit value and therefore this value must specify 32 bits or less. The counter is stored in the lower bits of the 32-bit storage.  The upper bits are set to zero.  If the bin count exceeds this bit depth, the value is set to the maximum counter value. Valid values for *CounterBitDepth* are 16, 24, and 32.
     * @type {Integer}
     */
    CounterBitDepth {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the color palette entries for an input stream, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * This stream state is used for input streams that have a palettized color format. Palettized formats with 4 bits per pixel (bpp) use the first 16 entries in the list. Formats with 8 bpp use the first 256 entries.
  * 
  * If a pixel has a palette index greater than the number of entries, the device treats the pixel as being white with opaque alpha. For full-range RGB, this value will be (255, 255, 255, 255); for YCbCr the value will be (255, 235, 128, 128).
  * 
  * The caller allocates the <b>pEntries</b> array. Set the <b>Count</b> member to the number of elements in the array. When retrieving the state data, you can set the <b>pEntries</b> member to <b>NULL</b> to get the number of palette entries. The device will return the count in the <b>Count</b> member.
  * 
  * If the DXVA-HD device does not have the <b>DXVAHD_FEATURE_CAPS_ALPHA_PALETTE</b> capability, every palette entry must have an alpha value of 0xFF (opaque). Otherwise, an error is returned from <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessstreamstate">IDXVAHD_VideoProcessor::SetVideoProcessStreamState</a>. 
  * 
  * To get the device capabilities, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> and check the <b>FeatureCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_palette_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_PALETTE_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of palette entries. The default state value is 0.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of <b>D3DCOLOR</b> values. For RGB streams, the palette entries use a D3DFMT_A8R8G8B8 (ARGB-32) representation. For YCbCr streams, the palette entries use an AYUV representation. The alpha channel is used for alpha blending; see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_alpha_data">DXVAHD_STREAM_STATE_ALPHA_DATA</a>.
     * @type {Pointer<UInt32>}
     */
    pEntries {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

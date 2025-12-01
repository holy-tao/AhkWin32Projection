#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the color space for video processing.
 * @remarks
 * The <b>RGB_Range</b> member applies to RGB output, while the <b>YCbCr_Matrix</b> and <b>YCbCr_xvYCC</b> members apply to YCbCr output. If the driver performs color-space conversion on the background color, it uses the values that apply to both color spaces.
 * 
 * 
 * 
 * If the driver supports extended YCbCr (xvYCC), it returns the <b>D3D11_VIDEO_PROCESSOR_DEVICE_CAPS_xvYCC</b> capabilities flag in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> method. Otherwise, the driver ignores the value of <b>YCbCr_xvYCC</b> and treats all YCbCr output as conventional YCbCr. 
 * 
 * If extended YCbCr is supported, it can be used with either transfer matrix. Extended YCbCr does not change the black point or white point—the black point is still 16 and the white point is still 235. However, extended YCbCr explicitly allows blacker-than-black values in the range 1–15, and whiter-than-white values in the range 236–254. When extended YCbCr is used, the driver should not clip the luma values to the nominal 16–235 range.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_color_space
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_COLOR_SPACE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Usage
     * - RGB_Range
     * - YCbCr_Matrix
     * - YCbCr_xvYCC
     * - Nominal_Range
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies whether the output is intended for playback or video processing (such as editing or authoring). The device can optimize the processing based on the type. The default state value is 0 (playback). 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Playback
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Video processing
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Usage {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Specifies the RGB color range. The default state value is 0 (full range).
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Full range (0-255)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Limited range (16-235)
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    RGB_Range {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * Specifies the YCbCr transfer matrix. The default state value is 0 (BT.601).
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ITU-R BT.601
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ITU-R BT.709
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    YCbCr_Matrix {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * Specifies whether the output uses conventional YCbCr or extended YCbCr (xvYCC). The default state value is zero (conventional YCbCr).
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Conventional YCbCr
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Extended YCbCr (xvYCC)
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    YCbCr_xvYCC {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_nominal_range">D3D11_VIDEO_PROCESSOR_NOMINAL_RANGE</a>.
     * 
     * 
     * 
     * Introduced in Windows 8.1.
     * @type {Integer}
     */
    Nominal_Range {
        get => (this._bitfield >> 4) & 0x3
        set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
    }
}

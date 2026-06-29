#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct D3D11_VIDEO_PROCESSOR_COLOR_SPACE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Usage
     * - RGB_Range
     * - YCbCr_Matrix
     * - YCbCr_xvYCC
     * - Nominal_Range
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Usage {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    RGB_Range {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    YCbCr_Matrix {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    YCbCr_xvYCC {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Nominal_Range {
        get => (this._bitfield >> 4) & 0x3
        set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
    }
}

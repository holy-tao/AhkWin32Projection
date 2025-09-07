#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VMRMixerPrefs enumeration contains flags that specify decimation, filtering, and color space information that will be used when the video image is created on the DirectDraw surface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vmrmixerprefs
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRMixerPrefs{

    /**
     * No decimation. The video will be rendered onto the surface in its native size.
     * @type {Integer (Int32)}
     */
    static MixerPref_NoDecimation => 1

    /**
     * Decimate output by 2 in the x and y directions.
     * @type {Integer (Int32)}
     */
    static MixerPref_DecimateOutput => 2

    /**
     * Adjust the horizontal or vertical size of the video streams to match the target aspect ratio. If this flag is not present, the VMR adjusts the horizontal size only. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/aspect-ratio-correction">Aspect Ratio Correction</a>.
     * @type {Integer (Int32)}
     */
    static MixerPref_ARAdjustXorY => 4

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MixerPref_DecimationReserved => 8

    /**
     * Bitmask to isolate the flags that control decimation. (This value is not a valid flag.)
     * @type {Integer (Int32)}
     */
    static MixerPref_DecimateMask => 15

    /**
     * Use bi-linear filtering. This is the default type of filtering, but not all cards can support it.
     * @type {Integer (Int32)}
     */
    static MixerPref_BiLinearFiltering => 16

    /**
     * Use point filtering.
     * @type {Integer (Int32)}
     */
    static MixerPref_PointFiltering => 32

    /**
     * Bitmask to isolate the flags the control filtering. (This value is not a valid flag.)
     * @type {Integer (Int32)}
     */
    static MixerPref_FilteringMask => 240

    /**
     * The render target is an RGB surface.
     * @type {Integer (Int32)}
     */
    static MixerPref_RenderTargetRGB => 256

    /**
     * The render target is a YUV surface. Requires Windows XP Service Pack 2. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/yuv-mixing-mode">YUV Mixing Mode</a>.
     * @type {Integer (Int32)}
     */
    static MixerPref_RenderTargetYUV => 4096

    /**
     * The render target is a YUV 4:2:0 surface. <div class="alert"><b>Note</b>  Deprecated.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MixerPref_RenderTargetYUV420 => 512

    /**
     * The render target is a YUV 4:2:2 surface. <div class="alert"><b>Note</b>  Deprecated.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MixerPref_RenderTargetYUV422 => 1024

    /**
     * The render target is a YUV 4:4:4 surface. <div class="alert"><b>Note</b>  Deprecated.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MixerPref_RenderTargetYUV444 => 2048

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MixerPref_RenderTargetReserved => 57344

    /**
     * Bitmask to isolate flags that control the render target. (This value is not a valid flag.)
     * @type {Integer (Int32)}
     */
    static MixerPref_RenderTargetMask => 65280

    /**
     * In YUV mixing mode only, this flag switches the VMR to bob deinterlacing. You can add or remove this flag while the filter graph is running; the change will be applied when the VMR mixer composes the next video frame.
     * @type {Integer (Int32)}
     */
    static MixerPref_DynamicSwitchToBOB => 65536

    /**
     * In YUV mixing mode only, this flag causes the VMR to decimate the image by a factor of 2 horizontally and vertically. You can add or remove this flag while the filter graph is running; the change is applied when the VMR mixer composes the next video frame.
     * @type {Integer (Int32)}
     */
    static MixerPref_DynamicDecimateBy2 => 131072

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MixerPref_DynamicReserved => 786432

    /**
     * Bitmask to isolate the MixerPref_DynamicSwitchToBOB and MixerPref_DynamicDecimateBy2 flags. (This value is not a valid flag.)
     * @type {Integer (Int32)}
     */
    static MixerPref_DynamicMask => 983040
}

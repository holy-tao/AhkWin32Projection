#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMRMixerPrefs enumeration contains flags that specify decimation, filtering, and color space information that will be used when the video image is created on the DirectDraw surface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vmrmixerprefs
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMRMixerPrefs extends Win32Enum {

    /**
     * No decimation. The video will be rendered onto the surface in its native size.
     * Native name: MixerPref_NoDecimation
     * @type {Integer (Int32)}
     */
    static Pref_NoDecimation => 1

    /**
     * Decimate output by 2 in the x and y directions.
     * Native name: MixerPref_DecimateOutput
     * @type {Integer (Int32)}
     */
    static Pref_DecimateOutput => 2

    /**
     * Adjust the horizontal or vertical size of the video streams to match the target aspect ratio. If this flag is not present, the VMR adjusts the horizontal size only. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/aspect-ratio-correction">Aspect Ratio Correction</a>.
     * Native name: MixerPref_ARAdjustXorY
     * @type {Integer (Int32)}
     */
    static Pref_ARAdjustXorY => 4

    /**
     * Reserved.
     * Native name: MixerPref_DecimationReserved
     * @type {Integer (Int32)}
     */
    static Pref_DecimationReserved => 8

    /**
     * Bitmask to isolate the flags that control decimation. (This value is not a valid flag.)
     * Native name: MixerPref_DecimateMask
     * @type {Integer (Int32)}
     */
    static Pref_DecimateMask => 15

    /**
     * Use bi-linear filtering. This is the default type of filtering, but not all cards can support it.
     * Native name: MixerPref_BiLinearFiltering
     * @type {Integer (Int32)}
     */
    static Pref_BiLinearFiltering => 16

    /**
     * Use point filtering.
     * Native name: MixerPref_PointFiltering
     * @type {Integer (Int32)}
     */
    static Pref_PointFiltering => 32

    /**
     * Bitmask to isolate the flags the control filtering. (This value is not a valid flag.)
     * Native name: MixerPref_FilteringMask
     * @type {Integer (Int32)}
     */
    static Pref_FilteringMask => 240

    /**
     * The render target is an RGB surface.
     * Native name: MixerPref_RenderTargetRGB
     * @type {Integer (Int32)}
     */
    static Pref_RenderTargetRGB => 256

    /**
     * The render target is a YUV surface. Requires Windows XP Service Pack 2. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/yuv-mixing-mode">YUV Mixing Mode</a>.
     * Native name: MixerPref_RenderTargetYUV
     * @type {Integer (Int32)}
     */
    static Pref_RenderTargetYUV => 4096

    /**
     * The render target is a YUV 4:2:0 surface. <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     * Native name: MixerPref_RenderTargetYUV420
     * @type {Integer (Int32)}
     */
    static Pref_RenderTargetYUV420 => 512

    /**
     * The render target is a YUV 4:2:2 surface. <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     * Native name: MixerPref_RenderTargetYUV422
     * @type {Integer (Int32)}
     */
    static Pref_RenderTargetYUV422 => 1024

    /**
     * The render target is a YUV 4:4:4 surface. <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     * Native name: MixerPref_RenderTargetYUV444
     * @type {Integer (Int32)}
     */
    static Pref_RenderTargetYUV444 => 2048

    /**
     * Reserved.
     * Native name: MixerPref_RenderTargetReserved
     * @type {Integer (Int32)}
     */
    static Pref_RenderTargetReserved => 57344

    /**
     * Bitmask to isolate flags that control the render target. (This value is not a valid flag.)
     * Native name: MixerPref_RenderTargetMask
     * @type {Integer (Int32)}
     */
    static Pref_RenderTargetMask => 65280

    /**
     * In YUV mixing mode only, this flag switches the VMR to bob deinterlacing. You can add or remove this flag while the filter graph is running; the change will be applied when the VMR mixer composes the next video frame.
     * Native name: MixerPref_DynamicSwitchToBOB
     * @type {Integer (Int32)}
     */
    static Pref_DynamicSwitchToBOB => 65536

    /**
     * In YUV mixing mode only, this flag causes the VMR to decimate the image by a factor of 2 horizontally and vertically. You can add or remove this flag while the filter graph is running; the change is applied when the VMR mixer composes the next video frame.
     * Native name: MixerPref_DynamicDecimateBy2
     * @type {Integer (Int32)}
     */
    static Pref_DynamicDecimateBy2 => 131072

    /**
     * Reserved.
     * Native name: MixerPref_DynamicReserved
     * @type {Integer (Int32)}
     */
    static Pref_DynamicReserved => 786432

    /**
     * Bitmask to isolate the MixerPref_DynamicSwitchToBOB and MixerPref_DynamicDecimateBy2 flags. (This value is not a valid flag.)
     * Native name: MixerPref_DynamicMask
     * @type {Integer (Int32)}
     */
    static Pref_DynamicMask => 983040
}

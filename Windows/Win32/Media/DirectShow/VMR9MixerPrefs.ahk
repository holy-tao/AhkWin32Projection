#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9MixerPrefs enumeration type contains flags that specify how the Video Mixing Render 9 filter (VMR-9) mixes the video streams. Settings include decimation, filtering, and render target preferences.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9mixerprefs
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMR9MixerPrefs extends Win32Enum {

    /**
     * No decimation. The video will be rendered onto the surface in its native size.
     * Native name: MixerPref9_NoDecimation
     * @type {Integer (Int32)}
     */
    static Pref9_NoDecimation => 1

    /**
     * Decimate output by 2 in the x and y directions.
     * Native name: MixerPref9_DecimateOutput
     * @type {Integer (Int32)}
     */
    static Pref9_DecimateOutput => 2

    /**
     * Adjust the horizontal or vertical size of the video streams to match the target aspect ratio. If this flag is not present, the VMR adjusts the horizontal size only. Requires Windows XP Service Pack 2. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/aspect-ratio-correction">Aspect Ratio Correction</a>.
     * Native name: MixerPref9_ARAdjustXorY
     * @type {Integer (Int32)}
     */
    static Pref9_ARAdjustXorY => 4

    /**
     * Do not perform aspect ratio correction on the composited stream if the input video streams have the same aspect ratio. Requires Windows XP Service Pack 2. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/non-square-mixing">Non-Square Mixing</a>.
     * Native name: MixerPref9_NonSquareMixing
     * @type {Integer (Int32)}
     */
    static Pref9_NonSquareMixing => 8

    /**
     * Bitmask to isolate the flags that control decimation. (This value is not a valid flag.)
     * Native name: MixerPref9_DecimateMask
     * @type {Integer (Int32)}
     */
    static Pref9_DecimateMask => 15

    /**
     * Bilinear interpolation filtering. A weighted average of a 2 x 2 area of neighboring pixels is used.
     * Native name: MixerPref9_BiLinearFiltering
     * @type {Integer (Int32)}
     */
    static Pref9_BiLinearFiltering => 16

    /**
     * Point filtering. The value of the nearest is pixel is used.
     * Native name: MixerPref9_PointFiltering
     * @type {Integer (Int32)}
     */
    static Pref9_PointFiltering => 32

    /**
     * Anisotropic filtering.
     * Native name: MixerPref9_AnisotropicFiltering
     * @type {Integer (Int32)}
     */
    static Pref9_AnisotropicFiltering => 64

    /**
     * Four-sample tent filtering.
     * Native name: MixerPref9_PyramidalQuadFiltering
     * @type {Integer (Int32)}
     */
    static Pref9_PyramidalQuadFiltering => 128

    /**
     * Four-sample Gaussian filtering.
     * Native name: MixerPref9_GaussianQuadFiltering
     * @type {Integer (Int32)}
     */
    static Pref9_GaussianQuadFiltering => 256

    /**
     * Reserved for future use.
     * Native name: MixerPref9_FilteringReserved
     * @type {Integer (Int32)}
     */
    static Pref9_FilteringReserved => 3584

    /**
     * Bitmask to isolate flags that control filtering. (This value is not a valid flag.)
     * Native name: MixerPref9_FilteringMask
     * @type {Integer (Int32)}
     */
    static Pref9_FilteringMask => 4080

    /**
     * Use an RGB render target.
     * Native name: MixerPref9_RenderTargetRGB
     * @type {Integer (Int32)}
     */
    static Pref9_RenderTargetRGB => 4096

    /**
     * Indicates that the target is a YUV surface. Requires Windows XP Service Pack 2. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/yuv-mixing-mode">YUV Mixing Mode</a>.
     * Native name: MixerPref9_RenderTargetYUV
     * @type {Integer (Int32)}
     */
    static Pref9_RenderTargetYUV => 8192

    /**
     * Reserved for future use.
     * Native name: MixerPref9_RenderTargetReserved
     * @type {Integer (Int32)}
     */
    static Pref9_RenderTargetReserved => 1032192

    /**
     * Bitmask to isolate flags that control the render target. (This value is not a valid flag.)
     * Native name: MixerPref9_RenderTargetMask
     * @type {Integer (Int32)}
     */
    static Pref9_RenderTargetMask => 1044480

    /**
     * In YUV mixing mode only, this flag switches the VMR to bob deinterlacing. You can add or remove this flag while the filter graph is running; the change is applied when the VMR mixer composes the next video frame.
     * Native name: MixerPref9_DynamicSwitchToBOB
     * @type {Integer (Int32)}
     */
    static Pref9_DynamicSwitchToBOB => 1048576

    /**
     * In YUV mixing mode only, this flag causes the VMR to decimate the image by a factor of 2 horizontally and vertically. You can add or remove this flag while the filter graph is running; the change will be applied when the VMR mixer composes the next video frame.
     * Native name: MixerPref9_DynamicDecimateBy2
     * @type {Integer (Int32)}
     */
    static Pref9_DynamicDecimateBy2 => 2097152

    /**
     * Reserved.
     * Native name: MixerPref9_DynamicReserved
     * @type {Integer (Int32)}
     */
    static Pref9_DynamicReserved => 12582912

    /**
     * Bitmask to isolate the MixerPref9_DynamicSwitchToBOB and MixerPref9_DynamicDecimateBy2 flags. (This value is not a valid flag.)
     * Native name: MixerPref9_DynamicMask
     * @type {Integer (Int32)}
     */
    static Pref9_DynamicMask => 15728640
}

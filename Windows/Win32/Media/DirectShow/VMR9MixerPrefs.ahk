#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VMR9MixerPrefs enumeration type contains flags that specify how the Video Mixing Render 9 filter (VMR-9) mixes the video streams. Settings include decimation, filtering, and render target preferences.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9mixerprefs
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9MixerPrefs{

    /**
     * No decimation. The video will be rendered onto the surface in its native size.
     * @type {Integer (Int32)}
     */
    static MixerPref9_NoDecimation => 1

    /**
     * Decimate output by 2 in the x and y directions.
     * @type {Integer (Int32)}
     */
    static MixerPref9_DecimateOutput => 2

    /**
     * Adjust the horizontal or vertical size of the video streams to match the target aspect ratio. If this flag is not present, the VMR adjusts the horizontal size only. Requires Windows XP Service Pack 2. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/aspect-ratio-correction">Aspect Ratio Correction</a>.
     * @type {Integer (Int32)}
     */
    static MixerPref9_ARAdjustXorY => 4

    /**
     * Do not perform aspect ratio correction on the composited stream if the input video streams have the same aspect ratio. Requires Windows XP Service Pack 2. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/non-square-mixing">Non-Square Mixing</a>.
     * @type {Integer (Int32)}
     */
    static MixerPref9_NonSquareMixing => 8

    /**
     * Bitmask to isolate the flags that control decimation. (This value is not a valid flag.)
     * @type {Integer (Int32)}
     */
    static MixerPref9_DecimateMask => 15

    /**
     * Bilinear interpolation filtering. A weighted average of a 2 x 2 area of neighboring pixels is used.
     * @type {Integer (Int32)}
     */
    static MixerPref9_BiLinearFiltering => 16

    /**
     * Point filtering. The value of the nearest is pixel is used.
     * @type {Integer (Int32)}
     */
    static MixerPref9_PointFiltering => 32

    /**
     * Anisotropic filtering.
     * @type {Integer (Int32)}
     */
    static MixerPref9_AnisotropicFiltering => 64

    /**
     * Four-sample tent filtering.
     * @type {Integer (Int32)}
     */
    static MixerPref9_PyramidalQuadFiltering => 128

    /**
     * Four-sample Gaussian filtering.
     * @type {Integer (Int32)}
     */
    static MixerPref9_GaussianQuadFiltering => 256

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static MixerPref9_FilteringReserved => 3584

    /**
     * Bitmask to isolate flags that control filtering. (This value is not a valid flag.)
     * @type {Integer (Int32)}
     */
    static MixerPref9_FilteringMask => 4080

    /**
     * Use an RGB render target.
     * @type {Integer (Int32)}
     */
    static MixerPref9_RenderTargetRGB => 4096

    /**
     * Indicates that the target is a YUV surface. Requires Windows XP Service Pack 2. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/yuv-mixing-mode">YUV Mixing Mode</a>.
     * @type {Integer (Int32)}
     */
    static MixerPref9_RenderTargetYUV => 8192

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static MixerPref9_RenderTargetReserved => 1032192

    /**
     * Bitmask to isolate flags that control the render target. (This value is not a valid flag.)
     * @type {Integer (Int32)}
     */
    static MixerPref9_RenderTargetMask => 1044480

    /**
     * In YUV mixing mode only, this flag switches the VMR to bob deinterlacing. You can add or remove this flag while the filter graph is running; the change is applied when the VMR mixer composes the next video frame.
     * @type {Integer (Int32)}
     */
    static MixerPref9_DynamicSwitchToBOB => 1048576

    /**
     * In YUV mixing mode only, this flag causes the VMR to decimate the image by a factor of 2 horizontally and vertically. You can add or remove this flag while the filter graph is running; the change will be applied when the VMR mixer composes the next video frame.
     * @type {Integer (Int32)}
     */
    static MixerPref9_DynamicDecimateBy2 => 2097152

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MixerPref9_DynamicReserved => 12582912

    /**
     * Bitmask to isolate the MixerPref9_DynamicSwitchToBOB and MixerPref9_DynamicDecimateBy2 flags. (This value is not a valid flag.)
     * @type {Integer (Int32)}
     */
    static MixerPref9_DynamicMask => 15728640
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the aspect-ratio mode.
 * @see https://learn.microsoft.com/windows/win32/api/evr/ne-evr-mfvideoaspectratiomode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoAspectRatioMode extends Win32Enum{

    /**
     * Do not maintain the aspect ratio of the video. Stretch the video to fit the output rectangle.
     * @type {Integer (Int32)}
     */
    static MFVideoARMode_None => 0

    /**
     * Preserve the aspect ratio of the video by letterboxing or within the output rectangle.
     * @type {Integer (Int32)}
     */
    static MFVideoARMode_PreservePicture => 1

    /**
     * <div class="alert"><b>Note</b>  Currently the EVR ignores this flag.</div>
     * <div> </div>
     * Correct the aspect ratio if the physical size of the display device does not match the display resolution. For example, if the native resolution of the monitor is 1600 by 1200 (4:3) but the display resolution is 1280 by 1024 (5:4), the monitor will display non-square pixels.
     * 
     * If this flag is set, you must also set the <b>MFVideoARMode_PreservePicture</b> flag.
     * @type {Integer (Int32)}
     */
    static MFVideoARMode_PreservePixel => 2

    /**
     * Apply a non-linear horizontal stretch if the aspect ratio of the destination rectangle does not match the aspect ratio of the source rectangle.
     * 
     * The non-linear stretch algorithm preserves the aspect ratio in the middle of the picture and stretches (or shrinks) the image progressively more toward the left and right. This mode is useful when viewing 4:3 content full-screen on a 16:9 display, instead of pillar-boxing. Non-linear vertical stretch is not supported, because the visual results are generally poor.
     * 
     * This mode may cause performance degradation.
     * 
     * If this flag is set, you must also set the <b>MFVideoARMode_PreservePixel</b> and <b>MFVideoARMode_PreservePicture</b> flags.
     * @type {Integer (Int32)}
     */
    static MFVideoARMode_NonLinearStretch => 4

    /**
     * Bitmask to validate flag values. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static MFVideoARMode_Mask => 7
}

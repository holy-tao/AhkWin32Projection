#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the aspect ratio of a video image in a display window.
 * @remarks
 * The AM_ARMODE_STRETCHED member causes a video stream to occupy the entire region of the display window when the window is resized, possibly stretching the video. The AM_ARMODE_LETTER_BOX member eliminates video stretching and distortions by keeping the aspect ratio consistent and painting the excess areas of the window a background color. The AM_ARMODE_CROP member also prevents stretching, by cropping the image if necessary.
 * @see https://learn.microsoft.com/windows/win32/api/mpconfig/ne-mpconfig-am_aspect_ratio_mode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_ASPECT_RATIO_MODE{

    /**
     * No aspect ratio correction.
     * @type {Integer (Int32)}
     */
    static AM_ARMODE_STRETCHED => 0

    /**
     * Put the video in letterbox format. Paint background color in the excess region so the video is not distorted.
     * @type {Integer (Int32)}
     */
    static AM_ARMODE_LETTER_BOX => 1

    /**
     * Crop the video to the correct aspect ratio.
     * @type {Integer (Int32)}
     */
    static AM_ARMODE_CROP => 2

    /**
     * Use whatever mode is currently set for the primary stream. This value is valid only for secondary streams.
     * @type {Integer (Int32)}
     */
    static AM_ARMODE_STRETCHED_AS_PRIMARY => 3
}

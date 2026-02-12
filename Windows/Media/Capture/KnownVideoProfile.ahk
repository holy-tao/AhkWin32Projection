#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the names of video recording profiles that are known by the system.
 * @remarks
 * Use [FindKnownVideoProfiles](mediacapture_findknownvideoprofiles_875917242.md) to retrieve the list of known profiles that are supported for a specified video device.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.knownvideoprofile
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class KnownVideoProfile extends Win32Enum{

    /**
     * The profile provides hints to the driver to optimize for high-quality video, prioritizing higher resolution and frame rates over power consumption and latency.
     * @type {Integer (Int32)}
     */
    static VideoRecording => 0

    /**
     * The profile provides hints to the driver to optimize for high-quality photo capture.
     * @type {Integer (Int32)}
     */
    static HighQualityPhoto => 1

    /**
     * The profile provides hints to the driver to allow for photo capture during video capture with balanced quality between both.
     * @type {Integer (Int32)}
     */
    static BalancedVideoAndPhoto => 2

    /**
     * The profile provides hints to the driver to optimize for VoIP scenarios, prioritizing lower power consumption, lower latency, and concurrency (for example, using the front and back cameras of a device simultaneously) while deprioritizing higher resolution.
     * @type {Integer (Int32)}
     */
    static VideoConferencing => 3

    /**
     * The profile provides hints to the driver to optimize for capturing photo sequences.
     * @type {Integer (Int32)}
     */
    static PhotoSequence => 4

    /**
     * The profile provides hints to the driver to optimize for high frame rate video capture.
     * @type {Integer (Int32)}
     */
    static HighFrameRate => 5

    /**
     * The profile provides hints to the driver to optimize for capturing variable photo sequences.
     * @type {Integer (Int32)}
     */
    static VariablePhotoSequence => 6

    /**
     * The profile provides hints to the driver to optimize for High Dynamic Range (HDR) with Wide Color Gamut (WCG) video.
     * @type {Integer (Int32)}
     */
    static HdrWithWcgVideo => 7

    /**
     * The profile provides hints to the driver to optimize for High Dynamic Range (HDR) with Wide Color Gamut (WCG) photo.
     * @type {Integer (Int32)}
     */
    static HdrWithWcgPhoto => 8

    /**
     * The profile provides hints to the driver to optimize for High Dynamic Range (HDR) video.
     * @type {Integer (Int32)}
     */
    static VideoHdr8 => 9

    /**
     * The profile enables the enumeration of compressed video streams.
     * @type {Integer (Int32)}
     */
    static CompressedCamera => 10
}

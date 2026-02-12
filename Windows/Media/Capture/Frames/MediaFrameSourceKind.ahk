#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of data produced by a [MediaFrameSource](mediaframesource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcekind
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameSourceKind extends Win32Enum{

    /**
     * The media frame source produces custom data.
     * @type {Integer (Int32)}
     */
    static Custom => 0

    /**
     * The media frame source produces color data.
     * @type {Integer (Int32)}
     */
    static Color => 1

    /**
     * The media frame source produces infrared data.
     * @type {Integer (Int32)}
     */
    static Infrared => 2

    /**
     * The media frame source produces depth data.
     * @type {Integer (Int32)}
     */
    static Depth => 3

    /**
     * The media frame source produces audio data.
     * @type {Integer (Int32)}
     */
    static Audio => 4

    /**
     * The media frame source produces image data.
     * @type {Integer (Int32)}
     */
    static Image => 5

    /**
     * The media frame source produces metadata.
     * @type {Integer (Int32)}
     */
    static Metadata => 6
}

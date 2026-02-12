#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies a type of stream on a media capture device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediastreamtype
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaStreamType extends Win32Enum{

    /**
     * A video preview stream.
     * @type {Integer (Int32)}
     */
    static VideoPreview => 0

    /**
     * A video recording stream.
     * @type {Integer (Int32)}
     */
    static VideoRecord => 1

    /**
     * An audio stream.
     * @type {Integer (Int32)}
     */
    static Audio => 2

    /**
     * A photo stream.
     * <!--to edit: In Win32 docs, I have been calling this a "still image stream" - but "photo" seems friendlier. If not, then I prefer "still image" over something like "photograhic".-->
     * @type {Integer (Int32)}
     */
    static Photo => 3

    /**
     * A metadata stream.
     * @type {Integer (Int32)}
     */
    static Metadata => 4
}

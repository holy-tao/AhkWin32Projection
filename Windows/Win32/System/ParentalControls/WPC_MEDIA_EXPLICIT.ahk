#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about the explicit rating of the media file.
 * @see https://docs.microsoft.com/windows/win32/api//wpcevent/ne-wpcevent-wpc_media_explicit
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_MEDIA_EXPLICIT{

    /**
     * The media file is not rated as explicit.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_EXPLICIT_FALSE => 0

    /**
     * The media file is rated as explicit.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_EXPLICIT_TRUE => 1

    /**
     * The media file has an unknown explicit rating.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_EXPLICIT_UNKNOWN => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class MEDIA_ACTIVITY_NOTIFY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MediaPlayback => 0

    /**
     * @type {Integer (Int32)}
     */
    static MediaRecording => 1

    /**
     * @type {Integer (Int32)}
     */
    static MediaCasting => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class MEDIA_ACTIVITY_NOTIFY_TYPE extends Win32Enum {

    /**
     * Native name: MediaPlayback
     * @type {Integer (Int32)}
     */
    static Playback => 0

    /**
     * Native name: MediaRecording
     * @type {Integer (Int32)}
     */
    static Recording => 1

    /**
     * Native name: MediaCasting
     * @type {Integer (Int32)}
     */
    static Casting => 2
}

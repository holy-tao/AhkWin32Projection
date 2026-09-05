#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPServices_StreamState enumeration indicates whether the stream is currently stopped, paused, or playing.
 * @see https://learn.microsoft.com/windows/win32/api/wmpservices/ne-wmpservices-wmpservices_streamstate
 * @namespace Windows.Win32.Media.MediaPlayer
 */
class WMPServices_StreamState extends Win32Enum {

    /**
     * The stream is stopped.
     * Native name: WMPServices_StreamState_Stop
     * @type {Integer (Int32)}
     */
    static Stop => 0

    /**
     * The stream is paused.
     * Native name: WMPServices_StreamState_Pause
     * @type {Integer (Int32)}
     */
    static Pause => 1

    /**
     * The stream is playing.
     * Native name: WMPServices_StreamState_Play
     * @type {Integer (Int32)}
     */
    static Play => 2
}

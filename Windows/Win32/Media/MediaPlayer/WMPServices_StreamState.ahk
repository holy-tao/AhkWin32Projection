#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPServices_StreamState enumeration indicates whether the stream is currently stopped, paused, or playing.
 * @see https://learn.microsoft.com/windows/win32/api/wmpservices/ne-wmpservices-wmpservices_streamstate
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPServices_StreamState extends Win32Enum{

    /**
     * The stream is stopped.
     * @type {Integer (Int32)}
     */
    static WMPServices_StreamState_Stop => 0

    /**
     * The stream is paused.
     * @type {Integer (Int32)}
     */
    static WMPServices_StreamState_Pause => 1

    /**
     * The stream is playing.
     * @type {Integer (Int32)}
     */
    static WMPServices_StreamState_Play => 2
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMPServices_StreamState enumeration indicates whether the stream is currently stopped, paused, or playing.
 * @see https://learn.microsoft.com/windows/win32/api/wmpservices/ne-wmpservices-wmpservices_streamstate
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPServices_StreamState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

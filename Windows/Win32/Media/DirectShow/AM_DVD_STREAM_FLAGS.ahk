#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a DVD stream type (video, audio, or subpicture).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-am_dvd_stream_flags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DVD_STREAM_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * DVD video stream.
     * @type {Integer (Int32)}
     */
    static AM_DVD_STREAM_VIDEO => 1

    /**
     * DVD audio stream.
     * @type {Integer (Int32)}
     */
    static AM_DVD_STREAM_AUDIO => 2

    /**
     * DVD subpicture stream.
     * @type {Integer (Int32)}
     */
    static AM_DVD_STREAM_SUBPIC => 4
}

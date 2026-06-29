#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the original source of the input video was film or video. This enumeration is used with the AVEncVideoSourceFilmContent property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideofilmcontent
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncVideoFilmContent {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The original source was video.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoFilmContent_VideoOnly => 0

    /**
     * The original source was film.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoFilmContent_FilmOnly => 1

    /**
     * The original source contains a mix of video and film.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoFilmContent_Mixed => 2
}

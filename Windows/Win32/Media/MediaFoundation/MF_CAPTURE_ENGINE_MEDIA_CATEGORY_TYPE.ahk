#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_COMMUNICATIONS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_MEDIA => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_GAMECHAT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_SPEECH => 4

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_FARFIELDSPEECH => 5

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_UNIFORMSPEECH => 6

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_VOICETYPING => 7
}

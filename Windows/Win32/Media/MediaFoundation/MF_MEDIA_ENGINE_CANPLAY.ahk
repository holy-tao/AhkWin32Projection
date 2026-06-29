#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the likelihood that the Media Engine can play a specified type of media resource.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_canplay
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MEDIA_ENGINE_CANPLAY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The Media Engine cannot play the resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_CANPLAY_NOT_SUPPORTED => 0

    /**
     * The Media Engine might be able to play the resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_CANPLAY_MAYBE => 1

    /**
     * The Media Engine can probably play the resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_CANPLAY_PROBABLY => 2
}

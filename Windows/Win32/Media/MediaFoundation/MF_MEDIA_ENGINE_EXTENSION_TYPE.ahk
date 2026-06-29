#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies media engine extension types.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_extension_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MEDIA_ENGINE_EXTENSION_TYPE {
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
    static MF_MEDIA_ENGINE_EXTENSION_TYPE_MEDIASOURCE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_EXTENSION_TYPE_BYTESTREAM => 1
}

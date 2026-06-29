#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines preload hints for the Media Engine.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_preload
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MEDIA_ENGINE_PRELOAD {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The <b>preload</b> attribute is missing.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_MISSING => 0

    /**
     * The <b>preload</b> attribute is an empty string. This value is equivalent to <b>MF_MEDIA_ENGINE_PRELOAD_AUTOMATIC</b>.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_EMPTY => 1

    /**
     * The <b>preload</b> attribute is "none". This value is a hint to the user agent not to preload the resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_NONE => 2

    /**
     * The <b>preload</b> attribute is "metadata". This value is a hint to the user agent to fetch the resource metadata.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_METADATA => 3

    /**
     * The <b>preload</b> attribute is "auto". This value is a hint to the user agent to preload the entire resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_AUTOMATIC => 4
}

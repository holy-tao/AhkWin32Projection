#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the likelihood that the Media Engine can play a specified type of media resource.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_media_engine_canplay
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_CANPLAY{

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

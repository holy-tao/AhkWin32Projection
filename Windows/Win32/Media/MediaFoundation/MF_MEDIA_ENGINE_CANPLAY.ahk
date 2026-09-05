#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the likelihood that the Media Engine can play a specified type of media resource.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_canplay
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_CANPLAY extends Win32Enum {

    /**
     * The Media Engine cannot play the resource.
     * Native name: MF_MEDIA_ENGINE_CANPLAY_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 0

    /**
     * The Media Engine might be able to play the resource.
     * Native name: MF_MEDIA_ENGINE_CANPLAY_MAYBE
     * @type {Integer (Int32)}
     */
    static MAYBE => 1

    /**
     * The Media Engine can probably play the resource.
     * Native name: MF_MEDIA_ENGINE_CANPLAY_PROBABLY
     * @type {Integer (Int32)}
     */
    static PROBABLY => 2
}

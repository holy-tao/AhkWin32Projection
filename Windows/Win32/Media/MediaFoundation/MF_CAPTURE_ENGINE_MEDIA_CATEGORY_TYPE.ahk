#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE extends Win32Enum {

    /**
     * Native name: MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 0

    /**
     * Native name: MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_COMMUNICATIONS
     * @type {Integer (Int32)}
     */
    static COMMUNICATIONS => 1

    /**
     * Native name: MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_MEDIA
     * @type {Integer (Int32)}
     */
    static MEDIA => 2

    /**
     * Native name: MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_GAMECHAT
     * @type {Integer (Int32)}
     */
    static GAMECHAT => 3

    /**
     * Native name: MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_SPEECH
     * @type {Integer (Int32)}
     */
    static SPEECH => 4

    /**
     * Native name: MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_FARFIELDSPEECH
     * @type {Integer (Int32)}
     */
    static FARFIELDSPEECH => 5

    /**
     * Native name: MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_UNIFORMSPEECH
     * @type {Integer (Int32)}
     */
    static UNIFORMSPEECH => 6

    /**
     * Native name: MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_VOICETYPING
     * @type {Integer (Int32)}
     */
    static VOICETYPING => 7
}

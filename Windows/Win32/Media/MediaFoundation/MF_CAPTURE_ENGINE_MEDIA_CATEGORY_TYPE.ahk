#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE extends Win32Enum{

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

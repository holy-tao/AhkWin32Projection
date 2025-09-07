#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the media engine seek mode.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setcurrenttimeex">MediaEngineEx::SetCurrentTimeEx</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_seek_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_SEEK_MODE{

    /**
     * Specifies normal seek.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_SEEK_MODE_NORMAL => 0

    /**
     * Specifies an approximate seek.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_SEEK_MODE_APPROXIMATE => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the media engine seek mode.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setcurrenttimeex">MediaEngineEx::SetCurrentTimeEx</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_seek_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_SEEK_MODE extends Win32Enum {

    /**
     * Specifies normal seek.
     * Native name: MF_MEDIA_ENGINE_SEEK_MODE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Specifies an approximate seek.
     * Native name: MF_MEDIA_ENGINE_SEEK_MODE_APPROXIMATE
     * @type {Integer (Int32)}
     */
    static APPROXIMATE => 1
}

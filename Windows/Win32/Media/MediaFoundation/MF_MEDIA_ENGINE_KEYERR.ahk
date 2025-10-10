#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines media key error codes for the media engine.
 * @remarks
 * 
  * <b>MF_MEDIA_ENGINE_KEYERR</b> is used with the <i>code</i> parameter of  <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediakeysessionnotify-keyerror">IMFMediaKeySessionNotify::KeyError</a> and the <i>code</i> value returned from <a href="https://docs.microsoft.com/windows/desktop/medfound/imfmediakeysession-geterror">IMFMediaKeySession::GetError</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_media_engine_keyerr
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_KEYERR{

    /**
     * Unknown error occurred.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAENGINE_KEYERR_UNKNOWN => 1

    /**
     * An error with the client occurred.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAENGINE_KEYERR_CLIENT => 2

    /**
     * An error with the service occurred.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAENGINE_KEYERR_SERVICE => 3

    /**
     * An error with the output occurred.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAENGINE_KEYERR_OUTPUT => 4

    /**
     * An error occurred related to a hardware change.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAENGINE_KEYERR_HARDWARECHANGE => 5

    /**
     * An error with the domain occurred.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAENGINE_KEYERR_DOMAIN => 6
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines error status codes for the Media Engine.
 * @remarks
 * 
 * The values greater than zero correspond to error codes defined for the <b>MediaError</b> object  in HTML5.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_media_engine_err
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_ERR{

    /**
     * No error.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_ERR_NOERROR => 0

    /**
     * The process of fetching the media resource was stopped at the user's request.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_ERR_ABORTED => 1

    /**
     * A network error occurred while fetching the media resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_ERR_NETWORK => 2

    /**
     * An error occurred while decoding the media resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_ERR_DECODE => 3

    /**
     * The media resource is not supported.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_ERR_SRC_NOT_SUPPORTED => 4

    /**
     * An error occurred while encrypting the media resource.
     * 
     * Supported in Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_ERR_ENCRYPTED => 5
}

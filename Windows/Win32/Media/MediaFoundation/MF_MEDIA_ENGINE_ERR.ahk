#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines error status codes for the Media Engine.
 * @remarks
 * The values greater than zero correspond to error codes defined for the <b>MediaError</b> object  in HTML5.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_err
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_ERR extends Win32Enum {

    /**
     * No error.
     * Native name: MF_MEDIA_ENGINE_ERR_NOERROR
     * @type {Integer (Int32)}
     */
    static NOERROR => 0

    /**
     * The process of fetching the media resource was stopped at the user's request.
     * Native name: MF_MEDIA_ENGINE_ERR_ABORTED
     * @type {Integer (Int32)}
     */
    static ABORTED => 1

    /**
     * A network error occurred while fetching the media resource.
     * Native name: MF_MEDIA_ENGINE_ERR_NETWORK
     * @type {Integer (Int32)}
     */
    static NETWORK => 2

    /**
     * An error occurred while decoding the media resource.
     * Native name: MF_MEDIA_ENGINE_ERR_DECODE
     * @type {Integer (Int32)}
     */
    static DECODE => 3

    /**
     * The media resource is not supported.
     * Native name: MF_MEDIA_ENGINE_ERR_SRC_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static SRC_NOT_SUPPORTED => 4

    /**
     * An error occurred while encrypting the media resource.
     * 
     * Supported in Windows 8.1 and later.
     * Native name: MF_MEDIA_ENGINE_ERR_ENCRYPTED
     * @type {Integer (Int32)}
     */
    static ENCRYPTED => 5
}

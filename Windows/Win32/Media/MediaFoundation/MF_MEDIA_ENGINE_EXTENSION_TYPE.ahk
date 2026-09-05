#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies media engine extension types.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_extension_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_EXTENSION_TYPE extends Win32Enum {

    /**
     * Native name: MF_MEDIA_ENGINE_EXTENSION_TYPE_MEDIASOURCE
     * @type {Integer (Int32)}
     */
    static MEDIASOURCE => 0

    /**
     * Native name: MF_MEDIA_ENGINE_EXTENSION_TYPE_BYTESTREAM
     * @type {Integer (Int32)}
     */
    static BYTESTREAM => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies media engine extension types.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_media_engine_extension_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_EXTENSION_TYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_EXTENSION_TYPE_MEDIASOURCE => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_EXTENSION_TYPE_BYTESTREAM => 1
}

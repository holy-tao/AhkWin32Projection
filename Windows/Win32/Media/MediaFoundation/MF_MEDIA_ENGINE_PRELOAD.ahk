#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines preload hints for the Media Engine.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_preload
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_PRELOAD extends Win32Enum{

    /**
     * The <b>preload</b> attribute is missing.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_MISSING => 0

    /**
     * The <b>preload</b> attribute is an empty string. This value is equivalent to <b>MF_MEDIA_ENGINE_PRELOAD_AUTOMATIC</b>.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_EMPTY => 1

    /**
     * The <b>preload</b> attribute is "none". This value is a hint to the user agent not to preload the resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_NONE => 2

    /**
     * The <b>preload</b> attribute is "metadata". This value is a hint to the user agent to fetch the resource metadata.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_METADATA => 3

    /**
     * The <b>preload</b> attribute is "auto". This value is a hint to the user agent to preload the entire resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_PRELOAD_AUTOMATIC => 4
}

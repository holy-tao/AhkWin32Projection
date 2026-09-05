#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines preload hints for the Media Engine.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_preload
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_PRELOAD extends Win32Enum {

    /**
     * The <b>preload</b> attribute is missing.
     * Native name: MF_MEDIA_ENGINE_PRELOAD_MISSING
     * @type {Integer (Int32)}
     */
    static MISSING => 0

    /**
     * The <b>preload</b> attribute is an empty string. This value is equivalent to <b>MF_MEDIA_ENGINE_PRELOAD_AUTOMATIC</b>.
     * Native name: MF_MEDIA_ENGINE_PRELOAD_EMPTY
     * @type {Integer (Int32)}
     */
    static EMPTY => 1

    /**
     * The <b>preload</b> attribute is "none". This value is a hint to the user agent not to preload the resource.
     * Native name: MF_MEDIA_ENGINE_PRELOAD_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2

    /**
     * The <b>preload</b> attribute is "metadata". This value is a hint to the user agent to fetch the resource metadata.
     * Native name: MF_MEDIA_ENGINE_PRELOAD_METADATA
     * @type {Integer (Int32)}
     */
    static METADATA => 3

    /**
     * The <b>preload</b> attribute is "auto". This value is a hint to the user agent to preload the entire resource.
     * Native name: MF_MEDIA_ENGINE_PRELOAD_AUTOMATIC
     * @type {Integer (Int32)}
     */
    static AUTOMATIC => 4
}

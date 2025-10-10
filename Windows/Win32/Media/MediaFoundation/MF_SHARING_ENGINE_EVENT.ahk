#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines events that are sent by the sharing engine.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/ne-mfsharingengine-mf_sharing_engine_event
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_SHARING_ENGINE_EVENT{

    /**
     * Reserved for internal use.
     * @type {Integer (Int32)}
     */
    static MF_SHARING_ENGINE_EVENT_DISCONNECT => 2000

    /**
     * Reserved for internal use.
     * @type {Integer (Int32)}
     */
    static MF_SHARING_ENGINE_EVENT_LOCALRENDERINGSTARTED => 2001

    /**
     * Reserved for internal use.
     * @type {Integer (Int32)}
     */
    static MF_SHARING_ENGINE_EVENT_LOCALRENDERINGENDED => 2002

    /**
     * The device has stopped.
     * @type {Integer (Int32)}
     */
    static MF_SHARING_ENGINE_EVENT_STOPPED => 2003

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MF_SHARING_ENGINE_EVENT_ERROR => 2501
}

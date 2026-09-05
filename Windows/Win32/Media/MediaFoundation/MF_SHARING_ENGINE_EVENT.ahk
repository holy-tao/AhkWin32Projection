#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines events that are sent by the sharing engine.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/ne-mfsharingengine-mf_sharing_engine_event
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_SHARING_ENGINE_EVENT extends Win32Enum {

    /**
     * Reserved for internal use.
     * Native name: MF_SHARING_ENGINE_EVENT_DISCONNECT
     * @type {Integer (Int32)}
     */
    static DISCONNECT => 2000

    /**
     * Reserved for internal use.
     * Native name: MF_SHARING_ENGINE_EVENT_LOCALRENDERINGSTARTED
     * @type {Integer (Int32)}
     */
    static LOCALRENDERINGSTARTED => 2001

    /**
     * Reserved for internal use.
     * Native name: MF_SHARING_ENGINE_EVENT_LOCALRENDERINGENDED
     * @type {Integer (Int32)}
     */
    static LOCALRENDERINGENDED => 2002

    /**
     * The device has stopped.
     * Native name: MF_SHARING_ENGINE_EVENT_STOPPED
     * @type {Integer (Int32)}
     */
    static STOPPED => 2003

    /**
     * Native name: MF_SHARING_ENGINE_EVENT_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 2501
}

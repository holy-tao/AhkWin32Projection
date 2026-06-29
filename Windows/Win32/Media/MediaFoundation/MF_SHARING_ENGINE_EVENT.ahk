#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines events that are sent by the sharing engine.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/ne-mfsharingengine-mf_sharing_engine_event
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_SHARING_ENGINE_EVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static MF_SHARING_ENGINE_EVENT_ERROR => 2501
}

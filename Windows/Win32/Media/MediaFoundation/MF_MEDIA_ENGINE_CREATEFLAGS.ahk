#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags for the IMFMediaEngineClassFactory::CreateInstance method.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_media_engine_createflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_CREATEFLAGS{

    /**
     * The Media Engine will play audio only. It will not play video.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_AUDIOONLY => 1

    /**
     * The Media Engine's resource loading algorithm waits for the application to signal the thread that loads the resource. For more information, see the remarks for <b>MF_MEDIA_ENGINE_EVENT_NOTIFYSTABLESTATE</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_event">MF_MEDIA_ENGINE_EVENT</a> enumeration.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_WAITFORSTABLE_STATE => 2

    /**
     * Always mute the audio.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_FORCEMUTE => 4

    /**
     * Enable low-latency mode in the rendering pipeline. This can be changed at a later time by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setrealtimemode">IMFMediaEngineEx::SetRealTimeMode</a>.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_REAL_TIME_MODE => 8

    /**
     * Disable locally registered media plugins. If this flag is set, the Media Engine will not load decoders or other media plugins that the application registered for the local process.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_DISABLE_LOCAL_PLUGINS => 16

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_CREATEFLAGS_MASK => 31
}

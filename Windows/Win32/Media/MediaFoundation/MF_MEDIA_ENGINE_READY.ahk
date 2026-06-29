#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines ready-state values for the Media Engine.
 * @remarks
 * These values correspond to constants defined for the  <b>HTMLMediaElement.readyState</b> attribute  in HTML5.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_ready
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MEDIA_ENGINE_READY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No data is available.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_READY_HAVE_NOTHING => 0

    /**
     * Some metadata is available, including the duration and, for video files, the video dimensions. No media data is available.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_READY_HAVE_METADATA => 1

    /**
     * There is media data  for the current playback position, but not enough data for playback or seeking.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_READY_HAVE_CURRENT_DATA => 2

    /**
     * There is enough media data to enable some playback or seeking. The amount of data might be a little as the next video frame.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_READY_HAVE_FUTURE_DATA => 3

    /**
     * There is enough data to play the resource, based on the current rate at which the resource is being fetched.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_READY_HAVE_ENOUGH_DATA => 4
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DMO_VIDEO_OUTPUT_STREAM_FLAGS enumeration defines flags that describe requested features, for video optimizations.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ne-mediaobj-_dmo_video_output_stream_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
export default struct _DMO_VIDEO_OUTPUT_STREAM_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Requests that every output buffer passed to the DMO contain the previous data that was generated.
     * @type {Integer (Int32)}
     */
    static DMO_VOSF_NEEDS_PREVIOUS_SAMPLE => 1
}

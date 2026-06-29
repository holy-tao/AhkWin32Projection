#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags used by the DwmSetPresentParameters function to specify the frame sampling type.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_source_frame_sampling
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWM_SOURCE_FRAME_SAMPLING {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use the first source frame that includes the first refresh of the output frame.
     * @type {Integer (Int32)}
     */
    static DWM_SOURCE_FRAME_SAMPLING_POINT => 0

    /**
     * Use the source frame that includes the most refreshes of the output frame. In the case of multiple source frames with the same coverage, the last frame is used.
     * @type {Integer (Int32)}
     */
    static DWM_SOURCE_FRAME_SAMPLING_COVERAGE => 1

    /**
     * The maximum recognized <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ne-dwmapi-dwm_source_frame_sampling">DWM_SOURCE_FRAME_SAMPLING</a> value, used for validation purposes.
     * @type {Integer (Int32)}
     */
    static DWM_SOURCE_FRAME_SAMPLING_LAST => 2
}

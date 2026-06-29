#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the status of a present.
 * @remarks
 * The status of a present indicates how it was handled based on timing, and whether it was canceled.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/ne-presentation-presentstatus
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct PresentStatus {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The frame was queued by the system to eventually be shown.
     * @type {Integer (Int32)}
     */
    static PresentStatus_Queued => 0

    /**
     * The frame was skipped because a later frame was a better candidate to show.
     * @type {Integer (Int32)}
     */
    static PresentStatus_Skipped => 1

    /**
     * The frame arrived, but was canceled by the application, so it was not displayed.
     * @type {Integer (Int32)}
     */
    static PresentStatus_Canceled => 2
}

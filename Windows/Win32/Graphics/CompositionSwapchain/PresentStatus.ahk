#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the status of a present.
 * @remarks
 * The status of a present indicates how it was handled based on timing, and whether it was canceled.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/ne-presentation-presentstatus
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
class PresentStatus extends Win32Enum {

    /**
     * The frame was queued by the system to eventually be shown.
     * Native name: PresentStatus_Queued
     * @type {Integer (Int32)}
     */
    static Queued => 0

    /**
     * The frame was skipped because a later frame was a better candidate to show.
     * Native name: PresentStatus_Skipped
     * @type {Integer (Int32)}
     */
    static Skipped => 1

    /**
     * The frame arrived, but was canceled by the application, so it was not displayed.
     * Native name: PresentStatus_Canceled
     * @type {Integer (Int32)}
     */
    static Canceled => 2
}

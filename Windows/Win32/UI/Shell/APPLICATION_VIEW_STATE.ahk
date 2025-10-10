#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the current view state of a Windows Store app. Used by IApplicationDesignModeSettings::SetApplicationViewState and IApplicationDesignModeSettings::IsApplicationViewStateSupported.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-application_view_state
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPLICATION_VIEW_STATE{

    /**
     * The current app's view is full-screen (has no snapped app adjacent to it), and is in landscape orientation.
     * @type {Integer (Int32)}
     */
    static AVS_FULLSCREEN_LANDSCAPE => 0

    /**
     * The current app's view has been reduced to a partial screen view as the result of another app snapping (being docked at one side of the screen in a narrow view).
     * @type {Integer (Int32)}
     */
    static AVS_FILLED => 1

    /**
     * The current app's view has been snapped (docked at one side of the screen in a narrow view).
     * @type {Integer (Int32)}
     */
    static AVS_SNAPPED => 2

    /**
     * The current app's view is full-screen (has no snapped app adjacent to it), and is in portrait orientation.
     * @type {Integer (Int32)}
     */
    static AVS_FULLSCREEN_PORTRAIT => 3
}

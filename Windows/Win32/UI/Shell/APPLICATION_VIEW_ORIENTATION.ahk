#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of display orientation modes for a window (app view). Used by IApplicationDesignModeSettings2::GetApplicationViewOrientation and IApplicationDesignModeSettings2::SetApplicationViewOrientation.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-application_view_orientation
 * @namespace Windows.Win32.UI.Shell
 */
export default struct APPLICATION_VIEW_ORIENTATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The window is in landscape orientation, with the display width greater than the height.
     * @type {Integer (Int32)}
     */
    static AVO_LANDSCAPE => 0

    /**
     * The window is in portrait orientation, with the display height greater than the width.
     * @type {Integer (Int32)}
     */
    static AVO_PORTRAIT => 1
}

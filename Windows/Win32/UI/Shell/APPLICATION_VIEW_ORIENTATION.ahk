#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of display orientation modes for a window (app view). Used by IApplicationDesignModeSettings2::GetApplicationViewOrientation and IApplicationDesignModeSettings2::SetApplicationViewOrientation.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-application_view_orientation
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPLICATION_VIEW_ORIENTATION extends Win32Enum{

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

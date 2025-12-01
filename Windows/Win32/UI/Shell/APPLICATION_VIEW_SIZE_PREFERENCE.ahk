#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of possible general window (app view) size preferences. Used by ILaunchSourceViewSizePreference::GetSourceViewSizePreference and ILaunchTargetViewSizePreference::GetTargetViewSizePreference.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-application_view_size_preference
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPLICATION_VIEW_SIZE_PREFERENCE extends Win32Enum{

    /**
     * The app does not specify a window size preference. Windows, rather than the app, sets the size preference, which defaults to <b>AVSP_USE_HALF</b>.
     * @type {Integer (Int32)}
     */
    static AVSP_DEFAULT => 0

    /**
     * Prefers to use less than 50% of the available horizontal screen pixels.
     * @type {Integer (Int32)}
     */
    static AVSP_USE_LESS => 1

    /**
     * Prefers to use 50% (half) of the available horizontal screen pixels.
     * @type {Integer (Int32)}
     */
    static AVSP_USE_HALF => 2

    /**
     * Prefers to use more than 50% of the available horizontal screen pixels.
     * @type {Integer (Int32)}
     */
    static AVSP_USE_MORE => 3

    /**
     * Prefers to use the minimum horizontal pixel width (either 320 or 500 pixels) specified in the app's manifest.
     * @type {Integer (Int32)}
     */
    static AVSP_USE_MINIMUM => 4

    /**
     * The window has no visible component.
     * @type {Integer (Int32)}
     */
    static AVSP_USE_NONE => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AVSP_CUSTOM => 6
}

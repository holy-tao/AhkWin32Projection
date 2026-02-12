#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the back button is shown in the system UI.
 * @remarks
 * This enumeration provides values for the [SystemNavigationManager.AppViewBackButtonVisibility](systemnavigationmanager_appviewbackbuttonvisibility.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.appviewbackbuttonvisibility
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class AppViewBackButtonVisibility extends Win32Enum{

    /**
     * The back button is shown.
     * @type {Integer (Int32)}
     */
    static Visible => 0

    /**
     * The back button is not shown and space is not reserved for it in the layout.
     * @type {Integer (Int32)}
     */
    static Collapsed => 1

    /**
     * The back button is shown, but not enabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 2
}

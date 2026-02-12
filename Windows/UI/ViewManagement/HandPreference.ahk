#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the set of directional preferences for the user interface presented by the app view.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.handpreference
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class HandPreference extends Win32Enum{

    /**
     * The preferred layout is for left-directional users.
     * @type {Integer (Int32)}
     */
    static LeftHanded => 0

    /**
     * The preferred layout is for right-directional users.
     * @type {Integer (Int32)}
     */
    static RightHanded => 1
}

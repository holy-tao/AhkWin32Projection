#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the app view is visible or hidden.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappviewstate
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class DesignerAppViewState extends Win32Enum{

    /**
     * The app view is visible.
     * @type {Integer (Int32)}
     */
    static Visible => 0

    /**
     * The app view is hidden.
     * @type {Integer (Int32)}
     */
    static Hidden => 1
}

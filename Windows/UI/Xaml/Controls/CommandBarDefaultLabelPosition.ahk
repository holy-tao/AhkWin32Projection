#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the placement and visibility of [AppBarButton](appbarbutton.md) labels in a [CommandBar](commandbar.md).
 * @remarks
 * This enumeration provides values for the [CommandBar.DefaultLabelPosition](commandbar_defaultlabelposition.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbardefaultlabelposition
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CommandBarDefaultLabelPosition extends Win32Enum{

    /**
     * App bar button labels are shown below the icon. Labels are visible only when the command bar is open.
     * @type {Integer (Int32)}
     */
    static Bottom => 0

    /**
     * App bar button labels are shown to the right of the icon. Labels are visible even when the command bar is closed.
     * @type {Integer (Int32)}
     */
    static Right => 1

    /**
     * App bar button labels are always hidden whether the command bar is open or closed.
     * @type {Integer (Int32)}
     */
    static Collapsed => 2
}

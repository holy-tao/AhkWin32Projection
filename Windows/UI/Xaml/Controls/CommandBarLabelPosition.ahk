#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the placement and visibility of an app bar button's label.
 * @remarks
 * This enumeration provides values for the [LabelPosition](appbarbutton_labelposition.md) property on [AppBarButton](appbarbutton.md) and [AppBarToggleButton](appbartogglebutton.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbarlabelposition
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CommandBarLabelPosition extends Win32Enum{

    /**
     * The placement and visibility of the app bar button's label is determined by the value of the [CommandBar.DefaultLabelPosition](commandbar_defaultlabelposition.md) property.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The app bar button's label is always hidden whether the command bar is open or closed.
     * @type {Integer (Int32)}
     */
    static Collapsed => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the tabbing behavior across tab stops for a tabbing sequence within a container.
 * @remarks
 * This enumeration is used by the [UIElement.TabFocusNavigation](../windows.ui.xaml/uielement_tabfocusnavigation.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardnavigationmode
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class KeyboardNavigationMode extends Win32Enum{

    /**
     * Tab indexes are considered on the local subtree only inside this container.
     * @type {Integer (Int32)}
     */
    static Local => 0

    /**
     * Focus returns to the first or the last keyboard navigation stop inside of a container when the first or last keyboard navigation stop is reached.
     * @type {Integer (Int32)}
     */
    static Cycle => 1

    /**
     * The container and all of its child elements as a whole receive focus only once.
     * @type {Integer (Int32)}
     */
    static Once => 2
}

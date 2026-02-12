#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the scrolling behavior of items while updating.
 * @remarks
 * See [ItemsStackPanel.ItemsUpdatingScrollMode](itemsstackpanel_itemsupdatingscrollmode.md) for more info.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsupdatingscrollmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemsUpdatingScrollMode extends Win32Enum{

    /**
     * Adjusts the scroll offset to keep the first visible item in the viewport when items are added to the [ItemsSource](itemscontrol_itemssource.md).
     * @type {Integer (Int32)}
     */
    static KeepItemsInView => 0

    /**
     * Maintains the scroll offset relative to the beginning of the list, forcing items in the viewport to move down when items are added to the [ItemsSource](itemscontrol_itemssource.md).
     * @type {Integer (Int32)}
     */
    static KeepScrollOffset => 1

    /**
     * Adjusts the scroll offset to keep the last visible item in the viewport when items are added to the [ItemsSource](itemscontrol_itemssource.md).
     * @type {Integer (Int32)}
     */
    static KeepLastItemInView => 2
}

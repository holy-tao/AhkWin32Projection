#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IListViewPersistenceHelper.ahk
#Include .\IListViewPersistenceHelperStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a helper class to save and retrieve the relative scroll position of the [ListView](listview.md).
 * @remarks
 * If the [ItemsStackPanel.ItemsUpdatingScrollMode](itemsstackpanel_itemsupdatingscrollmode.md) property is set to **KeepItemsInView**, ListViewPersistenceHelper attempts to restore the scroll position using the key of the first visible item. If [ItemsUpdatingScrollMode](itemsstackpanel_itemsupdatingscrollmode.md) is **KeepLastItemInView**, it attempts to restore the scroll position using the key of the last visible item.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewpersistencehelper
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListViewPersistenceHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewPersistenceHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewPersistenceHelper.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the relative scroll position of the [ListView](listview.md).
     * @param {ListViewBase} listViewBase_ The ListView object.
     * @param {ListViewItemToKeyHandler} itemToKeyHandler The method that will handle the retrieval of the item key.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewpersistencehelper.getrelativescrollposition
     */
    static GetRelativeScrollPosition(listViewBase_, itemToKeyHandler) {
        if (!ListViewPersistenceHelper.HasProp("__IListViewPersistenceHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewPersistenceHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewPersistenceHelperStatics.IID)
            ListViewPersistenceHelper.__IListViewPersistenceHelperStatics := IListViewPersistenceHelperStatics(factoryPtr)
        }

        return ListViewPersistenceHelper.__IListViewPersistenceHelperStatics.GetRelativeScrollPosition(listViewBase_, itemToKeyHandler)
    }

    /**
     * Begins an asynchronous action to set the relative scroll position of the [ListView](listview.md).
     * @param {ListViewBase} listViewBase_ The ListView.
     * @param {HSTRING} relativeScrollPosition The relative scroll position of the [ListView](listview.md).
     * @param {ListViewKeyToItemHandler} keyToItemHandler The method that will handle the retrieval of the [ListView](listview.md) item given the key.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewpersistencehelper.setrelativescrollpositionasync
     */
    static SetRelativeScrollPositionAsync(listViewBase_, relativeScrollPosition, keyToItemHandler) {
        if (!ListViewPersistenceHelper.HasProp("__IListViewPersistenceHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewPersistenceHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewPersistenceHelperStatics.IID)
            ListViewPersistenceHelper.__IListViewPersistenceHelperStatics := IListViewPersistenceHelperStatics(factoryPtr)
        }

        return ListViewPersistenceHelper.__IListViewPersistenceHelperStatics.SetRelativeScrollPositionAsync(listViewBase_, relativeScrollPosition, keyToItemHandler)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

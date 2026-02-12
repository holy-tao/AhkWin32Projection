#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IListViewBaseHeaderItem.ahk
#Include .\IListViewBaseHeaderItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the infrastructure for the [ListViewHeaderItem](listviewheaderitem.md) and [GridViewHeaderItem](gridviewheaderitem.md) classes.
 * @remarks
 * For user interface purposes, ListViewBaseHeaderItem should be thought of as an abstract base class. Use [ListViewHeaderItem](listviewheaderitem.md) or [GridViewHeaderItem](gridviewheaderitem.md) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbaseheaderitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListViewBaseHeaderItem extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewBaseHeaderItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewBaseHeaderItem.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

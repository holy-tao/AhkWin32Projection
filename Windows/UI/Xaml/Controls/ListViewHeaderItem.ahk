#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewBaseHeaderItem.ahk
#Include .\IListViewHeaderItem.ahk
#Include .\IListViewHeaderItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents items in the header for grouped data inside a [ListView](listview.md).
 * @remarks
 * ListViewHeaderItem is a control that's created by the system and added to the visual tree when the data templates for a grouped [ListView](listview.md) are realized. Specifically, it's created when realizing the [GroupStyle.HeaderTemplate](groupstyle_headertemplate.md). You don't typically define elements for ListViewHeaderItem in XAML. There's a default template for ListViewHeaderItem as part of the built-in templates. The main app scenario for the ListViewHeaderItem class is to copy and replace the default style and template with a style of your own, which also implicitly targets ListViewHeaderItem.
 * 
 * There's a dedicated automation peer class for ListViewHeaderItem, [ListViewHeaderItemAutomationPeer](../windows.ui.xaml.automation.peers/listviewheaderitemautomationpeer.md). This is because after the [ListView](listview.md) is realized, all the created item parts need automation representation, so that Microsoft UI Automation can report them in the tree it provides for assistive technology and other Microsoft UI Automation clients.
 * 
 * If you use the [GroupStyle.HeaderContainerStyle](groupstyle_headercontainerstyle.md) property, the [Style](../windows.ui.xaml/style.md) it contains must have a [TargetType](../windows.ui.xaml/style_targettype.md) value of either ListViewHeaderItem or [GridViewHeaderItem](gridviewheaderitem.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewheaderitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListViewHeaderItem extends ListViewBaseHeaderItem {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewHeaderItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewHeaderItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ListViewHeaderItem} 
     */
    static CreateInstance() {
        if (!ListViewHeaderItem.HasProp("__IListViewHeaderItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewHeaderItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewHeaderItemFactory.IID)
            ListViewHeaderItem.__IListViewHeaderItemFactory := IListViewHeaderItemFactory(factoryPtr)
        }

        return ListViewHeaderItem.__IListViewHeaderItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

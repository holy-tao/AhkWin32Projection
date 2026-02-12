#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewBaseHeaderItem.ahk
#Include .\IGridViewHeaderItem.ahk
#Include .\IGridViewHeaderItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents items in the header for grouped data inside a [GridView](gridview.md).
 * @remarks
 * GridViewHeaderItem is a control that's created by the system and added to the visual tree when the data templates for a grouped [ListView](listview.md) are realized. Specifically, it's created when realizing the [GroupStyle.HeaderTemplate](groupstyle_headertemplate.md). You don't typically define elements for GridViewHeaderItem in XAML. There's a default template for GridViewHeaderItem as part of the built-in templates. The main app scenario for the GridViewHeaderItem class is to copy and replace the default style and template with a style of your own, which also implicitly targets GridViewHeaderItem.
 * 
 * There's a dedicated automation peer class for GridViewHeaderItem, [GridViewHeaderItemAutomationPeer](../windows.ui.xaml.automation.peers/gridviewheaderitemautomationpeer.md). This is because after the [GridView](gridview.md) is realized, all the created item parts need automation representation, so that Microsoft UI Automation can report them in the tree it provides for assistive technology and other Microsoft UI Automation clients.
 * 
 * If you use the [GroupStyle.HeaderContainerStyle](groupstyle_headercontainerstyle.md) property, the [Style](../windows.ui.xaml/style.md) it contains must have a [TargetType](../windows.ui.xaml/style_targettype.md) value of either [ListViewHeaderItem](listviewheaderitem.md) or GridViewHeaderItem.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.gridviewheaderitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class GridViewHeaderItem extends ListViewBaseHeaderItem {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridViewHeaderItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridViewHeaderItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {GridViewHeaderItem} 
     */
    static CreateInstance() {
        if (!GridViewHeaderItem.HasProp("__IGridViewHeaderItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.GridViewHeaderItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewHeaderItemFactory.IID)
            GridViewHeaderItem.__IGridViewHeaderItemFactory := IGridViewHeaderItemFactory(factoryPtr)
        }

        return GridViewHeaderItem.__IGridViewHeaderItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

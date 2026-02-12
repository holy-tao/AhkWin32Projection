#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\SelectorItem.ahk
#Include .\IFlipViewItem.ahk
#Include .\IFlipViewItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the container for an item in a [FlipView](flipview.md) control.
 * @remarks
 * The FlipViewItem class provides the container for items displayed in a [FlipView](flipview.md) control. You populate the [FlipView](flipview.md) by adding objects directly to its [Items](itemscontrol_items.md) collection or by binding its [ItemsSource](itemscontrol_itemssource.md) property to a data source. When items are added to the [FlipView](flipview.md), a FlipViewItem container is created automatically for each item in the collection.
 * 
 * You can specify the look of the FlipViewItem by setting the [FlipView](flipview.md)'s [ItemContainerStyle](itemscontrol_itemcontainerstyle.md) property to a [Style](../windows.ui.xaml/style.md) with a [TargetType](../windows.ui.xaml/style_targettype.md) of FlipViewItem.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flipviewitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class FlipViewItem extends SelectorItem {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlipViewItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlipViewItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {FlipViewItem} 
     */
    static CreateInstance() {
        if (!FlipViewItem.HasProp("__IFlipViewItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FlipViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlipViewItemFactory.IID)
            FlipViewItem.__IFlipViewItemFactory := IFlipViewItemFactory(factoryPtr)
        }

        return FlipViewItem.__IFlipViewItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

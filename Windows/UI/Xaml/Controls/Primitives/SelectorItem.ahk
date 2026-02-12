#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ContentControl.ahk
#Include .\ISelectorItem.ahk
#Include .\ISelectorItemStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides a base class for item types in a selection control.
 * @remarks
 * SelectorItem is a companion base class to the [Selector](selector.md) base class. Basically SelectorItem is the shared base class for all the specialized items that are the item type of various [Selector](selector.md) controls. For example, [ListBox](../windows.ui.xaml.controls/listbox.md) is a [Selector](selector.md) subclass, and its [ListBoxItem](../windows.ui.xaml.controls/listboxitem.md) item type is a SelectorItem subclass.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selectoritem
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class SelectorItem extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISelectorItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISelectorItem.IID

    /**
     * Identifies the [IsSelected](selectoritem_isselected.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selectoritem.isselectedproperty
     * @type {DependencyProperty} 
     */
    static IsSelectedProperty {
        get => SelectorItem.get_IsSelectedProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSelectedProperty() {
        if (!SelectorItem.HasProp("__ISelectorItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.SelectorItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectorItemStatics.IID)
            SelectorItem.__ISelectorItemStatics := ISelectorItemStatics(factoryPtr)
        }

        return SelectorItem.__ISelectorItemStatics.get_IsSelectedProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the item is selected in a selector.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selectoritem.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
        set => this.put_IsSelected(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelected() {
        if (!this.HasProp("__ISelectorItem")) {
            if ((queryResult := this.QueryInterface(ISelectorItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectorItem := ISelectorItem(outPtr)
        }

        return this.__ISelectorItem.get_IsSelected()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSelected(value) {
        if (!this.HasProp("__ISelectorItem")) {
            if ((queryResult := this.QueryInterface(ISelectorItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectorItem := ISelectorItem(outPtr)
        }

        return this.__ISelectorItem.put_IsSelected(value)
    }

;@endregion Instance Methods
}

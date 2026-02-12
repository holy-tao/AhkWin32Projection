#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MenuFlyoutItem.ahk
#Include .\IToggleMenuFlyoutItem.ahk
#Include .\IToggleMenuFlyoutItemFactory.ahk
#Include .\IToggleMenuFlyoutItemStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an item in a [MenuFlyout](menuflyout.md) that a user can change between two states, checked or unchecked.
 * @remarks
 * There are three elements that you can use to compose the menu items in a [MenuFlyout](menuflyout.md) control: [MenuFlyoutItem](menuflyoutitem.md) , ToggleMenuFlyoutItem, and [MenuFlyoutSeparator](menuflyoutseparator.md). You can use these in any combination.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglemenuflyoutitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ToggleMenuFlyoutItem extends MenuFlyoutItem {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToggleMenuFlyoutItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToggleMenuFlyoutItem.IID

    /**
     * Identifies the [IsChecked](togglemenuflyoutitem_ischecked.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglemenuflyoutitem.ischeckedproperty
     * @type {DependencyProperty} 
     */
    static IsCheckedProperty {
        get => ToggleMenuFlyoutItem.get_IsCheckedProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ToggleMenuFlyoutItem} 
     */
    static CreateInstance() {
        if (!ToggleMenuFlyoutItem.HasProp("__IToggleMenuFlyoutItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleMenuFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleMenuFlyoutItemFactory.IID)
            ToggleMenuFlyoutItem.__IToggleMenuFlyoutItemFactory := IToggleMenuFlyoutItemFactory(factoryPtr)
        }

        return ToggleMenuFlyoutItem.__IToggleMenuFlyoutItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCheckedProperty() {
        if (!ToggleMenuFlyoutItem.HasProp("__IToggleMenuFlyoutItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleMenuFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleMenuFlyoutItemStatics.IID)
            ToggleMenuFlyoutItem.__IToggleMenuFlyoutItemStatics := IToggleMenuFlyoutItemStatics(factoryPtr)
        }

        return ToggleMenuFlyoutItem.__IToggleMenuFlyoutItemStatics.get_IsCheckedProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether the [ToggleMenuFlyoutItem](togglemenuflyoutitem.md) is checked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglemenuflyoutitem.ischecked
     * @type {Boolean} 
     */
    IsChecked {
        get => this.get_IsChecked()
        set => this.put_IsChecked(value)
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
    get_IsChecked() {
        if (!this.HasProp("__IToggleMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IToggleMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleMenuFlyoutItem := IToggleMenuFlyoutItem(outPtr)
        }

        return this.__IToggleMenuFlyoutItem.get_IsChecked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsChecked(value) {
        if (!this.HasProp("__IToggleMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IToggleMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleMenuFlyoutItem := IToggleMenuFlyoutItem(outPtr)
        }

        return this.__IToggleMenuFlyoutItem.put_IsChecked(value)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MenuFlyoutItemBase.ahk
#Include .\IMenuFlyoutSubItem.ahk
#Include .\IMenuFlyoutSubItem2.ahk
#Include .\IMenuFlyoutSubItemStatics2.ahk
#Include .\IMenuFlyoutSubItemStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a menu item that displays a sub-menu in a [MenuFlyout](menuflyout.md) control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutsubitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MenuFlyoutSubItem extends MenuFlyoutItemBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyoutSubItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyoutSubItem.IID

    /**
     * Identifies the **Icon** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutsubitem.iconproperty
     * @type {DependencyProperty} 
     */
    static IconProperty {
        get => MenuFlyoutSubItem.get_IconProperty()
    }

    /**
     * Identifies the [Text](menuflyoutsubitem_text.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutsubitem.textproperty
     * @type {DependencyProperty} 
     */
    static TextProperty {
        get => MenuFlyoutSubItem.get_TextProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconProperty() {
        if (!MenuFlyoutSubItem.HasProp("__IMenuFlyoutSubItemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutSubItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutSubItemStatics2.IID)
            MenuFlyoutSubItem.__IMenuFlyoutSubItemStatics2 := IMenuFlyoutSubItemStatics2(factoryPtr)
        }

        return MenuFlyoutSubItem.__IMenuFlyoutSubItemStatics2.get_IconProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextProperty() {
        if (!MenuFlyoutSubItem.HasProp("__IMenuFlyoutSubItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutSubItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutSubItemStatics.IID)
            MenuFlyoutSubItem.__IMenuFlyoutSubItemStatics := IMenuFlyoutSubItemStatics(factoryPtr)
        }

        return MenuFlyoutSubItem.__IMenuFlyoutSubItemStatics.get_TextProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection used to generate the content of the sub-menu.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutsubitem.items
     * @type {IVector<MenuFlyoutItemBase>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets the text content of a [MenuFlyoutSubItem](menuflyoutsubitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutsubitem.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the graphic content of the menu flyout subitem.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutsubitem.icon
     * @type {IconElement} 
     */
    Icon {
        get => this.get_Icon()
        set => this.put_Icon(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MenuFlyoutSubItem](menuflyoutsubitem.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutSubItem")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<MenuFlyoutItemBase>} 
     */
    get_Items() {
        if (!this.HasProp("__IMenuFlyoutSubItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutSubItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutSubItem := IMenuFlyoutSubItem(outPtr)
        }

        return this.__IMenuFlyoutSubItem.get_Items()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IMenuFlyoutSubItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutSubItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutSubItem := IMenuFlyoutSubItem(outPtr)
        }

        return this.__IMenuFlyoutSubItem.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IMenuFlyoutSubItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutSubItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutSubItem := IMenuFlyoutSubItem(outPtr)
        }

        return this.__IMenuFlyoutSubItem.put_Text(value)
    }

    /**
     * 
     * @returns {IconElement} 
     */
    get_Icon() {
        if (!this.HasProp("__IMenuFlyoutSubItem2")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutSubItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutSubItem2 := IMenuFlyoutSubItem2(outPtr)
        }

        return this.__IMenuFlyoutSubItem2.get_Icon()
    }

    /**
     * 
     * @param {IconElement} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__IMenuFlyoutSubItem2")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutSubItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutSubItem2 := IMenuFlyoutSubItem2(outPtr)
        }

        return this.__IMenuFlyoutSubItem2.put_Icon(value)
    }

;@endregion Instance Methods
}

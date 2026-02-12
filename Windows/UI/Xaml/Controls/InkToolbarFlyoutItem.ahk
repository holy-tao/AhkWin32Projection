#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\ButtonBase.ahk
#Include .\IInkToolbarFlyoutItem.ahk
#Include .\IInkToolbarFlyoutItemStatics.ahk
#Include .\IInkToolbarFlyoutItemFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\InkToolbarFlyoutItem.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) button on a flyout. This item can be a basic button, a radio button, a radio toggle button, or a check box.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarflyoutitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarFlyoutItem extends ButtonBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarFlyoutItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarFlyoutItem.IID

    /**
     * Identifies the [Kind](inktoolbarflyoutitem_kind.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarflyoutitem.kindproperty
     * @type {DependencyProperty} 
     */
    static KindProperty {
        get => InkToolbarFlyoutItem.get_KindProperty()
    }

    /**
     * Identifies the [IsChecked](inktoolbarflyoutitem_ischecked.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarflyoutitem.ischeckedproperty
     * @type {DependencyProperty} 
     */
    static IsCheckedProperty {
        get => InkToolbarFlyoutItem.get_IsCheckedProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KindProperty() {
        if (!InkToolbarFlyoutItem.HasProp("__IInkToolbarFlyoutItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarFlyoutItemStatics.IID)
            InkToolbarFlyoutItem.__IInkToolbarFlyoutItemStatics := IInkToolbarFlyoutItemStatics(factoryPtr)
        }

        return InkToolbarFlyoutItem.__IInkToolbarFlyoutItemStatics.get_KindProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCheckedProperty() {
        if (!InkToolbarFlyoutItem.HasProp("__IInkToolbarFlyoutItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarFlyoutItemStatics.IID)
            InkToolbarFlyoutItem.__IInkToolbarFlyoutItemStatics := IInkToolbarFlyoutItemStatics(factoryPtr)
        }

        return InkToolbarFlyoutItem.__IInkToolbarFlyoutItemStatics.get_IsCheckedProperty()
    }

    /**
     * 
     * @returns {InkToolbarFlyoutItem} 
     */
    static CreateInstance() {
        if (!InkToolbarFlyoutItem.HasProp("__IInkToolbarFlyoutItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarFlyoutItemFactory.IID)
            InkToolbarFlyoutItem.__IInkToolbarFlyoutItemFactory := IInkToolbarFlyoutItemFactory(factoryPtr)
        }

        return InkToolbarFlyoutItem.__IInkToolbarFlyoutItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the type of button to use on the flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarflyoutitem.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets or sets whether the flyout item is checked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarflyoutitem.ischecked
     * @type {Boolean} 
     */
    IsChecked {
        get => this.get_IsChecked()
        set => this.put_IsChecked(value)
    }

    /**
     * Occurs when the flyout item is checked.
     * @type {TypedEventHandler<InkToolbarFlyoutItem, IInspectable>}
    */
    OnChecked {
        get {
            if(!this.HasProp("__OnChecked")){
                this.__OnChecked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{127a421c-ae3f-53df-b9ad-176847f32cde}"),
                    InkToolbarFlyoutItem,
                    IInspectable
                )
                this.__OnCheckedToken := this.add_Checked(this.__OnChecked.iface)
            }
            return this.__OnChecked
        }
    }

    /**
     * Occurs when the flyout item is unchecked.
     * @type {TypedEventHandler<InkToolbarFlyoutItem, IInspectable>}
    */
    OnUnchecked {
        get {
            if(!this.HasProp("__OnUnchecked")){
                this.__OnUnchecked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{127a421c-ae3f-53df-b9ad-176847f32cde}"),
                    InkToolbarFlyoutItem,
                    IInspectable
                )
                this.__OnUncheckedToken := this.add_Unchecked(this.__OnUnchecked.iface)
            }
            return this.__OnUnchecked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCheckedToken")) {
            this.remove_Checked(this.__OnCheckedToken)
            this.__OnChecked.iface.Dispose()
        }

        if(this.HasProp("__OnUncheckedToken")) {
            this.remove_Unchecked(this.__OnUncheckedToken)
            this.__OnUnchecked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IInkToolbarFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IInkToolbarFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarFlyoutItem := IInkToolbarFlyoutItem(outPtr)
        }

        return this.__IInkToolbarFlyoutItem.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IInkToolbarFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IInkToolbarFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarFlyoutItem := IInkToolbarFlyoutItem(outPtr)
        }

        return this.__IInkToolbarFlyoutItem.put_Kind(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChecked() {
        if (!this.HasProp("__IInkToolbarFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IInkToolbarFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarFlyoutItem := IInkToolbarFlyoutItem(outPtr)
        }

        return this.__IInkToolbarFlyoutItem.get_IsChecked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsChecked(value) {
        if (!this.HasProp("__IInkToolbarFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IInkToolbarFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarFlyoutItem := IInkToolbarFlyoutItem(outPtr)
        }

        return this.__IInkToolbarFlyoutItem.put_IsChecked(value)
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbarFlyoutItem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Checked(handler) {
        if (!this.HasProp("__IInkToolbarFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IInkToolbarFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarFlyoutItem := IInkToolbarFlyoutItem(outPtr)
        }

        return this.__IInkToolbarFlyoutItem.add_Checked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Checked(token) {
        if (!this.HasProp("__IInkToolbarFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IInkToolbarFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarFlyoutItem := IInkToolbarFlyoutItem(outPtr)
        }

        return this.__IInkToolbarFlyoutItem.remove_Checked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbarFlyoutItem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Unchecked(handler) {
        if (!this.HasProp("__IInkToolbarFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IInkToolbarFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarFlyoutItem := IInkToolbarFlyoutItem(outPtr)
        }

        return this.__IInkToolbarFlyoutItem.add_Unchecked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Unchecked(token) {
        if (!this.HasProp("__IInkToolbarFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IInkToolbarFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarFlyoutItem := IInkToolbarFlyoutItem(outPtr)
        }

        return this.__IInkToolbarFlyoutItem.remove_Unchecked(token)
    }

;@endregion Instance Methods
}

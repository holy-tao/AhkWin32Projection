#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IDatePickerFlyoutItem.ahk
#Include ..\Data\ICustomPropertyProvider.ahk
#Include .\IDatePickerFlyoutItemStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the container for an item in the [DatePickerFlyout](datepickerflyout.md) control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DatePickerFlyoutItem extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatePickerFlyoutItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatePickerFlyoutItem.IID

    /**
     * Identifies the [PrimaryText](datepickerflyoutitem_primarytext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutitem.primarytextproperty
     * @type {DependencyProperty} 
     */
    static PrimaryTextProperty {
        get => DatePickerFlyoutItem.get_PrimaryTextProperty()
    }

    /**
     * Identifies the [SecondaryText](datepickerflyoutitem_secondarytext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutitem.secondarytextproperty
     * @type {DependencyProperty} 
     */
    static SecondaryTextProperty {
        get => DatePickerFlyoutItem.get_SecondaryTextProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PrimaryTextProperty() {
        if (!DatePickerFlyoutItem.HasProp("__IDatePickerFlyoutItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutItemStatics.IID)
            DatePickerFlyoutItem.__IDatePickerFlyoutItemStatics := IDatePickerFlyoutItemStatics(factoryPtr)
        }

        return DatePickerFlyoutItem.__IDatePickerFlyoutItemStatics.get_PrimaryTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SecondaryTextProperty() {
        if (!DatePickerFlyoutItem.HasProp("__IDatePickerFlyoutItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutItemStatics.IID)
            DatePickerFlyoutItem.__IDatePickerFlyoutItemStatics := IDatePickerFlyoutItemStatics(factoryPtr)
        }

        return DatePickerFlyoutItem.__IDatePickerFlyoutItemStatics.get_SecondaryTextProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the primary text of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutitem.primarytext
     * @type {HSTRING} 
     */
    PrimaryText {
        get => this.get_PrimaryText()
        set => this.put_PrimaryText(value)
    }

    /**
     * Gets or sets the secondary text of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutitem.secondarytext
     * @type {HSTRING} 
     */
    SecondaryText {
        get => this.get_SecondaryText()
        set => this.put_SecondaryText(value)
    }

    /**
     * Gets the type of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutitem.type
     * @type {TypeName} 
     */
    Type {
        get => this.get_Type()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrimaryText() {
        if (!this.HasProp("__IDatePickerFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyoutItem := IDatePickerFlyoutItem(outPtr)
        }

        return this.__IDatePickerFlyoutItem.get_PrimaryText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PrimaryText(value) {
        if (!this.HasProp("__IDatePickerFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyoutItem := IDatePickerFlyoutItem(outPtr)
        }

        return this.__IDatePickerFlyoutItem.put_PrimaryText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecondaryText() {
        if (!this.HasProp("__IDatePickerFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyoutItem := IDatePickerFlyoutItem(outPtr)
        }

        return this.__IDatePickerFlyoutItem.get_SecondaryText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SecondaryText(value) {
        if (!this.HasProp("__IDatePickerFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyoutItem := IDatePickerFlyoutItem(outPtr)
        }

        return this.__IDatePickerFlyoutItem.put_SecondaryText(value)
    }

    /**
     * Retrieves an [ICustomProperty](../windows.ui.xaml.data/icustomproperty.md) object by specifying a property name.
     * @param {HSTRING} name The name of the property.
     * @returns {ICustomProperty} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutitem.getcustomproperty
     */
    GetCustomProperty(name) {
        if (!this.HasProp("__ICustomPropertyProvider")) {
            if ((queryResult := this.QueryInterface(ICustomPropertyProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomPropertyProvider := ICustomPropertyProvider(outPtr)
        }

        return this.__ICustomPropertyProvider.GetCustomProperty(name)
    }

    /**
     * Retrieves a custom property's [ICustomProperty](../windows.ui.xaml.data/icustomproperty.md) support object by specifying a property name and the type of the indexed collection.
     * @param {HSTRING} name The name of the custom property.
     * @param {TypeName} type The type of the indexed collection, specified as a [TypeName](../windows.ui.xaml.interop/typename.md) (for Visual C++ component extensions (C++/CX)) or [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) (for C#/VB).
     * @returns {ICustomProperty} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutitem.getindexedproperty
     */
    GetIndexedProperty(name, type) {
        if (!this.HasProp("__ICustomPropertyProvider")) {
            if ((queryResult := this.QueryInterface(ICustomPropertyProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomPropertyProvider := ICustomPropertyProvider(outPtr)
        }

        return this.__ICustomPropertyProvider.GetIndexedProperty(name, type)
    }

    /**
     * Provides support for "GetStringFromObject" and/or "ToString" logic on the assumption that the implementation supports System.Object. This logic might be accessed by features or services such as generating UI Automation values based on data content.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutitem.getstringrepresentation
     */
    GetStringRepresentation() {
        if (!this.HasProp("__ICustomPropertyProvider")) {
            if ((queryResult := this.QueryInterface(ICustomPropertyProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomPropertyProvider := ICustomPropertyProvider(outPtr)
        }

        return this.__ICustomPropertyProvider.GetStringRepresentation()
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_Type() {
        if (!this.HasProp("__ICustomPropertyProvider")) {
            if ((queryResult := this.QueryInterface(ICustomPropertyProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomPropertyProvider := ICustomPropertyProvider(outPtr)
        }

        return this.__ICustomPropertyProvider.get_Type()
    }

;@endregion Instance Methods
}

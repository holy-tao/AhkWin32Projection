#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FlyoutBase.ahk
#Include .\IPickerFlyoutBase.ahk
#Include .\IPickerFlyoutBaseOverrides.ahk
#Include .\IPickerFlyoutBaseStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a base class for picker controls.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pickerflyoutbase
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class PickerFlyoutBase extends FlyoutBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPickerFlyoutBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPickerFlyoutBase.IID

    /**
     * Gets the identifier for the attached title property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pickerflyoutbase.titleproperty
     * @type {DependencyProperty} 
     */
    static TitleProperty {
        get => PickerFlyoutBase.get_TitleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TitleProperty() {
        if (!PickerFlyoutBase.HasProp("__IPickerFlyoutBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.PickerFlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPickerFlyoutBaseStatics.IID)
            PickerFlyoutBase.__IPickerFlyoutBaseStatics := IPickerFlyoutBaseStatics(factoryPtr)
        }

        return PickerFlyoutBase.__IPickerFlyoutBaseStatics.get_TitleProperty()
    }

    /**
     * Gets the title displayed on the picker control.
     * @param {DependencyObject} element The dependency object for which to get the title.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pickerflyoutbase.gettitle
     */
    static GetTitle(element) {
        if (!PickerFlyoutBase.HasProp("__IPickerFlyoutBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.PickerFlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPickerFlyoutBaseStatics.IID)
            PickerFlyoutBase.__IPickerFlyoutBaseStatics := IPickerFlyoutBaseStatics(factoryPtr)
        }

        return PickerFlyoutBase.__IPickerFlyoutBaseStatics.GetTitle(element)
    }

    /**
     * Sets the title displayed on a picker control.
     * @param {DependencyObject} element The dependency object for which to set the title.
     * @param {HSTRING} value The title you want to display.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pickerflyoutbase.settitle
     */
    static SetTitle(element, value) {
        if (!PickerFlyoutBase.HasProp("__IPickerFlyoutBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.PickerFlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPickerFlyoutBaseStatics.IID)
            PickerFlyoutBase.__IPickerFlyoutBaseStatics := IPickerFlyoutBaseStatics(factoryPtr)
        }

        return PickerFlyoutBase.__IPickerFlyoutBaseStatics.SetTitle(element, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies [PickerFlyoutBase](pickerflyoutbase.md) subclasses when a user has confirmed a selection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pickerflyoutbase.onconfirmed
     */
    OnConfirmed() {
        if (!this.HasProp("__IPickerFlyoutBaseOverrides")) {
            if ((queryResult := this.QueryInterface(IPickerFlyoutBaseOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerFlyoutBaseOverrides := IPickerFlyoutBaseOverrides(outPtr)
        }

        return this.__IPickerFlyoutBaseOverrides.OnConfirmed()
    }

    /**
     * Gets or sets whether confirmation buttons should be shown in the picker. Note: This method has no base class implementation and must be overridden in a derived class.
     * @remarks
     * This method has no base class implementation and must be overridden in a derived class.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pickerflyoutbase.shouldshowconfirmationbuttons
     */
    ShouldShowConfirmationButtons() {
        if (!this.HasProp("__IPickerFlyoutBaseOverrides")) {
            if ((queryResult := this.QueryInterface(IPickerFlyoutBaseOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerFlyoutBaseOverrides := IPickerFlyoutBaseOverrides(outPtr)
        }

        return this.__IPickerFlyoutBaseOverrides.ShouldShowConfirmationButtons()
    }

;@endregion Instance Methods
}

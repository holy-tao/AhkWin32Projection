#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IDatePickerFlyoutPresenter.ahk
#Include .\IDatePickerFlyoutPresenter2.ahk
#Include .\IDatePickerFlyoutPresenterStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control to allow a user to pick a date.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutpresenter
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DatePickerFlyoutPresenter extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatePickerFlyoutPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatePickerFlyoutPresenter.IID

    /**
     * Identifies the [IsDefaultShadowEnabled](datepickerflyoutpresenter_isdefaultshadowenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutpresenter.isdefaultshadowenabledproperty
     * @type {DependencyProperty} 
     */
    static IsDefaultShadowEnabledProperty {
        get => DatePickerFlyoutPresenter.get_IsDefaultShadowEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDefaultShadowEnabledProperty() {
        if (!DatePickerFlyoutPresenter.HasProp("__IDatePickerFlyoutPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyoutPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutPresenterStatics2.IID)
            DatePickerFlyoutPresenter.__IDatePickerFlyoutPresenterStatics2 := IDatePickerFlyoutPresenterStatics2(factoryPtr)
        }

        return DatePickerFlyoutPresenter.__IDatePickerFlyoutPresenterStatics2.get_IsDefaultShadowEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the default shadow effect is shown.
     * @remarks
     * > [!TIP]
     * > For more info, design guidance, and code examples, see [Z-depth and shadow](/windows/uwp/design/layout/depth-shadow).
     * 
     * Many common controls automatically cast shadows using a [ThemeShadow](../windows.ui.xaml.media/themeshadow.md). 
     * 
     * If a default shadow doesn't look correct on your DatePicker's content then you can disable it by setting this property to `false`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyoutpresenter.isdefaultshadowenabled
     * @type {Boolean} 
     */
    IsDefaultShadowEnabled {
        get => this.get_IsDefaultShadowEnabled()
        set => this.put_IsDefaultShadowEnabled(value)
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
    get_IsDefaultShadowEnabled() {
        if (!this.HasProp("__IDatePickerFlyoutPresenter2")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyoutPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyoutPresenter2 := IDatePickerFlyoutPresenter2(outPtr)
        }

        return this.__IDatePickerFlyoutPresenter2.get_IsDefaultShadowEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDefaultShadowEnabled(value) {
        if (!this.HasProp("__IDatePickerFlyoutPresenter2")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyoutPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyoutPresenter2 := IDatePickerFlyoutPresenter2(outPtr)
        }

        return this.__IDatePickerFlyoutPresenter2.put_IsDefaultShadowEnabled(value)
    }

;@endregion Instance Methods
}

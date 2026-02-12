#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ITimePickerFlyoutPresenter.ahk
#Include .\ITimePickerFlyoutPresenter2.ahk
#Include .\ITimePickerFlyoutPresenterStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the visual container for the [TimePickerFlyout](timepickerflyout.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyoutpresenter
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TimePickerFlyoutPresenter extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimePickerFlyoutPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimePickerFlyoutPresenter.IID

    /**
     * Identifies the [IsDefaultShadowEnabled](timepickerflyoutpresenter_isdefaultshadowenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyoutpresenter.isdefaultshadowenabledproperty
     * @type {DependencyProperty} 
     */
    static IsDefaultShadowEnabledProperty {
        get => TimePickerFlyoutPresenter.get_IsDefaultShadowEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDefaultShadowEnabledProperty() {
        if (!TimePickerFlyoutPresenter.HasProp("__ITimePickerFlyoutPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePickerFlyoutPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerFlyoutPresenterStatics2.IID)
            TimePickerFlyoutPresenter.__ITimePickerFlyoutPresenterStatics2 := ITimePickerFlyoutPresenterStatics2(factoryPtr)
        }

        return TimePickerFlyoutPresenter.__ITimePickerFlyoutPresenterStatics2.get_IsDefaultShadowEnabledProperty()
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
     * If a default shadow doesn't look correct on your TimePicker's content then you can disable it by setting this property to `false`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyoutpresenter.isdefaultshadowenabled
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
        if (!this.HasProp("__ITimePickerFlyoutPresenter2")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyoutPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyoutPresenter2 := ITimePickerFlyoutPresenter2(outPtr)
        }

        return this.__ITimePickerFlyoutPresenter2.get_IsDefaultShadowEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDefaultShadowEnabled(value) {
        if (!this.HasProp("__ITimePickerFlyoutPresenter2")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyoutPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyoutPresenter2 := ITimePickerFlyoutPresenter2(outPtr)
        }

        return this.__ITimePickerFlyoutPresenter2.put_IsDefaultShadowEnabled(value)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IRatingControl.ahk
#Include .\IRatingControlFactory.ahk
#Include .\IRatingControlStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\RatingControl.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that lets a user enter a star rating.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RatingControl extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRatingControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRatingControl.IID

    /**
     * Identifies the Caption dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.CaptionProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.captionproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.captionproperty
     * @type {DependencyProperty} 
     */
    static CaptionProperty {
        get => RatingControl.get_CaptionProperty()
    }

    /**
     * Identifies the InitialSetValue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.InitialSetValueProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.initialsetvalueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.initialsetvalueproperty
     * @type {DependencyProperty} 
     */
    static InitialSetValueProperty {
        get => RatingControl.get_InitialSetValueProperty()
    }

    /**
     * Identifies the IsClearEnabled dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.IsClearEnabledProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.isclearenabledproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.isclearenabledproperty
     * @type {DependencyProperty} 
     */
    static IsClearEnabledProperty {
        get => RatingControl.get_IsClearEnabledProperty()
    }

    /**
     * Identifies the IsReadOnly dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.IsReadOnlyProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.isreadonlyproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.isreadonlyproperty
     * @type {DependencyProperty} 
     */
    static IsReadOnlyProperty {
        get => RatingControl.get_IsReadOnlyProperty()
    }

    /**
     * Identifies the MaxRating dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.MaxRatingProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.maxratingproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.maxratingproperty
     * @type {DependencyProperty} 
     */
    static MaxRatingProperty {
        get => RatingControl.get_MaxRatingProperty()
    }

    /**
     * Identifies the PlaceholderValue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.PlaceholderValueProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.placeholdervalueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.placeholdervalueproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderValueProperty {
        get => RatingControl.get_PlaceholderValueProperty()
    }

    /**
     * Identifies the ItemInfo dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.ItemInfoProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.iteminfoproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.iteminfoproperty
     * @type {DependencyProperty} 
     */
    static ItemInfoProperty {
        get => RatingControl.get_ItemInfoProperty()
    }

    /**
     * Identifies the Value dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.ValueProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.valueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.valueproperty
     * @type {DependencyProperty} 
     */
    static ValueProperty {
        get => RatingControl.get_ValueProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {RatingControl} 
     */
    static CreateInstance() {
        if (!RatingControl.HasProp("__IRatingControlFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlFactory.IID)
            RatingControl.__IRatingControlFactory := IRatingControlFactory(factoryPtr)
        }

        return RatingControl.__IRatingControlFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CaptionProperty() {
        if (!RatingControl.HasProp("__IRatingControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlStatics.IID)
            RatingControl.__IRatingControlStatics := IRatingControlStatics(factoryPtr)
        }

        return RatingControl.__IRatingControlStatics.get_CaptionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_InitialSetValueProperty() {
        if (!RatingControl.HasProp("__IRatingControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlStatics.IID)
            RatingControl.__IRatingControlStatics := IRatingControlStatics(factoryPtr)
        }

        return RatingControl.__IRatingControlStatics.get_InitialSetValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsClearEnabledProperty() {
        if (!RatingControl.HasProp("__IRatingControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlStatics.IID)
            RatingControl.__IRatingControlStatics := IRatingControlStatics(factoryPtr)
        }

        return RatingControl.__IRatingControlStatics.get_IsClearEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsReadOnlyProperty() {
        if (!RatingControl.HasProp("__IRatingControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlStatics.IID)
            RatingControl.__IRatingControlStatics := IRatingControlStatics(factoryPtr)
        }

        return RatingControl.__IRatingControlStatics.get_IsReadOnlyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxRatingProperty() {
        if (!RatingControl.HasProp("__IRatingControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlStatics.IID)
            RatingControl.__IRatingControlStatics := IRatingControlStatics(factoryPtr)
        }

        return RatingControl.__IRatingControlStatics.get_MaxRatingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderValueProperty() {
        if (!RatingControl.HasProp("__IRatingControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlStatics.IID)
            RatingControl.__IRatingControlStatics := IRatingControlStatics(factoryPtr)
        }

        return RatingControl.__IRatingControlStatics.get_PlaceholderValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemInfoProperty() {
        if (!RatingControl.HasProp("__IRatingControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlStatics.IID)
            RatingControl.__IRatingControlStatics := IRatingControlStatics(factoryPtr)
        }

        return RatingControl.__IRatingControlStatics.get_ItemInfoProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ValueProperty() {
        if (!RatingControl.HasProp("__IRatingControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlStatics.IID)
            RatingControl.__IRatingControlStatics := IRatingControlStatics(factoryPtr)
        }

        return RatingControl.__IRatingControlStatics.get_ValueProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the text label for the control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.Caption](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.caption) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.caption
     * @type {HSTRING} 
     */
    Caption {
        get => this.get_Caption()
        set => this.put_Caption(value)
    }

    /**
     * Gets or sets the initial set rating value.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.InitialSetValue](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.initialsetvalue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.initialsetvalue
     * @type {Integer} 
     */
    InitialSetValue {
        get => this.get_InitialSetValue()
        set => this.put_InitialSetValue(value)
    }

    /**
     * Gets or sets the value that determines if the user can remove the rating.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.IsClearEnabled](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.isclearenabled) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.isclearenabled
     * @type {Boolean} 
     */
    IsClearEnabled {
        get => this.get_IsClearEnabled()
        set => this.put_IsClearEnabled(value)
    }

    /**
     * Gets or sets the value that determines if the user can change the rating.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.IsReadOnly](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.isreadonly) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
        set => this.put_IsReadOnly(value)
    }

    /**
     * Gets or sets the maximum allowed rating value.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.MaxRating](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.maxrating) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.maxrating
     * @type {Integer} 
     */
    MaxRating {
        get => this.get_MaxRating()
        set => this.put_MaxRating(value)
    }

    /**
     * Gets or sets the rating that is displayed in the control until the value is changed by a user action or some other operation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.PlaceholderValue](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.placeholdervalue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.placeholdervalue
     * @type {Float} 
     */
    PlaceholderValue {
        get => this.get_PlaceholderValue()
        set => this.put_PlaceholderValue(value)
    }

    /**
     * Gets or sets info about the visual states of the items that represent a rating.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.ItemInfo](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.iteminfo) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * You can set the ItemInfo property to replace the default stars with other glyphs or images that represent a rating.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.iteminfo
     * @type {RatingItemInfo} 
     */
    ItemInfo {
        get => this.get_ItemInfo()
        set => this.put_ItemInfo(value)
    }

    /**
     * Gets or sets the rating value.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.Value](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.value) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingcontrol.value
     * @type {Float} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Occurs when the Value property has changed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingControl.ValueChanged](/windows/winui/api/microsoft.ui.xaml.controls.ratingcontrol.valuechanged) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<RatingControl, IInspectable>}
    */
    OnValueChanged {
        get {
            if(!this.HasProp("__OnValueChanged")){
                this.__OnValueChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{180be111-c600-5e5d-8266-fb29b9656af4}"),
                    RatingControl,
                    IInspectable
                )
                this.__OnValueChangedToken := this.add_ValueChanged(this.__OnValueChanged.iface)
            }
            return this.__OnValueChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnValueChangedToken")) {
            this.remove_ValueChanged(this.__OnValueChangedToken)
            this.__OnValueChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Caption() {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.get_Caption()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Caption(value) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.put_Caption(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitialSetValue() {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.get_InitialSetValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InitialSetValue(value) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.put_InitialSetValue(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsClearEnabled() {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.get_IsClearEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsClearEnabled(value) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.put_IsClearEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.get_IsReadOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsReadOnly(value) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.put_IsReadOnly(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxRating() {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.get_MaxRating()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxRating(value) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.put_MaxRating(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaceholderValue() {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.get_PlaceholderValue()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderValue(value) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.put_PlaceholderValue(value)
    }

    /**
     * 
     * @returns {RatingItemInfo} 
     */
    get_ItemInfo() {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.get_ItemInfo()
    }

    /**
     * 
     * @param {RatingItemInfo} value 
     * @returns {HRESULT} 
     */
    put_ItemInfo(value) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.put_ItemInfo(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Value() {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.get_Value()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.put_Value(value)
    }

    /**
     * 
     * @param {TypedEventHandler<RatingControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ValueChanged(handler) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.add_ValueChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ValueChanged(token) {
        if (!this.HasProp("__IRatingControl")) {
            if ((queryResult := this.QueryInterface(IRatingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingControl := IRatingControl(outPtr)
        }

        return this.__IRatingControl.remove_ValueChanged(token)
    }

;@endregion Instance Methods
}

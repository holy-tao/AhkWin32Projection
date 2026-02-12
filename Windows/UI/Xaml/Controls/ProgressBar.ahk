#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\RangeBase.ahk
#Include .\IProgressBar.ahk
#Include .\IProgressBarFactory.ahk
#Include .\IProgressBarStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control that indicates the progress of an operation, where the typical visual appearance is a bar that animates a filled area as progress continues.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressBar](/windows/winui/api/microsoft.ui.xaml.controls.progressbar) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Progress controls](/windows/uwp/controls-and-patterns/progress-controls).
 * 
 * A ProgressBar control visually indicates progress of an operation with one of two styles: a bar that displays a repeating pattern, or a bar that fills based on a value.
 * 
 * <img src="images/controls/ProgressBar_Indeterminate.png" alt="Indeterminate progress bar control" />
 * 
 * <img alt="Progress bar control" src="images/controls/ProgressBar_Determinate.png" />
 * 
 * The [IsIndeterminate](progressbar_isindeterminate.md) property determines the appearance of a ProgressBar.
 * + Set [IsIndeterminate](progressbar_isindeterminate.md) to **true** to display a repeating pattern. An alternative control to use for indeterminate progress is a [ProgressRing](progressring.md).
 * + Set [IsIndeterminate](progressbar_isindeterminate.md) to **false** to fill the bar based on a value. When [IsIndeterminate](progressbar_isindeterminate.md) is **false**, you specify the range with the [Minimum](../windows.ui.xaml.controls.primitives/rangebase_minimum.md) and [Maximum](../windows.ui.xaml.controls.primitives/rangebase_maximum.md) properties. By default [Minimum](../windows.ui.xaml.controls.primitives/rangebase_minimum.md) is 0 and [Maximum](../windows.ui.xaml.controls.primitives/rangebase_maximum.md) is 100. To specify the progress value, you set the [Value](../windows.ui.xaml.controls.primitives/rangebase_value.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressbar
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ProgressBar extends RangeBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProgressBar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProgressBar.IID

    /**
     * Identifies the [IsIndeterminate](progressbar_isindeterminate.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressBar.IsIndeterminateProperty](/windows/winui/api/microsoft.ui.xaml.controls.progressbar.isindeterminateproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressbar.isindeterminateproperty
     * @type {DependencyProperty} 
     */
    static IsIndeterminateProperty {
        get => ProgressBar.get_IsIndeterminateProperty()
    }

    /**
     * Identifies the [ShowError](progressbar_showerror.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressBar.ShowErrorProperty](/windows/winui/api/microsoft.ui.xaml.controls.progressbar.showerrorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressbar.showerrorproperty
     * @type {DependencyProperty} 
     */
    static ShowErrorProperty {
        get => ProgressBar.get_ShowErrorProperty()
    }

    /**
     * Identifies the [ShowPaused](progressbar_showpaused.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressBar.ShowPausedProperty](/windows/winui/api/microsoft.ui.xaml.controls.progressbar.showpausedproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressbar.showpausedproperty
     * @type {DependencyProperty} 
     */
    static ShowPausedProperty {
        get => ProgressBar.get_ShowPausedProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ProgressBar} 
     */
    static CreateInstance() {
        if (!ProgressBar.HasProp("__IProgressBarFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ProgressBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProgressBarFactory.IID)
            ProgressBar.__IProgressBarFactory := IProgressBarFactory(factoryPtr)
        }

        return ProgressBar.__IProgressBarFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsIndeterminateProperty() {
        if (!ProgressBar.HasProp("__IProgressBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ProgressBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProgressBarStatics.IID)
            ProgressBar.__IProgressBarStatics := IProgressBarStatics(factoryPtr)
        }

        return ProgressBar.__IProgressBarStatics.get_IsIndeterminateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShowErrorProperty() {
        if (!ProgressBar.HasProp("__IProgressBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ProgressBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProgressBarStatics.IID)
            ProgressBar.__IProgressBarStatics := IProgressBarStatics(factoryPtr)
        }

        return ProgressBar.__IProgressBarStatics.get_ShowErrorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShowPausedProperty() {
        if (!ProgressBar.HasProp("__IProgressBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ProgressBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProgressBarStatics.IID)
            ProgressBar.__IProgressBarStatics := IProgressBarStatics(factoryPtr)
        }

        return ProgressBar.__IProgressBarStatics.get_ShowPausedProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the progress bar reports generic progress with a repeating pattern or reports progress based on the [Value](../windows.ui.xaml.controls.primitives/rangebase_value.md) property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressBar.IsIndeterminate](/windows/winui/api/microsoft.ui.xaml.controls.progressbar.isindeterminate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressbar.isindeterminate
     * @type {Boolean} 
     */
    IsIndeterminate {
        get => this.get_IsIndeterminate()
        set => this.put_IsIndeterminate(value)
    }

    /**
     * Gets or sets a value that indicates whether the progress bar should use visual states that communicate an **Error** state to the user.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressBar.ShowError](/windows/winui/api/microsoft.ui.xaml.controls.progressbar.showerror) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressbar.showerror
     * @type {Boolean} 
     */
    ShowError {
        get => this.get_ShowError()
        set => this.put_ShowError(value)
    }

    /**
     * Gets or sets a value that indicates whether the progress bar should use visual states that communicate a **Paused** state to the user.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressBar.ShowPaused](/windows/winui/api/microsoft.ui.xaml.controls.progressbar.showpaused) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressbar.showpaused
     * @type {Boolean} 
     */
    ShowPaused {
        get => this.get_ShowPaused()
        set => this.put_ShowPaused(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when defining templates for a [ProgressBar](progressbar.md) control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressBar.TemplateSettings](/windows/winui/api/microsoft.ui.xaml.controls.progressbar.templatesettings) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressbar.templatesettings
     * @type {ProgressBarTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
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
    get_IsIndeterminate() {
        if (!this.HasProp("__IProgressBar")) {
            if ((queryResult := this.QueryInterface(IProgressBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBar := IProgressBar(outPtr)
        }

        return this.__IProgressBar.get_IsIndeterminate()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsIndeterminate(value) {
        if (!this.HasProp("__IProgressBar")) {
            if ((queryResult := this.QueryInterface(IProgressBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBar := IProgressBar(outPtr)
        }

        return this.__IProgressBar.put_IsIndeterminate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowError() {
        if (!this.HasProp("__IProgressBar")) {
            if ((queryResult := this.QueryInterface(IProgressBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBar := IProgressBar(outPtr)
        }

        return this.__IProgressBar.get_ShowError()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowError(value) {
        if (!this.HasProp("__IProgressBar")) {
            if ((queryResult := this.QueryInterface(IProgressBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBar := IProgressBar(outPtr)
        }

        return this.__IProgressBar.put_ShowError(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowPaused() {
        if (!this.HasProp("__IProgressBar")) {
            if ((queryResult := this.QueryInterface(IProgressBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBar := IProgressBar(outPtr)
        }

        return this.__IProgressBar.get_ShowPaused()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowPaused(value) {
        if (!this.HasProp("__IProgressBar")) {
            if ((queryResult := this.QueryInterface(IProgressBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBar := IProgressBar(outPtr)
        }

        return this.__IProgressBar.put_ShowPaused(value)
    }

    /**
     * 
     * @returns {ProgressBarTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IProgressBar")) {
            if ((queryResult := this.QueryInterface(IProgressBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBar := IProgressBar(outPtr)
        }

        return this.__IProgressBar.get_TemplateSettings()
    }

;@endregion Instance Methods
}

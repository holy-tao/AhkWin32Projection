#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IProgressRing.ahk
#Include .\IProgressRingStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control that indicates that an operation is ongoing. The typical visual appearance is a ring-shaped "spinner" that cycles an animation as progress continues.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressRing](/windows/winui/api/microsoft.ui.xaml.controls.progressring) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [[Progress controls](/windows/uwp/controls-and-patterns/progress-controls).
 * 
 * ProgressRing is a control that indicates indeterminate progress by displaying an animated ring.
 * 
 * <img alt="Progress ring control" src="images/controls/ProgressRing.png" />
 * 
 * Use a ProgressRing to visually indicate that an operation is in progress. Set the [IsActive](progressring_isactive.md) property to turn the ProgressRing on or off. If [IsActive](progressring_isactive.md) is false, the ProgressRing is not shown, but space is reserved for it in the UI layout. To not reserve space for the ProgressRing, set its [Visibility](../windows.ui.xaml/uielement_visibility.md) property to [Collapsed](../windows.ui.xaml/visibility.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressring
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ProgressRing extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProgressRing

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProgressRing.IID

    /**
     * Identifies the [IsActive](progressring_isactive.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressRing.IsActiveProperty](/windows/winui/api/microsoft.ui.xaml.controls.progressring.isactiveproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressring.isactiveproperty
     * @type {DependencyProperty} 
     */
    static IsActiveProperty {
        get => ProgressRing.get_IsActiveProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsActiveProperty() {
        if (!ProgressRing.HasProp("__IProgressRingStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ProgressRing")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProgressRingStatics.IID)
            ProgressRing.__IProgressRingStatics := IProgressRingStatics(factoryPtr)
        }

        return ProgressRing.__IProgressRingStatics.get_IsActiveProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the [ProgressRing](progressring.md) is showing progress.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressRing.IsActive](/windows/winui/api/microsoft.ui.xaml.controls.progressring.isactive) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * Set the IsActive property to turn the [ProgressRing](progressring.md) on or off. If IsActive is false, the [ProgressRing](progressring.md) is not shown, but space is reserved for it in the UI layout. To not reserve space for the [ProgressRing](progressring.md), set its [Visibility](../windows.ui.xaml/uielement_visibility.md) property to [Collapsed](../windows.ui.xaml/visibility.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressring.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
        set => this.put_IsActive(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when defining templates for a [ProgressRing](progressring.md) control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressRing.TemplateSettings](/windows/winui/api/microsoft.ui.xaml.controls.progressring.templatesettings) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.progressring.templatesettings
     * @type {ProgressRingTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ProgressRing](progressring.md) class.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ProgressRing.-ctor](/windows/winui/api/microsoft.ui.xaml.controls.progressring.-ctor) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ProgressRing")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IProgressRing")) {
            if ((queryResult := this.QueryInterface(IProgressRing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressRing := IProgressRing(outPtr)
        }

        return this.__IProgressRing.get_IsActive()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsActive(value) {
        if (!this.HasProp("__IProgressRing")) {
            if ((queryResult := this.QueryInterface(IProgressRing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressRing := IProgressRing(outPtr)
        }

        return this.__IProgressRing.put_IsActive(value)
    }

    /**
     * 
     * @returns {ProgressRingTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IProgressRing")) {
            if ((queryResult := this.QueryInterface(IProgressRing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressRing := IProgressRing(outPtr)
        }

        return this.__IProgressRing.get_TemplateSettings()
    }

;@endregion Instance Methods
}

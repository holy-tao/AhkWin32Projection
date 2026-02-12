#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUISettingsController.ahk
#Include .\IUISettingsControllerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to the **Accessibility** visual effects settings (Settings -> Accessibility -> Visual effects).
 * @remarks
 * The settings include persistent scrollbars, transparency effects, animation effects, and notification duration.
 * 
 * :::image type="content" source="images/accessibility-display-settings.png" alt-text="Screenshot of the Accessibility Visual effects settings dialog.":::
 * 
 * > [!IMPORTANT]
 * > This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list.
 * >
 * > Add the following to the Package.appmanifest:
 * >
 * > - To `<Package>`
 * >   - `IgnorableNamespaces="iot"`
 * > - Under `<Capabilities>`
 * >   - `<iot:Capability Name="systemManagement"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.uisettingscontroller
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class UISettingsController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUISettingsController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUISettingsController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the default [UISettingsController](uisettingscontroller.md) with access to the **Accessibility** visual effects settings (Settings -> Accessibility -> Visual effects).
     * @remarks
     * > [!IMPORTANT]
     * > This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list.
     * >
     * > Add the following to the Package.appmanifest:
     * >
     * > - To `<Package>`
     * >   - `IgnorableNamespaces="iot"`
     * > - Under `<Capabilities>`
     * >   - `<iot:Capability Name="systemManagement"/>`
     * @returns {IAsyncOperation<UISettingsController>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.uisettingscontroller.requestdefaultasync
     */
    static RequestDefaultAsync() {
        if (!UISettingsController.HasProp("__IUISettingsControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.Core.UISettingsController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUISettingsControllerStatics.IID)
            UISettingsController.__IUISettingsControllerStatics := IUISettingsControllerStatics(factoryPtr)
        }

        return UISettingsController.__IUISettingsControllerStatics.RequestDefaultAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Turn complex window display effects on or off through the **Accessibility** visual effects settings (Settings -> Accessibility -> Visual effects).
     * @remarks
     * > [!IMPORTANT]
     * > This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list.
     * >
     * > Add the following to the Package.appmanifest:
     * >
     * > - To `<Package>`
     * >   - `IgnorableNamespaces="iot"`
     * > - Under `<Capabilities>`
     * >   - `<iot:Capability Name="systemManagement"/>`
     * @param {Boolean} value True, if enabled. Otherwise, false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.uisettingscontroller.setadvancedeffectsenabled
     */
    SetAdvancedEffectsEnabled(value) {
        if (!this.HasProp("__IUISettingsController")) {
            if ((queryResult := this.QueryInterface(IUISettingsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettingsController := IUISettingsController(outPtr)
        }

        return this.__IUISettingsController.SetAdvancedEffectsEnabled(value)
    }

    /**
     * Turn window animation effects on or off through the **Accessibility** visual effects settings (Settings -> Accessibility -> Visual effects).
     * @remarks
     * > [!IMPORTANT]
     * > This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list.
     * >
     * > Add the following to the Package.appmanifest:
     * >
     * > - To `<Package>`
     * >   - `IgnorableNamespaces="iot"`
     * > - Under `<Capabilities>`
     * >   - `<iot:Capability Name="systemManagement"/>`
     * @param {Boolean} value True, if enabled. Otherwise, false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.uisettingscontroller.setanimationsenabled
     */
    SetAnimationsEnabled(value) {
        if (!this.HasProp("__IUISettingsController")) {
            if ((queryResult := this.QueryInterface(IUISettingsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettingsController := IUISettingsController(outPtr)
        }

        return this.__IUISettingsController.SetAnimationsEnabled(value)
    }

    /**
     * Turn automatic hiding of scroll bars on or off through the **Accessibility** visual effects settings (Settings -> Accessibility -> Visual effects).
     * @remarks
     * > [!IMPORTANT]
     * > This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list.
     * >
     * > Add the following to the Package.appmanifest:
     * >
     * > - To `<Package>`
     * >   - `IgnorableNamespaces="iot"`
     * > - Under `<Capabilities>`
     * >   - `<iot:Capability Name="systemManagement"/>`
     * @param {Boolean} value True, if enabled. Otherwise, false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.uisettingscontroller.setautohidescrollbars
     */
    SetAutoHideScrollBars(value) {
        if (!this.HasProp("__IUISettingsController")) {
            if ((queryResult := this.QueryInterface(IUISettingsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettingsController := IUISettingsController(outPtr)
        }

        return this.__IUISettingsController.SetAutoHideScrollBars(value)
    }

    /**
     * Set the amount of time that notifications are shown through the **Accessibility** visual effects settings (Settings -> Accessibility -> Visual effects).
     * @remarks
     * > [!IMPORTANT]
     * > This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list.
     * >
     * > Add the following to the Package.appmanifest:
     * >
     * > - To `<Package>`
     * >   - `IgnorableNamespaces="iot"`
     * > - Under `<Capabilities>`
     * >   - `<iot:Capability Name="systemManagement"/>`
     * @param {Integer} value The amount of time notifications are shown, in seconds.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.uisettingscontroller.setmessageduration
     */
    SetMessageDuration(value) {
        if (!this.HasProp("__IUISettingsController")) {
            if ((queryResult := this.QueryInterface(IUISettingsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettingsController := IUISettingsController(outPtr)
        }

        return this.__IUISettingsController.SetMessageDuration(value)
    }

    /**
     * Set the text scale factor through the **Accessibility** visual effects settings (Settings -> Accessibility -> Visual effects).
     * @remarks
     * > [!IMPORTANT]
     * > This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list.
     * >
     * > Add the following to the Package.appmanifest:
     * >
     * > - To `<Package>`
     * >   - `IgnorableNamespaces="iot"`
     * > - Under `<Capabilities>`
     * >   - `<iot:Capability Name="systemManagement"/>`
     * @param {Float} value The text scale factor, in percent (100-225).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.uisettingscontroller.settextscalefactor
     */
    SetTextScaleFactor(value) {
        if (!this.HasProp("__IUISettingsController")) {
            if ((queryResult := this.QueryInterface(IUISettingsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettingsController := IUISettingsController(outPtr)
        }

        return this.__IUISettingsController.SetTextScaleFactor(value)
    }

;@endregion Instance Methods
}

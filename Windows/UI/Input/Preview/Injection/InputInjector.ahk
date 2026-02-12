#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInputInjector.ahk
#Include .\IInputInjector2.ahk
#Include .\IInputInjectorStatics2.ahk
#Include .\IInputInjectorStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the virtual input device for sending the input data.
 * @remarks
 * > [!Important]
 * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
 * 
 * Using input injection requires the following be added to the Package.appxmanifest:
 * 
 * - To `<Package>`
 *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
 *   - `IgnorableNamespaces="rescap"`
 * - To `<Capabilities>`
 *   - `<rescap:Capability Name="inputInjectionBrokered" />`
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InputInjector extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputInjector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputInjector.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Attempts to create a new instance of the [InputInjector](inputinjector.md) class.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * 
     * This method differs from [TryCreate](inputinjector_trycreate_508033141.md) in that input injection is restricted to the process that is actively being captured for broadcast using an [App​Broadcast​Services](/uwp/api/windows.media.capture.appbroadcastservices) object. Injected input is silently dropped when there is no such active process.
     * @returns {InputInjector} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.trycreateforappbroadcastonly
     */
    static TryCreateForAppBroadcastOnly() {
        if (!InputInjector.HasProp("__IInputInjectorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.Injection.InputInjector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInputInjectorStatics2.IID)
            InputInjector.__IInputInjectorStatics2 := IInputInjectorStatics2(factoryPtr)
        }

        return InputInjector.__IInputInjectorStatics2.TryCreateForAppBroadcastOnly()
    }

    /**
     * Attempts to create a new instance of the [InputInjector](inputinjector.md) class.
     * 
     * > [!NOTE]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * 
     * Use [TryCreateForAppBroadcastOnly](inputinjector_trycreateforappbroadcastonly_1904430574.md) when input injection should be restricted to the process that is actively being captured for broadcast using an [App​Broadcast​Services](/uwp/api/windows.media.capture.appbroadcastservices) object.
     * @returns {InputInjector} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.trycreate
     */
    static TryCreate() {
        if (!InputInjector.HasProp("__IInputInjectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.Injection.InputInjector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInputInjectorStatics.IID)
            InputInjector.__IInputInjectorStatics := IInputInjectorStatics(factoryPtr)
        }

        return InputInjector.__IInputInjectorStatics.TryCreate()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sends programmatically generated keyboard input to the system.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @param {IIterable<InjectedInputKeyboardInfo>} input_ The keyboard input specified by [InjectedInputKeyboardInfo](injectedinputkeyboardinfo.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.injectkeyboardinput
     */
    InjectKeyboardInput(input_) {
        if (!this.HasProp("__IInputInjector")) {
            if ((queryResult := this.QueryInterface(IInputInjector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector := IInputInjector(outPtr)
        }

        return this.__IInputInjector.InjectKeyboardInput(input_)
    }

    /**
     * Sends programmatically generated mouse input to the system.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @param {IIterable<InjectedInputMouseInfo>} input_ The mouse input specified by [InjectedInputMouseInfo](injectedinputmouseinfo.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.injectmouseinput
     */
    InjectMouseInput(input_) {
        if (!this.HasProp("__IInputInjector")) {
            if ((queryResult := this.QueryInterface(IInputInjector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector := IInputInjector(outPtr)
        }

        return this.__IInputInjector.InjectMouseInput(input_)
    }

    /**
     * Initializes a virtual touch device that can synthesize input events and provide corresponding input data to the system.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @param {Integer} visualMode The type of visual feedback displayed for touch input injection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.initializetouchinjection
     */
    InitializeTouchInjection(visualMode) {
        if (!this.HasProp("__IInputInjector")) {
            if ((queryResult := this.QueryInterface(IInputInjector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector := IInputInjector(outPtr)
        }

        return this.__IInputInjector.InitializeTouchInjection(visualMode)
    }

    /**
     * Sends programmatically generated touch input to the system.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @param {IIterable<InjectedInputTouchInfo>} input_ The touch input specified by [InjectedInputTouchInfo](injectedinputtouchinfo.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.injecttouchinput
     */
    InjectTouchInput(input_) {
        if (!this.HasProp("__IInputInjector")) {
            if ((queryResult := this.QueryInterface(IInputInjector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector := IInputInjector(outPtr)
        }

        return this.__IInputInjector.InjectTouchInput(input_)
    }

    /**
     * Shuts down the virtual touch device created with [InitializeTouchInjection](inputinjector_initializetouchinjection_1509714255.md).
     * 
     * > [!NOTE]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.uninitializetouchinjection
     */
    UninitializeTouchInjection() {
        if (!this.HasProp("__IInputInjector")) {
            if ((queryResult := this.QueryInterface(IInputInjector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector := IInputInjector(outPtr)
        }

        return this.__IInputInjector.UninitializeTouchInjection()
    }

    /**
     * Initializes a virtual pen device that can synthesize input events and provide corresponding input data to the system.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @param {Integer} visualMode The visual feedback mode for pen input injection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.initializepeninjection
     */
    InitializePenInjection(visualMode) {
        if (!this.HasProp("__IInputInjector")) {
            if ((queryResult := this.QueryInterface(IInputInjector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector := IInputInjector(outPtr)
        }

        return this.__IInputInjector.InitializePenInjection(visualMode)
    }

    /**
     * Sends programmatically generated pen input to the system.
     * 
     * > [!NOTE]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @param {InjectedInputPenInfo} input_ The pen input specified by [InjectedInputPenInfo](injectedinputpeninfo.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.injectpeninput
     */
    InjectPenInput(input_) {
        if (!this.HasProp("__IInputInjector")) {
            if ((queryResult := this.QueryInterface(IInputInjector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector := IInputInjector(outPtr)
        }

        return this.__IInputInjector.InjectPenInput(input_)
    }

    /**
     * Shuts down the virtual pen device created with [InitializePenInjection](inputinjector_initializepeninjection_260722924.md).
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.uninitializepeninjection
     */
    UninitializePenInjection() {
        if (!this.HasProp("__IInputInjector")) {
            if ((queryResult := this.QueryInterface(IInputInjector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector := IInputInjector(outPtr)
        }

        return this.__IInputInjector.UninitializePenInjection()
    }

    /**
     * Sends programmatically generated system shortcuts to the system.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @param {Integer} shortcut The system shortcuts.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.injectshortcut
     */
    InjectShortcut(shortcut) {
        if (!this.HasProp("__IInputInjector")) {
            if ((queryResult := this.QueryInterface(IInputInjector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector := IInputInjector(outPtr)
        }

        return this.__IInputInjector.InjectShortcut(shortcut)
    }

    /**
     * Initializes a virtual gamepad device that can synthesize input events and provide corresponding input data to the system.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * 
     * Calling this method is analogous to connecting a physical gamepad, which also triggers a [GamepadAdded](/uwp/api/windows.gaming.input.gamepad.GamepadAdded) event.
     * 
     * A physical gamepad is assigned a persistent unique ID (see [NonRoamableId](../windows.gaming.input/rawgamecontroller_nonroamableid.md)) that does not change when the device is connected and disconnected. Similarly, a virtual gamepad created with InitializeGamepadInjection is also assigned a unique ID that persists across calls to UninitializeGamepadInjection and InitializeGamepadInjection for the same [InputInjector](inputinjector.md) instance.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.initializegamepadinjection
     */
    InitializeGamepadInjection() {
        if (!this.HasProp("__IInputInjector2")) {
            if ((queryResult := this.QueryInterface(IInputInjector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector2 := IInputInjector2(outPtr)
        }

        return this.__IInputInjector2.InitializeGamepadInjection()
    }

    /**
     * Sends programmatically generated gamepad input to the system.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @param {InjectedInputGamepadInfo} input_ The gamepad input specified by [InjectedInputGamepadInfo](injectedinputgamepadinfo.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.injectgamepadinput
     */
    InjectGamepadInput(input_) {
        if (!this.HasProp("__IInputInjector2")) {
            if ((queryResult := this.QueryInterface(IInputInjector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector2 := IInputInjector2(outPtr)
        }

        return this.__IInputInjector2.InjectGamepadInput(input_)
    }

    /**
     * Shuts down the virtual gamepad device created with [InitializeGamepadInjection](inputinjector_initializegamepadinjection_1113833135.md).
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * 
     * Using input injection requires the following be added to the Package.appxmanifest:
     * 
     * - To `<Package>`
     *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *     - `IgnorableNamespaces="rescap"`
     * - To `<Capabilities>`
     *     - `<rescap:Capability Name="inputInjectionBrokered" />`
     * 
     * Calling this method is analogous to disconnecting a physical gamepad, which also triggers a [GamepadRemoved](/uwp/api/windows.gaming.input.gamepad.GamepadRemoved) event.
     * 
     * A physical gamepad is assigned a persistent unique ID (see [NonRoamableId](../windows.gaming.input/rawgamecontroller_nonroamableid.md)) that does not change when the device is connected and disconnected. Similarly, a virtual gamepad created with [InitializeGamepadInjection](inputinjector_initializegamepadinjection_1113833135.md) is also assigned a unique ID that persists across calls to [UninitializeGamepadInjection](inputinjector_initializegamepadinjection_1113833135.md) and [InitializeGamepadInjection](inputinjector_initializegamepadinjection_1113833135.md) for the same [InputInjector](inputinjector.md) instance.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.inputinjector.uninitializegamepadinjection
     */
    UninitializeGamepadInjection() {
        if (!this.HasProp("__IInputInjector2")) {
            if ((queryResult := this.QueryInterface(IInputInjector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputInjector2 := IInputInjector2(outPtr)
        }

        return this.__IInputInjector2.UninitializeGamepadInjection()
    }

;@endregion Instance Methods
}

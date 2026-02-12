#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInjectedInputGamepadInfo.ahk
#Include .\IInjectedInputGamepadInfoFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents programmatically generated gamepad input.
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputgamepadinfo
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputGamepadInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInjectedInputGamepadInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInjectedInputGamepadInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [InjectedInputGamepadInfo](injectedinputgamepadinfo.md) object that is used to specify the gamepad input to inject based on the current state of the gamepad.
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
     * @param {GamepadReading} reading The current state of the gamepad.
     * 
     * > [!NOTE]
     * > The [Timestamp](/uwp/api/windows.gaming.input.gamepadreading?branch=rs3.Timestamp) value is replaced with the current time of input injection.
     * @returns {InjectedInputGamepadInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputgamepadinfo.#ctor
     */
    static CreateInstanceFromGamepadReading(reading) {
        if (!InjectedInputGamepadInfo.HasProp("__IInjectedInputGamepadInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.Injection.InjectedInputGamepadInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInjectedInputGamepadInfoFactory.IID)
            InjectedInputGamepadInfo.__IInjectedInputGamepadInfoFactory := IInjectedInputGamepadInfoFactory(factoryPtr)
        }

        return InjectedInputGamepadInfo.__IInjectedInputGamepadInfoFactory.CreateInstanceFromGamepadReading(reading)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the gamepad buttons used for input injection.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputgamepadinfo.buttons
     * @type {Integer} 
     */
    Buttons {
        get => this.get_Buttons()
        set => this.put_Buttons(value)
    }

    /**
     * Gets or sets the position of the left stick on the X-axis.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputgamepadinfo.leftthumbstickx
     * @type {Float} 
     */
    LeftThumbstickX {
        get => this.get_LeftThumbstickX()
        set => this.put_LeftThumbstickX(value)
    }

    /**
     * Gets or sets the position of the left stick on the Y-axis.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputgamepadinfo.leftthumbsticky
     * @type {Float} 
     */
    LeftThumbstickY {
        get => this.get_LeftThumbstickY()
        set => this.put_LeftThumbstickY(value)
    }

    /**
     * Gets or sets the position of the left trigger.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputgamepadinfo.lefttrigger
     * @type {Float} 
     */
    LeftTrigger {
        get => this.get_LeftTrigger()
        set => this.put_LeftTrigger(value)
    }

    /**
     * Gets or sets the position of the right stick on the X-axis.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputgamepadinfo.rightthumbstickx
     * @type {Float} 
     */
    RightThumbstickX {
        get => this.get_RightThumbstickX()
        set => this.put_RightThumbstickX(value)
    }

    /**
     * Gets or sets the position of the right stick on the Y-axis.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputgamepadinfo.rightthumbsticky
     * @type {Float} 
     */
    RightThumbstickY {
        get => this.get_RightThumbstickY()
        set => this.put_RightThumbstickY(value)
    }

    /**
     * Gets or sets the position of the right trigger.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputgamepadinfo.righttrigger
     * @type {Float} 
     */
    RightTrigger {
        get => this.get_RightTrigger()
        set => this.put_RightTrigger(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [InjectedInputGamepadInfo](injectedinputgamepadinfo.md) object that is used to specify the gamepad input to inject.
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
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.Injection.InjectedInputGamepadInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Buttons() {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.get_Buttons()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Buttons(value) {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.put_Buttons(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftThumbstickX() {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.get_LeftThumbstickX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LeftThumbstickX(value) {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.put_LeftThumbstickX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftThumbstickY() {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.get_LeftThumbstickY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LeftThumbstickY(value) {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.put_LeftThumbstickY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftTrigger() {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.get_LeftTrigger()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LeftTrigger(value) {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.put_LeftTrigger(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightThumbstickX() {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.get_RightThumbstickX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RightThumbstickX(value) {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.put_RightThumbstickX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightThumbstickY() {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.get_RightThumbstickY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RightThumbstickY(value) {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.put_RightThumbstickY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightTrigger() {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.get_RightTrigger()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RightTrigger(value) {
        if (!this.HasProp("__IInjectedInputGamepadInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputGamepadInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputGamepadInfo := IInjectedInputGamepadInfo(outPtr)
        }

        return this.__IInjectedInputGamepadInfo.put_RightTrigger(value)
    }

;@endregion Instance Methods
}

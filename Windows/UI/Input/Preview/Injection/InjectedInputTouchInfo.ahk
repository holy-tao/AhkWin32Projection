#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInjectedInputTouchInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents programmatically generated touch input.
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputtouchinfo
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputTouchInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInjectedInputTouchInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInjectedInputTouchInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the bounding box that represents the touch contact area.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputtouchinfo.contact
     * @type {InjectedInputRectangle} 
     */
    Contact {
        get => this.get_Contact()
        set => this.put_Contact(value)
    }

    /**
     * Gets or sets the counter-clockwise angle of rotation around the major axis of the pointer device (the z-axis, perpendicular to the surface of the digitizer).
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputtouchinfo.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets basic pointer info common to touch input.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputtouchinfo.pointerinfo
     * @type {InjectedInputPointerInfo} 
     */
    PointerInfo {
        get => this.get_PointerInfo()
        set => this.put_PointerInfo(value)
    }

    /**
     * Gets or sets the force exerted by the pointer device on the surface of the digitizer.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputtouchinfo.pressure
     * @type {Float} 
     */
    Pressure {
        get => this.get_Pressure()
        set => this.put_Pressure(value)
    }

    /**
     * Gets or sets the touch states used to simulate touch input.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputtouchinfo.touchparameters
     * @type {Integer} 
     */
    TouchParameters {
        get => this.get_TouchParameters()
        set => this.put_TouchParameters(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [InjectedInputTouchInfo](injectedinputtouchinfo.md) object that is used to specify the touch input to inject.
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
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.Injection.InjectedInputTouchInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {InjectedInputRectangle} 
     */
    get_Contact() {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.get_Contact()
    }

    /**
     * 
     * @param {InjectedInputRectangle} value 
     * @returns {HRESULT} 
     */
    put_Contact(value) {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.put_Contact(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.put_Orientation(value)
    }

    /**
     * 
     * @returns {InjectedInputPointerInfo} 
     */
    get_PointerInfo() {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.get_PointerInfo()
    }

    /**
     * 
     * @param {InjectedInputPointerInfo} value 
     * @returns {HRESULT} 
     */
    put_PointerInfo(value) {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.put_PointerInfo(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pressure() {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.get_Pressure()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Pressure(value) {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.put_Pressure(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TouchParameters() {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.get_TouchParameters()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TouchParameters(value) {
        if (!this.HasProp("__IInjectedInputTouchInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputTouchInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputTouchInfo := IInjectedInputTouchInfo(outPtr)
        }

        return this.__IInjectedInputTouchInfo.put_TouchParameters(value)
    }

;@endregion Instance Methods
}

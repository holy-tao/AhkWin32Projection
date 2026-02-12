#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInjectedInputPenInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents programmatically generated pen input.
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpeninfo
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputPenInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInjectedInputPenInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInjectedInputPenInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets basic pointer info common to pen input.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpeninfo.pointerinfo
     * @type {InjectedInputPointerInfo} 
     */
    PointerInfo {
        get => this.get_PointerInfo()
        set => this.put_PointerInfo(value)
    }

    /**
     * Gets or sets the pen button options.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpeninfo.penbuttons
     * @type {Integer} 
     */
    PenButtons {
        get => this.get_PenButtons()
        set => this.put_PenButtons(value)
    }

    /**
     * Gets or sets the pen states used to simulate pen input.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpeninfo.penparameters
     * @type {Integer} 
     */
    PenParameters {
        get => this.get_PenParameters()
        set => this.put_PenParameters(value)
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpeninfo.pressure
     * @type {Float} 
     */
    Pressure {
        get => this.get_Pressure()
        set => this.put_Pressure(value)
    }

    /**
     * Gets or sets the clockwise rotation, or twist, of the pointer.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpeninfo.rotation
     * @type {Float} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * Gets or sets the angle of tilt of the pointer along the x-axis.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpeninfo.tiltx
     * @type {Integer} 
     */
    TiltX {
        get => this.get_TiltX()
        set => this.put_TiltX(value)
    }

    /**
     * Gets or sets the angle of tilt of the pointer along the y-axis.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpeninfo.tilty
     * @type {Integer} 
     */
    TiltY {
        get => this.get_TiltY()
        set => this.put_TiltY(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [InjectedInputPenInfo](injectedinputpeninfo.md) object that is used to specify the pen input to inject.
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
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.Injection.InjectedInputPenInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {InjectedInputPointerInfo} 
     */
    get_PointerInfo() {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.get_PointerInfo()
    }

    /**
     * 
     * @param {InjectedInputPointerInfo} value 
     * @returns {HRESULT} 
     */
    put_PointerInfo(value) {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.put_PointerInfo(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PenButtons() {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.get_PenButtons()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PenButtons(value) {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.put_PenButtons(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PenParameters() {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.get_PenParameters()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PenParameters(value) {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.put_PenParameters(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pressure() {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.get_Pressure()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Pressure(value) {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.put_Pressure(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Rotation() {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.get_Rotation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Rotation(value) {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.put_Rotation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TiltX() {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.get_TiltX()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TiltX(value) {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.put_TiltX(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TiltY() {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.get_TiltY()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TiltY(value) {
        if (!this.HasProp("__IInjectedInputPenInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputPenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputPenInfo := IInjectedInputPenInfo(outPtr)
        }

        return this.__IInjectedInputPenInfo.put_TiltY(value)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInjectedInputKeyboardInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents programmatically generated keyboard input, such as a Tab or Shift+Tab (Reverse Tabbing).
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
 * Injecting too many keystrokes in a single call to [InjectKeyboardInput](inputinjector_injectkeyboardinput_329566807.md) can result in an ArgumentException.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputkeyboardinfo
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputKeyboardInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInjectedInputKeyboardInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInjectedInputKeyboardInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the various options, or modifiers, used to simulate input from physical or virtual keyboards.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputkeyboardinfo.keyoptions
     * @type {Integer} 
     */
    KeyOptions {
        get => this.get_KeyOptions()
        set => this.put_KeyOptions(value)
    }

    /**
     * Gets or sets an OEM, device-dependent identifier for a key on a physical keyboard.
     * 
     * > [!NOTE]
     * > A keyboard generates two scan codes when the user types a key—one when the user presses the key and another when the user releases the key.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputkeyboardinfo.scancode
     * @type {Integer} 
     */
    ScanCode {
        get => this.get_ScanCode()
        set => this.put_ScanCode(value)
    }

    /**
     * Gets or sets a device-independent identifier mapped to a key on a physical or software keyboard.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputkeyboardinfo.virtualkey
     * @type {Integer} 
     */
    VirtualKey {
        get => this.get_VirtualKey()
        set => this.put_VirtualKey(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [InjectedInputKeyboardInfo](injectedinputkeyboardinfo.md) object that is used to specify the keyboard input to inject.
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
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.Injection.InjectedInputKeyboardInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyOptions() {
        if (!this.HasProp("__IInjectedInputKeyboardInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputKeyboardInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputKeyboardInfo := IInjectedInputKeyboardInfo(outPtr)
        }

        return this.__IInjectedInputKeyboardInfo.get_KeyOptions()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_KeyOptions(value) {
        if (!this.HasProp("__IInjectedInputKeyboardInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputKeyboardInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputKeyboardInfo := IInjectedInputKeyboardInfo(outPtr)
        }

        return this.__IInjectedInputKeyboardInfo.put_KeyOptions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScanCode() {
        if (!this.HasProp("__IInjectedInputKeyboardInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputKeyboardInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputKeyboardInfo := IInjectedInputKeyboardInfo(outPtr)
        }

        return this.__IInjectedInputKeyboardInfo.get_ScanCode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ScanCode(value) {
        if (!this.HasProp("__IInjectedInputKeyboardInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputKeyboardInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputKeyboardInfo := IInjectedInputKeyboardInfo(outPtr)
        }

        return this.__IInjectedInputKeyboardInfo.put_ScanCode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VirtualKey() {
        if (!this.HasProp("__IInjectedInputKeyboardInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputKeyboardInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputKeyboardInfo := IInjectedInputKeyboardInfo(outPtr)
        }

        return this.__IInjectedInputKeyboardInfo.get_VirtualKey()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VirtualKey(value) {
        if (!this.HasProp("__IInjectedInputKeyboardInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputKeyboardInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputKeyboardInfo := IInjectedInputKeyboardInfo(outPtr)
        }

        return this.__IInjectedInputKeyboardInfo.put_VirtualKey(value)
    }

;@endregion Instance Methods
}

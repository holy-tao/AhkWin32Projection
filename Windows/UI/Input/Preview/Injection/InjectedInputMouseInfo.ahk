#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInjectedInputMouseInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents programmatically generated mouse input.
 * @remarks
 * > [!Important]
 * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) to be declared in the application manifest. For more information on app capability requirements, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
 * 
 * To use the input injection APIs, open the Package.appxmanifest file and add the following (the `rescap` namespace hosts the restricted capabilities, whuch lets you declare the `inputInjectionBrokered` capability in the `Capabilities` section).
 * 
 * - To `<Package>`
 *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities" IgnorableNamespaces="rescap"`
 * - In `<Capabilities>`
 *   - `<rescap:Capability Name="inputInjectionBrokered" />`
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputmouseinfo
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputMouseInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInjectedInputMouseInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInjectedInputMouseInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the various options, or modifiers, used to simulate mouse input.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) to be declared in the application manifest. For more information on app capability requirements, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * 
     * To use the input injection APIs, open the Package.appxmanifest file and add the following (the `rescap` namespace hosts the restricted capabilities, whuch lets you declare the `inputInjectionBrokered` capability in the `Capabilities` section).
     * 
     * - To `<Package>`
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities" IgnorableNamespaces="rescap"`
     * - In `<Capabilities>`
     *   - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputmouseinfo.mouseoptions
     * @type {Integer} 
     */
    MouseOptions {
        get => this.get_MouseOptions()
        set => this.put_MouseOptions(value)
    }

    /**
     * Gets or sets a value used by other properties (see [MouseOptions](injectedinputmouseinfo_mouseoptions.md)).
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) to be declared in the application manifest. For more information on app capability requirements, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * 
     * To use the input injection APIs, open the Package.appxmanifest file and add the following (the `rescap` namespace hosts the restricted capabilities, whuch lets you declare the `inputInjectionBrokered` capability in the `Capabilities` section).
     * 
     * - To `<Package>`
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities" IgnorableNamespaces="rescap"`
     * - In `<Capabilities>`
     *   - `<rescap:Capability Name="inputInjectionBrokered" />`
     * 
     * The value being set is dependent on the [MouseOptions](injectedinputmouseinfo_mouseoptions.md) flags specified. Some examples include:
     * 
     * - [HWheel](injectedinputmouseinfo_mousedata.md): the distance that a mouse wheel has rotated around the x-axis (horizontal). The mouse wheel button has discrete, evenly spaced notches or distance thresholds (also called detents). When you rotate or tilt the wheel, a wheel message is sent as each detent is encountered.
     * 
     * The windows constant, WHEEL_DELTA (defined as a value of 120), describes one detent. Each detent marks the threshold for a single increment of an associated action (for example, scrolling a line or page).
     * 
     * > [!NOTE]
     * > The delta was set to 120 to enable finer-resolution wheels (such as freely-rotating wheels with no notches) that send more messages per rotation, but with smaller values per message.
     * 
     * A positive value indicates that the wheel was rotated forward (away from the user) or tilted to the right; a negative value indicates that the wheel was rotated backward (toward the user) or tilted to the left.
     * 
     * > [!NOTE]
     * > [MouseData](injectedinputmouseinfo_mousedata.md) is of type `uint`, which doesn't support negative values. You must use an unchecked block or a temporary local variable (see [InjectedInputMouseInfo](injectedinputmouseinfo.md) for an example).
     * 
     * - [XDown](injectedinputmouseinfo_mousedata.md) or [XUp](injectedinputmouseinfo_mousedata.md): 1 for XBUTTON1 or 2 for XBUTTON2XBUTTON1 and XBUTTON2 are additional buttons used on many mouse devices, often for forward and backward navigation in Web browsers. They return the same data as standard mouse buttons.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputmouseinfo.mousedata
     * @type {Integer} 
     */
    MouseData {
        get => this.get_MouseData()
        set => this.put_MouseData(value)
    }

    /**
     * Gets or sets the change in the y-coordinate value of the mouse cursor.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) to be declared in the application manifest. For more information on app capability requirements, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * 
     * To use the input injection APIs, open the Package.appxmanifest file and add the following (the `rescap` namespace hosts the restricted capabilities, whuch lets you declare the `inputInjectionBrokered` capability in the `Capabilities` section).
     * 
     * - To `<Package>`
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities" IgnorableNamespaces="rescap"`
     * - In `<Capabilities>`
     *   - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputmouseinfo.deltay
     * @type {Integer} 
     */
    DeltaY {
        get => this.get_DeltaY()
        set => this.put_DeltaY(value)
    }

    /**
     * Gets or sets the change in the x-coordinate value of the mouse cursor.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) to be declared in the application manifest. For more information on app capability requirements, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * 
     * To use the input injection APIs, open the Package.appxmanifest file and add the following (the `rescap` namespace hosts the restricted capabilities, whuch lets you declare the `inputInjectionBrokered` capability in the `Capabilities` section).
     * 
     * - To `<Package>`
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities" IgnorableNamespaces="rescap"`
     * - In `<Capabilities>`
     *   - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputmouseinfo.deltax
     * @type {Integer} 
     */
    DeltaX {
        get => this.get_DeltaX()
        set => this.put_DeltaX(value)
    }

    /**
     * Gets or sets the baseline, or reference value, for timed input events such as a double click/tap.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) to be declared in the application manifest. For more information on app capability requirements, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * 
     * To use the input injection APIs, open the Package.appxmanifest file and add the following (the `rescap` namespace hosts the restricted capabilities, whuch lets you declare the `inputInjectionBrokered` capability in the `Capabilities` section).
     * 
     * - To `<Package>`
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities" IgnorableNamespaces="rescap"`
     * - In `<Capabilities>`
     *   - `<rescap:Capability Name="inputInjectionBrokered" />`
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputmouseinfo.timeoffsetinmilliseconds
     * @type {Integer} 
     */
    TimeOffsetInMilliseconds {
        get => this.get_TimeOffsetInMilliseconds()
        set => this.put_TimeOffsetInMilliseconds(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [InjectedInputMouseInfo](injectedinputmouseinfo.md) object that is used to specify the mouse input to inject.
     * @remarks
     * > [!Important]
     * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) to be declared in the application manifest. For more information on app capability requirements, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * 
     * To use the input injection APIs, open the Package.appxmanifest file and add the following (the `rescap` namespace hosts the restricted capabilities, whuch lets you declare the `inputInjectionBrokered` capability in the `Capabilities` section).
     * 
     * - To `<Package>`
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities" IgnorableNamespaces="rescap"`
     * - In `<Capabilities>`
     *   - `<rescap:Capability Name="inputInjectionBrokered" />`
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.Injection.InjectedInputMouseInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MouseOptions() {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.get_MouseOptions()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MouseOptions(value) {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.put_MouseOptions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MouseData() {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.get_MouseData()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MouseData(value) {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.put_MouseData(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeltaY() {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.get_DeltaY()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DeltaY(value) {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.put_DeltaY(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeltaX() {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.get_DeltaX()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DeltaX(value) {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.put_DeltaX(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TimeOffsetInMilliseconds() {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.get_TimeOffsetInMilliseconds()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TimeOffsetInMilliseconds(value) {
        if (!this.HasProp("__IInjectedInputMouseInfo")) {
            if ((queryResult := this.QueryInterface(IInjectedInputMouseInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInjectedInputMouseInfo := IInjectedInputMouseInfo(outPtr)
        }

        return this.__IInjectedInputMouseInfo.put_TimeOffsetInMilliseconds(value)
    }

;@endregion Instance Methods
}

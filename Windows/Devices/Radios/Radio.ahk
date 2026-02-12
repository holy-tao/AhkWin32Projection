#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadio.ahk
#Include .\IRadioStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Radio.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a radio device on the system.
 * @remarks
 * The [Radio](radio.md) class serves as the primary interface for radio management on Windows devices, providing both 
 * enumeration capabilities and individual radio control.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radio
 * @namespace Windows.Devices.Radios
 * @version WindowsRuntime 1.4
 */
class Radio extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadio

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadio.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a collection (snapshot) of [Radio](radio.md) objects representing the radios present when the call executes.
     * @returns {IAsyncOperation<IVectorView<Radio>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radio.getradiosasync
     */
    static GetRadiosAsync() {
        if (!Radio.HasProp("__IRadioStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Radios.Radio")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadioStatics.IID)
            Radio.__IRadioStatics := IRadioStatics(factoryPtr)
        }

        return Radio.__IRadioStatics.GetRadiosAsync()
    }

    /**
     * Returns an Advanced Query Syntax (AQS) string used to enumerate or monitor [Radio](radio.md) devices via
     * [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) and related
     * enumeration APIs.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radio.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!Radio.HasProp("__IRadioStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Radios.Radio")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadioStatics.IID)
            Radio.__IRadioStatics := IRadioStatics(factoryPtr)
        }

        return Radio.__IRadioStatics.GetDeviceSelector()
    }

    /**
     * Retrieves a [Radio](radio.md) object by device identifier.
     * @remarks
     * This method retrieves the current representation of a radio by device identifier. The identifier is typically
     * obtained from [Windows.Devices.Enumeration.DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md).
     * 
     * This approach is more reliable than using [GetRadiosAsync](/uwp/api/windows.devices.radios.radio.GetRadiosAsync) in scenarios
     * where a USB radio has failed or been removed. When a radio fails or is removed,
     * [GetRadiosAsync](/uwp/api/windows.devices.radios.radio.GetRadiosAsync) returns no radio object.
     * [FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.FindAllAsync) still returns a valid
     * [Id](/uwp/api/windows.devices.enumeration.deviceinformation.Id) that can be passed to
     * [FromIdAsync](/uwp/api/windows.devices.radios.radio#Windows_Devices_Radios_Radio_FromIdAsync_System_String_) to obtain the
     * radio object, which will report itself as `Disabled`.
     * 
     * If the underlying hardware has been removed or is unavailable, the returned object reflects the last known configuration
     * and typically reports a `Disabled` state. A radio that no longer exists will not appear in new enumeration snapshots.
     * @param {HSTRING} deviceId A string that identifies a particular radio device.
     * @returns {IAsyncOperation<Radio>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radio.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Radio.HasProp("__IRadioStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Radios.Radio")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadioStatics.IID)
            Radio.__IRadioStatics := IRadioStatics(factoryPtr)
        }

        return Radio.__IRadioStatics.FromIdAsync(deviceId)
    }

    /**
     * Requests permission to control radios and returns a [RadioAccessStatus](radioaccessstatus.md) indicating the current
     * user's access level for radio control operations.
     * @remarks
     * > [!IMPORTANT]  
     * > This method may prompt the user the first time access is requested. Call it from a context where user interaction
     * > (consent UI) is valid. Do not block critical UI threads with long-running logic after the call completes.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radio.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!Radio.HasProp("__IRadioStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Radios.Radio")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadioStatics.IID)
            Radio.__IRadioStatics := IRadioStatics(factoryPtr)
        }

        return Radio.__IRadioStatics.RequestAccessAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the current operational state of the radio.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radio.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the name of the radio represented by this object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radio.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets an enumeration value that describes what kind of radio this object represents.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radio.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Occurs when a radio's operational state changes.
     * @type {TypedEventHandler<Radio, IInspectable>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fc6aa329-b586-5ebb-9e85-3f6b84ebdf18}"),
                    Radio,
                    IInspectable
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Attempts to change the operational state of the radio (On / Off) asynchronously, subject to user permission, hardware
     * capabilities, and system policy.
     * @param {Integer} value The desired radio state. Pass [RadioState.On](radiostate.md) to enable or [RadioState.Off](radiostate.md) to disable the radio.
     * 
     * > [!NOTE]
     * > [RadioState.Disabled](radiostate.md) is reserved for OS use and cannot be set programmatically.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radio.setstateasync
     */
    SetStateAsync(value) {
        if (!this.HasProp("__IRadio")) {
            if ((queryResult := this.QueryInterface(IRadio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadio := IRadio(outPtr)
        }

        return this.__IRadio.SetStateAsync(value)
    }

    /**
     * 
     * @param {TypedEventHandler<Radio, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__IRadio")) {
            if ((queryResult := this.QueryInterface(IRadio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadio := IRadio(outPtr)
        }

        return this.__IRadio.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_StateChanged(eventCookie) {
        if (!this.HasProp("__IRadio")) {
            if ((queryResult := this.QueryInterface(IRadio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadio := IRadio(outPtr)
        }

        return this.__IRadio.remove_StateChanged(eventCookie)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IRadio")) {
            if ((queryResult := this.QueryInterface(IRadio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadio := IRadio(outPtr)
        }

        return this.__IRadio.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IRadio")) {
            if ((queryResult := this.QueryInterface(IRadio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadio := IRadio(outPtr)
        }

        return this.__IRadio.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IRadio")) {
            if ((queryResult := this.QueryInterface(IRadio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadio := IRadio(outPtr)
        }

        return this.__IRadio.get_Kind()
    }

;@endregion Instance Methods
}

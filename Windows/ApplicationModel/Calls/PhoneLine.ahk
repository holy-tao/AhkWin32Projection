#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneLine.ahk
#Include .\IPhoneLine2.ahk
#Include .\IPhoneLine3.ahk
#Include .\IPhoneLineStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PhoneLine.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a phone line.
 * @remarks
 * A phone line is a line on a device that can either receive incoming calls or place outgoing calls, depending on whether the line is configured to support dialing out. For example, a single SIM device has 1 cellular line while a dual SIM device has 2 cellular lines. The system will automatically create new lines for VoIP applications that allow initiating an outgoing call.
 * 
 * Each PhoneLine instance has properties specific to that line.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLine extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneLine

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneLine.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * This static method asynchronously retrieves a [PhoneLine](phoneline.md) object that represents a specific phone line on the device based on the line ID.
     * @remarks
     * The following example shows how to get the default [PhoneLine](phoneline.md).
     * 
     * 
     * 
     * [!code-csharp[GetDefaultLine](../windows.applicationmodel.calls/code/ApplicationModel.Calls/cs/Scenario1.cs#SnippetGetDefaultLine)]
     * @param {Guid} lineId The line ID of the phone line to retrieve.
     * @returns {IAsyncOperation<PhoneLine>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.fromidasync
     */
    static FromIdAsync(lineId) {
        if (!PhoneLine.HasProp("__IPhoneLineStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneLine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneLineStatics.IID)
            PhoneLine.__IPhoneLineStatics := IPhoneLineStatics(factoryPtr)
        }

        return PhoneLine.__IPhoneLineStatics.FromIdAsync(lineId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the ID of the phone line.
     * @remarks
     * For cellular lines, the ID is persistent across devices and reboots.
     * For VoIP and Bluetooth Hands-Free lines, the ID is not persistent across devices and reboots.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.id
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the preferred display color of the phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.displaycolor
     * @type {Color} 
     */
    DisplayColor {
        get => this.get_DisplayColor()
    }

    /**
     * Gets the current network status of the phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.networkstate
     * @type {Integer} 
     */
    NetworkState {
        get => this.get_NetworkState()
    }

    /**
     * Gets the user assigned friendly name for the phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the voice mail data associated with the [PhoneLine](phoneline.md) instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.voicemail
     * @type {PhoneVoicemail} 
     */
    Voicemail {
        get => this.get_Voicemail()
    }

    /**
     * Gets the name of the current network that is being used by the phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.networkname
     * @type {HSTRING} 
     */
    NetworkName {
        get => this.get_NetworkName()
    }

    /**
     * Gets details for the cellular component specific components for the [PhoneLine](phoneline.md) instance. This property is NULL for VoIP phone lines.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.cellulardetails
     * @type {PhoneLineCellularDetails} 
     */
    CellularDetails {
        get => this.get_CellularDetails()
    }

    /**
     * Gets the transport for the phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.transport
     * @type {Integer} 
     */
    Transport {
        get => this.get_Transport()
    }

    /**
     * Gets a boolean value which indicates if the phone line can be used to place outgoing calls.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.candial
     * @type {Boolean} 
     */
    CanDial {
        get => this.get_CanDial()
    }

    /**
     * Gets a value that indicates if the phone line supports being pinned as a live tile.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.supportstile
     * @type {Boolean} 
     */
    SupportsTile {
        get => this.get_SupportsTile()
    }

    /**
     * Gets whether video calling is supported over this phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.videocallingcapabilities
     * @type {PhoneCallVideoCapabilities} 
     */
    VideoCallingCapabilities {
        get => this.get_VideoCallingCapabilities()
    }

    /**
     * Gets extra configuration information about this [PhoneLine](phoneline.md) instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.lineconfiguration
     * @type {PhoneLineConfiguration} 
     */
    LineConfiguration {
        get => this.get_LineConfiguration()
    }

    /**
     * Device ID for the PhoneLineTransportDevice associated with this PhoneLine. Null if there is no transport device.
     * @remarks
     * The DeviceId comes from the [Windows.Devices.Enumerations.DeviceInformation.ID](../windows.devices.enumeration/deviceinformation_id.md).
     * 
     * PhoneLineTransportDevice is available only for PhoneLine objects where the PhoneLineTransport type is Bluetooth.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.transportdeviceid
     * @type {HSTRING} 
     */
    TransportDeviceId {
        get => this.get_TransportDeviceId()
    }

    /**
     * Occurs when and properties for the associated [PhoneLine](phoneline.md) instance change. This can occur when meta data changes like the voice mail count, the network state, or the cellular details.
     * @remarks
     * The following example demonstrates how to monitor for and update the network state.
     * 
     * 
     * 
     * [!code-csharp[MonitorLineChanges](../windows.applicationmodel.calls/code/ApplicationModel.Calls/cs/Scenario1.cs#SnippetMonitorLineChanges)]
     * @type {TypedEventHandler<PhoneLine, IInspectable>}
    */
    OnLineChanged {
        get {
            if(!this.HasProp("__OnLineChanged")){
                this.__OnLineChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c5f5192-9fc0-5543-9bc4-411482e4ea93}"),
                    PhoneLine,
                    IInspectable
                )
                this.__OnLineChangedToken := this.add_LineChanged(this.__OnLineChanged.iface)
            }
            return this.__OnLineChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLineChangedToken")) {
            this.remove_LineChanged(this.__OnLineChangedToken)
            this.__OnLineChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneLine, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LineChanged(handler) {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.add_LineChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LineChanged(token) {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.remove_LineChanged(token)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_Id()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DisplayColor() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_DisplayColor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkState() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_NetworkState()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_DisplayName()
    }

    /**
     * 
     * @returns {PhoneVoicemail} 
     */
    get_Voicemail() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_Voicemail()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NetworkName() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_NetworkName()
    }

    /**
     * 
     * @returns {PhoneLineCellularDetails} 
     */
    get_CellularDetails() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_CellularDetails()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Transport() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_Transport()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDial() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_CanDial()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsTile() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_SupportsTile()
    }

    /**
     * 
     * @returns {PhoneCallVideoCapabilities} 
     */
    get_VideoCallingCapabilities() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_VideoCallingCapabilities()
    }

    /**
     * 
     * @returns {PhoneLineConfiguration} 
     */
    get_LineConfiguration() {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.get_LineConfiguration()
    }

    /**
     * Check if a number should be dialed immediately from the dialer without requiring the user to press the call button.
     * @param {HSTRING} number_ The phone number to check for immediate dialing.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.isimmediatedialnumberasync
     */
    IsImmediateDialNumberAsync(number_) {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.IsImmediateDialNumberAsync(number_)
    }

    /**
     * Place a phone call on the phone line. The caller must be in the foreground.
     * @remarks
     * In order to use this method, the [PhoneLine](phoneline.md) instance needs to support outbound calls. Use [CanDial](phoneline_candial.md) to verify whether or not that is supported.
     * @param {HSTRING} number_ The number to dial.
     * @param {HSTRING} displayName The display name of the party receiving the phone call. This parameter is optional.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.dial
     */
    Dial(number_, displayName) {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.Dial(number_, displayName)
    }

    /**
     * Place a phone call on the phone line, allowing the caller to specify additional dial options. The caller must be in the foreground.
     * @param {PhoneDialOptions} options The additional dial options for the phone call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.dialwithoptions
     */
    DialWithOptions(options) {
        if (!this.HasProp("__IPhoneLine")) {
            if ((queryResult := this.QueryInterface(IPhoneLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine := IPhoneLine(outPtr)
        }

        return this.__IPhoneLine.DialWithOptions(options)
    }

    /**
     * Informs the platform that text reply functionality is supported for this line.
     * 
     * > [!NOTE]
     * > This method is deprecated.
     * @remarks
     * By default, the platform assumes text reply functionality is not supported. It is recommended the app set this capability (if available) as soon as being notified of a LineChanged event indicating a new PhoneLine has been added.
     * @param {Boolean} value True to enable text reply functionality, and false otherwise.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.enabletextreply
     */
    EnableTextReply(value) {
        if (!this.HasProp("__IPhoneLine2")) {
            if ((queryResult := this.QueryInterface(IPhoneLine2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine2 := IPhoneLine2(outPtr)
        }

        return this.__IPhoneLine2.EnableTextReply(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportDeviceId() {
        if (!this.HasProp("__IPhoneLine2")) {
            if ((queryResult := this.QueryInterface(IPhoneLine2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine2 := IPhoneLine2(outPtr)
        }

        return this.__IPhoneLine2.get_TransportDeviceId()
    }

    /**
     * Places a phone call on the line.
     * @param {HSTRING} number_ The number to call.
     * @param {HSTRING} displayName The display name of the callee.
     * @returns {PhoneLineDialResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.dialwithresult
     */
    DialWithResult(number_, displayName) {
        if (!this.HasProp("__IPhoneLine3")) {
            if ((queryResult := this.QueryInterface(IPhoneLine3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine3 := IPhoneLine3(outPtr)
        }

        return this.__IPhoneLine3.DialWithResult(number_, displayName)
    }

    /**
     * Asynchronously places a phone call on the line.
     * @param {HSTRING} number_ The number to call.
     * @param {HSTRING} displayName The display name of the callee.
     * @returns {IAsyncOperation<PhoneLineDialResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.dialwithresultasync
     */
    DialWithResultAsync(number_, displayName) {
        if (!this.HasProp("__IPhoneLine3")) {
            if ((queryResult := this.QueryInterface(IPhoneLine3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine3 := IPhoneLine3(outPtr)
        }

        return this.__IPhoneLine3.DialWithResultAsync(number_, displayName)
    }

    /**
     * Retrieves a phone calls result object, from which you can retrieve the active phone calls.
     * @returns {PhoneCallsResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.getallactivephonecalls
     */
    GetAllActivePhoneCalls() {
        if (!this.HasProp("__IPhoneLine3")) {
            if ((queryResult := this.QueryInterface(IPhoneLine3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine3 := IPhoneLine3(outPtr)
        }

        return this.__IPhoneLine3.GetAllActivePhoneCalls()
    }

    /**
     * Asynchronously retrieves a phone calls result object, from which you can retrieve the active phone calls.
     * @returns {IAsyncOperation<PhoneCallsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneline.getallactivephonecallsasync
     */
    GetAllActivePhoneCallsAsync() {
        if (!this.HasProp("__IPhoneLine3")) {
            if ((queryResult := this.QueryInterface(IPhoneLine3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLine3 := IPhoneLine3(outPtr)
        }

        return this.__IPhoneLine3.GetAllActivePhoneCallsAsync()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCall.ahk
#Include .\IPhoneCallStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PhoneCall.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a phone call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCall extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCall

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCall.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * A static factory method that creates a new [PhoneCall](phonecall.md) object for the specified call identifier.
     * @param {HSTRING} callId The call identifier for which to create a corresponding [PhoneCall](phonecall.md) object.
     * @returns {PhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.getfromid
     */
    static GetFromId(callId) {
        if (!PhoneCall.HasProp("__IPhoneCallStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCall")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallStatics.IID)
            PhoneCall.__IPhoneCallStatics := IPhoneCallStatics(factoryPtr)
        }

        return PhoneCall.__IPhoneCallStatics.GetFromId(callId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the phone call identifier (or call identifier).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.callid
     * @type {HSTRING} 
     */
    CallId {
        get => this.get_CallId()
    }

    /**
     * Gets the muted status of the phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.ismuted
     * @type {Boolean} 
     */
    IsMuted {
        get => this.get_IsMuted()
    }

    /**
     * Gets the status of the phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the phone call audio device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.audiodevice
     * @type {Integer} 
     */
    AudioDevice {
        get => this.get_AudioDevice()
    }

    /**
     * An event that's raised when the value of [PhoneCall.Status](phonecall_status.md) changes.
     * @type {TypedEventHandler<PhoneCall, IInspectable>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6dde6f30-654a-5fae-994d-8200049bd6da}"),
                    PhoneCall,
                    IInspectable
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

    /**
     * An event that's raised when the value of [PhoneCall.AudioDevice](phonecall_audiodevice.md) changes.
     * @type {TypedEventHandler<PhoneCall, IInspectable>}
    */
    OnAudioDeviceChanged {
        get {
            if(!this.HasProp("__OnAudioDeviceChanged")){
                this.__OnAudioDeviceChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6dde6f30-654a-5fae-994d-8200049bd6da}"),
                    PhoneCall,
                    IInspectable
                )
                this.__OnAudioDeviceChangedToken := this.add_AudioDeviceChanged(this.__OnAudioDeviceChanged.iface)
            }
            return this.__OnAudioDeviceChanged
        }
    }

    /**
     * An event that's raised when the value of [PhoneCall.IsMuted](phonecall_ismuted.md) changes.
     * @type {TypedEventHandler<PhoneCall, IInspectable>}
    */
    OnIsMutedChanged {
        get {
            if(!this.HasProp("__OnIsMutedChanged")){
                this.__OnIsMutedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6dde6f30-654a-5fae-994d-8200049bd6da}"),
                    PhoneCall,
                    IInspectable
                )
                this.__OnIsMutedChangedToken := this.add_IsMutedChanged(this.__OnIsMutedChanged.iface)
            }
            return this.__OnIsMutedChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStatusChangedToken")) {
            this.remove_StatusChanged(this.__OnStatusChangedToken)
            this.__OnStatusChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAudioDeviceChangedToken")) {
            this.remove_AudioDeviceChanged(this.__OnAudioDeviceChangedToken)
            this.__OnAudioDeviceChanged.iface.Dispose()
        }

        if(this.HasProp("__OnIsMutedChangedToken")) {
            this.remove_IsMutedChanged(this.__OnIsMutedChangedToken)
            this.__OnIsMutedChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneCall, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.add_StatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.remove_StatusChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneCall, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioDeviceChanged(handler) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.add_AudioDeviceChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AudioDeviceChanged(token) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.remove_AudioDeviceChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneCall, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsMutedChanged(handler) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.add_IsMutedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsMutedChanged(token) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.remove_IsMutedChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallId() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.get_CallId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMuted() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.get_IsMuted()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioDevice() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.get_AudioDevice()
    }

    /**
     * Retrieves an object representing a phone call, and its properties.
     * @returns {PhoneCallInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.getphonecallinfo
     */
    GetPhoneCallInfo() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.GetPhoneCallInfo()
    }

    /**
     * Asynchronously retrieves an object representing a phone call, and its properties.
     * @returns {IAsyncOperation<PhoneCallInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.getphonecallinfoasync
     */
    GetPhoneCallInfoAsync() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.GetPhoneCallInfoAsync()
    }

    /**
     * Ends the phone call.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.end
     */
    End() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.End()
    }

    /**
     * Asynchronously ends the phone call.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.endasync
     */
    EndAsync() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.EndAsync()
    }

    /**
     * Sends the specified dual tone multi-frequency (DTMF) character to the phone call. Only short tones (burst) are supported.
     * @param {Integer} key A [DtmfKey](dtmfkey.md) object representing the DTMF character to send.
     * @param {Integer} dtmfToneAudioPlayback_ A [DtmfToneAudioPlayback](dtmftoneaudioplayback.md) object specifying whether or not the audio for the DTMF tones should be played back on the local device.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.senddtmfkey
     */
    SendDtmfKey(key, dtmfToneAudioPlayback_) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.SendDtmfKey(key, dtmfToneAudioPlayback_)
    }

    /**
     * Asynchronously sends the specified dual tone multi-frequency (DTMF) character to the phone call. Only short tones (burst) are supported.
     * @param {Integer} key A [DtmfKey](dtmfkey.md) object representing the DTMF character to send.
     * @param {Integer} dtmfToneAudioPlayback_ A [DtmfToneAudioPlayback](dtmftoneaudioplayback.md) object specifying whether or not the audio for the DTMF tones should be played back on the local device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.senddtmfkeyasync
     */
    SendDtmfKeyAsync(key, dtmfToneAudioPlayback_) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.SendDtmfKeyAsync(key, dtmfToneAudioPlayback_)
    }

    /**
     * Answers an incoming phone call.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.acceptincoming
     */
    AcceptIncoming() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.AcceptIncoming()
    }

    /**
     * Asynchronously answers an incoming phone call.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.acceptincomingasync
     */
    AcceptIncomingAsync() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.AcceptIncomingAsync()
    }

    /**
     * Places an active phone call on hold.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.hold
     */
    Hold() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.Hold()
    }

    /**
     * Asynchronously places an active phone call on hold.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.holdasync
     */
    HoldAsync() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.HoldAsync()
    }

    /**
     * Activates a phone call previously placed on hold.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.resumefromhold
     */
    ResumeFromHold() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.ResumeFromHold()
    }

    /**
     * Asynchronously activates a phone call previously placed on hold.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.resumefromholdasync
     */
    ResumeFromHoldAsync() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.ResumeFromHoldAsync()
    }

    /**
     * Mutes an active phone call.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.mute
     */
    Mute() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.Mute()
    }

    /**
     * Asynchronously mutes an active phone call.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.muteasync
     */
    MuteAsync() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.MuteAsync()
    }

    /**
     * Unmutes a previously muted phone call.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.unmute
     */
    Unmute() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.Unmute()
    }

    /**
     * Asynchronously unmutes a previously muted phone call.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.unmuteasync
     */
    UnmuteAsync() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.UnmuteAsync()
    }

    /**
     * Rejects/declines an incoming phone call.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.rejectincoming
     */
    RejectIncoming() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.RejectIncoming()
    }

    /**
     * Asynchronously rejects/declines an incoming phone call.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.rejectincomingasync
     */
    RejectIncomingAsync() {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.RejectIncomingAsync()
    }

    /**
     * Sets a hands-free (HF) phone call audio device.
     * @param {Integer} endpoint A [PhoneCallAudioDevice](/uwp/api/windows.applicationmodel.calls.phonecalloperationstatus) object representing the audio device to set.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.changeaudiodevice
     */
    ChangeAudioDevice(endpoint) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.ChangeAudioDevice(endpoint)
    }

    /**
     * Asynchronously sets a hands-free (HF) phone call audio device.
     * @param {Integer} endpoint An asynchronous operation object which, when it completes, contains a [PhoneCallOperationStatus](phonecalloperationstatus) object representing the status of the phone call.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecall.changeaudiodeviceasync
     */
    ChangeAudioDeviceAsync(endpoint) {
        if (!this.HasProp("__IPhoneCall")) {
            if ((queryResult := this.QueryInterface(IPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCall := IPhoneCall(outPtr)
        }

        return this.__IPhoneCall.ChangeAudioDeviceAsync(endpoint)
    }

;@endregion Instance Methods
}

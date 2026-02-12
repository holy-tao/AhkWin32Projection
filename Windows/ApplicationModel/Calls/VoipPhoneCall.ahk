#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoipPhoneCall.ahk
#Include .\IVoipPhoneCall2.ahk
#Include .\IVoipPhoneCall3.ahk
#Include .\IVoipPhoneCall4.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\VoipPhoneCall.ahk
#Include .\CallStateChangeEventArgs.ahk
#Include .\CallAnswerEventArgs.ahk
#Include .\CallRejectEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a VoIP phone call.
 * @remarks
 * Call the [VoipCallCoordinator.RequestNewAppInitiatedCall](voipcallcoordinator_requestnewappinitiatedcall_477072082.md) method to create a new **VoipPhoneCall** object. You can then use the **VoipPhoneCall** object to set up a new in-app call notification, and to handle events that the **VoipPhoneCall** raises.
 * 
 * If the user accepts the call, then your application should call [NotifyCallAccepted](voipphonecall_notifycallaccepted_862950983.md). If the call is rejected or unanswered, then call [NotifyCallEnded](voipphonecall_notifycallended_1962259325.md). Alternatively, the system itself can raise the [AnswerRequested](voipphonecall_answerrequested.md) or [RejectRequested](voipphonecall_rejectrequested.md) events, and your VoIP application can handle those events in order to determine whether the user has accepted or rejected the incoming call via the HID device.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class VoipPhoneCall extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoipPhoneCall

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoipPhoneCall.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets contact name associated with the VoIP call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.contactname
     * @type {HSTRING} 
     */
    ContactName {
        get => this.get_ContactName()
        set => this.put_ContactName(value)
    }

    /**
     * Gets or sets the start time associated with the VoIP call.
     * @remarks
     * Apps can set the start time for the given call to match their conventions for when calls begin. The value can be queried to allow the foreground VoIP application to display the same current call duration shown in the minimized call UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Gets the media types used by the call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.callmedia
     * @type {Integer} 
     */
    CallMedia {
        get => this.get_CallMedia()
        set => this.put_CallMedia(value)
    }

    /**
     * Gets a value that represents whether or not the associated devices list is being used by the call.
     * @remarks
     * If a new call is requested using a call options object created with a list of associated call control device IDs included (including an empty list), then **IsUsingAssociatedDevicesList** will be initialized to `true`. Otherwise, it will be initialized to `false`. If initialized to `false`, and the list of associated devices for the call is later added to or set (including set to an empty list), then **IsUsingAssociatedDevicesList** will be updated to `true` for the remaining lifetime of the call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.isusingassociateddeviceslist
     * @type {Boolean} 
     */
    IsUsingAssociatedDevicesList {
        get => this.get_IsUsingAssociatedDevicesList()
    }

    /**
     * Raised to alert the VoIP app that the call should be ended.
     * @remarks
     * After this event has been raised, the application is required to call [NotifyCallEnded](voipphonecall_notifycallended_1962259325.md) within 5 seconds.
     * @type {TypedEventHandler<VoipPhoneCall, CallStateChangeEventArgs>}
    */
    OnEndRequested {
        get {
            if(!this.HasProp("__OnEndRequested")){
                this.__OnEndRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1e00c6cc-e14c-51ce-93f3-0a0a9a3f3eec}"),
                    VoipPhoneCall,
                    CallStateChangeEventArgs
                )
                this.__OnEndRequestedToken := this.add_EndRequested(this.__OnEndRequested.iface)
            }
            return this.__OnEndRequested
        }
    }

    /**
     * Raised to alert the VoIP app that the call should be placed on hold.
     * @remarks
     * After this event is raised, the application is required to call [NotifyCallHeld](voipphonecall_notifycallheld_666131143.md) within 5 seconds.
     * @type {TypedEventHandler<VoipPhoneCall, CallStateChangeEventArgs>}
    */
    OnHoldRequested {
        get {
            if(!this.HasProp("__OnHoldRequested")){
                this.__OnHoldRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1e00c6cc-e14c-51ce-93f3-0a0a9a3f3eec}"),
                    VoipPhoneCall,
                    CallStateChangeEventArgs
                )
                this.__OnHoldRequestedToken := this.add_HoldRequested(this.__OnHoldRequested.iface)
            }
            return this.__OnHoldRequested
        }
    }

    /**
     * Raised to indicate that a previously held VoIP call should be made active.
     * @remarks
     * After this event has been raised, the application must call [NotifyCallActive](voipphonecall_notifycallactive_97340177.md) within 5 seconds.
     * @type {TypedEventHandler<VoipPhoneCall, CallStateChangeEventArgs>}
    */
    OnResumeRequested {
        get {
            if(!this.HasProp("__OnResumeRequested")){
                this.__OnResumeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1e00c6cc-e14c-51ce-93f3-0a0a9a3f3eec}"),
                    VoipPhoneCall,
                    CallStateChangeEventArgs
                )
                this.__OnResumeRequestedToken := this.add_ResumeRequested(this.__OnResumeRequested.iface)
            }
            return this.__OnResumeRequested
        }
    }

    /**
     * Raised when the user answers an incoming call.
     * @remarks
     * The system raises the **AnswerRequested** event to signal to your VoIP application that the call has been accepted by the system. After the event is raised, your VoIP application must call [NotifyCallActive](voipphonecall_notifycallactive_97340177.md) within 5 seconds. See [VoipPhoneCall](voipphonecall.md) for more details.
     * @type {TypedEventHandler<VoipPhoneCall, CallAnswerEventArgs>}
    */
    OnAnswerRequested {
        get {
            if(!this.HasProp("__OnAnswerRequested")){
                this.__OnAnswerRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d47be4da-c00c-5faa-bfa5-1b11e0c3ccc1}"),
                    VoipPhoneCall,
                    CallAnswerEventArgs
                )
                this.__OnAnswerRequestedToken := this.add_AnswerRequested(this.__OnAnswerRequested.iface)
            }
            return this.__OnAnswerRequested
        }
    }

    /**
     * Raised when a call has been rejected.
     * @remarks
     * The system raises the **RejectRequested** event to signal to your VoIP application that the call has been rejected. After this event is raised, your VoIP application must call [NotifyCallEnded](voipphonecall_notifycallended_1962259325.md) within 5 seconds. See [VoipPhoneCall](voipphonecall.md) for more info.
     * @type {TypedEventHandler<VoipPhoneCall, CallRejectEventArgs>}
    */
    OnRejectRequested {
        get {
            if(!this.HasProp("__OnRejectRequested")){
                this.__OnRejectRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d06255ce-0967-5441-8fe6-ed2e7008197e}"),
                    VoipPhoneCall,
                    CallRejectEventArgs
                )
                this.__OnRejectRequestedToken := this.add_RejectRequested(this.__OnRejectRequested.iface)
            }
            return this.__OnRejectRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnEndRequestedToken")) {
            this.remove_EndRequested(this.__OnEndRequestedToken)
            this.__OnEndRequested.iface.Dispose()
        }

        if(this.HasProp("__OnHoldRequestedToken")) {
            this.remove_HoldRequested(this.__OnHoldRequestedToken)
            this.__OnHoldRequested.iface.Dispose()
        }

        if(this.HasProp("__OnResumeRequestedToken")) {
            this.remove_ResumeRequested(this.__OnResumeRequestedToken)
            this.__OnResumeRequested.iface.Dispose()
        }

        if(this.HasProp("__OnAnswerRequestedToken")) {
            this.remove_AnswerRequested(this.__OnAnswerRequestedToken)
            this.__OnAnswerRequested.iface.Dispose()
        }

        if(this.HasProp("__OnRejectRequestedToken")) {
            this.remove_RejectRequested(this.__OnRejectRequestedToken)
            this.__OnRejectRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<VoipPhoneCall, CallStateChangeEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EndRequested(handler) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.add_EndRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EndRequested(token) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.remove_EndRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<VoipPhoneCall, CallStateChangeEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HoldRequested(handler) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.add_HoldRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HoldRequested(token) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.remove_HoldRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<VoipPhoneCall, CallStateChangeEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResumeRequested(handler) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.add_ResumeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ResumeRequested(token) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.remove_ResumeRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<VoipPhoneCall, CallAnswerEventArgs>} acceptHandler 
     * @returns {EventRegistrationToken} 
     */
    add_AnswerRequested(acceptHandler) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.add_AnswerRequested(acceptHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AnswerRequested(token) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.remove_AnswerRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<VoipPhoneCall, CallRejectEventArgs>} rejectHandler 
     * @returns {EventRegistrationToken} 
     */
    add_RejectRequested(rejectHandler) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.add_RejectRequested(rejectHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RejectRequested(token) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.remove_RejectRequested(token)
    }

    /**
     * Notifies the system that the call is currently on hold.
     * @remarks
     * Apps must call this method before calling [NotifyCallActive](voipphonecall_notifycallactive_97340177.md) on another VoIP call. Only one call can be active at a time.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.notifycallheld
     */
    NotifyCallHeld() {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.NotifyCallHeld()
    }

    /**
     * Notifies the system that the VoIP call is active.
     * @remarks
     * The system raises the [AnswerRequested](voipphonecall_answerrequested.md) event to signal to your VoIP application that the call has been accepted by the system. After the event is raised, your VoIP application must call **NotifyCallActive** within 5 seconds. See [VoipPhoneCall](voipphonecall.md) for more info.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.notifycallactive
     */
    NotifyCallActive() {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.NotifyCallActive()
    }

    /**
     * Notifies the system that the call has ended.
     * @remarks
     * The system raises the [RejectRequested](voipphonecall_rejectrequested.md) event to signal to your VoIP application that the call has been rejected. After this event is raised, your VoIP application must call **NotifyCallEnded** within 5 seconds. See [VoipPhoneCall](voipphonecall.md) for more info.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.notifycallended
     */
    NotifyCallEnded() {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.NotifyCallEnded()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactName() {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.get_ContactName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactName(value) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.put_ContactName(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.get_StartTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.put_StartTime(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CallMedia() {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.get_CallMedia()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CallMedia(value) {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.put_CallMedia(value)
    }

    /**
     * When upgrading a call from cellular to video, notifies the system that the app is done setting up the audio and video streams for the video call so that the system can end the existing cellular call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.notifycallready
     */
    NotifyCallReady() {
        if (!this.HasProp("__IVoipPhoneCall")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall := IVoipPhoneCall(outPtr)
        }

        return this.__IVoipPhoneCall.NotifyCallReady()
    }

    /**
     * Brings the VOIP app's user interface into the foreground after accepting a call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.tryshowappui
     */
    TryShowAppUI() {
        if (!this.HasProp("__IVoipPhoneCall2")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall2 := IVoipPhoneCall2(outPtr)
        }

        return this.__IVoipPhoneCall2.TryShowAppUI()
    }

    /**
     * Notifies the system that the VoIP call has been accepted.
     * @remarks
     * This event notifies the system that the incoming VoIP call was answered from within your VoIP application's incoming call notification. You should raise this event in conjunction with the [VoipCallCoordinator.RequestNewAppInitiatedCall](voipcallcoordinator_requestnewappinitiatedcall_477072082.md) method.
     * @param {Integer} media The media types of the new incoming call (either audio and video or audio only). Pass **Audio|Video** if the user chose to answer the call with outgoing video, or **Audio** if they answered with just audio.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.notifycallaccepted
     */
    NotifyCallAccepted(media) {
        if (!this.HasProp("__IVoipPhoneCall3")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall3 := IVoipPhoneCall3(outPtr)
        }

        return this.__IVoipPhoneCall3.NotifyCallAccepted(media)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUsingAssociatedDevicesList() {
        if (!this.HasProp("__IVoipPhoneCall4")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall4 := IVoipPhoneCall4(outPtr)
        }

        return this.__IVoipPhoneCall4.get_IsUsingAssociatedDevicesList()
    }

    /**
     * Notifies the system that the VoIP call is active; includes associated call control devices.
     * @remarks
     * The system raises the [AnswerRequested](voipphonecall_answerrequested.md) event to signal to your VoIP application that the call has been accepted by the system. After the event is raised, your VoIP application must call **NotifyCallActive** within 5 seconds. See [VoipPhoneCall](voipphonecall.md) for more info.
     * 
     * When calling this method, your app might wish to specify either a single device (such as the one that accepted the call, or the device that's the active audio endpoint) or a set of devices (such as the device that accepted the call plus a dedicated Bluetooth remote control for calls). Your app may also pass an empty device list. When calling this overload, the [VoipPhoneCall.IsUsingAssociatedDevicesList](./voipphonecall_isusingassociateddeviceslist.md) property of the call will be set to `true` (if not already), and only the associated devices will be able to interact with the call going forward.
     * @param {IIterable<HSTRING>} associatedDeviceIds A list of device interface ids of call control devices to associate with the call. May not be null (otherwise returns **E_INVALIDARG**). Replaces any existing list of associated devices.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.notifycallactive
     */
    NotifyCallActiveOnDevices(associatedDeviceIds) {
        if (!this.HasProp("__IVoipPhoneCall4")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall4 := IVoipPhoneCall4(outPtr)
        }

        return this.__IVoipPhoneCall4.NotifyCallActiveOnDevices(associatedDeviceIds)
    }

    /**
     * Adds to the list of associated devices for a call.
     * @remarks
     * If this is the first time any device ID has been added to the list, then the call's [IsUsingAssociatedDevicesList](./voipphonecall_isusingassociateddeviceslist.md) will be set to `true`; and only this device will be used going forward.
     * @param {HSTRING} deviceId A new device ID to add to the list of associated devices for a call while it's active. If the ID is already in the list, then it will be ignored. The ID of a device whose [VoipCallControlDeviceKind](./voipcallcontroldevicekind.md) isn't currently supported for association will still be added, but will have no effect. If the ID is already present in the list, then trying to add it with **AddAssociatedCallControlDevice** will have no effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.addassociatedcallcontroldevice
     */
    AddAssociatedCallControlDevice(deviceId) {
        if (!this.HasProp("__IVoipPhoneCall4")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall4 := IVoipPhoneCall4(outPtr)
        }

        return this.__IVoipPhoneCall4.AddAssociatedCallControlDevice(deviceId)
    }

    /**
     * Removes from the list of associated devices for a call.
     * @remarks
     * If removing this device ID leaves the list empty, then no call control device will be able to interact with the call. But the call's [IsUsingAssociatedDevicesList](./voipphonecall_isusingassociateddeviceslist.md) won't be set back to `false`.
     * @param {HSTRING} deviceId A device ID to be removed from the list of associated devices for a call while it's active. If the ID isn't present in the list, then trying to remove it with **RemoveAssociatedCallControlDevice** will have no effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.removeassociatedcallcontroldevice
     */
    RemoveAssociatedCallControlDevice(deviceId) {
        if (!this.HasProp("__IVoipPhoneCall4")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall4 := IVoipPhoneCall4(outPtr)
        }

        return this.__IVoipPhoneCall4.RemoveAssociatedCallControlDevice(deviceId)
    }

    /**
     * Sets the list of call control device IDs that are associated with the call. In the scenario where control of a call is desired to be transferred from one device to another (such as due to a change in audio endpoint), this allows the change to be made in a single transaction, rather than with sequential add and remove calls.
     * @remarks
     * If this is the first time that the list has been set (including if it is being set to empty), then the call's [IsUsingAssociatedDevicesList](./voipphonecall_isusingassociateddeviceslist.md) will be set to `true`, and only the given devices will be used going forward.
     * @param {IIterable<HSTRING>} associatedDeviceIds The new list of call control devices to associate with the call. This replaces any existing list of associated devices. Must be non-null, and contain no duplicate IDs (otherwise returns E_INVALIDARG).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.setassociatedcallcontroldevices
     */
    SetAssociatedCallControlDevices(associatedDeviceIds) {
        if (!this.HasProp("__IVoipPhoneCall4")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall4 := IVoipPhoneCall4(outPtr)
        }

        return this.__IVoipPhoneCall4.SetAssociatedCallControlDevices(associatedDeviceIds)
    }

    /**
     * Retrieves the list of call control device IDs that are associated with the call.
     * @remarks
     * The returned list of device IDs is only those that were manually added on call creation, or via another method that modifies the associated call control devices list. If the call's [IsUsingAssociatedDevicesList](./voipphonecall_isusingassociateddeviceslist.md) is `false`, then **GetAssociatedCallControlDevices** will return an empty list but all connected call control devices will be able to interact with the call. 
     * Note that a device’s ID is not automatically removed from this list when that device is disconnected, and that that device will still be able to interact with the call if it is later reconnected.
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecall.getassociatedcallcontroldevices
     */
    GetAssociatedCallControlDevices() {
        if (!this.HasProp("__IVoipPhoneCall4")) {
            if ((queryResult := this.QueryInterface(IVoipPhoneCall4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipPhoneCall4 := IVoipPhoneCall4(outPtr)
        }

        return this.__IVoipPhoneCall4.GetAssociatedCallControlDevices()
    }

;@endregion Instance Methods
}

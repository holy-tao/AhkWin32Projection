#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoipCallCoordinator.ahk
#Include .\IVoipCallCoordinator2.ahk
#Include .\IVoipCallCoordinator3.ahk
#Include .\IVoipCallCoordinator4.ahk
#Include .\IVoipCallCoordinator5.ahk
#Include .\IVoipCallCoordinatorStatics2.ahk
#Include .\IVoipCallCoordinatorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\VoipCallCoordinator.ahk
#Include .\MuteChangeEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Allows an application to manage VoIP calls.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class VoipCallCoordinator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoipCallCoordinator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoipCallCoordinator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Determines whether or not a given device kind is supported for association with calls in the current version of the VoIP calling platform.
     * @param {Integer} kind The device kind to query about.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.iscallcontroldevicekindsupportedforassociation
     */
    static IsCallControlDeviceKindSupportedForAssociation(kind) {
        if (!VoipCallCoordinator.HasProp("__IVoipCallCoordinatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.VoipCallCoordinator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoipCallCoordinatorStatics2.IID)
            VoipCallCoordinator.__IVoipCallCoordinatorStatics2 := IVoipCallCoordinatorStatics2(factoryPtr)
        }

        return VoipCallCoordinator.__IVoipCallCoordinatorStatics2.IsCallControlDeviceKindSupportedForAssociation(kind)
    }

    /**
     * Returns an Advanced Query Syntax (AQS) string that you can use to enumerate all valid call control capable devices. You can pass the returned string to [DeviceInformation.FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync) or [DeviceInformation.CreateWatcher](/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher). Valid devices are those of a [VoipCallControlDeviceKind](./voipcallcontroldevicekind.md) that's supported for association, and that's currently connected.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.getdeviceselectorforcallcontrol
     */
    static GetDeviceSelectorForCallControl() {
        if (!VoipCallCoordinator.HasProp("__IVoipCallCoordinatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.VoipCallCoordinator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoipCallCoordinatorStatics2.IID)
            VoipCallCoordinator.__IVoipCallCoordinatorStatics2 := IVoipCallCoordinatorStatics2(factoryPtr)
        }

        return VoipCallCoordinator.__IVoipCallCoordinatorStatics2.GetDeviceSelectorForCallControl()
    }

    /**
     * Retrieves the default instance of the [VoipCallCoordinator](voipcallcoordinator.md) class.
     * @remarks
     * You can use this method to get the default instance of the [VoipCallCoordinator](voipcallcoordinator.md) class even if you do not define the required capability below. However, you will not be able to use the other methods of the [VoipCallCoordinator](voipcallcoordinator.md) object without defining the capability. The capability protects the service from running on the platform.
     * @returns {VoipCallCoordinator} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.getdefault
     */
    static GetDefault() {
        if (!VoipCallCoordinator.HasProp("__IVoipCallCoordinatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.VoipCallCoordinator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoipCallCoordinatorStatics.IID)
            VoipCallCoordinator.__IVoipCallCoordinatorStatics := IVoipCallCoordinatorStatics(factoryPtr)
        }

        return VoipCallCoordinator.__IVoipCallCoordinatorStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMuteStateChangedToken")) {
            this.remove_MuteStateChanged(this.__OnMuteStateChangedToken)
            this.__OnMuteStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * > [!IMPORTANT]
     * > The need to reserve the CPU and memory resources necessary for a VoIP call is unique to the Universal Windows Platform (UWP) environment. For a desktop app, resource management isn't necessary, so you can omit any call to **ReserveCallResourcesAsync**.
     * 
     * Reserves the CPU and memory resources necessary for a VoIP call. You should use this method only in a single-process application model.
     * @remarks
     * Use this method when your VoIP application receives an incoming call notification, or before creating an outgoing VoIP call.
     * 
     * Each call requires separate resources. To handle multiple VoIP calls simultaneously, you must invoke this method once for each call.
     * 
     * Resources are freed automatically when the last call is completed.
     * @param {HSTRING} taskEntryPoint 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.reservecallresourcesasync
     */
    ReserveCallResourcesAsync(taskEntryPoint) {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.ReserveCallResourcesAsync(taskEntryPoint)
    }

    /**
     * 
     * @param {TypedEventHandler<VoipCallCoordinator, MuteChangeEventArgs>} muteChangeHandler 
     * @returns {EventRegistrationToken} 
     */
    add_MuteStateChanged(muteChangeHandler) {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.add_MuteStateChanged(muteChangeHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MuteStateChanged(token) {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.remove_MuteStateChanged(token)
    }

    /**
     * Makes a request to the system for a new incoming call.
     * @remarks
     * Use this method when the user has turned on quiet hours. If caller's contact remote ID is on the quiet hour breakthrough list, the call will be connected, and an incoming call notification will be shown. If not, the call will not be connected, and no notification will be shown.
     * @param {HSTRING} context_ A string that is passed to the associated foreground app as a deep link. The maximum length is 128 characters. This parameter must be non-null.
     * @param {HSTRING} contactName The contact name of the caller to be displayed on the incoming call UI. The maximum length is 128 characters.
     * @param {HSTRING} contactNumber The phone number of the caller to be displayed on the incoming call UI. The maximum length is 128 characters.
     * @param {Uri} contactImage The Uri of an image file associated with the caller to be displayed on the incoming call UI. The file type must be PNG or JPG. The maximum file size is 1MB.
     * @param {HSTRING} serviceName The name of the VoIP service or application. The maximum length is 128 characters.
     * @param {Uri} brandingImage The Uri of an image file that is a logo or icon of the VoIP service or application to be displayed on the incoming call UI. The file type must be PNG or JPG. The maximum file size is 128KB.
     * @param {HSTRING} callDetails A string indicating who the call is on behalf of. The maximum length is 128 characters.
     * @param {Uri} ringtone The Uri of an audio file containing the ringtone for this call. The file type must be WMA or MP3. The maximum file size is 1MB.
     * @param {Integer} media The media types of the new incoming call (either audio and video or audio only). Pass **Audio|Video** if the user should have the option of answering the call with outgoing video. This assumes that the user's device has a camera available for the app to use at the time the call arrives. If this is not the case, or the user should only use audio, pass **Audio**.
     * @param {TimeSpan} ringTimeout The time, in seconds, the system should wait for the user to answer or ignore the call before rejecting the call. The allowed range is 5 to 120 seconds. The default value is 30 seconds.
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.requestnewincomingcall
     */
    RequestNewIncomingCall(context_, contactName, contactNumber, contactImage, serviceName, brandingImage, callDetails, ringtone, media, ringTimeout) {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.RequestNewIncomingCall(context_, contactName, contactNumber, contactImage, serviceName, brandingImage, callDetails, ringtone, media, ringTimeout)
    }

    /**
     * Makes a request to the system for a new outgoing call.
     * @param {HSTRING} context_ A string that is passed to the associated foreground app as a deep link. The maximum length is 128 characters. This parameter must be non-null.
     * @param {HSTRING} contactName The name or ID of the caller which is displayed in the phone's minimized call UI. The maximum length is 128 characters.
     * @param {HSTRING} serviceName The name of the VoIP service which is displayed in the phone's minimized call UI. The maximum length is 128 characters.
     * @param {Integer} media The media type of the new outgoing call (either audio and video or audio only). Pass **Audio|Video** if the user chose to start the call with outgoing video. This assumes that the user's device has a camera available for the app to use at the time the call is made. If this is not the case, or the user should only use audio, pass **Audio**.
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.requestnewoutgoingcall
     */
    RequestNewOutgoingCall(context_, contactName, serviceName, media) {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.RequestNewOutgoingCall(context_, contactName, serviceName, media)
    }

    /**
     * Notifies the system that the user has muted the call using the VoIP app's UI.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.notifymuted
     */
    NotifyMuted() {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.NotifyMuted()
    }

    /**
     * Notifies the system that the user has unmuted the call using the VoIP app's UI.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.notifyunmuted
     */
    NotifyUnmuted() {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.NotifyUnmuted()
    }

    /**
     * Makes a request of the system to create an outgoing video call that will replace an existing cellular call.
     * @param {Guid} callUpgradeGuid The [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) of the call.
     * @param {HSTRING} context_ A string that is passed to the associated foreground app as a deep link. This might be a contact name or other data that can be used to populate the app's UI more quickly. The maximum length is 128 characters. This parameter must be non-null and must refer to a task defined in the app's manifest file.
     * @param {HSTRING} contactName The name or ID of the caller which is displayed in the phone's minimized call UI. The maximum length is 128 characters.
     * @param {HSTRING} serviceName The name of the VoIP service which is displayed in the phone's minimized call UI. The maximum length is 128 characters.
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.requestoutgoingupgradetovideocall
     */
    RequestOutgoingUpgradeToVideoCall(callUpgradeGuid, context_, contactName, serviceName) {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.RequestOutgoingUpgradeToVideoCall(callUpgradeGuid, context_, contactName, serviceName)
    }

    /**
     * > [!IMPORTANT]
     * > The types in the **Windows.Phone.Networking.Voip** namespace are deprecated, and may not be available in future versions of Windows. Instead, use the equivalent types in the [Windows.ApplicationModel.Calls](/uwp/api/windows.applicationmodel.calls) namespace.
     * 
     * Notifies the system of a new incoming video call that will replace an existing cellular call.
     * @param {HSTRING} context_ A string that is passed to the associated foreground app as a deep link. This might be a contact name or other data that can be used to populate the app's UI more quickly. The maximum length is 128 characters. This parameter must be non-null and must refer to a task defined in the app's manifest file.
     * @param {HSTRING} contactName The contact name of the caller to be displayed on the incoming call UI. The maximum length is 128 characters.
     * @param {HSTRING} contactNumber The phone number of the caller to be displayed on the incoming call UI. The maximum length is 128 characters.
     * @param {Uri} contactImage The Uri of an image file associated with the caller to be displayed on the incoming call UI. The file type must be PNG or JPG. The maximum file size is 1 MB.
     * @param {HSTRING} serviceName The name of the VoIP service or application. The maximum length is 128 characters.
     * @param {Uri} brandingImage The Uri of an image file that is a logo or icon of the VoIP service or application to be displayed on the incoming call UI. The file type must be PNG or JPG. The maximum file size is 128 KB.
     * @param {HSTRING} callDetails A string indicating who the call is on behalf of. The maximum length is 128 characters.
     * @param {Uri} ringtone The Uri of an audio file containing the ringtone for this call. The file type must be WMA or MP3. The maximum file size is 1 MB.
     * @param {TimeSpan} ringTimeout The time, in seconds, the system should wait for the user to answer or ignore the call before rejecting the call. The allowed range is 5 to 120 seconds. The default value is 30 seconds.
     * @returns {VoipPhoneCall} The object representing the new incoming call.
     * @see https://learn.microsoft.com/uwp/api/windows.phone.networking.voip.voipcallcoordinator.requestincomingupgradetovideocall
     */
    RequestIncomingUpgradeToVideoCall(context_, contactName, contactNumber, contactImage, serviceName, brandingImage, callDetails, ringtone, ringTimeout) {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.RequestIncomingUpgradeToVideoCall(context_, contactName, contactNumber, contactImage, serviceName, brandingImage, callDetails, ringtone, ringTimeout)
    }

    /**
     * Terminates a cellular call in order to upgrade to a VoIP call.
     * @param {Guid} callUpgradeGuid The [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the VoIP call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.terminatecellularcall
     */
    TerminateCellularCall(callUpgradeGuid) {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.TerminateCellularCall(callUpgradeGuid)
    }

    /**
     * Cancels the upgrade to a VoIP call.
     * @param {Guid} callUpgradeGuid The [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the VoIP call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.cancelupgrade
     */
    CancelUpgrade(callUpgradeGuid) {
        if (!this.HasProp("__IVoipCallCoordinator")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator := IVoipCallCoordinator(outPtr)
        }

        return this.__IVoipCallCoordinator.CancelUpgrade(callUpgradeGuid)
    }

    /**
     * Sets up a newly accepted call.
     * @remarks
     * Use this method instead of **RequestNewIncomingCall** in auto-accept scenarios, where an incoming call is automatically accepted and connected with video. Possible applications include a home surveillance camera, or helping elderly or disabled users accept calls.
     * 
     * All string parameters have a maximum allowed length of 128 characters (including the terminator).
     * @param {HSTRING} context_ Information that is passed to the VoIP app's foreground UI process. This might be the contact name, or other data that helps the UI display more quickly.
     * @param {HSTRING} contactName The name or ID of the caller.
     * @param {HSTRING} contactNumber The phone number (if applicable) of the caller.
     * @param {HSTRING} serviceName The name of the service or application.
     * @param {Integer} media The media types of the new incoming call (either audio and video or audio only). Pass **Audio|Video** if the call should be answered with outgoing video. This assumes that the user's device has a camera available for the app to use at the time the call is answered. If this is not the case, or the user should only use audio, pass **Audio**.
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.setupnewacceptedcall
     */
    SetupNewAcceptedCall(context_, contactName, contactNumber, serviceName, media) {
        if (!this.HasProp("__IVoipCallCoordinator2")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator2 := IVoipCallCoordinator2(outPtr)
        }

        return this.__IVoipCallCoordinator2.SetupNewAcceptedCall(context_, contactName, contactNumber, serviceName, media)
    }

    /**
     * Requests a new call object from the system. Call this method from your VoIP app to tell the system that there's a new incoming call, and that you want to host an incoming call notification for that new call.
     * @remarks
     * Use this method to create a new [VoipPhoneCall](voipphonecall.md) object. You can use a **VoipPhoneCall** object to send in-app call notifications, and to handle events that the **VoipPhoneCall** raises. See [VoipPhoneCall](voipphonecall.md) for more info about how to work with these notifications and events.
     * @param {HSTRING} context_ A string that is passed to the associated foreground app as a deep link. The maximum length is 128 characters. This parameter must be non-null.
     * @param {HSTRING} contactName The contact name of the caller to be displayed on the incoming call UI. The maximum length is 128 characters.
     * @param {HSTRING} contactNumber The phone number of the caller to be displayed on the incoming call UI. The maximum length is 128 characters.
     * @param {HSTRING} serviceName The name of the VoIP service or application. The maximum length is 128 characters.
     * @param {Integer} media The media types of the new incoming call (either audio and video or audio only). Pass **Audio|Video** if the user should have the option of answering the call with outgoing video. This assumes that the user's device has a camera available for the app to use at the time the call arrives. If this is not the case, or the user should only use audio, pass **Audio**.
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.requestnewappinitiatedcall
     */
    RequestNewAppInitiatedCall(context_, contactName, contactNumber, serviceName, media) {
        if (!this.HasProp("__IVoipCallCoordinator3")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator3 := IVoipCallCoordinator3(outPtr)
        }

        return this.__IVoipCallCoordinator3.RequestNewAppInitiatedCall(context_, contactName, contactNumber, serviceName, media)
    }

    /**
     * Makes a request to the system for a new incoming call.
     * @param {HSTRING} context_ A string that is passed to the associated foreground app as a deep link. The maximum length is 128 characters. This parameter must be non-null.
     * @param {HSTRING} contactName The contact name of the caller to be displayed on the incoming call UI. The maximum length is 128 characters.
     * @param {HSTRING} contactNumber The phone number of the caller to be displayed on the incoming call UI. The maximum length is 128 characters.
     * @param {Uri} contactImage The Uri of an image file associated with the caller to be displayed on the incoming call UI. The file type must be PNG or JPG. The maximum file size is 1MB.
     * @param {HSTRING} serviceName The name of the VoIP service or application. The maximum length is 128 characters.
     * @param {Uri} brandingImage The Uri of an image file that is a logo or icon of the VoIP service or application to be displayed on the incoming call UI. The file type must be PNG or JPG. The maximum file size is 128KB.
     * @param {HSTRING} callDetails A string indicating who the call is on behalf of. The maximum length is 128 characters.
     * @param {Uri} ringtone The Uri of an audio file containing the ringtone for this call. The file type must be WMA or MP3. The maximum file size is 1MB.
     * @param {Integer} media The media types of the new incoming call (either audio and video or audio only). Pass **Audio|Video** if the user should have the option of answering the call with outgoing video. This assumes that the user's device has a camera available for the app to use at the time the call arrives. If this is not the case, or the user should only use audio, pass **Audio**.
     * @param {TimeSpan} ringTimeout The time, in seconds, the system should wait for the user to answer or ignore the call before rejecting the call. The allowed range is 5 to 120 seconds. The default value is 30 seconds.
     * @param {HSTRING} contactRemoteId 
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.requestnewincomingcall
     */
    RequestNewIncomingCallWithContactRemoteId(context_, contactName, contactNumber, contactImage, serviceName, brandingImage, callDetails, ringtone, media, ringTimeout, contactRemoteId) {
        if (!this.HasProp("__IVoipCallCoordinator3")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator3 := IVoipCallCoordinator3(outPtr)
        }

        return this.__IVoipCallCoordinator3.RequestNewIncomingCallWithContactRemoteId(context_, contactName, contactNumber, contactImage, serviceName, brandingImage, callDetails, ringtone, media, ringTimeout, contactRemoteId)
    }

    /**
     * > [!IMPORTANT]
     * > The need to reserve the CPU and memory resources necessary for a VoIP call is unique to the Universal Windows Platform (UWP) environment. For a desktop app, resource management isn't necessary, so you can omit any call to **ReserveCallResourcesAsync**.
     * 
     * Reserves the CPU and memory resources necessary for a VoIP call. You should use this method only in a two-process application model.
     * @remarks
     * Use this method when your VoIP application receives an incoming call notification, or before creating an outgoing VoIP call.
     * 
     * Each call requires separate resources. To handle multiple VoIP calls simultaneously, you must invoke this method once for each call.
     * 
     * Resources are freed automatically when the last call is completed.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.reservecallresourcesasync
     */
    ReserveOneProcessCallResourcesAsync() {
        if (!this.HasProp("__IVoipCallCoordinator4")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator4 := IVoipCallCoordinator4(outPtr)
        }

        return this.__IVoipCallCoordinator4.ReserveOneProcessCallResourcesAsync()
    }

    /**
     * Requests a new call object from the system by using an [IncomingVoipPhoneCallOptions](./incomingvoipphonecalloptions.md) object. Call this method from your VoIP app to tell the system that there's a new incoming call, and that you want to host an incoming call notification for that new call.
     * @remarks
     * Use this method to create a new [VoipPhoneCall](voipphonecall.md) object. You can use a **VoipPhoneCall** object to send in-app call notifications, and to handle events that the **VoipPhoneCall** raises. See [VoipPhoneCall](voipphonecall.md) for more info about how to work with those notifications and events.
     * @param {IncomingVoipPhoneCallOptions} callOptions An object representing the options to use when creating the new call.
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.requestnewincomingcallwithoptions
     */
    RequestNewIncomingCallWithOptions(callOptions) {
        if (!this.HasProp("__IVoipCallCoordinator5")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator5 := IVoipCallCoordinator5(outPtr)
        }

        return this.__IVoipCallCoordinator5.RequestNewIncomingCallWithOptions(callOptions)
    }

    /**
     * Requests a new call object from the system by using an [OutgoingVoipCallOptions](./outgoingvoipphonecalloptions.md) object. Call this method from your VoIP app to tell the system that there's a new outgoing call.
     * @remarks
     * Use this method to create a new [VoipPhoneCall](voipphonecall.md) object. You can use a **VoipPhoneCall** object to send in-app call notifications, and to handle events that the **VoipPhoneCall** raises. See [VoipPhoneCall](voipphonecall.md) for more info about how to work with those notifications and events.
     * @param {OutgoingVoipPhoneCallOptions} callOptions An object representing the options to use when creating the new call.
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.requestnewoutgoingcallwithoptions
     */
    RequestNewOutgoingCallWithOptions(callOptions) {
        if (!this.HasProp("__IVoipCallCoordinator5")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator5 := IVoipCallCoordinator5(outPtr)
        }

        return this.__IVoipCallCoordinator5.RequestNewOutgoingCallWithOptions(callOptions)
    }

    /**
     * Sets up a newly accepted call by using an [AcceptedVoipPhoneCallOptions](./acceptedvoipphonecalloptions.md) object.
     * @remarks
     * Use this method instead of **RequestNewIncomingCall** in auto-accept scenarios, where an incoming call is automatically accepted and connected with video. Possible applications include a home surveillance camera, or helping elderly or disabled users accept calls.
     * @param {AcceptedVoipPhoneCallOptions} callOptions An object representing the options to use when creating the new accepted call.
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.setupnewacceptedcallwithoptions
     */
    SetupNewAcceptedCallWithOptions(callOptions) {
        if (!this.HasProp("__IVoipCallCoordinator5")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator5 := IVoipCallCoordinator5(outPtr)
        }

        return this.__IVoipCallCoordinator5.SetupNewAcceptedCallWithOptions(callOptions)
    }

    /**
     * Requests a new call object from the system by using an [AppInitiatedVoipPhoneCallOptions](./appinitiatedvoipphonecalloptions.md) object. Call this method from your VoIP app to tell the system that there's a new incoming call, and that you want to host an incoming call notification for that new call.
     * @remarks
     * Use this method to create a new [VoipPhoneCall](voipphonecall.md) object. You can use a **VoipPhoneCall** object to send in-app call notifications, and to handle events that the **VoipPhoneCall** raises. See [VoipPhoneCall](voipphonecall.md) for more info about how to work with those notifications and events.
     * @param {AppInitiatedVoipPhoneCallOptions} callOptions An object representing the options to use when creating the new call.
     * @returns {VoipPhoneCall} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcoordinator.requestnewappinitiatedcallwithoptions
     */
    RequestNewAppInitiatedCallWithOptions(callOptions) {
        if (!this.HasProp("__IVoipCallCoordinator5")) {
            if ((queryResult := this.QueryInterface(IVoipCallCoordinator5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoipCallCoordinator5 := IVoipCallCoordinator5(outPtr)
        }

        return this.__IVoipCallCoordinator5.RequestNewAppInitiatedCallWithOptions(callOptions)
    }

;@endregion Instance Methods
}

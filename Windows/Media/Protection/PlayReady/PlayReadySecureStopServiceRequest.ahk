#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadySecureStopServiceRequest.ahk
#Include .\IPlayReadyServiceRequest.ahk
#Include ..\IMediaProtectionServiceRequest.ahk
#Include .\IPlayReadySecureStopServiceRequestFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Manages secure stop messages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadySecureStopServiceRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadySecureStopServiceRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadySecureStopServiceRequest.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} publisherCertBytes_length 
     * @param {Pointer<Integer>} publisherCertBytes 
     * @returns {PlayReadySecureStopServiceRequest} 
     */
    static CreateInstance(publisherCertBytes_length, publisherCertBytes) {
        if (!PlayReadySecureStopServiceRequest.HasProp("__IPlayReadySecureStopServiceRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadySecureStopServiceRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadySecureStopServiceRequestFactory.IID)
            PlayReadySecureStopServiceRequest.__IPlayReadySecureStopServiceRequestFactory := IPlayReadySecureStopServiceRequestFactory(factoryPtr)
        }

        return PlayReadySecureStopServiceRequest.__IPlayReadySecureStopServiceRequestFactory.CreateInstance(publisherCertBytes_length, publisherCertBytes)
    }

    /**
     * Initializes a new instance of the [PlayReadySecureStopServiceRequest](playreadysecurestopservicerequest.md) class to include all secure stop sessions.
     * @param {Guid} sessionID 
     * @param {Integer} publisherCertBytes_length 
     * @param {Pointer<Integer>} publisherCertBytes The raw binary body of the publisher certificate.
     * @returns {PlayReadySecureStopServiceRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.#ctor
     */
    static CreateInstanceFromSessionID(sessionID, publisherCertBytes_length, publisherCertBytes) {
        if (!PlayReadySecureStopServiceRequest.HasProp("__IPlayReadySecureStopServiceRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadySecureStopServiceRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadySecureStopServiceRequestFactory.IID)
            PlayReadySecureStopServiceRequest.__IPlayReadySecureStopServiceRequestFactory := IPlayReadySecureStopServiceRequestFactory(factoryPtr)
        }

        return PlayReadySecureStopServiceRequest.__IPlayReadySecureStopServiceRequestFactory.CreateInstanceFromSessionID(sessionID, publisherCertBytes_length, publisherCertBytes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the session identifier property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.sessionid
     * @type {Guid} 
     */
    SessionID {
        get => this.get_SessionID()
    }

    /**
     * Gets the secure stop session's start time property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * Gets the secure stop session's update/stop time property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.updatetime
     * @type {DateTime} 
     */
    UpdateTime {
        get => this.get_UpdateTime()
    }

    /**
     * Gets the secure stop session's stopped flag property which indicates whether the secure stop session for this request was cleanly shut down.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.stopped
     * @type {Boolean} 
     */
    Stopped {
        get => this.get_Stopped()
    }

    /**
     * Gets the current publisher certificate property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.publishercertificate
     */
    PublisherCertificate {
        get => this.get_PublisherCertificate()
    }

    /**
     * Gets or sets the URI used to perform a service request action.
     * @remarks
     * The URI must be set through this property before calling [BeginServiceRequest](playreadysecurestopservicerequest_beginservicerequest_736222023.md).
     * 
     * This property cannot be set after [BeginServiceRequest](playreadysecurestopservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](playreadysecurestopservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets the custom data that was returned in the response from the service.
     * @remarks
     * This property can be called only after the service request has been completed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.responsecustomdata
     * @type {HSTRING} 
     */
    ResponseCustomData {
        get => this.get_ResponseCustomData()
    }

    /**
     * Gets or sets the custom data of the request challenge.
     * @remarks
     * Use this property to get the custom data to be placed in the request challenge or to set the challenge custom data to send up as part of the request.
     * 
     * Setting this property is optional.
     * 
     * This property cannot be set after [BeginServiceRequest](playreadysecurestopservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](playreadysecurestopservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.challengecustomdata
     * @type {HSTRING} 
     */
    ChallengeCustomData {
        get => this.get_ChallengeCustomData()
        set => this.put_ChallengeCustomData(value)
    }

    /**
     * Gets the vendor content protection system identifier.
     * @remarks
     * This property allows the app to identify the content protection system being used and therefore how to interpret the protection task.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.protectionsystem
     * @type {Guid} 
     */
    ProtectionSystem {
        get => this.get_ProtectionSystem()
    }

    /**
     * Gets the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the type of operation that the PlayReady secure stop service request performs.
     * @remarks
     * The possible values of **Type** depend on the content protection system used for the content. This can be determined by context or by inspecting the [ProtectionSystem](playreadysecurestopservicerequest_protectionsystem.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.type
     * @type {Guid} 
     */
    Type {
        get => this.get_Type()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SessionID() {
        if (!this.HasProp("__IPlayReadySecureStopServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadySecureStopServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadySecureStopServiceRequest := IPlayReadySecureStopServiceRequest(outPtr)
        }

        return this.__IPlayReadySecureStopServiceRequest.get_SessionID()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        if (!this.HasProp("__IPlayReadySecureStopServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadySecureStopServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadySecureStopServiceRequest := IPlayReadySecureStopServiceRequest(outPtr)
        }

        return this.__IPlayReadySecureStopServiceRequest.get_StartTime()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_UpdateTime() {
        if (!this.HasProp("__IPlayReadySecureStopServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadySecureStopServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadySecureStopServiceRequest := IPlayReadySecureStopServiceRequest(outPtr)
        }

        return this.__IPlayReadySecureStopServiceRequest.get_UpdateTime()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Stopped() {
        if (!this.HasProp("__IPlayReadySecureStopServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadySecureStopServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadySecureStopServiceRequest := IPlayReadySecureStopServiceRequest(outPtr)
        }

        return this.__IPlayReadySecureStopServiceRequest.get_Stopped()
    }

    /**
     * 
     * @param {Pointer<Pointer>} publisherCertBytes 
     * @returns {HRESULT} 
     */
    get_PublisherCertificate(publisherCertBytes) {
        if (!this.HasProp("__IPlayReadySecureStopServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadySecureStopServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadySecureStopServiceRequest := IPlayReadySecureStopServiceRequest(outPtr)
        }

        return this.__IPlayReadySecureStopServiceRequest.get_PublisherCertificate(publisherCertBytes)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IPlayReadyServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyServiceRequest := IPlayReadyServiceRequest(outPtr)
        }

        return this.__IPlayReadyServiceRequest.get_Uri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__IPlayReadyServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyServiceRequest := IPlayReadyServiceRequest(outPtr)
        }

        return this.__IPlayReadyServiceRequest.put_Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResponseCustomData() {
        if (!this.HasProp("__IPlayReadyServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyServiceRequest := IPlayReadyServiceRequest(outPtr)
        }

        return this.__IPlayReadyServiceRequest.get_ResponseCustomData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ChallengeCustomData() {
        if (!this.HasProp("__IPlayReadyServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyServiceRequest := IPlayReadyServiceRequest(outPtr)
        }

        return this.__IPlayReadyServiceRequest.get_ChallengeCustomData()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ChallengeCustomData(value) {
        if (!this.HasProp("__IPlayReadyServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyServiceRequest := IPlayReadyServiceRequest(outPtr)
        }

        return this.__IPlayReadyServiceRequest.put_ChallengeCustomData(value)
    }

    /**
     * Begins an asynchronous service request operation.
     * @remarks
     * Completion and results can be retrieved using the [IAsyncAction](../windows.foundation/iasyncaction.md) interface that is returned. Calling this method places the class in a read-only state.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.beginservicerequest
     */
    BeginServiceRequest() {
        if (!this.HasProp("__IPlayReadyServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyServiceRequest := IPlayReadyServiceRequest(outPtr)
        }

        return this.__IPlayReadyServiceRequest.BeginServiceRequest()
    }

    /**
     * Returns a new service request interface.
     * @remarks
     * This method should only be called after:
     * 
     * 
     * + A completion event from the [IAsyncAction](../windows.foundation/iasyncaction.md) object returned from [BeginServiceRequest](playreadysecurestopservicerequest_beginservicerequest_736222023.md) has indicated the current service request is complete (automatic enabling).
     * + A call to [ProcessManualEnablingResponse](playreadysecurestopservicerequest_processmanualenablingresponse_559693975.md) (manual enabling).
     * 
     * 
     * Both of the above situations leave the current service request in a read-only/complete state, although there could be additional service requests to perform. An app should call this method to determine if additional service requests are required.
     * @returns {IPlayReadyServiceRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.nextservicerequest
     */
    NextServiceRequest() {
        if (!this.HasProp("__IPlayReadyServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyServiceRequest := IPlayReadyServiceRequest(outPtr)
        }

        return this.__IPlayReadyServiceRequest.NextServiceRequest()
    }

    /**
     * Begins the process of manually enabling.
     * @remarks
     * Provides the caller the raw HTTP challenge and headers that they must send up to the server. When the response is received, it should be processed by calling the [ProcessManualEnablingResponse](playreadysecurestopservicerequest_processmanualenablingresponse_559693975.md) method.
     * @returns {PlayReadySoapMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.generatemanualenablingchallenge
     */
    GenerateManualEnablingChallenge() {
        if (!this.HasProp("__IPlayReadyServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyServiceRequest := IPlayReadyServiceRequest(outPtr)
        }

        return this.__IPlayReadyServiceRequest.GenerateManualEnablingChallenge()
    }

    /**
     * Process the raw binary result of a manual enabling challenge.
     * @remarks
     * The return value of this method is a failure only if the input data is invalid in some way. If the result is processed successfully but has a failure state, this method will return that failure in the result parameter.
     * 
     * The most common values to be returned in the result parameter are:
     * 
     * 
     * + S_OK—The enabling response was processed and there are no more service requests necessary. A following call to [NextServiceRequest](playreadysecurestopservicerequest_nextservicerequest_1650210697.md) will return a **NULL** pointer.
     * + MSPR_E_CONTENT_ENABLING_ACTION_REQUIRED—A new service request was generated when processing the current service request. A call to **NextServiceRequest** should be made.
     * + DRM_E_SERVER_SERVICE_SPECIFIC—A PlayReady license or domain server failed.
     * + MSPR_E_SDK_UPDATE_REQUIRED—The individualization service requires a client SDK update before a new individualization operation can complete. Refreshing the PlayReady SDK is required.
     * @param {Integer} responseBytes_length 
     * @param {Pointer<Integer>} responseBytes The response result to be processed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopservicerequest.processmanualenablingresponse
     */
    ProcessManualEnablingResponse(responseBytes_length, responseBytes) {
        if (!this.HasProp("__IPlayReadyServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyServiceRequest := IPlayReadyServiceRequest(outPtr)
        }

        return this.__IPlayReadyServiceRequest.ProcessManualEnablingResponse(responseBytes_length, responseBytes)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProtectionSystem() {
        if (!this.HasProp("__IMediaProtectionServiceRequest")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionServiceRequest := IMediaProtectionServiceRequest(outPtr)
        }

        return this.__IMediaProtectionServiceRequest.get_ProtectionSystem()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Type() {
        if (!this.HasProp("__IMediaProtectionServiceRequest")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionServiceRequest := IMediaProtectionServiceRequest(outPtr)
        }

        return this.__IMediaProtectionServiceRequest.get_Type()
    }

;@endregion Instance Methods
}

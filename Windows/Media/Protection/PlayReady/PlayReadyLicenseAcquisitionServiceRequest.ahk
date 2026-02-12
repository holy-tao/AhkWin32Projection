#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyLicenseAcquisitionServiceRequest.ahk
#Include .\IPlayReadyServiceRequest.ahk
#Include ..\IMediaProtectionServiceRequest.ahk
#Include .\IPlayReadyLicenseAcquisitionServiceRequest2.ahk
#Include .\IPlayReadyLicenseAcquisitionServiceRequest3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the service methods for obtaining PlayReady licenses.
 * @remarks
 * This class can be created proactively, returned from a previous service request operation, or delivered to the app through the **MediaProtectionManager.ServiceRequested** event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyLicenseAcquisitionServiceRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadyLicenseAcquisitionServiceRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadyLicenseAcquisitionServiceRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the current content header property.
     * @remarks
     * This property cannot be set after [BeginServiceRequest](playreadylicenseacquisitionservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](playreadylicenseacquisitionservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.contentheader
     * @type {PlayReadyContentHeader} 
     */
    ContentHeader {
        get => this.get_ContentHeader()
        set => this.put_ContentHeader(value)
    }

    /**
     * Gets or sets the current domain service identifier property that overrides a service identifier in the content header.
     * @remarks
     * This property cannot be set after [BeginServiceRequest](playreadylicenseacquisitionservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](playreadylicenseacquisitionservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.domainserviceid
     * @type {Guid} 
     */
    DomainServiceId {
        get => this.get_DomainServiceId()
        set => this.put_DomainServiceId(value)
    }

    /**
     * Gets or sets the URI used to perform a service request action.
     * @remarks
     * The URI must be set before calling [BeginServiceRequest](playreadylicenseacquisitionservicerequest_beginservicerequest_736222023.md) either through this property or through a different property (such as a content header) that contains a URI.
     * 
     * This property cannot be set after [BeginServiceRequest](playreadylicenseacquisitionservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](playreadylicenseacquisitionservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.uri
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.responsecustomdata
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
     * This property cannot be set after [BeginServiceRequest](playreadylicenseacquisitionservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](playreadylicenseacquisitionservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.challengecustomdata
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.protectionsystem
     * @type {Guid} 
     */
    ProtectionSystem {
        get => this.get_ProtectionSystem()
    }

    /**
     * Gets the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the type of operation that the PlayReady license acquisition service request performs.
     * @remarks
     * The possible values of **Type** depend on the content protection system used for the content. This can be determined by context or by inspecting the [ProtectionSystem](playreadylicenseacquisitionservicerequest_protectionsystem.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.type
     * @type {Guid} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a unique identifier for the PlayReady license acquisition operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.sessionid
     * @type {Guid} 
     */
    SessionId {
        get => this.get_SessionId()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PlayReadyLicenseAcquisitionServiceRequest](playreadylicenseacquisitionservicerequest.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyLicenseAcquisitionServiceRequest")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PlayReadyContentHeader} 
     */
    get_ContentHeader() {
        if (!this.HasProp("__IPlayReadyLicenseAcquisitionServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicenseAcquisitionServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicenseAcquisitionServiceRequest := IPlayReadyLicenseAcquisitionServiceRequest(outPtr)
        }

        return this.__IPlayReadyLicenseAcquisitionServiceRequest.get_ContentHeader()
    }

    /**
     * 
     * @param {PlayReadyContentHeader} value 
     * @returns {HRESULT} 
     */
    put_ContentHeader(value) {
        if (!this.HasProp("__IPlayReadyLicenseAcquisitionServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicenseAcquisitionServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicenseAcquisitionServiceRequest := IPlayReadyLicenseAcquisitionServiceRequest(outPtr)
        }

        return this.__IPlayReadyLicenseAcquisitionServiceRequest.put_ContentHeader(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainServiceId() {
        if (!this.HasProp("__IPlayReadyLicenseAcquisitionServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicenseAcquisitionServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicenseAcquisitionServiceRequest := IPlayReadyLicenseAcquisitionServiceRequest(outPtr)
        }

        return this.__IPlayReadyLicenseAcquisitionServiceRequest.get_DomainServiceId()
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_DomainServiceId(value) {
        if (!this.HasProp("__IPlayReadyLicenseAcquisitionServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicenseAcquisitionServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicenseAcquisitionServiceRequest := IPlayReadyLicenseAcquisitionServiceRequest(outPtr)
        }

        return this.__IPlayReadyLicenseAcquisitionServiceRequest.put_DomainServiceId(value)
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.beginservicerequest
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
     * + A completion event from the [IAsyncAction](../windows.foundation/iasyncaction.md) object returned from [BeginServiceRequest](playreadylicenseacquisitionservicerequest_beginservicerequest_736222023.md) has indicated the current service request is complete (automatic enabling).
     * + A call to [ProcessManualEnablingResponse](playreadylicenseacquisitionservicerequest_processmanualenablingresponse_559693975.md) (manual enabling).
     * 
     * 
     * Both of the above situations leave the current service request in a read-only/complete state, although there could be additional service requests to perform. An app should call this method to determine if additional service requests are required.
     * @returns {IPlayReadyServiceRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.nextservicerequest
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
     * Provides the caller the raw HTTP challenge and headers that they must send up to the server. When the response is received, it should be processed by calling the [ProcessManualEnablingResponse](playreadylicenseacquisitionservicerequest_processmanualenablingresponse_559693975.md) method.
     * 
     * Calling this method places the class in a read-only state even if the method does not succeed.
     * @returns {PlayReadySoapMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.generatemanualenablingchallenge
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
     * + S_OK—The enabling response was processed and there are no more service requests necessary. A following call to [NextServiceRequest](playreadylicenseacquisitionservicerequest_nextservicerequest_1650210697.md) will return a **NULL** pointer.
     * + MSPR_E_CONTENT_ENABLING_ACTION_REQUIRED—A new service request was generated when processing the current service request. A call to **NextServiceRequest** should be made.
     * + DRM_E_SERVER_SERVICE_SPECIFIC—A PlayReady license or domain server failed.
     * + MSPR_E_SDK_UPDATE_REQUIRED—The individualization service requires a client SDK update before a new individualization operation can complete. Refreshing the PlayReady SDK is required.
     * @param {Integer} responseBytes_length 
     * @param {Pointer<Integer>} responseBytes The response result to be processed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.processmanualenablingresponse
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

    /**
     * 
     * @returns {Guid} 
     */
    get_SessionId() {
        if (!this.HasProp("__IPlayReadyLicenseAcquisitionServiceRequest2")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicenseAcquisitionServiceRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicenseAcquisitionServiceRequest2 := IPlayReadyLicenseAcquisitionServiceRequest2(outPtr)
        }

        return this.__IPlayReadyLicenseAcquisitionServiceRequest2.get_SessionId()
    }

    /**
     * Creates a PlayReadyLicense class iterator that supports in-memory-only PlayReady licenses in addition to persisted licenses.
     * @param {PlayReadyContentHeader} contentHeader The content header used to locate associated licenses.
     * @param {Boolean} fullyEvaluated Indicates whether evaluated license chains should be enumerated or if all licenses (including those that are unusable) should be enumerated. Set this parameter to true if evaluated license chains should be enumerated. Set this parameter to false if all licenses should be enumerated.
     * @returns {PlayReadyLicenseIterable} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseacquisitionservicerequest.createlicenseiterable
     */
    CreateLicenseIterable(contentHeader, fullyEvaluated) {
        if (!this.HasProp("__IPlayReadyLicenseAcquisitionServiceRequest3")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicenseAcquisitionServiceRequest3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicenseAcquisitionServiceRequest3 := IPlayReadyLicenseAcquisitionServiceRequest3(outPtr)
        }

        return this.__IPlayReadyLicenseAcquisitionServiceRequest3.CreateLicenseIterable(contentHeader, fullyEvaluated)
    }

;@endregion Instance Methods
}

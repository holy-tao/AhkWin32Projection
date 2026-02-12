#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyMeteringReportServiceRequest.ahk
#Include .\IPlayReadyServiceRequest.ahk
#Include ..\IMediaProtectionServiceRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the service methods for content metering operations.
 * @remarks
 * This class can only be created proactively.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyMeteringReportServiceRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadyMeteringReportServiceRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadyMeteringReportServiceRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the current metering certificate property.
     * @remarks
     * This property cannot be set after [BeginServiceRequest](playreadymeteringreportservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](playreadymeteringreportservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.meteringcertificate
     */
    MeteringCertificate {
        get => this.get_MeteringCertificate()
        set => this.put_MeteringCertificate(value)
    }

    /**
     * Gets or sets the URI used to perform a service request action.
     * @remarks
     * The URI must be set through this property before calling [BeginServiceRequest](playreadymeteringreportservicerequest_beginservicerequest_736222023.md).
     * 
     * This property cannot be set after [BeginServiceRequest](playreadymeteringreportservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](playreadymeteringreportservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.uri
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.responsecustomdata
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
     * This property cannot be set after [BeginServiceRequest](playreadymeteringreportservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](playreadymeteringreportservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.challengecustomdata
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.protectionsystem
     * @type {Guid} 
     */
    ProtectionSystem {
        get => this.get_ProtectionSystem()
    }

    /**
     * Gets the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the type of operation that the PlayReady metering report service request performs.
     * @remarks
     * The possible values of **Type** depend on the content protection system used for the content. This can be determined by context or by inspecting the [ProtectionSystem](playreadymeteringreportservicerequest_protectionsystem.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.type
     * @type {Guid} 
     */
    Type {
        get => this.get_Type()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PlayReadyMeteringReportServiceRequest](playreadymeteringreportservicerequest.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyMeteringReportServiceRequest")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Pointer<Pointer>} meteringCertBytes 
     * @returns {HRESULT} 
     */
    get_MeteringCertificate(meteringCertBytes) {
        if (!this.HasProp("__IPlayReadyMeteringReportServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyMeteringReportServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyMeteringReportServiceRequest := IPlayReadyMeteringReportServiceRequest(outPtr)
        }

        return this.__IPlayReadyMeteringReportServiceRequest.get_MeteringCertificate(meteringCertBytes)
    }

    /**
     * 
     * @param {Integer} meteringCertBytes_length 
     * @param {Pointer<Integer>} meteringCertBytes 
     * @returns {HRESULT} 
     */
    put_MeteringCertificate(meteringCertBytes_length, meteringCertBytes) {
        if (!this.HasProp("__IPlayReadyMeteringReportServiceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayReadyMeteringReportServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyMeteringReportServiceRequest := IPlayReadyMeteringReportServiceRequest(outPtr)
        }

        return this.__IPlayReadyMeteringReportServiceRequest.put_MeteringCertificate(meteringCertBytes_length, meteringCertBytes)
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
     * 
     * If no data is available for metering, this method will return MSPR_E_NO_METERING_DATA_AVAILABLE.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.beginservicerequest
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
     * This method should only be called after a completion event from the [IAsyncAction](../windows.foundation/iasyncaction.md) object returned from [BeginServiceRequest](playreadymeteringreportservicerequest_beginservicerequest_736222023.md) has indicated the current service request is complete (automatic enabling). This situation leaves the current service request in a read-only/complete state, although there could be additional service requests to perform. An app should call this method to determine if additional service requests are required.
     * 
     * If no data is available for metering, this method will return MSPR_E_NO_METERING_DATA_AVAILABLE.
     * @returns {IPlayReadyServiceRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.nextservicerequest
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
     * Provides the caller the raw HTTP challenge and headers that they must send up to the server. When the response is received, it should be processed by calling the [ProcessManualEnablingResponse](playreadymeteringreportservicerequest_processmanualenablingresponse_559693975.md) method.
     * 
     * Calling this method places the class in a read-only state even if the method does not succeed.
     * @returns {PlayReadySoapMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.generatemanualenablingchallenge
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
     * + S_OK—The enabling response was processed and there are no more service requests necessary. A following call to [NextServiceRequest](playreadymeteringreportservicerequest_nextservicerequest_1650210697.md) will return a **NULL** pointer.
     * + MSPR_E_CONTENT_ENABLING_ACTION_REQUIRED—A new service request was generated when processing the current service request. A call to **NextServiceRequest** should be made.
     * + DRM_E_SERVER_SERVICE_SPECIFIC—A PlayReady license or domain server failed.
     * + MSPR_E_SDK_UPDATE_REQUIRED—The individualization service requires a client SDK update before a new individualization operation can complete. Refreshing the PlayReady SDK is required.
     * @param {Integer} responseBytes_length 
     * @param {Pointer<Integer>} responseBytes The response result to be processed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadymeteringreportservicerequest.processmanualenablingresponse
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

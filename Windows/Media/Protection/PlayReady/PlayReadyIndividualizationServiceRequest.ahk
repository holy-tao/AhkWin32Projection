#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyIndividualizationServiceRequest.ahk
#Include .\IPlayReadyServiceRequest.ahk
#Include ..\IMediaProtectionServiceRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the service methods for requesting platform individualization.
 * @remarks
 * This class can be created proactively, returned from a previous service request operation, or delivered to the application through the **MediaProtectionManager.ServiceRequested** event.
 * 
 * The process of individualization is not configurable by an app, so this class has no methods or properties beyond that of the [IPlayReadyServiceRequest](iplayreadyservicerequest.md) base class. It is provided for type completeness and as a concrete activatable class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyIndividualizationServiceRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadyIndividualizationServiceRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadyIndividualizationServiceRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the URI used to perform a service request action. This property is not supported in this class.
     * @remarks
     * The URI should not be set on this service request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets the custom data that was returned in the response from the service. This property is not supported in this class.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest.responsecustomdata
     * @type {HSTRING} 
     */
    ResponseCustomData {
        get => this.get_ResponseCustomData()
    }

    /**
     * Gets or sets the custom data of the request challenge. This property is not supported in this class.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest.challengecustomdata
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest.protectionsystem
     * @type {Guid} 
     */
    ProtectionSystem {
        get => this.get_ProtectionSystem()
    }

    /**
     * Gets the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the type of operation that the PlayReady individualization service request performs.
     * @remarks
     * The possible values of **Type** depend on the content protection system used for the content. This can be determined by context or by inspecting the [ProtectionSystem](playreadyindividualizationservicerequest_protectionsystem.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest.type
     * @type {Guid} 
     */
    Type {
        get => this.get_Type()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PlayReadyIndividualizationServiceRequest](playreadyindividualizationservicerequest.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyIndividualizationServiceRequest")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest.beginservicerequest
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
     * This method should only be called after a completion event from the [IAsyncAction](../windows.foundation/iasyncaction.md) object returned from [BeginServiceRequest](playreadyindividualizationservicerequest_beginservicerequest_736222023.md) has indicated the current service request is complete (automatic enabling). This situation leaves the current service request in a read-only/complete state, although there could be additional service requests to perform. An app should call this method to determine if additional service requests are required.
     * @returns {IPlayReadyServiceRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest.nextservicerequest
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
     * Begins the process of manually enabling. This method is not supported in this class.
     * @returns {PlayReadySoapMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest.generatemanualenablingchallenge
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
     * Process the raw binary result of a manual enabling challenge. This method is not supported in this class.
     * @param {Integer} responseBytes_length 
     * @param {Pointer<Integer>} responseBytes The response result to be processed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyindividualizationservicerequest.processmanualenablingresponse
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

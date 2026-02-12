#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include .\IPlayReadyServiceRequest.ahk
#Include .\PlayReadySoapMessage.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Base interface for all service request interfaces.
 * @remarks
 * All PlayReady service request objects support all the methods in this interface with the exceptions of [PlayReadyIndividualizationServiceRequest](playreadyindividualizationservicerequest.md) and [PlayReadyRevocationServiceRequest](playreadyrevocationservicerequest.md). **IPlayReadyIndividualizationServiceRequest** and **IPlayReadyRevocationServiceRequest** only support [BeginServiceRequest](iplayreadyservicerequest_beginservicerequest_736222023.md) and [NextServiceRequest](iplayreadyservicerequest_nextservicerequest_1650210697.md).
 * 
 * Some properties are only available for retrieval after the service request is complete. These will be explicitly indicated.
 * 
 * No properties can be set after **BeginServiceRequest** or [GenerateManualEnablingChallenge](iplayreadyservicerequest_generatemanualenablingchallenge_1228062000.md) has been called. These methods effectively put the interface into a read-only state.
 * 
 * The only **IPlayReadyServiceRequest** that can be created if the machine is not individualized is **IPlayReadyIndividualizationServiceRequest**. All others return MSPR_E_NEEDS_INDIVIDUALIZATION until individualization occurs successfully.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadyservicerequest
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyServiceRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyServiceRequest
     * @type {Guid}
     */
    static IID => Guid("{8bad2836-a703-45a6-a180-76f3565aa725}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uri", "put_Uri", "get_ResponseCustomData", "get_ChallengeCustomData", "put_ChallengeCustomData", "BeginServiceRequest", "NextServiceRequest", "GenerateManualEnablingChallenge", "ProcessManualEnablingResponse"]

    /**
     * Gets or sets the URI used to perform a service request action.
     * @remarks
     * For certain service requests, the URI must be set before calling [BeginServiceRequest](iplayreadyservicerequest_beginservicerequest_736222023.md) either through this property or through a different property (such as a content header) that contains a URI.
     * 
     * This property cannot be set after [BeginServiceRequest](iplayreadyservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](iplayreadyservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadyservicerequest.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets the custom data that was returned in the response from the service.
     * @remarks
     * This property can only be called after the service request has been completed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadyservicerequest.responsecustomdata
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
     * This property cannot be set after [BeginServiceRequest](iplayreadyservicerequest_beginservicerequest_736222023.md) or [GenerateManualEnablingChallenge](iplayreadyservicerequest_generatemanualenablingchallenge_1228062000.md) have been called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadyservicerequest.challengecustomdata
     * @type {HSTRING} 
     */
    ChallengeCustomData {
        get => this.get_ChallengeCustomData()
        set => this.put_ChallengeCustomData(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResponseCustomData() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ChallengeCustomData() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ChallengeCustomData(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Begins an asynchronous service request operation.
     * @remarks
     * Completion and results can be retrieved using the [IAsyncAction](../windows.foundation/iasyncaction.md) interface that is returned. Calling this method places the interface in a read-only state.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadyservicerequest.beginservicerequest
     */
    BeginServiceRequest() {
        result := ComCall(11, this, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * Returns a new service request interface.
     * @remarks
     * This method should only be called after:
     * + A completion event from the [IAsyncAction](../windows.foundation/iasyncaction.md) object returned from [BeginServiceRequest](iplayreadyservicerequest_beginservicerequest_736222023.md) has indicated the current service request is complete (automatic enabling).
     * + A call to [ProcessManualEnablingResponse](iplayreadyservicerequest_processmanualenablingresponse_559693975.md) (manual enabling).
     * 
     * 
     * Both of the above situations leave the current service request in a read-only/complete state, although there could be additional service requests to perform. An app should call this method to determine if additional service requests are required.
     * @returns {IPlayReadyServiceRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadyservicerequest.nextservicerequest
     */
    NextServiceRequest() {
        result := ComCall(12, this, "ptr*", &serviceRequest := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPlayReadyServiceRequest(serviceRequest)
    }

    /**
     * Begins the process of manually enabling.
     * @remarks
     * Provides the caller the raw HTTP challenge and headers that must be sent up to the server. When the response is received, it should be processed by calling the [ProcessManualEnablingResponse](iplayreadyservicerequest_processmanualenablingresponse_559693975.md) method.
     * 
     * Calling this method places the interface in a read-only state even if the method does not succeed.
     * @returns {PlayReadySoapMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadyservicerequest.generatemanualenablingchallenge
     */
    GenerateManualEnablingChallenge() {
        result := ComCall(13, this, "ptr*", &challengeMessage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadySoapMessage(challengeMessage)
    }

    /**
     * Processes the raw binary result of a manual enabling challenge.
     * @remarks
     * The return value of this method is a failure only if the input data is invalid in some way. If the result is processed successfully but has a failure state, this method will return that failure in the *result* parameter.
     * 
     * The most common values to be returned in *result* are:
     * + S_OK—The enabling response was processed and there are no more service requests necessary. A following call to [NextServiceRequest](iplayreadyservicerequest_nextservicerequest_1650210697.md) will return a **NULL** pointer.
     * + MSPR_E_CONTENT_ENABLING_ACTION_REQUIRED—A new service request was generated when processing the current service request. A call to **NextServiceRequest** should be made.
     * + DRM_E_SERVER_SERVICE_SPECIFIC—A PlayReady license or domain server failed.
     * + MSPR_E_SDK_UPDATE_REQUIRED—The individualization service requires a client SDK update before a new individualization operation can complete. Refreshing the PlayReady SDK is required.
     * @param {Integer} responseBytes_length 
     * @param {Pointer<Integer>} responseBytes The response result to be processed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadyservicerequest.processmanualenablingresponse
     */
    ProcessManualEnablingResponse(responseBytes_length, responseBytes) {
        responseBytesMarshal := responseBytes is VarRef ? "char*" : "ptr"

        result := ComCall(14, this, "uint", responseBytes_length, responseBytesMarshal, responseBytes, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

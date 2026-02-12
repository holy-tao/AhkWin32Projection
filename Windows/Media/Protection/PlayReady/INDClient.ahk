#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\INDStartResult.ahk
#Include .\INDLicenseFetchResult.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDClient extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDClient
     * @type {Guid}
     */
    static IID => Guid("{3bd6781b-61b8-46e2-99a5-8abcb6b9f7d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_RegistrationCompleted", "remove_RegistrationCompleted", "add_ProximityDetectionCompleted", "remove_ProximityDetectionCompleted", "add_LicenseFetchCompleted", "remove_LicenseFetchCompleted", "add_ReRegistrationNeeded", "remove_ReRegistrationNeeded", "add_ClosedCaptionDataReceived", "remove_ClosedCaptionDataReceived", "StartAsync", "LicenseFetchAsync", "ReRegistrationAsync", "Close"]

    /**
     * 
     * @param {TypedEventHandler<NDClient, INDRegistrationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RegistrationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RegistrationCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<NDClient, INDProximityDetectionCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProximityDetectionCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProximityDetectionCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<NDClient, INDLicenseFetchCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LicenseFetchCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LicenseFetchCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<NDClient, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReRegistrationNeeded(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReRegistrationNeeded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<NDClient, INDClosedCaptionDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ClosedCaptionDataReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ClosedCaptionDataReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} contentUrl 
     * @param {Integer} startAsyncOptions 
     * @param {INDCustomData} registrationCustomData 
     * @param {INDLicenseFetchDescriptor} licenseFetchDescriptor 
     * @returns {IAsyncOperation<INDStartResult>} 
     */
    StartAsync(contentUrl, startAsyncOptions, registrationCustomData, licenseFetchDescriptor) {
        result := ComCall(16, this, "ptr", contentUrl, "uint", startAsyncOptions, "ptr", registrationCustomData, "ptr", licenseFetchDescriptor, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(INDStartResult, result_)
    }

    /**
     * 
     * @param {INDLicenseFetchDescriptor} licenseFetchDescriptor 
     * @returns {IAsyncOperation<INDLicenseFetchResult>} 
     */
    LicenseFetchAsync(licenseFetchDescriptor) {
        result := ComCall(17, this, "ptr", licenseFetchDescriptor, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(INDLicenseFetchResult, result_)
    }

    /**
     * 
     * @param {INDCustomData} registrationCustomData 
     * @returns {IAsyncAction} 
     */
    ReRegistrationAsync(registrationCustomData) {
        result := ComCall(18, this, "ptr", registrationCustomData, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * MSSQLSERVER_4064
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

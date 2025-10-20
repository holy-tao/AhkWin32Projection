#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that authorize connections and resources.
 * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nn-tsgpolicyengine-itsgpolicyengine
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITSGPolicyEngine extends IUnknown{
    /**
     * The interface identifier for ITSGPolicyEngine
     * @type {Guid}
     */
    static IID => Guid("{8bc24f08-6223-42f4-a5b4-8e37cd135bbd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} mainSessionId 
     * @param {BSTR} username 
     * @param {Integer} authType 
     * @param {BSTR} clientMachineIP 
     * @param {BSTR} clientMachineName 
     * @param {Pointer<Byte>} sohData 
     * @param {Integer} numSOHBytes 
     * @param {Pointer<Byte>} cookieData 
     * @param {Integer} numCookieBytes 
     * @param {HANDLE_PTR} userToken 
     * @param {Pointer<ITSGAuthorizeConnectionSink>} pSink 
     * @returns {HRESULT} 
     */
    AuthorizeConnection(mainSessionId, username, authType, clientMachineIP, clientMachineName, sohData, numSOHBytes, cookieData, numCookieBytes, userToken, pSink) {
        username := username is String ? BSTR.Alloc(username).Value : username
        clientMachineIP := clientMachineIP is String ? BSTR.Alloc(clientMachineIP).Value : clientMachineIP
        clientMachineName := clientMachineName is String ? BSTR.Alloc(clientMachineName).Value : clientMachineName

        result := ComCall(3, this, "ptr", mainSessionId, "ptr", username, "int", authType, "ptr", clientMachineIP, "ptr", clientMachineName, "char*", sohData, "uint", numSOHBytes, "char*", cookieData, "uint", numCookieBytes, "ptr", userToken, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} mainSessionId 
     * @param {Integer} subSessionId 
     * @param {BSTR} username 
     * @param {Pointer<BSTR>} resourceNames 
     * @param {Integer} numResources 
     * @param {Pointer<BSTR>} alternateResourceNames 
     * @param {Integer} numAlternateResourceName 
     * @param {Integer} portNumber 
     * @param {BSTR} operation 
     * @param {Pointer<Byte>} cookie 
     * @param {Integer} numBytesInCookie 
     * @param {Pointer<ITSGAuthorizeResourceSink>} pSink 
     * @returns {HRESULT} 
     */
    AuthorizeResource(mainSessionId, subSessionId, username, resourceNames, numResources, alternateResourceNames, numAlternateResourceName, portNumber, operation, cookie, numBytesInCookie, pSink) {
        username := username is String ? BSTR.Alloc(username).Value : username
        operation := operation is String ? BSTR.Alloc(operation).Value : operation

        result := ComCall(4, this, "ptr", mainSessionId, "int", subSessionId, "ptr", username, "ptr", resourceNames, "uint", numResources, "ptr", alternateResourceNames, "uint", numAlternateResourceName, "uint", portNumber, "ptr", operation, "char*", cookie, "uint", numBytesInCookie, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} quarantineEnabled 
     * @returns {HRESULT} 
     */
    IsQuarantineEnabled(quarantineEnabled) {
        result := ComCall(6, this, "ptr", quarantineEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

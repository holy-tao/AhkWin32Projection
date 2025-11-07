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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AuthorizeConnection", "AuthorizeResource", "Refresh", "IsQuarantineEnabled"]

    /**
     * 
     * @param {Guid} mainSessionId 
     * @param {BSTR} username 
     * @param {Integer} authType 
     * @param {BSTR} clientMachineIP 
     * @param {BSTR} clientMachineName 
     * @param {Pointer<Integer>} sohData 
     * @param {Integer} numSOHBytes 
     * @param {Pointer<Integer>} cookieData 
     * @param {Integer} numCookieBytes 
     * @param {HANDLE_PTR} userToken 
     * @param {ITSGAuthorizeConnectionSink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-authorizeconnection
     */
    AuthorizeConnection(mainSessionId, username, authType, clientMachineIP, clientMachineName, sohData, numSOHBytes, cookieData, numCookieBytes, userToken, pSink) {
        username := username is String ? BSTR.Alloc(username).Value : username
        clientMachineIP := clientMachineIP is String ? BSTR.Alloc(clientMachineIP).Value : clientMachineIP
        clientMachineName := clientMachineName is String ? BSTR.Alloc(clientMachineName).Value : clientMachineName

        sohDataMarshal := sohData is VarRef ? "char*" : "ptr"
        cookieDataMarshal := cookieData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", mainSessionId, "ptr", username, "int", authType, "ptr", clientMachineIP, "ptr", clientMachineName, sohDataMarshal, sohData, "uint", numSOHBytes, cookieDataMarshal, cookieData, "uint", numCookieBytes, "ptr", userToken, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} mainSessionId 
     * @param {Integer} subSessionId 
     * @param {BSTR} username 
     * @param {Pointer<BSTR>} resourceNames 
     * @param {Integer} numResources 
     * @param {Pointer<BSTR>} alternateResourceNames 
     * @param {Integer} numAlternateResourceName 
     * @param {Integer} portNumber 
     * @param {BSTR} operation 
     * @param {Pointer<Integer>} cookie 
     * @param {Integer} numBytesInCookie 
     * @param {ITSGAuthorizeResourceSink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-authorizeresource
     */
    AuthorizeResource(mainSessionId, subSessionId, username, resourceNames, numResources, alternateResourceNames, numAlternateResourceName, portNumber, operation, cookie, numBytesInCookie, pSink) {
        username := username is String ? BSTR.Alloc(username).Value : username
        operation := operation is String ? BSTR.Alloc(operation).Value : operation

        cookieMarshal := cookie is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", mainSessionId, "int", subSessionId, "ptr", username, "ptr", resourceNames, "uint", numResources, "ptr", alternateResourceNames, "uint", numAlternateResourceName, "uint", portNumber, "ptr", operation, cookieMarshal, cookie, "uint", numBytesInCookie, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-refresh
     */
    Refresh() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-isquarantineenabled
     */
    IsQuarantineEnabled() {
        result := ComCall(6, this, "int*", &quarantineEnabled := 0, "HRESULT")
        return quarantineEnabled
    }
}

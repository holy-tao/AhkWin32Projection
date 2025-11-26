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
     * Determines whether the specified connection is authorized to connect to Remote Desktop Gateway (RD Gateway).
     * @param {Guid} mainSessionId A unique identifier assigned to the connection request by RD Gateway.
     * @param {BSTR} username The user name.
     * @param {Integer} authType A value of the <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ne-tsgpolicyengine-aaauthschemes">AAAuthSchemes</a> enumeration type that specifies the type of authentication used to connect to RD Gateway.
     * @param {BSTR} clientMachineIP The IP address of the user's computer.
     * @param {BSTR} clientMachineName The name of the user's computer.
     * @param {Pointer<Integer>} sohData A pointer to a <b>BYTE</b> that contains the statement of health (SoH) provided by the user's computer. If the authorization plug-in does not require a statement of health, this parameter is <b>NULL</b>. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-isquarantineenabled">IsQuarantineEnabled</a> method.
     * @param {Integer} numSOHBytes The number of bytes referenced by the <i>sohData</i> parameter.
     * @param {Pointer<Integer>} cookieData A pointer to a <b>BYTE</b> that contains the cookie provided by the user. If the <b>authType</b> parameter is not set to <b>AA_AUTH_COOKIE</b>, this parameter is <b>NULL</b>.
     * @param {Integer} numCookieBytes The number of bytes referenced by the <i>cookieData</i> parameter.
     * @param {HANDLE_PTR} userToken A pointer to a <b>HANDLE</b> that specifies the user token of the user. If the user is not running Windows, this parameter is <b>NULL</b>.
     * @param {ITSGAuthorizeConnectionSink} pSink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/tsgpolicyengine/nn-tsgpolicyengine-itsgauthorizeconnectionsink">ITSGAuthorizeConnectionSink</a> interface that the authorization plug-in must use to notify RD Gateway about the result of authorization.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-authorizeconnection
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
     * Determines which resources the specified connection is authorized to connect to.
     * @param {Guid} mainSessionId A unique identifier assigned to the connection request by RD Gateway.
     * @param {Integer} subSessionId A unique identifier assigned to the subsession by RD Gateway. A subsession is a session launched from another session.
     * @param {BSTR} username The user name.
     * @param {Pointer<BSTR>} resourceNames A list of resources to authorize.
     * @param {Integer} numResources The number of resources referenced by the <i>resourceNames</i> parameter.
     * @param {Pointer<BSTR>} alternateResourceNames A pointer to a <b>BSTR</b> that contains a list of alternate resource names. This parameter is only valid when RD Connection Broker is in use.
     * @param {Integer} numAlternateResourceName The number of alternate resource names referenced by the <i>alternateResourceNames</i> parameter.
     * @param {Integer} portNumber The port number specified by the user.
     * @param {BSTR} operation The operation that the user is attempting on the resource. This parameter is always set to "RDP".
     * @param {Pointer<Integer>} cookie A pointer to a <b>BYTE</b> that contains the cookie provided by the user. If the user did not authenticate by using a cookie, this parameter is <b>NULL</b>.
     * @param {Integer} numBytesInCookie The number of bytes referenced by the <i>cookie</i> parameter.
     * @param {ITSGAuthorizeResourceSink} pSink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/tsgpolicyengine/nn-tsgpolicyengine-itsgauthorizeresourcesink">ITSGAuthorizeResourceSink</a> interface that the authorization plug-in must use to notify RD Gateway about the result of authorization.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-authorizeresource
     */
    AuthorizeResource(mainSessionId, subSessionId, username, resourceNames, numResources, alternateResourceNames, numAlternateResourceName, portNumber, operation, cookie, numBytesInCookie, pSink) {
        username := username is String ? BSTR.Alloc(username).Value : username
        operation := operation is String ? BSTR.Alloc(operation).Value : operation

        cookieMarshal := cookie is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", mainSessionId, "int", subSessionId, "ptr", username, "ptr", resourceNames, "uint", numResources, "ptr", alternateResourceNames, "uint", numAlternateResourceName, "uint", portNumber, "ptr", operation, cookieMarshal, cookie, "uint", numBytesInCookie, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * This method is reserved.
     * @returns {HRESULT} Always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-refresh
     */
    Refresh() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether the authorization plug-in requires a statement of health (SoH) from the user's computer.
     * @returns {BOOL} Indicates whether the authorization plug-in requires a statement of health from the user's computer. <b>TRUE</b> to use RD Gateway to request an SoH from the user's computer; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-isquarantineenabled
     */
    IsQuarantineEnabled() {
        result := ComCall(6, this, "int*", &quarantineEnabled := 0, "HRESULT")
        return quarantineEnabled
    }
}

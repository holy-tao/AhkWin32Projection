#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that notify Remote Desktop Gateway (RD Gateway) about the result of an attempt to authorize a connection.
 * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nn-tsgpolicyengine-itsgauthorizeconnectionsink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITSGAuthorizeConnectionSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITSGAuthorizeConnectionSink
     * @type {Guid}
     */
    static IID => Guid("{c27ece33-7781-4318-98ef-1cf2da7b7005}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnConnectionAuthorized"]

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) about the result of an attempt to authorize a connection.
     * @param {HRESULT} hrIn The result of the authorization attempt. Specify <b>S_OK</b> to indicate that the attempt succeeded. Specify any other value to indicate that the attempt failed.
     * @param {Guid} mainSessionId A unique identifier assigned to the connection request by RD Gateway.
     * @param {Integer} cbSoHResponse The number of bytes referenced by the  <i>pbSoHResponse</i> parameter.
     * @param {Pointer<Integer>} pbSoHResponse A pointer to a <b>BYTE</b> that specifies the response to the request for a statement of health (SoH). If the <i>hrIn</i> parameter is not <b>S_OK</b>, this parameter is ignored.
     * @param {Integer} idleTimeout The number of minutes that the connection can remain idle before being disconnected. If the <i>hrIn</i> parameter is not <b>S_OK</b>, this parameter is ignored.
     * @param {Integer} sessionTimeout The maximum number of minutes allotted to the session. If the <i>hrIn</i> parameter is not <b>S_OK</b>, this parameter is ignored.
     * @param {Integer} sessionTimeoutAction 
     * @param {Integer} trustClass This parameter is reserved. Always set it to  <b>AA_TRUSTEDUSER_TRUSTEDCLIENT</b>. If the <i>hrIn</i> parameter is not <b>S_OK</b>, this parameter is ignored.
     * @param {Pointer<Integer>} policyAttributes An array of Boolean values  that specify the redirection settings associated with the connection. Each element of the array corresponds to a value of the <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ne-tsgpolicyengine-policyattributetype">PolicyAttributeType</a> enumeration. If the <i>hrIn</i> parameter is not <b>S_OK</b>, this parameter is ignored.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nf-tsgpolicyengine-itsgauthorizeconnectionsink-onconnectionauthorized
     */
    OnConnectionAuthorized(hrIn, mainSessionId, cbSoHResponse, pbSoHResponse, idleTimeout, sessionTimeout, sessionTimeoutAction, trustClass, policyAttributes) {
        pbSoHResponseMarshal := pbSoHResponse is VarRef ? "char*" : "ptr"
        policyAttributesMarshal := policyAttributes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "int", hrIn, "ptr", mainSessionId, "uint", cbSoHResponse, pbSoHResponseMarshal, pbSoHResponse, "uint", idleTimeout, "uint", sessionTimeout, "int", sessionTimeoutAction, "int", trustClass, policyAttributesMarshal, policyAttributes, "HRESULT")
        return result
    }
}

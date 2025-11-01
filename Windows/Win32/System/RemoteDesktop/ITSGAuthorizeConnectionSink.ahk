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
     * 
     * @param {HRESULT} hrIn 
     * @param {Guid} mainSessionId 
     * @param {Integer} cbSoHResponse 
     * @param {Pointer<Integer>} pbSoHResponse 
     * @param {Integer} idleTimeout 
     * @param {Integer} sessionTimeout 
     * @param {Integer} sessionTimeoutAction 
     * @param {Integer} trustClass 
     * @param {Pointer<Integer>} policyAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nf-tsgpolicyengine-itsgauthorizeconnectionsink-onconnectionauthorized
     */
    OnConnectionAuthorized(hrIn, mainSessionId, cbSoHResponse, pbSoHResponse, idleTimeout, sessionTimeout, sessionTimeoutAction, trustClass, policyAttributes) {
        pbSoHResponseMarshal := pbSoHResponse is VarRef ? "char*" : "ptr"
        policyAttributesMarshal := policyAttributes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "int", hrIn, "ptr", mainSessionId, "uint", cbSoHResponse, pbSoHResponseMarshal, pbSoHResponse, "uint", idleTimeout, "uint", sessionTimeout, "int", sessionTimeoutAction, "int", trustClass, policyAttributesMarshal, policyAttributes, "HRESULT")
        return result
    }
}

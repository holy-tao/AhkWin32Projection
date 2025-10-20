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
     * 
     * @param {HRESULT} hrIn 
     * @param {Pointer<Guid>} mainSessionId 
     * @param {Integer} cbSoHResponse 
     * @param {Pointer<Byte>} pbSoHResponse 
     * @param {Integer} idleTimeout 
     * @param {Integer} sessionTimeout 
     * @param {Integer} sessionTimeoutAction 
     * @param {Integer} trustClass 
     * @param {Pointer<UInt32>} policyAttributes 
     * @returns {HRESULT} 
     */
    OnConnectionAuthorized(hrIn, mainSessionId, cbSoHResponse, pbSoHResponse, idleTimeout, sessionTimeout, sessionTimeoutAction, trustClass, policyAttributes) {
        result := ComCall(3, this, "int", hrIn, "ptr", mainSessionId, "uint", cbSoHResponse, "char*", pbSoHResponse, "uint", idleTimeout, "uint", sessionTimeout, "int", sessionTimeoutAction, "int", trustClass, "uint*", policyAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

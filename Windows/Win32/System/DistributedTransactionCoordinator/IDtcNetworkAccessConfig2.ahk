#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDtcNetworkAccessConfig.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcNetworkAccessConfig2 extends IDtcNetworkAccessConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcNetworkAccessConfig2
     * @type {Guid}
     */
    static IID => Guid("{a7aa013b-eb7d-4f42-b41c-b2dec09ae034}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNetworkInboundAccess", "GetNetworkOutboundAccess", "SetNetworkInboundAccess", "SetNetworkOutboundAccess", "GetAuthenticationLevel", "SetAuthenticationLevel"]

    /**
     * 
     * @param {Pointer<BOOL>} pbInbound 
     * @returns {HRESULT} 
     */
    GetNetworkInboundAccess(pbInbound) {
        result := ComCall(16, this, "ptr", pbInbound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbOutbound 
     * @returns {HRESULT} 
     */
    GetNetworkOutboundAccess(pbOutbound) {
        result := ComCall(17, this, "ptr", pbOutbound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bInbound 
     * @returns {HRESULT} 
     */
    SetNetworkInboundAccess(bInbound) {
        result := ComCall(18, this, "int", bInbound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bOutbound 
     * @returns {HRESULT} 
     */
    SetNetworkOutboundAccess(bOutbound) {
        result := ComCall(19, this, "int", bOutbound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAuthLevel 
     * @returns {HRESULT} 
     */
    GetAuthenticationLevel(pAuthLevel) {
        pAuthLevelMarshal := pAuthLevel is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pAuthLevelMarshal, pAuthLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AuthLevel 
     * @returns {HRESULT} 
     */
    SetAuthenticationLevel(AuthLevel) {
        result := ComCall(21, this, "int", AuthLevel, "HRESULT")
        return result
    }
}

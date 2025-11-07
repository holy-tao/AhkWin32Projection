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
     * @returns {BOOL} 
     */
    GetNetworkInboundAccess() {
        result := ComCall(16, this, "int*", &pbInbound := 0, "HRESULT")
        return pbInbound
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkOutboundAccess() {
        result := ComCall(17, this, "int*", &pbOutbound := 0, "HRESULT")
        return pbOutbound
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
     * @returns {Integer} 
     */
    GetAuthenticationLevel() {
        result := ComCall(20, this, "int*", &pAuthLevel := 0, "HRESULT")
        return pAuthLevel
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

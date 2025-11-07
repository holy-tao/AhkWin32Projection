#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcNetworkAccessConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcNetworkAccessConfig
     * @type {Guid}
     */
    static IID => Guid("{9797c15d-a428-4291-87b6-0995031a678d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAnyNetworkAccess", "SetAnyNetworkAccess", "GetNetworkAdministrationAccess", "SetNetworkAdministrationAccess", "GetNetworkTransactionAccess", "SetNetworkTransactionAccess", "GetNetworkClientAccess", "SetNetworkClientAccess", "GetNetworkTIPAccess", "SetNetworkTIPAccess", "GetXAAccess", "SetXAAccess", "RestartDtcService"]

    /**
     * 
     * @returns {BOOL} 
     */
    GetAnyNetworkAccess() {
        result := ComCall(3, this, "int*", &pbAnyNetworkAccess := 0, "HRESULT")
        return pbAnyNetworkAccess
    }

    /**
     * 
     * @param {BOOL} bAnyNetworkAccess 
     * @returns {HRESULT} 
     */
    SetAnyNetworkAccess(bAnyNetworkAccess) {
        result := ComCall(4, this, "int", bAnyNetworkAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkAdministrationAccess() {
        result := ComCall(5, this, "int*", &pbNetworkAdministrationAccess := 0, "HRESULT")
        return pbNetworkAdministrationAccess
    }

    /**
     * 
     * @param {BOOL} bNetworkAdministrationAccess 
     * @returns {HRESULT} 
     */
    SetNetworkAdministrationAccess(bNetworkAdministrationAccess) {
        result := ComCall(6, this, "int", bNetworkAdministrationAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkTransactionAccess() {
        result := ComCall(7, this, "int*", &pbNetworkTransactionAccess := 0, "HRESULT")
        return pbNetworkTransactionAccess
    }

    /**
     * 
     * @param {BOOL} bNetworkTransactionAccess 
     * @returns {HRESULT} 
     */
    SetNetworkTransactionAccess(bNetworkTransactionAccess) {
        result := ComCall(8, this, "int", bNetworkTransactionAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkClientAccess() {
        result := ComCall(9, this, "int*", &pbNetworkClientAccess := 0, "HRESULT")
        return pbNetworkClientAccess
    }

    /**
     * 
     * @param {BOOL} bNetworkClientAccess 
     * @returns {HRESULT} 
     */
    SetNetworkClientAccess(bNetworkClientAccess) {
        result := ComCall(10, this, "int", bNetworkClientAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetNetworkTIPAccess() {
        result := ComCall(11, this, "int*", &pbNetworkTIPAccess := 0, "HRESULT")
        return pbNetworkTIPAccess
    }

    /**
     * 
     * @param {BOOL} bNetworkTIPAccess 
     * @returns {HRESULT} 
     */
    SetNetworkTIPAccess(bNetworkTIPAccess) {
        result := ComCall(12, this, "int", bNetworkTIPAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetXAAccess() {
        result := ComCall(13, this, "int*", &pbXAAccess := 0, "HRESULT")
        return pbXAAccess
    }

    /**
     * 
     * @param {BOOL} bXAAccess 
     * @returns {HRESULT} 
     */
    SetXAAccess(bXAAccess) {
        result := ComCall(14, this, "int", bXAAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestartDtcService() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}

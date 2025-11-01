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
     * @param {Pointer<BOOL>} pbAnyNetworkAccess 
     * @returns {HRESULT} 
     */
    GetAnyNetworkAccess(pbAnyNetworkAccess) {
        result := ComCall(3, this, "ptr", pbAnyNetworkAccess, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbNetworkAdministrationAccess 
     * @returns {HRESULT} 
     */
    GetNetworkAdministrationAccess(pbNetworkAdministrationAccess) {
        result := ComCall(5, this, "ptr", pbNetworkAdministrationAccess, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbNetworkTransactionAccess 
     * @returns {HRESULT} 
     */
    GetNetworkTransactionAccess(pbNetworkTransactionAccess) {
        result := ComCall(7, this, "ptr", pbNetworkTransactionAccess, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbNetworkClientAccess 
     * @returns {HRESULT} 
     */
    GetNetworkClientAccess(pbNetworkClientAccess) {
        result := ComCall(9, this, "ptr", pbNetworkClientAccess, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbNetworkTIPAccess 
     * @returns {HRESULT} 
     */
    GetNetworkTIPAccess(pbNetworkTIPAccess) {
        result := ComCall(11, this, "ptr", pbNetworkTIPAccess, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbXAAccess 
     * @returns {HRESULT} 
     */
    GetXAAccess(pbXAAccess) {
        result := ComCall(13, this, "ptr", pbXAAccess, "HRESULT")
        return result
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

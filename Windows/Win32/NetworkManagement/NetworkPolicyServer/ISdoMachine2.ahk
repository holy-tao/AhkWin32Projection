#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\ISdoMachine.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdoMachine2 extends ISdoMachine{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISdoMachine2
     * @type {Guid}
     */
    static IID => Guid("{518e5ffe-d8ce-4f7e-a5db-b40a35419d3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTemplatesSDO", "EnableTemplates", "SyncConfigAgainstTemplates", "ImportRemoteTemplates", "Reload"]

    /**
     * 
     * @param {BSTR} bstrServiceName 
     * @returns {IUnknown} 
     */
    GetTemplatesSDO(bstrServiceName) {
        bstrServiceName := bstrServiceName is String ? BSTR.Alloc(bstrServiceName).Value : bstrServiceName

        result := ComCall(16, this, "ptr", bstrServiceName, "ptr*", &ppTemplatesSDO := 0, "HRESULT")
        return IUnknown(ppTemplatesSDO)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableTemplates() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServiceName 
     * @param {Pointer<IUnknown>} ppConfigRoot 
     * @param {Pointer<IUnknown>} ppTemplatesRoot 
     * @param {VARIANT_BOOL} bForcedSync 
     * @returns {HRESULT} 
     */
    SyncConfigAgainstTemplates(bstrServiceName, ppConfigRoot, ppTemplatesRoot, bForcedSync) {
        bstrServiceName := bstrServiceName is String ? BSTR.Alloc(bstrServiceName).Value : bstrServiceName

        result := ComCall(18, this, "ptr", bstrServiceName, "ptr*", ppConfigRoot, "ptr*", ppTemplatesRoot, "short", bForcedSync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pLocalTemplatesRoot 
     * @param {BSTR} bstrRemoteMachineName 
     * @returns {HRESULT} 
     */
    ImportRemoteTemplates(pLocalTemplatesRoot, bstrRemoteMachineName) {
        bstrRemoteMachineName := bstrRemoteMachineName is String ? BSTR.Alloc(bstrRemoteMachineName).Value : bstrRemoteMachineName

        result := ComCall(19, this, "ptr", pLocalTemplatesRoot, "ptr", bstrRemoteMachineName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reload() {
        result := ComCall(20, this, "HRESULT")
        return result
    }
}

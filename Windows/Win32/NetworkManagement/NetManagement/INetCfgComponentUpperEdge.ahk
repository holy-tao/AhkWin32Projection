#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentUpperEdge extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponentUpperEdge
     * @type {Guid}
     */
    static IID => Guid("{932238e4-bea1-11d0-9298-00c04fc99dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInterfaceIdsForAdapter", "AddInterfacesToAdapter", "RemoveInterfacesFromAdapter"]

    /**
     * 
     * @param {INetCfgComponent} pAdapter 
     * @param {Pointer<Integer>} pdwNumInterfaces 
     * @param {Pointer<Pointer<Guid>>} ppguidInterfaceIds 
     * @returns {HRESULT} 
     */
    GetInterfaceIdsForAdapter(pAdapter, pdwNumInterfaces, ppguidInterfaceIds) {
        pdwNumInterfacesMarshal := pdwNumInterfaces is VarRef ? "uint*" : "ptr"
        ppguidInterfaceIdsMarshal := ppguidInterfaceIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pAdapter, pdwNumInterfacesMarshal, pdwNumInterfaces, ppguidInterfaceIdsMarshal, ppguidInterfaceIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pAdapter 
     * @param {Integer} dwNumInterfaces 
     * @returns {HRESULT} 
     */
    AddInterfacesToAdapter(pAdapter, dwNumInterfaces) {
        result := ComCall(4, this, "ptr", pAdapter, "uint", dwNumInterfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pAdapter 
     * @param {Integer} dwNumInterfaces 
     * @param {Pointer<Guid>} pguidInterfaceIds 
     * @returns {HRESULT} 
     */
    RemoveInterfacesFromAdapter(pAdapter, dwNumInterfaces, pguidInterfaceIds) {
        result := ComCall(5, this, "ptr", pAdapter, "uint", dwNumInterfaces, "ptr", pguidInterfaceIds, "HRESULT")
        return result
    }
}

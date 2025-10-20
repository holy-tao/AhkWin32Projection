#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentUpperEdge extends IUnknown{
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
     * 
     * @param {Pointer<INetCfgComponent>} pAdapter 
     * @param {Pointer<UInt32>} pdwNumInterfaces 
     * @param {Pointer<Guid>} ppguidInterfaceIds 
     * @returns {HRESULT} 
     */
    GetInterfaceIdsForAdapter(pAdapter, pdwNumInterfaces, ppguidInterfaceIds) {
        result := ComCall(3, this, "ptr", pAdapter, "uint*", pdwNumInterfaces, "ptr", ppguidInterfaceIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetCfgComponent>} pAdapter 
     * @param {Integer} dwNumInterfaces 
     * @returns {HRESULT} 
     */
    AddInterfacesToAdapter(pAdapter, dwNumInterfaces) {
        result := ComCall(4, this, "ptr", pAdapter, "uint", dwNumInterfaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetCfgComponent>} pAdapter 
     * @param {Integer} dwNumInterfaces 
     * @param {Pointer<Guid>} pguidInterfaceIds 
     * @returns {HRESULT} 
     */
    RemoveInterfacesFromAdapter(pAdapter, dwNumInterfaces, pguidInterfaceIds) {
        result := ComCall(5, this, "ptr", pAdapter, "uint", dwNumInterfaces, "ptr", pguidInterfaceIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

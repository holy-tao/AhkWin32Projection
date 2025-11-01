#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * To query current network cost and data plan status associated with a connection.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkconnectioncost
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkConnectionCost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkConnectionCost
     * @type {Guid}
     */
    static IID => Guid("{dcb0000a-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCost", "GetDataPlanStatus"]

    /**
     * 
     * @param {Pointer<Integer>} pCost 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnectioncost-getcost
     */
    GetCost(pCost) {
        pCostMarshal := pCost is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCostMarshal, pCost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<NLM_DATAPLAN_STATUS>} pDataPlanStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnectioncost-getdataplanstatus
     */
    GetDataPlanStatus(pDataPlanStatus) {
        result := ComCall(4, this, "ptr", pDataPlanStatus, "HRESULT")
        return result
    }
}

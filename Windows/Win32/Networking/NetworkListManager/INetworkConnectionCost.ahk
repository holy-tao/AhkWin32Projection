#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NLM_DATAPLAN_STATUS.ahk
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
     * GetCost method retrieves the network cost associated with a connection.
     * @returns {Integer} A DWORD value that represents the network cost of the connection. The lowest 16 bits represent the cost level and the highest 16 bits represent the cost flags. Possible values are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_cost">NLM_CONNECTION_COST</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnectioncost-getcost
     */
    GetCost() {
        result := ComCall(3, this, "uint*", &pCost := 0, "HRESULT")
        return pCost
    }

    /**
     * GetDataPlanStatus method retrieves the status of the data plan associated with a connection.
     * @returns {NLM_DATAPLAN_STATUS} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_dataplan_status">NLM_DATAPLAN_STATUS</a> structure that describes the status of the data plan associated with the connection. The caller supplies the memory of this structure.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnectioncost-getdataplanstatus
     */
    GetDataPlanStatus() {
        pDataPlanStatus := NLM_DATAPLAN_STATUS()
        result := ComCall(4, this, "ptr", pDataPlanStatus, "HRESULT")
        return pDataPlanStatus
    }
}

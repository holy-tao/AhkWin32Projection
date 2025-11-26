#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface to notify an application of machine-wide cost and data plan related events.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkcostmanagerevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkCostManagerEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkCostManagerEvents
     * @type {Guid}
     */
    static IID => Guid("{dcb00009-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CostChanged", "DataPlanStatusChanged"]

    /**
     * CostChanged method is called to indicates a cost change for either machine-wide Internet connectivity, or the first-hop of routing to a specific destination on a connection.
     * @param {Integer} newCost A DWORD that represents the new cost of the connection. The lowest 16 bits represent the cost level, and the highest 16 bits represent the flags. Possible values are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_cost">NLM_CONNECTION_COST</a> enumeration.
     * @param {Pointer<NLM_SOCKADDR>} pDestAddr An <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_sockaddr">NLM_SOCKADDR</a> structure containing an IPv4/IPv6 address that identifies the destination on which the event occurred. If <i>destAddr</i> is NULL, the change is a machine-wide Internet connectivity change.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkcostmanagerevents-costchanged
     */
    CostChanged(newCost, pDestAddr) {
        result := ComCall(3, this, "uint", newCost, "ptr", pDestAddr, "HRESULT")
        return result
    }

    /**
     * DataPlanStatusChanged method is called to indicate a change to the status of a data plan associated with either a connection used for machine-wide Internet connectivity, or the first-hop of routing to a specific destination on a connection.
     * @param {Pointer<NLM_SOCKADDR>} pDestAddr An <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_sockaddr">NLM_SOCKADDR</a> structure containing an IPv4/IPv6 address that identifies the destination for which the event occurred. If <i>destAddr</i> is NULL, the change is a machine-wide Internet connectivity change.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkcostmanagerevents-dataplanstatuschanged
     */
    DataPlanStatusChanged(pDestAddr) {
        result := ComCall(4, this, "ptr", pDestAddr, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface to notify an application of cost and data plan status change events for a connection.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkconnectioncostevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkConnectionCostEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkConnectionCostEvents
     * @type {Guid}
     */
    static IID => Guid("{dcb0000b-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectionCostChanged", "ConnectionDataPlanStatusChanged"]

    /**
     * ConnectionCostChanged method notifies an application of a network cost change for a connection.
     * @param {Guid} connectionId A unique ID  that identifies the connection on which the cost change event occurred.
     * @param {Integer} newCost A DWORD value that represents the new cost of the connection. The lowest 16 bits represent the cost level, and the highest 16 bits represent the flags. Possible values are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_cost">NLM_CONNECTION_COST</a> enumeration.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnectioncostevents-connectioncostchanged
     */
    ConnectionCostChanged(connectionId, newCost) {
        result := ComCall(3, this, "ptr", connectionId, "uint", newCost, "HRESULT")
        return result
    }

    /**
     * ConnectionDataPlanStatusChanged method notifies an application of a data plan status change on a connection.
     * @param {Guid} connectionId A unique ID that identifies the connection on which the data plan status change event occurred.
     * @returns {HRESULT} This method returns  S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnectioncostevents-connectiondataplanstatuschanged
     */
    ConnectionDataPlanStatusChanged(connectionId) {
        result := ComCall(4, this, "ptr", connectionId, "HRESULT")
        return result
    }
}

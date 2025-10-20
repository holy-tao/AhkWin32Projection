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
     * 
     * @param {Pointer<UInt32>} pCost 
     * @returns {HRESULT} 
     */
    GetCost(pCost) {
        result := ComCall(3, this, "uint*", pCost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<NLM_DATAPLAN_STATUS>} pDataPlanStatus 
     * @returns {HRESULT} 
     */
    GetDataPlanStatus(pDataPlanStatus) {
        result := ComCall(4, this, "ptr", pDataPlanStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

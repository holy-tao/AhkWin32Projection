#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to query for machine-wide cost and data plan status information associated with either a connection used for machine-wide Internet connectivity, or the first-hop of routing to a specific destination on a connection.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkcostmanager
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkCostManager extends IUnknown{
    /**
     * The interface identifier for INetworkCostManager
     * @type {Guid}
     */
    static IID => Guid("{dcb00008-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pCost 
     * @param {Pointer<NLM_SOCKADDR>} pDestIPAddr 
     * @returns {HRESULT} 
     */
    GetCost(pCost, pDestIPAddr) {
        result := ComCall(3, this, "uint*", pCost, "ptr", pDestIPAddr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<NLM_DATAPLAN_STATUS>} pDataPlanStatus 
     * @param {Pointer<NLM_SOCKADDR>} pDestIPAddr 
     * @returns {HRESULT} 
     */
    GetDataPlanStatus(pDataPlanStatus, pDestIPAddr) {
        result := ComCall(4, this, "ptr", pDataPlanStatus, "ptr", pDestIPAddr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} length 
     * @param {Pointer<NLM_SOCKADDR>} pDestIPAddrList 
     * @param {VARIANT_BOOL} bAppend 
     * @returns {HRESULT} 
     */
    SetDestinationAddresses(length, pDestIPAddrList, bAppend) {
        result := ComCall(5, this, "uint", length, "ptr", pDestIPAddrList, "short", bAppend, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

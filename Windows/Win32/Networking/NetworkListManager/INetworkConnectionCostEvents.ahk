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
     * 
     * @param {Pointer<Guid>} connectionId 
     * @param {Integer} newCost 
     * @returns {HRESULT} 
     */
    ConnectionCostChanged(connectionId, newCost) {
        result := ComCall(3, this, "ptr", connectionId, "uint", newCost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} connectionId 
     * @returns {HRESULT} 
     */
    ConnectionDataPlanStatusChanged(connectionId) {
        result := ComCall(4, this, "ptr", connectionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

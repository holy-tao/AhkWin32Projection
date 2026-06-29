#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface to notify an application of cost and data plan status change events for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworkconnectioncostevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct INetworkConnectionCostEvents extends IUnknown {
    /**
     * The interface identifier for INetworkConnectionCostEvents
     * @type {Guid}
     */
    static IID := Guid("{dcb0000b-570f-4a9b-8d69-199fdba5723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkConnectionCostEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConnectionCostChanged           : IntPtr
        ConnectionDataPlanStatusChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkConnectionCostEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ConnectionCostChanged method notifies an application of a network cost change for a connection.
     * @param {Guid} connectionId A unique ID  that identifies the connection on which the cost change event occurred.
     * @param {Integer} newCost A DWORD value that represents the new cost of the connection. The lowest 16 bits represent the cost level, and the highest 16 bits represent the flags. Possible values are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_cost">NLM_CONNECTION_COST</a> enumeration.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnectioncostevents-connectioncostchanged
     */
    ConnectionCostChanged(connectionId, newCost) {
        result := ComCall(3, this, Guid, connectionId, "uint", newCost, "HRESULT")
        return result
    }

    /**
     * ConnectionDataPlanStatusChanged method notifies an application of a data plan status change on a connection.
     * @param {Guid} connectionId A unique ID that identifies the connection on which the data plan status change event occurred.
     * @returns {HRESULT} This method returns  S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnectioncostevents-connectiondataplanstatuschanged
     */
    ConnectionDataPlanStatusChanged(connectionId) {
        result := ComCall(4, this, Guid, connectionId, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetworkConnectionCostEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectionCostChanged := CallbackCreate(GetMethod(implObj, "ConnectionCostChanged"), flags, 3)
        this.vtbl.ConnectionDataPlanStatusChanged := CallbackCreate(GetMethod(implObj, "ConnectionDataPlanStatusChanged"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectionCostChanged)
        CallbackFree(this.vtbl.ConnectionDataPlanStatusChanged)
    }
}

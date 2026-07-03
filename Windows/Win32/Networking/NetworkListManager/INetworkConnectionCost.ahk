#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NLM_DATAPLAN_STATUS.ahk" { NLM_DATAPLAN_STATUS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * To query current network cost and data plan status associated with a connection.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworkconnectioncost
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct INetworkConnectionCost extends IUnknown {
    /**
     * The interface identifier for INetworkConnectionCost
     * @type {Guid}
     */
    static IID := Guid("{dcb0000a-570f-4a9b-8d69-199fdba5723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkConnectionCost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCost           : IntPtr
        GetDataPlanStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkConnectionCost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * GetCost method retrieves the network cost associated with a connection.
     * @returns {Integer} A DWORD value that represents the network cost of the connection. The lowest 16 bits represent the cost level and the highest 16 bits represent the cost flags. Possible values are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_cost">NLM_CONNECTION_COST</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnectioncost-getcost
     */
    GetCost() {
        result := ComCall(3, this, "uint*", &pCost := 0, "HRESULT")
        return pCost
    }

    /**
     * GetDataPlanStatus method retrieves the status of the data plan associated with a connection.
     * @returns {NLM_DATAPLAN_STATUS} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_dataplan_status">NLM_DATAPLAN_STATUS</a> structure that describes the status of the data plan associated with the connection. The caller supplies the memory of this structure.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnectioncost-getdataplanstatus
     */
    GetDataPlanStatus() {
        pDataPlanStatus := NLM_DATAPLAN_STATUS()
        result := ComCall(4, this, NLM_DATAPLAN_STATUS.Ptr, pDataPlanStatus, "HRESULT")
        return pDataPlanStatus
    }

    Query(iid) {
        if (INetworkConnectionCost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCost := CallbackCreate(GetMethod(implObj, "GetCost"), flags, 2)
        this.vtbl.GetDataPlanStatus := CallbackCreate(GetMethod(implObj, "GetDataPlanStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCost)
        CallbackFree(this.vtbl.GetDataPlanStatus)
    }
}

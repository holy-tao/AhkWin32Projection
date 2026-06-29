#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\NLM_SOCKADDR.ahk" { NLM_SOCKADDR }

/**
 * This interface to notify an application of machine-wide cost and data plan related events.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworkcostmanagerevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct INetworkCostManagerEvents extends IUnknown {
    /**
     * The interface identifier for INetworkCostManagerEvents
     * @type {Guid}
     */
    static IID := Guid("{dcb00009-570f-4a9b-8d69-199fdba5723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkCostManagerEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CostChanged           : IntPtr
        DataPlanStatusChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkCostManagerEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * CostChanged method is called to indicates a cost change for either machine-wide Internet connectivity, or the first-hop of routing to a specific destination on a connection.
     * @param {Integer} newCost A DWORD that represents the new cost of the connection. The lowest 16 bits represent the cost level, and the highest 16 bits represent the flags. Possible values are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_cost">NLM_CONNECTION_COST</a> enumeration.
     * @param {Pointer<NLM_SOCKADDR>} pDestAddr An <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_sockaddr">NLM_SOCKADDR</a> structure containing an IPv4/IPv6 address that identifies the destination on which the event occurred. If <i>destAddr</i> is NULL, the change is a machine-wide Internet connectivity change.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkcostmanagerevents-costchanged
     */
    CostChanged(newCost, pDestAddr) {
        result := ComCall(3, this, "uint", newCost, NLM_SOCKADDR.Ptr, pDestAddr, "HRESULT")
        return result
    }

    /**
     * DataPlanStatusChanged method is called to indicate a change to the status of a data plan associated with either a connection used for machine-wide Internet connectivity, or the first-hop of routing to a specific destination on a connection.
     * @param {Pointer<NLM_SOCKADDR>} pDestAddr An <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_sockaddr">NLM_SOCKADDR</a> structure containing an IPv4/IPv6 address that identifies the destination for which the event occurred. If <i>destAddr</i> is NULL, the change is a machine-wide Internet connectivity change.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkcostmanagerevents-dataplanstatuschanged
     */
    DataPlanStatusChanged(pDestAddr) {
        result := ComCall(4, this, NLM_SOCKADDR.Ptr, pDestAddr, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetworkCostManagerEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CostChanged := CallbackCreate(GetMethod(implObj, "CostChanged"), flags, 3)
        this.vtbl.DataPlanStatusChanged := CallbackCreate(GetMethod(implObj, "DataPlanStatusChanged"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CostChanged)
        CallbackFree(this.vtbl.DataPlanStatusChanged)
    }
}

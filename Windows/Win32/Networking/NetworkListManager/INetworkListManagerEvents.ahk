#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NLM_CONNECTIVITY.ahk" { NLM_CONNECTIVITY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * INetworkListManagerEvents is a message sink interface that a client implements to get overall machine state related events. Applications that are interested on higher-level events, for example internet connectivity, implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworklistmanagerevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct INetworkListManagerEvents extends IUnknown {
    /**
     * The interface identifier for INetworkListManagerEvents
     * @type {Guid}
     */
    static IID := Guid("{dcb00001-570f-4a9b-8d69-199fdba5723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkListManagerEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConnectivityChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkListManagerEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The NetworkConnectivityChanged method is called when network connectivity related changes occur. (INetworkListManagerEvents.ConnectivityChanged)
     * @param {NLM_CONNECTIVITY} newConnectivity An <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connectivity">NLM_CONNECTIVITY</a> enumeration value that contains the new connectivity settings of the machine.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanagerevents-connectivitychanged
     */
    ConnectivityChanged(newConnectivity) {
        result := ComCall(3, this, NLM_CONNECTIVITY, newConnectivity, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetworkListManagerEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectivityChanged := CallbackCreate(GetMethod(implObj, "ConnectivityChanged"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectivityChanged)
    }
}

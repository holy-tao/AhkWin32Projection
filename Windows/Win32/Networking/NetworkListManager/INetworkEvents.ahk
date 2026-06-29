#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NLM_CONNECTIVITY.ahk" { NLM_CONNECTIVITY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\NLM_NETWORK_PROPERTY_CHANGE.ahk" { NLM_NETWORK_PROPERTY_CHANGE }

/**
 * INetworkEvents is a notification sink interface that a client implements to get network related events. These APIs are all callback functions that are called automatically when the respective events are raised.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworkevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct INetworkEvents extends IUnknown {
    /**
     * The interface identifier for INetworkEvents
     * @type {Guid}
     */
    static IID := Guid("{dcb00004-570f-4a9b-8d69-199fdba5723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NetworkAdded               : IntPtr
        NetworkDeleted             : IntPtr
        NetworkConnectivityChanged : IntPtr
        NetworkPropertyChanged     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The NetworkAdded method is called when a new network is added. The GUID of the new network is provided.
     * @param {Guid} networkId A <b>GUID</b> that specifies the new network that was added.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkevents-networkadded
     */
    NetworkAdded(networkId) {
        result := ComCall(3, this, Guid, networkId, "HRESULT")
        return result
    }

    /**
     * The NetworkDeleted method is called when a network is deleted.
     * @param {Guid} networkId GUID that contains the network ID of the network that was deleted.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkevents-networkdeleted
     */
    NetworkDeleted(networkId) {
        result := ComCall(4, this, Guid, networkId, "HRESULT")
        return result
    }

    /**
     * The NetworkConnectivityChanged method is called when network connectivity related changes occur. (INetworkEvents.NetworkConnectivityChanged)
     * @param {Guid} networkId A <b>GUID</b> that specifies the new network that was added.
     * @param {NLM_CONNECTIVITY} newConnectivity <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connectivity">NLM_CONNECTIVITY</a> enumeration value that contains the new connectivity of this network.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkevents-networkconnectivitychanged
     */
    NetworkConnectivityChanged(networkId, newConnectivity) {
        result := ComCall(5, this, Guid, networkId, NLM_CONNECTIVITY, newConnectivity, "HRESULT")
        return result
    }

    /**
     * The NetworkPropertyChanged method is called when a network property change is detected.
     * @param {Guid} networkId GUID that specifies the network on which this event occurred.
     * @param {NLM_NETWORK_PROPERTY_CHANGE} flags <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_network_property_change">NLM_NETWORK_PROPERTY_CHANGE</a> enumeration value that specifies the network property that changed.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkevents-networkpropertychanged
     */
    NetworkPropertyChanged(networkId, flags) {
        result := ComCall(6, this, Guid, networkId, NLM_NETWORK_PROPERTY_CHANGE, flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetworkEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NetworkAdded := CallbackCreate(GetMethod(implObj, "NetworkAdded"), flags, 2)
        this.vtbl.NetworkDeleted := CallbackCreate(GetMethod(implObj, "NetworkDeleted"), flags, 2)
        this.vtbl.NetworkConnectivityChanged := CallbackCreate(GetMethod(implObj, "NetworkConnectivityChanged"), flags, 3)
        this.vtbl.NetworkPropertyChanged := CallbackCreate(GetMethod(implObj, "NetworkPropertyChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NetworkAdded)
        CallbackFree(this.vtbl.NetworkDeleted)
        CallbackFree(this.vtbl.NetworkConnectivityChanged)
        CallbackFree(this.vtbl.NetworkPropertyChanged)
    }
}

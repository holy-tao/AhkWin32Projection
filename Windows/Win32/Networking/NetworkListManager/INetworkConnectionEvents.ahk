#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NLM_CONNECTION_PROPERTY_CHANGE.ahk" { NLM_CONNECTION_PROPERTY_CHANGE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NLM_CONNECTIVITY.ahk" { NLM_CONNECTIVITY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The INetworkConnectionEvents interface is a message sink interface that a client implements to get network connection-related events. Applications that are interested in lower-level events (such as authentication changes) must implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworkconnectionevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct INetworkConnectionEvents extends IUnknown {
    /**
     * The interface identifier for INetworkConnectionEvents
     * @type {Guid}
     */
    static IID := Guid("{dcb00007-570f-4a9b-8d69-199fdba5723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkConnectionEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NetworkConnectionConnectivityChanged : IntPtr
        NetworkConnectionPropertyChanged     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkConnectionEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The NetworkConnectionConnectivityChanged method notifies a client when connectivity change events occur on a network connection level.
     * @param {Guid} connectionId A GUID that identifies the network connection  on which the event occurred.
     * @param {NLM_CONNECTIVITY} newConnectivity <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connectivity">NLM_CONNECTIVITY</a> enumeration value that specifies the new connectivity for this network connection.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnectionevents-networkconnectionconnectivitychanged
     */
    NetworkConnectionConnectivityChanged(connectionId, newConnectivity) {
        result := ComCall(3, this, Guid, connectionId, NLM_CONNECTIVITY, newConnectivity, "HRESULT")
        return result
    }

    /**
     * The NetworkConnectionPropertyChanged method notifies a client when property change events related to a specific network connection occur.
     * @param {Guid} connectionId A GUID that identifies the network connection  on which the event occurred.
     * @param {NLM_CONNECTION_PROPERTY_CHANGE} flags The <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_property_change">NLM_CONNECTION_PROPERTY_CHANGE</a> flags for this connection.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnectionevents-networkconnectionpropertychanged
     */
    NetworkConnectionPropertyChanged(connectionId, flags) {
        result := ComCall(4, this, Guid, connectionId, NLM_CONNECTION_PROPERTY_CHANGE, flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetworkConnectionEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NetworkConnectionConnectivityChanged := CallbackCreate(GetMethod(implObj, "NetworkConnectionConnectivityChanged"), flags, 3)
        this.vtbl.NetworkConnectionPropertyChanged := CallbackCreate(GetMethod(implObj, "NetworkConnectionPropertyChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NetworkConnectionConnectivityChanged)
        CallbackFree(this.vtbl.NetworkConnectionPropertyChanged)
    }
}

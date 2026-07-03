#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DOT11_ADHOC_NETWORK_CONNECTION_STATUS.ahk" { DOT11_ADHOC_NETWORK_CONNECTION_STATUS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines the notifications supported by IDot11AdHocInterface.
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/nn-adhoc-idot11adhocinterfacenotificationsink
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct IDot11AdHocInterfaceNotificationSink extends IUnknown {
    /**
     * The interface identifier for IDot11AdHocInterfaceNotificationSink
     * @type {Guid}
     */
    static IID := Guid("{8f10cc2f-cf0d-42a0-acbe-e2de7007384d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDot11AdHocInterfaceNotificationSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnConnectionStatusChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDot11AdHocInterfaceNotificationSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the client that the connection status of the network associated with the NIC has changed.
     * @remarks
     * This notification is triggered when the connection status changes as a result of connection and disconnection requests issued by the current application. It is also triggered when other applications issue successful connection  and disconnection requests using the <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocnetwork">IDot11AdHocNetwork</a> methods or the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/native-wifi-functions">Native Wifi functions</a>.
     * @param {DOT11_ADHOC_NETWORK_CONNECTION_STATUS} eStatus A pointer to a  <a href="https://docs.microsoft.com/windows/win32/api/adhoc/ne-adhoc-dot11_adhoc_network_connection_status">DOT11_ADHOC_NETWORK_CONNECTION_STATUS</a> value that specifies the new connection state.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterfacenotificationsink-onconnectionstatuschange
     */
    OnConnectionStatusChange(eStatus) {
        result := ComCall(3, this, DOT11_ADHOC_NETWORK_CONNECTION_STATUS, eStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDot11AdHocInterfaceNotificationSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnConnectionStatusChange := CallbackCreate(GetMethod(implObj, "OnConnectionStatusChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnConnectionStatusChange)
    }
}

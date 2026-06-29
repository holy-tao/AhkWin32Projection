#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnConnection.ahk" { IMbnConnection }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to IMbnConnection objects and connection notifications.
 * @remarks
 * This interface can be used to access the following notification interfaces.<table>
 * <tr>
 * <th>Notification Sink to Register</th>
 * <th>IID</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanagerevents">IMbnConnectionManagerEvents</a>
 * </td>
 * <td><b>IID_IMbnConnectionManagerEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionevents">IMbnConnectionEvents</a>
 * </td>
 * <td><b>IID_IMbnConnectionEvents</b></td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * An application can obtain this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with a class id of <b>CLSID_IMbnConnectionManager</b>.
 * 
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <b>IMbnConnectionManager</b> object.</li>
 * <li>
 * For each notification sink to register, call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass IID corresponding to the notification sink to <i>riid</i>.
 * 
 * </li>
 * <li>For each connection point returned by step 2, call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements the matching notification interface to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the "Client" section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnconnectionmanager
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnConnectionManager extends IUnknown {
    /**
     * The interface identifier for IMbnConnectionManager
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-201d-4bbb-aaee-338e368af6fa}")

    /**
     * The class identifier for MbnConnectionManager
     * @type {Guid}
     */
    static CLSID := Guid("{bdfee05c-4418-11dd-90ed-001c257ccff1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnConnectionManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetConnection  : IntPtr
        GetConnections : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnConnectionManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a connection.
     * @param {PWSTR} connectionID A string containing the connection ID.
     * @returns {IMbnConnection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the requested connection.  If the method returns anything other than S_OK, then this is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnection
     */
    GetConnection(connectionID) {
        connectionID := connectionID is String ? StrPtr(connectionID) : connectionID

        result := ComCall(3, this, "ptr", connectionID, "ptr*", &mbnConnection := 0, "HRESULT")
        return IMbnConnection(mbnConnection)
    }

    /**
     * Gets a list of available connections.
     * @returns {Pointer<SAFEARRAY>} An array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interfaces representing connections that are associated with the devices.  If this method returns anything other than <b>S_OK</b>, then this is <b>NULL</b>.  Otherwise the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnections
     */
    GetConnections() {
        result := ComCall(4, this, "ptr*", &mbnConnections := 0, "HRESULT")
        return mbnConnections
    }

    Query(iid) {
        if (IMbnConnectionManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConnection := CallbackCreate(GetMethod(implObj, "GetConnection"), flags, 3)
        this.vtbl.GetConnections := CallbackCreate(GetMethod(implObj, "GetConnections"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConnection)
        CallbackFree(this.vtbl.GetConnections)
    }
}

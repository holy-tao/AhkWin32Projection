#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumConnections.ahk" { IEnumConnections }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IConnectionPointContainer.ahk" { IConnectionPointContainer }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Supports connection points for connectable objects. (IConnectionPoint)
 * @remarks
 * Connectable objects support the following features: 
 * 
 * 
 * 
 * <ul>
 * <li>Outgoing interfaces, such as event sets
 * </li>
 * <li>The ability to enumerate the IIDs of the outgoing interfaces
 * </li>
 * <li>The ability to connect and disconnect sinks to the object for those outgoing IIDs
 * </li>
 * <li>The ability to enumerate the connections that exist to a particular outgoing interface
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpoint
 * @namespace Windows.Win32.System.Com
 */
export default struct IConnectionPoint extends IUnknown {
    /**
     * The interface identifier for IConnectionPoint
     * @type {Guid}
     */
    static IID := Guid("{b196b286-bab4-101a-b69c-00aa00341d07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConnectionPoint interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetConnectionInterface      : IntPtr
        GetConnectionPointContainer : IntPtr
        Advise                      : IntPtr
        Unadvise                    : IntPtr
        EnumConnections             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConnectionPoint.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the IID of the outgoing interface managed by this connection point.
     * @remarks
     * Using the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ienumconnectionpoints">IEnumConnectionPoints</a> interface, a client can obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iconnectionpoint">IConnectionPoint</a> interface. Using that pointer and the <b>GetConnectionInterface</b> method, the client can determine the IID of each connection point enumerated. The IID returned from this method must enable the caller to access this same connection point through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">IConnectionPointContainer::FindConnectionPoint</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method must be implemented in any connection point; E_NOTIMPL is not an acceptable return value.
     * @returns {Guid} A pointer to the identifier of the outgoing interface managed by this connection point.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-getconnectioninterface
     */
    GetConnectionInterface() {
        pIID := Guid()
        result := ComCall(3, this, Guid.Ptr, pIID, "HRESULT")
        return pIID
    }

    /**
     * Retrieves the IConnectionPointContainer interface pointer for the parent connectable object.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * This method calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>. The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> to release this pointer when done.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> before returning.
     * 
     * This method must be implemented in any connection point; E_NOTIMPL is not an acceptable return value.
     * @returns {IConnectionPointContainer} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-getconnectionpointcontainer
     */
    GetConnectionPointContainer() {
        result := ComCall(4, this, "ptr*", &ppCPC := 0, "HRESULT")
        return IConnectionPointContainer(ppCPC)
    }

    /**
     * Establishes a connection between a connection point object and the client's sink.
     * @remarks
     * <b>Advise</b> establishes a connection between the connection point and the caller's sink identified with <i>pUnkSink</i>.
     * 
     * The connection point must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to obtain the correct outgoing interface pointer to call when events occur, with the IID for the outgoing interface managed by the connection point. When the IID is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">IConnectionPointContainer::FindConnectionPoint</a> method, an interface pointer to this same connection point is returned.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The connection point must query the <i>pUnkSink</i> pointer for the correct outgoing interface. If this query fails, this method must return CONNECT_E_CANNOTCONNECT.
     * 
     * The <i>pdwCookie</i> value must be unique for each connection to any given instance of a connection point.
     * @param {IUnknown} pUnkSink A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the client's advise sink. The client's sink receives outgoing calls from the connection point.
     * @returns {Integer} A pointer to a returned token that uniquely identifies this connection. The caller uses this token later to delete the connection by passing it to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">IConnectionPoint::Unadvise</a> method. If the connection was not successfully established, this value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise
     */
    Advise(pUnkSink) {
        result := ComCall(5, this, "ptr", pUnkSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Terminates an advisory connection previously established between a connection point object and a client's sink.
     * @remarks
     * When an advisory connection is terminated, the connection point calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method on the pointer that was saved for the connection during the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">IConnectionPoint::Advise</a> method. This <b>Release</b> reverses the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> that was performed during the <b>Advise</b> when the connection point calls the advisory sink's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>.
     * @param {Integer} dwCookie A connection token previously returned from <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">IConnectionPoint::Advise</a>.
     * @returns {HRESULT} This method can return the standard return values E_UNEXPECTED, as well as the following values.
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
     * The connection was terminated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value in <i>dwCookie</i> does not represent a valid connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Creates an enumerator object to iterate through the current connections for this connection point.
     * @remarks
     * The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when the enumerator is no longer needed.
     * @returns {IEnumConnections} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ienumconnections">IEnumConnections</a> interface pointer that receives the newly created enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-enumconnections
     */
    EnumConnections() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumConnections(ppEnum)
    }

    Query(iid) {
        if (IConnectionPoint.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConnectionInterface := CallbackCreate(GetMethod(implObj, "GetConnectionInterface"), flags, 2)
        this.vtbl.GetConnectionPointContainer := CallbackCreate(GetMethod(implObj, "GetConnectionPointContainer"), flags, 2)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 3)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
        this.vtbl.EnumConnections := CallbackCreate(GetMethod(implObj, "EnumConnections"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConnectionInterface)
        CallbackFree(this.vtbl.GetConnectionPointContainer)
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.Unadvise)
        CallbackFree(this.vtbl.EnumConnections)
    }
}

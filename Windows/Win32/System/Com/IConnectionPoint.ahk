#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConnectionPointContainer.ahk
#Include .\IEnumConnections.ahk
#Include .\IUnknown.ahk

/**
 * Supports connection points for connectable objects.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iconnectionpoint
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IConnectionPoint extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectionPoint
     * @type {Guid}
     */
    static IID => Guid("{b196b286-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectionInterface", "GetConnectionPointContainer", "Advise", "Unadvise", "EnumConnections"]

    /**
     * Retrieves the IID of the outgoing interface managed by this connection point.
     * @returns {Guid} A pointer to the identifier of the outgoing interface managed by this connection point.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iconnectionpoint-getconnectioninterface
     */
    GetConnectionInterface() {
        pIID := Guid()
        result := ComCall(3, this, "ptr", pIID, "HRESULT")
        return pIID
    }

    /**
     * Retrieves the IConnectionPointContainer interface pointer for the parent connectable object.
     * @returns {IConnectionPointContainer} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iconnectionpoint-getconnectionpointcontainer
     */
    GetConnectionPointContainer() {
        result := ComCall(4, this, "ptr*", &ppCPC := 0, "HRESULT")
        return IConnectionPointContainer(ppCPC)
    }

    /**
     * Establishes a connection between a connection point object and the client's sink.
     * @param {IUnknown} pUnkSink A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the client's advise sink. The client's sink receives outgoing calls from the connection point.
     * @returns {Integer} A pointer to a returned token that uniquely identifies this connection. The caller uses this token later to delete the connection by passing it to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">IConnectionPoint::Unadvise</a> method. If the connection was not successfully established, this value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iconnectionpoint-advise
     */
    Advise(pUnkSink) {
        result := ComCall(5, this, "ptr", pUnkSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Terminates an advisory connection previously established between a connection point object and a client's sink.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iconnectionpoint-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Creates an enumerator object to iterate through the current connections for this connection point.
     * @returns {IEnumConnections} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ienumconnections">IEnumConnections</a> interface pointer that receives the newly created enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iconnectionpoint-enumconnections
     */
    EnumConnections() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumConnections(ppEnum)
    }
}

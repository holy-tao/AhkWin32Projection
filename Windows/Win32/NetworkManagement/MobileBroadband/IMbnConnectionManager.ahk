#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMbnConnection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to IMbnConnection objects and connection notifications.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnconnectionmanager
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnConnectionManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnConnectionManager
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-201d-4bbb-aaee-338e368af6fa}")

    /**
     * The class identifier for MbnConnectionManager
     * @type {Guid}
     */
    static CLSID => Guid("{bdfee05c-4418-11dd-90ed-001c257ccff1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnection", "GetConnections"]

    /**
     * 
     * @param {PWSTR} connectionID 
     * @returns {IMbnConnection} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnection
     */
    GetConnection(connectionID) {
        connectionID := connectionID is String ? StrPtr(connectionID) : connectionID

        result := ComCall(3, this, "ptr", connectionID, "ptr*", &mbnConnection := 0, "HRESULT")
        return IMbnConnection(mbnConnection)
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnections
     */
    GetConnections() {
        result := ComCall(4, this, "ptr*", &mbnConnections := 0, "HRESULT")
        return mbnConnections
    }
}

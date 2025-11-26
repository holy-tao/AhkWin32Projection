#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This notification interface signals an application about the arrival and removal of IMbnConnection interfaces in the system.
 * @remarks
 * 
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanager">IMbnConnectionManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnConnectionManagerEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnConnectionManagerEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnconnectionmanagerevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnConnectionManagerEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnConnectionManagerEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-201e-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnConnectionArrival", "OnConnectionRemoval"]

    /**
     * Notification method that indicates a new connection was added to the system.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the device added to the system.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionmanagerevents-onconnectionarrival
     */
    OnConnectionArrival(newConnection) {
        result := ComCall(3, this, "ptr", newConnection, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates a connection was removed from the system.
     * @param {IMbnConnection} oldConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the device removed from the system.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionmanagerevents-onconnectionremoval
     */
    OnConnectionRemoval(oldConnection) {
        result := ComCall(4, this, "ptr", oldConnection, "HRESULT")
        return result
    }
}

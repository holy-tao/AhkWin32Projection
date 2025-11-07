#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMbnInterface.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to IMbnInterface objects and notifications.
 * @remarks
 * 
 * This interface can be used to access the following notification interfaces.<table>
 * <tr>
 * <th>Notification Sink to Register</th>
 * <th>IID</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanagerevents">IMbnInterfaceManagerEvents</a>
 * </td>
 * <td><b>IID_IMbnInterfaceManagerEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a>
 * </td>
 * <td><b>IID_IMbnInterfaceEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsignalevents">IMbnSignalEvents</a>
 * </td>
 * <td><b>IID_IMbnSignalEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanagerevents">IMbnPinManagerEvents</a>
 * </td>
 * <td><b>IID_IMbnPinManagerEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinevents">IMbnPinEvents</a>
 * </td>
 * <td><b>IID_IMbnPinEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>
 * </td>
 * <td><b>IID_IMbnRegistrationEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontextevents">IMbnConnectionContextEvents</a>
 * </td>
 * <td><b>IID_IMbnConnectionContextEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a>
 * </td>
 * <td><b>IID_IMbnSmsEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnserviceactivationevents">IMbnServiceActivationEvents</a>
 * </td>
 * <td><b>IID_IMbnServiceActivationEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnvendorspecificevents">IMbnVendorSpecificEvents</a>
 * </td>
 * <td><b>IID_IMbnVendorSpecificEvents</b></td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <b>IMbnInterfaceManager</b> object.</li>
 * <li>
 * For each notification sink to register, call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass IID corresponding to the notification sink to <i>riid</i>.
 * 
 * </li>
 * <li>For each connection point returned by step 2, call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements the matching notification interface to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbninterfacemanager
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnInterfaceManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnInterfaceManager
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-201b-4bbb-aaee-338e368af6fa}")

    /**
     * The class identifier for MbnInterfaceManager
     * @type {Guid}
     */
    static CLSID => Guid("{bdfee05b-4418-11dd-90ed-001c257ccff1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInterface", "GetInterfaces"]

    /**
     * 
     * @param {PWSTR} interfaceID 
     * @returns {IMbnInterface} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterfacemanager-getinterface
     */
    GetInterface(interfaceID) {
        interfaceID := interfaceID is String ? StrPtr(interfaceID) : interfaceID

        result := ComCall(3, this, "ptr", interfaceID, "ptr*", &mbnInterface := 0, "HRESULT")
        return IMbnInterface(mbnInterface)
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterfacemanager-getinterfaces
     */
    GetInterfaces() {
        result := ComCall(4, this, "ptr*", &mbnInterfaces := 0, "HRESULT")
        return mbnInterfaces
    }
}

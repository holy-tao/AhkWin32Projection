#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\IMbnInterface.ahk" { IMbnInterface }

/**
 * Provides access to IMbnInterface objects and notifications.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbninterfacemanager
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnInterfaceManager extends IUnknown {
    /**
     * The interface identifier for IMbnInterfaceManager
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-201b-4bbb-aaee-338e368af6fa}")

    /**
     * The class identifier for MbnInterfaceManager
     * @type {Guid}
     */
    static CLSID := Guid("{bdfee05b-4418-11dd-90ed-001c257ccff1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnInterfaceManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInterface  : IntPtr
        GetInterfaces : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnInterfaceManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a specific interface.
     * @param {PWSTR} interfaceID A string that contains the ID of the interface to retrieve.
     * @returns {IMbnInterface} Pointer to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> specified by <i>interfaceID</i> or <b>NULL</b> if there is no matching interface.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterfacemanager-getinterface
     */
    GetInterface(interfaceID) {
        interfaceID := interfaceID is String ? StrPtr(interfaceID) : interfaceID

        result := ComCall(3, this, "ptr", interfaceID, "ptr*", &mbnInterface := 0, "HRESULT")
        return IMbnInterface(mbnInterface)
    }

    /**
     * Gets a list of all available IMbnInterface objects.
     * @returns {Pointer<SAFEARRAY>} An array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> interfaces that are associated with the device.  If this method returns anything other than <b>S_OK</b>, then this is <b>NULL</b>.  Otherwise the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterfacemanager-getinterfaces
     */
    GetInterfaces() {
        result := ComCall(4, this, "ptr*", &mbnInterfaces := 0, "HRESULT")
        return mbnInterfaces
    }

    Query(iid) {
        if (IMbnInterfaceManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInterface := CallbackCreate(GetMethod(implObj, "GetInterface"), flags, 3)
        this.vtbl.GetInterfaces := CallbackCreate(GetMethod(implObj, "GetInterfaces"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInterface)
        CallbackFree(this.vtbl.GetInterfaces)
    }
}

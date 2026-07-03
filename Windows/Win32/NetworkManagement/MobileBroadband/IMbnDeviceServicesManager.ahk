#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnDeviceServicesContext.ahk" { IMbnDeviceServicesContext }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to IMbnDeviceServicesContext objects and Mobile Broadband device service notifications.
 * @remarks
 * The following procedure describes how to register for notifications.<ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iconnectionpoint">IConnectionPoint</a> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on an <b>IMbnDeviceServicesManager</b> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass IID_IMbnDeviceServicesEvents to RIID.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on an object that implements <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> to PUNK.</li>
 * </ol>
 * 
 * 
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * 
 * For sample code that registers COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/january/msdn-magazine-january-2001">COM Connection Points article</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbndeviceservicesmanager
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnDeviceServicesManager extends IUnknown {
    /**
     * The interface identifier for IMbnDeviceServicesManager
     * @type {Guid}
     */
    static IID := Guid("{20a26258-6811-4478-ac1d-13324e45e41c}")

    /**
     * The class identifier for MbnDeviceServicesManager
     * @type {Guid}
     */
    static CLSID := Guid("{2269daa3-2a9f-4165-a501-ce00a6f7a75b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnDeviceServicesManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDeviceServicesContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnDeviceServicesManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the IMbnDeviceServicesContext interface for a specific Mobile Broadband device.
     * @param {BSTR} networkInterfaceID A string that contains the ID of the Mobile Broadband device. The ID can be obtained using the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-get_interfaceid">InterfaceID</a> property
     * @returns {IMbnDeviceServicesContext} Pointer to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicescontext">IMbnDeviceServicesContext</a> for the device specified by <i>networkInterfaceID</i> or <b>NULL</b> if there is no matching interface.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesmanager-getdeviceservicescontext
     */
    GetDeviceServicesContext(networkInterfaceID) {
        networkInterfaceID := networkInterfaceID is String ? BSTR.Alloc(networkInterfaceID).Value : networkInterfaceID

        result := ComCall(3, this, BSTR, networkInterfaceID, "ptr*", &mbnDevicesContext := 0, "HRESULT")
        return IMbnDeviceServicesContext(mbnDevicesContext)
    }

    Query(iid) {
        if (IMbnDeviceServicesManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceServicesContext := CallbackCreate(GetMethod(implObj, "GetDeviceServicesContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceServicesContext)
    }
}

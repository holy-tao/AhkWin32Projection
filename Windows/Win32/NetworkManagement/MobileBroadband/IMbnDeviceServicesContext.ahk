#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnDeviceService.ahk" { IMbnDeviceService }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Allows for enumerating and retrieving Mobile Broadband device objects on the system.
 * @remarks
 * <b>IMbnDeviceServicesContext</b> objects are provided by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesmanager-getdeviceservicescontext">GetDeviceServicesContext</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesmanager">IMbnDeviceServicesManager</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbndeviceservicescontext
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnDeviceServicesContext extends IUnknown {
    /**
     * The interface identifier for IMbnDeviceServicesContext
     * @type {Guid}
     */
    static IID := Guid("{fc5ac347-1592-4068-80bb-6a57580150d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnDeviceServicesContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumerateDeviceServices : IntPtr
        GetDeviceService        : IntPtr
        get_MaxCommandSize      : IntPtr
        get_MaxDataSize         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnDeviceServicesContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MaxCommandSize {
        get => this.get_MaxCommandSize()
    }

    /**
     * @type {Integer} 
     */
    MaxDataSize {
        get => this.get_MaxDataSize()
    }

    /**
     * Gets the list of supported device services by the Mobile Broadband device.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_device_service">MBN_DEVICE_SERVICE</a> structures that contains the list of device service supported by the device. If <b>EnumerateDeviceServices</b> returns any value other than <b>S_OK</b>, <i>deviceServices</i> is <b>NULL</b>. Otherwise, upon completion, the calling program must free the allocated memory. Before freeing the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>, the calling program must also free all the <b>BSTRs</b> in the <b>MBN_DEVICE_SERVICE</b> structure by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-enumeratedeviceservices
     */
    EnumerateDeviceServices() {
        result := ComCall(3, this, "ptr*", &deviceServices := 0, "HRESULT")
        return deviceServices
    }

    /**
     * Gets the IMbnDeviceService object that can be used for communicating with a device service on the Mobile Broadband device.
     * @remarks
     * <b>GetDeviceService</b> may return an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object that already has a command or data session open. The calling process can check if the device service is already open.
     * @param {BSTR} deviceServiceID The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservice-get_deviceserviceid">deviceServiceID</a> of the Mobile Broadband device.
     * @returns {IMbnDeviceService} The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-getdeviceservice
     */
    GetDeviceService(deviceServiceID) {
        deviceServiceID := deviceServiceID is String ? BSTR.Alloc(deviceServiceID).Value : deviceServiceID

        result := ComCall(4, this, BSTR, deviceServiceID, "ptr*", &mbnDeviceService := 0, "HRESULT")
        return IMbnDeviceService(mbnDeviceService)
    }

    /**
     * The maximum length, in bytes, of data that can be associated with a device service SET or QUERY command.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-get_maxcommandsize
     */
    get_MaxCommandSize() {
        result := ComCall(5, this, "uint*", &maxCommandSize := 0, "HRESULT")
        return maxCommandSize
    }

    /**
     * The maximum length, in bytes, of data that can be written to or read from a device service session.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-get_maxdatasize
     */
    get_MaxDataSize() {
        result := ComCall(6, this, "uint*", &maxDataSize := 0, "HRESULT")
        return maxDataSize
    }

    Query(iid) {
        if (IMbnDeviceServicesContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateDeviceServices := CallbackCreate(GetMethod(implObj, "EnumerateDeviceServices"), flags, 2)
        this.vtbl.GetDeviceService := CallbackCreate(GetMethod(implObj, "GetDeviceService"), flags, 3)
        this.vtbl.get_MaxCommandSize := CallbackCreate(GetMethod(implObj, "get_MaxCommandSize"), flags, 2)
        this.vtbl.get_MaxDataSize := CallbackCreate(GetMethod(implObj, "get_MaxDataSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateDeviceServices)
        CallbackFree(this.vtbl.GetDeviceService)
        CallbackFree(this.vtbl.get_MaxCommandSize)
        CallbackFree(this.vtbl.get_MaxDataSize)
    }
}

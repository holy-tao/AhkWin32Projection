#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMDSPDevice.ahk" { IMDSPDevice }
#Import ".\IMDServiceProvider.ahk" { IMDServiceProvider }

/**
 * The IMDServiceProvider2 interface extends the IMDServiceProvider interface by providing a way of obtaining IMDSPDevice object(s) for a given device path name. The device path name comes from the Plug and Play (PnP) subsystem.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdserviceprovider2
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDServiceProvider2 extends IMDServiceProvider {
    /**
     * The interface identifier for IMDServiceProvider2
     * @type {Guid}
     */
    static IID := Guid("{b2fa24b7-cda3-4694-9862-413ae1a34819}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDServiceProvider2 interfaces
    */
    struct Vtbl extends IMDServiceProvider.Vtbl {
        CreateDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDServiceProvider2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CreateDevice method is called by the Windows Media Device Manager to get the IMDSPDevice object(s) corresponding to the canonical device obtained from the PnP subsystem.
     * @remarks
     * Windows Media Device Manager calls this method when an application starts, or when a Plug and Play compliant device connects with the computer.
     * @param {PWSTR} pwszDevicePath Pointer to a wide-character null-terminated string containing the device path of the device detected by Windows Media Device Manager. This name is obtained from the PnP subsystem, and is the canonical name plus "$ <i>#</i> ", where <i>#</i> is an auto-incremented number. This name can be passed directly to functions such as <b>CreateFile</b> to gain access to the underlying kernel device object. The service provider should create a wrapper <b>IMDSPDevice</b> object(s) for this device.
     * @param {Pointer<Integer>} pdwCount Pointer to a <b>DWORD</b> containing the number of <b>IMDSPDevice</b> objects that are created.
     * @param {Pointer<Pointer<IMDSPDevice>>} pppDeviceArray An array of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspdevice">IMDSPDevice</a> interfaces representing the devices. Typically, there is only one array element, but a service provider can create more than one <b>IMDSPDevice</b> object corresponding to a device path name if it creates an <b>IMDSPDevice</b> object for each top-level storage. This is subject to change in the future, and the count may be restricted to 1.
     * @returns {HRESULT} If the method succeeds it returns S_OK. If the method fails, it returns the Windows Media Device Manager error codes.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdserviceprovider2-createdevice
     */
    CreateDevice(pwszDevicePath, pdwCount, pppDeviceArray) {
        pwszDevicePath := pwszDevicePath is String ? StrPtr(pwszDevicePath) : pwszDevicePath

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"
        pppDeviceArrayMarshal := pppDeviceArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pwszDevicePath, pdwCountMarshal, pdwCount, pppDeviceArrayMarshal, pppDeviceArray, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMDServiceProvider2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDevice := CallbackCreate(GetMethod(implObj, "CreateDevice"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDevice)
    }
}

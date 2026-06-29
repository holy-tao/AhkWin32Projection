#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMDeviceRemoval interface provides a way for the Filter Graph Manager to register for device removal events for a capture device.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamdeviceremoval
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMDeviceRemoval extends IUnknown {
    /**
     * The interface identifier for IAMDeviceRemoval
     * @type {Guid}
     */
    static IID := Guid("{f90a6130-b658-11d2-ae49-0000f8754b99}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMDeviceRemoval interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeviceInfo   : IntPtr
        Reassociate  : IntPtr
        Disassociate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMDeviceRemoval.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The DeviceInfo method retrieves information about the device.
     * @remarks
     * For more information about the device interface classes and device paths, see Device I/O in the Windows SDK documentation.
     * @param {Pointer<Guid>} pclsidInterfaceClass Receives a GUID that specifies the device interface class.
     * @param {Pointer<PWSTR>} pwszSymbolicLink Receives a pointer to a string that contains the Plug and Play (PnP) device path for the device. The caller must release the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdeviceremoval-deviceinfo
     */
    DeviceInfo(pclsidInterfaceClass, pwszSymbolicLink) {
        pwszSymbolicLinkMarshal := pwszSymbolicLink is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, pclsidInterfaceClass, pwszSymbolicLinkMarshal, pwszSymbolicLink, "HRESULT")
        return result
    }

    /**
     * The Reassociate method reassociates the KsProxy filter with the device. The Filter Graph Manager calls this method if it receives a notification that the device has returned after being removed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdeviceremoval-reassociate
     */
    Reassociate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Disassociate method disassociates the KsProxy filter from the device by closing the device handle. The Filter Graph Manager calls this method if it receives a notification that the device was removed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdeviceremoval-disassociate
     */
    Disassociate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMDeviceRemoval.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeviceInfo := CallbackCreate(GetMethod(implObj, "DeviceInfo"), flags, 3)
        this.vtbl.Reassociate := CallbackCreate(GetMethod(implObj, "Reassociate"), flags, 1)
        this.vtbl.Disassociate := CallbackCreate(GetMethod(implObj, "Disassociate"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeviceInfo)
        CallbackFree(this.vtbl.Reassociate)
        CallbackFree(this.vtbl.Disassociate)
    }
}

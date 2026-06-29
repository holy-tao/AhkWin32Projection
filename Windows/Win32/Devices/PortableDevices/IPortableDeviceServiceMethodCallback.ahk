#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains a method that applications use to track the completion of a callback method. Applications that call service methods asynchronously may implement this interface, and supply it as a parameter to IPortableDeviceServiceMethods::InvokeAsync.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethodcallback
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceServiceMethodCallback extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceServiceMethodCallback
     * @type {Guid}
     */
    static IID := Guid("{c424233c-afce-4828-a756-7ed7a2350083}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceServiceMethodCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceServiceMethodCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that a callback method has completed execution.
     * @param {HRESULT} hrStatus The overall status of the method.
     * @param {IPortableDeviceValues} pResults An <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains the method-execution results.  This is empty if the method returns no results.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethodcallback-oncomplete
     */
    OnComplete(hrStatus, pResults) {
        result := ComCall(3, this, "int", hrStatus, "ptr", pResults, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceServiceMethodCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnComplete := CallbackCreate(GetMethod(implObj, "OnComplete"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnComplete)
    }
}

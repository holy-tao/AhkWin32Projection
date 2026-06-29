#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to handle the completion of calls to the DeviceIoControlAsyncmethod.
 * @remarks
 * Callers that want  to use asynchronous operations on an instance that's created by CreateDeviceAccessInstance should implement the <b>IDeviceRequestCompletionCallback</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nn-deviceaccess-idevicerequestcompletioncallback
 * @namespace Windows.Win32.Devices.DeviceAccess
 */
export default struct IDeviceRequestCompletionCallback extends IUnknown {
    /**
     * The interface identifier for IDeviceRequestCompletionCallback
     * @type {Guid}
     */
    static IID := Guid("{999bad24-9acd-45bb-8669-2a2fc0288b04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeviceRequestCompletionCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeviceRequestCompletionCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} requestResult 
     * @param {Integer} bytesReturned 
     * @returns {HRESULT} 
     */
    Invoke(requestResult, bytesReturned) {
        result := ComCall(3, this, "int", requestResult, "uint", bytesReturned, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDeviceRequestCompletionCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invoke)
    }
}

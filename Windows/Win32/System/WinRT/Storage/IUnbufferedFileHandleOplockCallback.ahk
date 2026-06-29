#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a callback method that you want to run when the opportunistic lock for a handle that you get by calling the IUnbufferedFileHandleProvider::OpenUnbufferedFileHandle method is broken.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nn-windowsstoragecom-iunbufferedfilehandleoplockcallback
 * @namespace Windows.Win32.System.WinRT.Storage
 */
export default struct IUnbufferedFileHandleOplockCallback extends IUnknown {
    /**
     * The interface identifier for IUnbufferedFileHandleOplockCallback
     * @type {Guid}
     */
    static IID := Guid("{d1019a0e-6243-4329-8497-2e75894d7710}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUnbufferedFileHandleOplockCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnBrokenCallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUnbufferedFileHandleOplockCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Runs when the opportunistic lock for a handle that you get by calling the IUnbufferedFileHandleProvider::OpenUnbufferedFileHandle method is broken.
     * @remarks
     * Implement this method to specify what your app should do when the opportunistic lock for a handle that you get by calling the <a href="https://docs.microsoft.com/windows/desktop/api/windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleprovider-openunbufferedfilehandle">IUnbufferedFileHandleProvider::OpenUnbufferedFileHandle</a> method is broken.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleoplockcallback-onbrokencallback
     */
    OnBrokenCallback() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUnbufferedFileHandleOplockCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnBrokenCallback := CallbackCreate(GetMethod(implObj, "OnBrokenCallback"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnBrokenCallback)
    }
}

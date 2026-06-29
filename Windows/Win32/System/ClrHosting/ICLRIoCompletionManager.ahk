#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRIoCompletionManager extends IUnknown {
    /**
     * The interface identifier for ICLRIoCompletionManager
     * @type {Guid}
     */
    static IID := Guid("{2d74ce86-b8d6-4c84-b3a7-9768933b3c12}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRIoCompletionManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRIoCompletionManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwErrorCode 
     * @param {Integer} NumberOfBytesTransferred 
     * @param {Pointer<Void>} pvOverlapped 
     * @returns {HRESULT} 
     */
    OnComplete(dwErrorCode, NumberOfBytesTransferred, pvOverlapped) {
        pvOverlappedMarshal := pvOverlapped is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", dwErrorCode, "uint", NumberOfBytesTransferred, pvOverlappedMarshal, pvOverlapped, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRIoCompletionManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnComplete := CallbackCreate(GetMethod(implObj, "OnComplete"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnComplete)
    }
}

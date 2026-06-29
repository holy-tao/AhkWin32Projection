#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FILE_OPERATION_FLAGS2.ahk" { FILE_OPERATION_FLAGS2 }
#Import ".\IFileOperation.ahk" { IFileOperation }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFileOperation2 extends IFileOperation {
    /**
     * The interface identifier for IFileOperation2
     * @type {Guid}
     */
    static IID := Guid("{cd8f23c1-8f61-4916-909d-55bdd0918753}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileOperation2 interfaces
    */
    struct Vtbl extends IFileOperation.Vtbl {
        SetOperationFlags2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileOperation2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {FILE_OPERATION_FLAGS2} operationFlags2 
     * @returns {HRESULT} 
     */
    SetOperationFlags2(operationFlags2) {
        result := ComCall(23, this, FILE_OPERATION_FLAGS2, operationFlags2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFileOperation2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOperationFlags2 := CallbackCreate(GetMethod(implObj, "SetOperationFlags2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOperationFlags2)
    }
}

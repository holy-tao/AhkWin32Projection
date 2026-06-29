#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IAppServiceConnectionExtendedExecution extends IUnknown {
    /**
     * The interface identifier for IAppServiceConnectionExtendedExecution
     * @type {Guid}
     */
    static IID := Guid("{65219584-f9cb-4ae3-81f9-a28a6ca450d9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppServiceConnectionExtendedExecution interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OpenForExtendedExecutionAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppServiceConnectionExtendedExecution.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    OpenForExtendedExecutionAsync(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &operation := 0, "HRESULT")
        return operation
    }

    Query(iid) {
        if (IAppServiceConnectionExtendedExecution.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenForExtendedExecutionAsync := CallbackCreate(GetMethod(implObj, "OpenForExtendedExecutionAsync"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenForExtendedExecutionAsync)
    }
}

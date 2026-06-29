#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\BINDHANDLETYPES.ahk" { BINDHANDLETYPES }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IGetBindHandle extends IUnknown {
    /**
     * The interface identifier for IGetBindHandle
     * @type {Guid}
     */
    static IID := Guid("{af0ff408-129d-4b20-91f0-02bd23d88352}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetBindHandle interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBindHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetBindHandle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BINDHANDLETYPES} enumRequestedHandle 
     * @returns {HANDLE} 
     */
    GetBindHandle(enumRequestedHandle) {
        pRetHandle := HANDLE.Owned()
        result := ComCall(3, this, BINDHANDLETYPES, enumRequestedHandle, HANDLE.Ptr, pRetHandle, "HRESULT")
        return pRetHandle
    }

    Query(iid) {
        if (IGetBindHandle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBindHandle := CallbackCreate(GetMethod(implObj, "GetBindHandle"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBindHandle)
    }
}

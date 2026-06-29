#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IOplockStorage extends IUnknown {
    /**
     * The interface identifier for IOplockStorage
     * @type {Guid}
     */
    static IID := Guid("{8d19c834-8879-11d1-83e9-00c04fc2c6d4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOplockStorage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateStorageEx : IntPtr
        OpenStorageEx   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOplockStorage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {Integer} grfMode 
     * @param {Integer} _stgfmt 
     * @param {Integer} grfAttrs 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateStorageEx(pwcsName, grfMode, _stgfmt, grfAttrs, riid) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(3, this, "ptr", pwcsName, "uint", grfMode, "uint", _stgfmt, "uint", grfAttrs, Guid.Ptr, riid, "ptr*", &ppstgOpen := 0, "HRESULT")
        return ppstgOpen
    }

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {Integer} grfMode 
     * @param {Integer} _stgfmt 
     * @param {Integer} grfAttrs 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    OpenStorageEx(pwcsName, grfMode, _stgfmt, grfAttrs, riid) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(4, this, "ptr", pwcsName, "uint", grfMode, "uint", _stgfmt, "uint", grfAttrs, Guid.Ptr, riid, "ptr*", &ppstgOpen := 0, "HRESULT")
        return ppstgOpen
    }

    Query(iid) {
        if (IOplockStorage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateStorageEx := CallbackCreate(GetMethod(implObj, "CreateStorageEx"), flags, 7)
        this.vtbl.OpenStorageEx := CallbackCreate(GetMethod(implObj, "OpenStorageEx"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateStorageEx)
        CallbackFree(this.vtbl.OpenStorageEx)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EMemoryCriticalLevel.ahk" { EMemoryCriticalLevel }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostMalloc extends IUnknown {
    /**
     * The interface identifier for IHostMalloc
     * @type {Guid}
     */
    static IID := Guid("{1831991c-cc53-4a31-b218-04e910446479}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostMalloc interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Alloc      : IntPtr
        DebugAlloc : IntPtr
        Free       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostMalloc.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} cbSize 
     * @param {EMemoryCriticalLevel} eCriticalLevel 
     * @returns {Pointer<Void>} 
     */
    Alloc(cbSize, eCriticalLevel) {
        result := ComCall(3, this, "ptr", cbSize, EMemoryCriticalLevel, eCriticalLevel, "ptr*", &ppMem := 0, "HRESULT")
        return ppMem
    }

    /**
     * 
     * @param {Pointer} cbSize 
     * @param {EMemoryCriticalLevel} eCriticalLevel 
     * @param {Pointer<Integer>} pszFileName 
     * @param {Integer} iLineNo 
     * @returns {Pointer<Void>} 
     */
    DebugAlloc(cbSize, eCriticalLevel, pszFileName, iLineNo) {
        pszFileNameMarshal := pszFileName is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", cbSize, EMemoryCriticalLevel, eCriticalLevel, pszFileNameMarshal, pszFileName, "int", iLineNo, "ptr*", &ppMem := 0, "HRESULT")
        return ppMem
    }

    /**
     * 
     * @param {Pointer<Void>} pMem 
     * @returns {HRESULT} 
     */
    Free(pMem) {
        pMemMarshal := pMem is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pMemMarshal, pMem, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHostMalloc.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Alloc := CallbackCreate(GetMethod(implObj, "Alloc"), flags, 4)
        this.vtbl.DebugAlloc := CallbackCreate(GetMethod(implObj, "DebugAlloc"), flags, 6)
        this.vtbl.Free := CallbackCreate(GetMethod(implObj, "Free"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Alloc)
        CallbackFree(this.vtbl.DebugAlloc)
        CallbackFree(this.vtbl.Free)
    }
}

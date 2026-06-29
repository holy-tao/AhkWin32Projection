#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Foundation\CHAR.ahk" { CHAR }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Globalization
 * @charset ANSI
 */
export default struct IMLangStringBufA extends IUnknown {
    /**
     * The interface identifier for IMLangStringBufA
     * @type {Guid}
     */
    static IID := Guid("{d24acd23-ba72-11d0-b188-00aa0038c969}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLangStringBufA interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStatus : IntPtr
        LockBuf   : IntPtr
        UnlockBuf : IntPtr
        Insert    : IntPtr
        Delete    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLangStringBufA.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} plFlags 
     * @param {Pointer<Integer>} pcchBuf 
     * @returns {HRESULT} 
     */
    GetStatus(plFlags, pcchBuf) {
        plFlagsMarshal := plFlags is VarRef ? "int*" : "ptr"
        pcchBufMarshal := pcchBuf is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plFlagsMarshal, plFlags, pcchBufMarshal, pcchBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchMaxLock 
     * @param {Pointer<Pointer<CHAR>>} ppszBuf 
     * @param {Pointer<Integer>} pcchBuf 
     * @returns {HRESULT} 
     */
    LockBuf(cchOffset, cchMaxLock, ppszBuf, pcchBuf) {
        ppszBufMarshal := ppszBuf is VarRef ? "ptr*" : "ptr"
        pcchBufMarshal := pcchBuf is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", cchOffset, "int", cchMaxLock, ppszBufMarshal, ppszBuf, pcchBufMarshal, pcchBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszBuf 
     * @param {Integer} cchOffset 
     * @param {Integer} cchWrite 
     * @returns {HRESULT} 
     */
    UnlockBuf(pszBuf, cchOffset, cchWrite) {
        pszBuf := pszBuf is String ? StrPtr(pszBuf) : pszBuf

        result := ComCall(5, this, "ptr", pszBuf, "int", cchOffset, "int", cchWrite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchMaxInsert 
     * @returns {Integer} 
     */
    Insert(cchOffset, cchMaxInsert) {
        result := ComCall(6, this, "int", cchOffset, "int", cchMaxInsert, "int*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchDelete 
     * @returns {HRESULT} 
     */
    Delete(cchOffset, cchDelete) {
        result := ComCall(7, this, "int", cchOffset, "int", cchDelete, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLangStringBufA.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 3)
        this.vtbl.LockBuf := CallbackCreate(GetMethod(implObj, "LockBuf"), flags, 5)
        this.vtbl.UnlockBuf := CallbackCreate(GetMethod(implObj, "UnlockBuf"), flags, 4)
        this.vtbl.Insert := CallbackCreate(GetMethod(implObj, "Insert"), flags, 4)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.LockBuf)
        CallbackFree(this.vtbl.UnlockBuf)
        CallbackFree(this.vtbl.Insert)
        CallbackFree(this.vtbl.Delete)
    }
}

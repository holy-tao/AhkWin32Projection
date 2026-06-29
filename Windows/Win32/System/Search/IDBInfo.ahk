#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBLITERALINFO.ahk" { DBLITERALINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDBInfo extends IUnknown {
    /**
     * The interface identifier for IDBInfo
     * @type {Guid}
     */
    static IID := Guid("{0c733a89-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDBInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetKeywords    : IntPtr
        GetLiteralInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDBInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetKeywords() {
        result := ComCall(3, this, PWSTR.Ptr, &ppwszKeywords := 0, "HRESULT")
        return ppwszKeywords
    }

    /**
     * 
     * @param {Integer} cLiterals 
     * @param {Pointer<Integer>} rgLiterals 
     * @param {Pointer<Integer>} pcLiteralInfo 
     * @param {Pointer<Pointer<DBLITERALINFO>>} prgLiteralInfo 
     * @param {Pointer<Pointer<Integer>>} ppCharBuffer 
     * @returns {HRESULT} 
     */
    GetLiteralInfo(cLiterals, rgLiterals, pcLiteralInfo, prgLiteralInfo, ppCharBuffer) {
        rgLiteralsMarshal := rgLiterals is VarRef ? "uint*" : "ptr"
        pcLiteralInfoMarshal := pcLiteralInfo is VarRef ? "uint*" : "ptr"
        prgLiteralInfoMarshal := prgLiteralInfo is VarRef ? "ptr*" : "ptr"
        ppCharBufferMarshal := ppCharBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cLiterals, rgLiteralsMarshal, rgLiterals, pcLiteralInfoMarshal, pcLiteralInfo, prgLiteralInfoMarshal, prgLiteralInfo, ppCharBufferMarshal, ppCharBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDBInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetKeywords := CallbackCreate(GetMethod(implObj, "GetKeywords"), flags, 2)
        this.vtbl.GetLiteralInfo := CallbackCreate(GetMethod(implObj, "GetLiteralInfo"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetKeywords)
        CallbackFree(this.vtbl.GetLiteralInfo)
    }
}

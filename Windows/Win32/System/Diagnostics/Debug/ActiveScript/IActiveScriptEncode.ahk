#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptEncode extends IUnknown {
    /**
     * The interface identifier for IActiveScriptEncode
     * @type {Guid}
     */
    static IID := Guid("{bb1a2ae3-a4f9-11cf-8f20-00805f2cd064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptEncode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EncodeSection   : IntPtr
        DecodeScript    : IntPtr
        GetEncodeProgId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptEncode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pchIn 
     * @param {Integer} cchIn 
     * @param {PWSTR} pchOut 
     * @param {Integer} cchOut 
     * @param {Pointer<Integer>} pcchRet 
     * @returns {HRESULT} 
     */
    EncodeSection(pchIn, cchIn, pchOut, cchOut, pcchRet) {
        pchIn := pchIn is String ? StrPtr(pchIn) : pchIn
        pchOut := pchOut is String ? StrPtr(pchOut) : pchOut

        pcchRetMarshal := pcchRet is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pchIn, "uint", cchIn, "ptr", pchOut, "uint", cchOut, pcchRetMarshal, pcchRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchIn 
     * @param {Integer} cchIn 
     * @param {PWSTR} pchOut 
     * @param {Integer} cchOut 
     * @param {Pointer<Integer>} pcchRet 
     * @returns {HRESULT} 
     */
    DecodeScript(pchIn, cchIn, pchOut, cchOut, pcchRet) {
        pchIn := pchIn is String ? StrPtr(pchIn) : pchIn
        pchOut := pchOut is String ? StrPtr(pchOut) : pchOut

        pcchRetMarshal := pcchRet is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pchIn, "uint", cchIn, "ptr", pchOut, "uint", cchOut, pcchRetMarshal, pcchRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrOut 
     * @returns {HRESULT} 
     */
    GetEncodeProgId(pbstrOut) {
        result := ComCall(5, this, BSTR.Ptr, pbstrOut, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptEncode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EncodeSection := CallbackCreate(GetMethod(implObj, "EncodeSection"), flags, 6)
        this.vtbl.DecodeScript := CallbackCreate(GetMethod(implObj, "DecodeScript"), flags, 6)
        this.vtbl.GetEncodeProgId := CallbackCreate(GetMethod(implObj, "GetEncodeProgId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EncodeSection)
        CallbackFree(this.vtbl.DecodeScript)
        CallbackFree(this.vtbl.GetEncodeProgId)
    }
}

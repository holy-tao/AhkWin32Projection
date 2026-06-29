#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSAdminBase2W.ahk" { IMSAdminBase2W }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct IMSAdminBase3W extends IMSAdminBase2W {
    /**
     * The interface identifier for IMSAdminBase3W
     * @type {Guid}
     */
    static IID := Guid("{f612954d-3b0b-4c56-9563-227b7be624b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSAdminBase3W interfaces
    */
    struct Vtbl extends IMSAdminBase2W.Vtbl {
        GetChildPaths : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSAdminBase3W.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} cchMDBufferSize 
     * @param {PWSTR} pszBuffer 
     * @param {Pointer<Integer>} pcchMDRequiredBufferSize 
     * @returns {HRESULT} 
     */
    GetChildPaths(hMDHandle, pszMDPath, cchMDBufferSize, pszBuffer, pcchMDRequiredBufferSize) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        pcchMDRequiredBufferSizeMarshal := pcchMDRequiredBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, "uint", hMDHandle, "ptr", pszMDPath, "uint", cchMDBufferSize, "ptr", pszBuffer, pcchMDRequiredBufferSizeMarshal, pcchMDRequiredBufferSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSAdminBase3W.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetChildPaths := CallbackCreate(GetMethod(implObj, "GetChildPaths"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetChildPaths)
    }
}

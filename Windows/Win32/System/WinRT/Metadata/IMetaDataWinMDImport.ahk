#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMetaDataWinMDImport extends IUnknown {
    /**
     * The interface identifier for IMetaDataWinMDImport
     * @type {Guid}
     */
    static IID := Guid("{969ea0c5-964e-411b-a807-b0f3c2dfcbd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaDataWinMDImport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUntransformedTypeRefProps : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaDataWinMDImport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} tr 
     * @param {Pointer<Integer>} ptkResolutionScope 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @returns {HRESULT} 
     */
    GetUntransformedTypeRefProps(tr, ptkResolutionScope, szName, cchName, pchName) {
        szName := szName is String ? StrPtr(szName) : szName

        ptkResolutionScopeMarshal := ptkResolutionScope is VarRef ? "uint*" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", tr, ptkResolutionScopeMarshal, ptkResolutionScope, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMetaDataWinMDImport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUntransformedTypeRefProps := CallbackCreate(GetMethod(implObj, "GetUntransformedTypeRefProps"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUntransformedTypeRefProps)
    }
}

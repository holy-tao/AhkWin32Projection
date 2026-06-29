#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct IMSImpExpHelpW extends IUnknown {
    /**
     * The interface identifier for IMSImpExpHelpW
     * @type {Guid}
     */
    static IID := Guid("{29ff67ff-8050-480f-9f30-cc41635f2f9d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSImpExpHelpW interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumeratePathsInFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSImpExpHelpW.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {PWSTR} pszKeyType 
     * @param {Integer} dwMDBufferSize 
     * @param {PWSTR} pszBuffer 
     * @returns {Integer} 
     */
    EnumeratePathsInFile(pszFileName, pszKeyType, dwMDBufferSize, pszBuffer) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
        pszKeyType := pszKeyType is String ? StrPtr(pszKeyType) : pszKeyType
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(3, this, "ptr", pszFileName, "ptr", pszKeyType, "uint", dwMDBufferSize, "ptr", pszBuffer, "uint*", &pdwMDRequiredBufferSize := 0, "HRESULT")
        return pdwMDRequiredBufferSize
    }

    Query(iid) {
        if (IMSImpExpHelpW.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumeratePathsInFile := CallbackCreate(GetMethod(implObj, "EnumeratePathsInFile"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumeratePathsInFile)
    }
}

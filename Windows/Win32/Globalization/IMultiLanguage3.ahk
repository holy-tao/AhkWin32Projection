#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\System\Com\IStream.ahk" { IStream }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMultiLanguage2.ahk" { IMultiLanguage2 }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMultiLanguage3 extends IMultiLanguage2 {
    /**
     * The interface identifier for IMultiLanguage3
     * @type {Guid}
     */
    static IID := Guid("{4e5868ab-b157-4623-9acc-6a1d9caebe04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultiLanguage3 interfaces
    */
    struct Vtbl extends IMultiLanguage2.Vtbl {
        DetectOutboundCodePage          : IntPtr
        DetectOutboundCodePageInIStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultiLanguage3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpWideCharStr 
     * @param {Integer} cchWideChar 
     * @param {Pointer<Integer>} puiPreferredCodePages 
     * @param {Integer} nPreferredCodePages 
     * @param {Pointer<Integer>} pnDetectedCodePages 
     * @param {PWSTR} lpSpecialChar 
     * @returns {Integer} 
     */
    DetectOutboundCodePage(dwFlags, lpWideCharStr, cchWideChar, puiPreferredCodePages, nPreferredCodePages, pnDetectedCodePages, lpSpecialChar) {
        lpWideCharStr := lpWideCharStr is String ? StrPtr(lpWideCharStr) : lpWideCharStr
        lpSpecialChar := lpSpecialChar is String ? StrPtr(lpSpecialChar) : lpSpecialChar

        puiPreferredCodePagesMarshal := puiPreferredCodePages is VarRef ? "uint*" : "ptr"
        pnDetectedCodePagesMarshal := pnDetectedCodePages is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "uint", dwFlags, "ptr", lpWideCharStr, "uint", cchWideChar, puiPreferredCodePagesMarshal, puiPreferredCodePages, "uint", nPreferredCodePages, "uint*", &puiDetectedCodePages := 0, pnDetectedCodePagesMarshal, pnDetectedCodePages, "ptr", lpSpecialChar, "HRESULT")
        return puiDetectedCodePages
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IStream} pStrIn 
     * @param {Pointer<Integer>} puiPreferredCodePages 
     * @param {Integer} nPreferredCodePages 
     * @param {Pointer<Integer>} pnDetectedCodePages 
     * @param {PWSTR} lpSpecialChar 
     * @returns {Integer} 
     */
    DetectOutboundCodePageInIStream(dwFlags, pStrIn, puiPreferredCodePages, nPreferredCodePages, pnDetectedCodePages, lpSpecialChar) {
        lpSpecialChar := lpSpecialChar is String ? StrPtr(lpSpecialChar) : lpSpecialChar

        puiPreferredCodePagesMarshal := puiPreferredCodePages is VarRef ? "uint*" : "ptr"
        pnDetectedCodePagesMarshal := pnDetectedCodePages is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "uint", dwFlags, "ptr", pStrIn, puiPreferredCodePagesMarshal, puiPreferredCodePages, "uint", nPreferredCodePages, "uint*", &puiDetectedCodePages := 0, pnDetectedCodePagesMarshal, pnDetectedCodePages, "ptr", lpSpecialChar, "HRESULT")
        return puiDetectedCodePages
    }

    Query(iid) {
        if (IMultiLanguage3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DetectOutboundCodePage := CallbackCreate(GetMethod(implObj, "DetectOutboundCodePage"), flags, 9)
        this.vtbl.DetectOutboundCodePageInIStream := CallbackCreate(GetMethod(implObj, "DetectOutboundCodePageInIStream"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DetectOutboundCodePage)
        CallbackFree(this.vtbl.DetectOutboundCodePageInIStream)
    }
}

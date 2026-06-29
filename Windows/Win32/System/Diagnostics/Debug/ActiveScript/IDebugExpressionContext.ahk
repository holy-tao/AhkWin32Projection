#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugExpression.ahk" { IDebugExpression }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugExpressionContext extends IUnknown {
    /**
     * The interface identifier for IDebugExpressionContext
     * @type {Guid}
     */
    static IID := Guid("{51973c15-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugExpressionContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ParseLanguageText : IntPtr
        GetLanguageInfo   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugExpressionContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {Integer} nRadix 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwFlags 
     * @returns {IDebugExpression} 
     */
    ParseLanguageText(pstrCode, nRadix, pstrDelimiter, dwFlags) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        result := ComCall(3, this, "ptr", pstrCode, "uint", nRadix, "ptr", pstrDelimiter, "uint", dwFlags, "ptr*", &ppe := 0, "HRESULT")
        return IDebugExpression(ppe)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLanguageName 
     * @param {Pointer<Guid>} pLanguageID 
     * @returns {HRESULT} 
     */
    GetLanguageInfo(pbstrLanguageName, pLanguageID) {
        result := ComCall(4, this, BSTR.Ptr, pbstrLanguageName, Guid.Ptr, pLanguageID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugExpressionContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ParseLanguageText := CallbackCreate(GetMethod(implObj, "ParseLanguageText"), flags, 6)
        this.vtbl.GetLanguageInfo := CallbackCreate(GetMethod(implObj, "GetLanguageInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ParseLanguageText)
        CallbackFree(this.vtbl.GetLanguageInfo)
    }
}

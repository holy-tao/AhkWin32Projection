#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptParse32 extends IUnknown {
    /**
     * The interface identifier for IActiveScriptParse32
     * @type {Guid}
     */
    static IID := Guid("{bb1a2ae2-a4f9-11cf-8f20-00805f2cd064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptParse32 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitNew         : IntPtr
        AddScriptlet    : IntPtr
        ParseScriptText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptParse32.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitNew() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrDefaultName 
     * @param {PWSTR} pstrCode 
     * @param {PWSTR} pstrItemName 
     * @param {PWSTR} pstrSubItemName 
     * @param {PWSTR} pstrEventName 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwSourceContextCookie 
     * @param {Integer} ulStartingLineNumber 
     * @param {Integer} dwFlags 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @returns {HRESULT} 
     */
    AddScriptlet(pstrDefaultName, pstrCode, pstrItemName, pstrSubItemName, pstrEventName, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, pbstrName, pexcepinfo) {
        pstrDefaultName := pstrDefaultName is String ? StrPtr(pstrDefaultName) : pstrDefaultName
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrItemName := pstrItemName is String ? StrPtr(pstrItemName) : pstrItemName
        pstrSubItemName := pstrSubItemName is String ? StrPtr(pstrSubItemName) : pstrSubItemName
        pstrEventName := pstrEventName is String ? StrPtr(pstrEventName) : pstrEventName
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        result := ComCall(4, this, "ptr", pstrDefaultName, "ptr", pstrCode, "ptr", pstrItemName, "ptr", pstrSubItemName, "ptr", pstrEventName, "ptr", pstrDelimiter, "uint", dwSourceContextCookie, "uint", ulStartingLineNumber, "uint", dwFlags, BSTR.Ptr, pbstrName, EXCEPINFO.Ptr, pexcepinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {PWSTR} pstrItemName 
     * @param {IUnknown} punkContext 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwSourceContextCookie 
     * @param {Integer} ulStartingLineNumber 
     * @param {Integer} dwFlags 
     * @param {Pointer<VARIANT>} pvarResult 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @returns {HRESULT} 
     */
    ParseScriptText(pstrCode, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, pvarResult, pexcepinfo) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrItemName := pstrItemName is String ? StrPtr(pstrItemName) : pstrItemName
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        result := ComCall(5, this, "ptr", pstrCode, "ptr", pstrItemName, "ptr", punkContext, "ptr", pstrDelimiter, "uint", dwSourceContextCookie, "uint", ulStartingLineNumber, "uint", dwFlags, VARIANT.Ptr, pvarResult, EXCEPINFO.Ptr, pexcepinfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptParse32.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitNew := CallbackCreate(GetMethod(implObj, "InitNew"), flags, 1)
        this.vtbl.AddScriptlet := CallbackCreate(GetMethod(implObj, "AddScriptlet"), flags, 12)
        this.vtbl.ParseScriptText := CallbackCreate(GetMethod(implObj, "ParseScriptText"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitNew)
        CallbackFree(this.vtbl.AddScriptlet)
        CallbackFree(this.vtbl.ParseScriptText)
    }
}

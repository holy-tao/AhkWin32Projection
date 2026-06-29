#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IEnumDebugCodeContexts.ahk" { IEnumDebugCodeContexts }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptDebug64 extends IUnknown {
    /**
     * The interface identifier for IActiveScriptDebug64
     * @type {Guid}
     */
    static IID := Guid("{bc437e23-f5b8-47f4-bb79-7d1ce5483b86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptDebug64 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetScriptTextAttributes    : IntPtr
        GetScriptletTextAttributes : IntPtr
        EnumCodeContextsOfPosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptDebug64.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {Integer} uNumCodeChars 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pattr 
     * @returns {HRESULT} 
     */
    GetScriptTextAttributes(pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        pattrMarshal := pattr is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ptr", pstrCode, "uint", uNumCodeChars, "ptr", pstrDelimiter, "uint", dwFlags, pattrMarshal, pattr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {Integer} uNumCodeChars 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pattr 
     * @returns {HRESULT} 
     */
    GetScriptletTextAttributes(pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        pattrMarshal := pattr is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "ptr", pstrCode, "uint", uNumCodeChars, "ptr", pstrDelimiter, "uint", dwFlags, pattrMarshal, pattr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceContext 
     * @param {Integer} uCharacterOffset 
     * @param {Integer} uNumChars 
     * @returns {IEnumDebugCodeContexts} 
     */
    EnumCodeContextsOfPosition(dwSourceContext, uCharacterOffset, uNumChars) {
        result := ComCall(5, this, "uint", dwSourceContext, "uint", uCharacterOffset, "uint", uNumChars, "ptr*", &ppescc := 0, "HRESULT")
        return IEnumDebugCodeContexts(ppescc)
    }

    Query(iid) {
        if (IActiveScriptDebug64.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetScriptTextAttributes := CallbackCreate(GetMethod(implObj, "GetScriptTextAttributes"), flags, 6)
        this.vtbl.GetScriptletTextAttributes := CallbackCreate(GetMethod(implObj, "GetScriptletTextAttributes"), flags, 6)
        this.vtbl.EnumCodeContextsOfPosition := CallbackCreate(GetMethod(implObj, "EnumCodeContextsOfPosition"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetScriptTextAttributes)
        CallbackFree(this.vtbl.GetScriptletTextAttributes)
        CallbackFree(this.vtbl.EnumCodeContextsOfPosition)
    }
}

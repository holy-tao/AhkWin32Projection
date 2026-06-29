#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugDocumentHost extends IUnknown {
    /**
     * The interface identifier for IDebugDocumentHost
     * @type {Guid}
     */
    static IID := Guid("{51973c27-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDocumentHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDeferredText         : IntPtr
        GetScriptTextAttributes : IntPtr
        OnCreateDocumentContext : IntPtr
        GetPathName             : IntPtr
        GetFileName             : IntPtr
        NotifyChanged           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDocumentHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwTextStartCookie 
     * @param {PWSTR} pcharText 
     * @param {Pointer<Integer>} pstaTextAttr 
     * @param {Pointer<Integer>} pcNumChars 
     * @param {Integer} cMaxChars 
     * @returns {HRESULT} 
     */
    GetDeferredText(dwTextStartCookie, pcharText, pstaTextAttr, pcNumChars, cMaxChars) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        pstaTextAttrMarshal := pstaTextAttr is VarRef ? "ushort*" : "ptr"
        pcNumCharsMarshal := pcNumChars is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwTextStartCookie, "ptr", pcharText, pstaTextAttrMarshal, pstaTextAttr, pcNumCharsMarshal, pcNumChars, "uint", cMaxChars, "HRESULT")
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
    GetScriptTextAttributes(pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        pattrMarshal := pattr is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "ptr", pstrCode, "uint", uNumCodeChars, "ptr", pstrDelimiter, "uint", dwFlags, pattrMarshal, pattr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    OnCreateDocumentContext() {
        result := ComCall(5, this, "ptr*", &ppunkOuter := 0, "HRESULT")
        return IUnknown(ppunkOuter)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLongName 
     * @param {Pointer<BOOL>} pfIsOriginalFile 
     * @returns {HRESULT} 
     */
    GetPathName(pbstrLongName, pfIsOriginalFile) {
        pfIsOriginalFileMarshal := pfIsOriginalFile is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, BSTR.Ptr, pbstrLongName, pfIsOriginalFileMarshal, pfIsOriginalFile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetFileName() {
        pbstrShortName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrShortName, "HRESULT")
        return pbstrShortName
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyChanged() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugDocumentHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeferredText := CallbackCreate(GetMethod(implObj, "GetDeferredText"), flags, 6)
        this.vtbl.GetScriptTextAttributes := CallbackCreate(GetMethod(implObj, "GetScriptTextAttributes"), flags, 6)
        this.vtbl.OnCreateDocumentContext := CallbackCreate(GetMethod(implObj, "OnCreateDocumentContext"), flags, 2)
        this.vtbl.GetPathName := CallbackCreate(GetMethod(implObj, "GetPathName"), flags, 3)
        this.vtbl.GetFileName := CallbackCreate(GetMethod(implObj, "GetFileName"), flags, 2)
        this.vtbl.NotifyChanged := CallbackCreate(GetMethod(implObj, "NotifyChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeferredText)
        CallbackFree(this.vtbl.GetScriptTextAttributes)
        CallbackFree(this.vtbl.OnCreateDocumentContext)
        CallbackFree(this.vtbl.GetPathName)
        CallbackFree(this.vtbl.GetFileName)
        CallbackFree(this.vtbl.NotifyChanged)
    }
}

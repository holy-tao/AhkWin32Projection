#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\ITypeInfo.ahk" { ITypeInfo }
#Import ".\IScriptEntry.ahk" { IScriptEntry }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IScriptNode extends IUnknown {
    /**
     * The interface identifier for IScriptNode
     * @type {Guid}
     */
    static IID := Guid("{0aee2a94-bcbb-11d0-8c72-00c04fc2b085}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScriptNode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Alive               : IntPtr
        Delete              : IntPtr
        GetParent           : IntPtr
        GetIndexInParent    : IntPtr
        GetCookie           : IntPtr
        GetNumberOfChildren : IntPtr
        GetChild            : IntPtr
        GetLanguage         : IntPtr
        CreateChildEntry    : IntPtr
        CreateChildHandler  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScriptNode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Alive() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @returns {IScriptNode} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(5, this, "ptr*", &ppsnParent := 0, "HRESULT")
        return IScriptNode(ppsnParent)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetIndexInParent() {
        result := ComCall(6, this, "uint*", &pisn := 0, "HRESULT")
        return pisn
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCookie() {
        result := ComCall(7, this, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberOfChildren() {
        result := ComCall(8, this, "uint*", &pcsn := 0, "HRESULT")
        return pcsn
    }

    /**
     * 
     * @param {Integer} isn 
     * @returns {IScriptNode} 
     */
    GetChild(isn) {
        result := ComCall(9, this, "uint", isn, "ptr*", &ppsn := 0, "HRESULT")
        return IScriptNode(ppsn)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetLanguage() {
        pbstr := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {Integer} isn 
     * @param {Integer} dwCookie 
     * @param {PWSTR} pszDelimiter 
     * @returns {IScriptEntry} 
     */
    CreateChildEntry(isn, dwCookie, pszDelimiter) {
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        result := ComCall(11, this, "uint", isn, "uint", dwCookie, "ptr", pszDelimiter, "ptr*", &ppse := 0, "HRESULT")
        return IScriptEntry(ppse)
    }

    /**
     * 
     * @param {PWSTR} pszDefaultName 
     * @param {Pointer<PWSTR>} prgpszNames 
     * @param {Integer} cpszNames 
     * @param {PWSTR} pszEvent 
     * @param {PWSTR} pszDelimiter 
     * @param {ITypeInfo} ptiSignature 
     * @param {Integer} iMethodSignature 
     * @param {Integer} isn 
     * @param {Integer} dwCookie 
     * @returns {IScriptEntry} 
     */
    CreateChildHandler(pszDefaultName, prgpszNames, cpszNames, pszEvent, pszDelimiter, ptiSignature, iMethodSignature, isn, dwCookie) {
        pszDefaultName := pszDefaultName is String ? StrPtr(pszDefaultName) : pszDefaultName
        pszEvent := pszEvent is String ? StrPtr(pszEvent) : pszEvent
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        prgpszNamesMarshal := prgpszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "ptr", pszDefaultName, prgpszNamesMarshal, prgpszNames, "uint", cpszNames, "ptr", pszEvent, "ptr", pszDelimiter, "ptr", ptiSignature, "uint", iMethodSignature, "uint", isn, "uint", dwCookie, "ptr*", &ppse := 0, "HRESULT")
        return IScriptEntry(ppse)
    }

    Query(iid) {
        if (IScriptNode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Alive := CallbackCreate(GetMethod(implObj, "Alive"), flags, 1)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.GetParent := CallbackCreate(GetMethod(implObj, "GetParent"), flags, 2)
        this.vtbl.GetIndexInParent := CallbackCreate(GetMethod(implObj, "GetIndexInParent"), flags, 2)
        this.vtbl.GetCookie := CallbackCreate(GetMethod(implObj, "GetCookie"), flags, 2)
        this.vtbl.GetNumberOfChildren := CallbackCreate(GetMethod(implObj, "GetNumberOfChildren"), flags, 2)
        this.vtbl.GetChild := CallbackCreate(GetMethod(implObj, "GetChild"), flags, 3)
        this.vtbl.GetLanguage := CallbackCreate(GetMethod(implObj, "GetLanguage"), flags, 2)
        this.vtbl.CreateChildEntry := CallbackCreate(GetMethod(implObj, "CreateChildEntry"), flags, 5)
        this.vtbl.CreateChildHandler := CallbackCreate(GetMethod(implObj, "CreateChildHandler"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Alive)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.GetParent)
        CallbackFree(this.vtbl.GetIndexInParent)
        CallbackFree(this.vtbl.GetCookie)
        CallbackFree(this.vtbl.GetNumberOfChildren)
        CallbackFree(this.vtbl.GetChild)
        CallbackFree(this.vtbl.GetLanguage)
        CallbackFree(this.vtbl.CreateChildEntry)
        CallbackFree(this.vtbl.CreateChildHandler)
    }
}

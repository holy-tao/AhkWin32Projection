#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IScriptEntry.ahk" { IScriptEntry }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IScriptNode.ahk" { IScriptNode }
#Import "..\..\..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptAuthor extends IUnknown {
    /**
     * The interface identifier for IActiveScriptAuthor
     * @type {Guid}
     */
    static IID := Guid("{9c109da0-7006-11d1-b36c-00a0c911e8b2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptAuthor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddNamedItem               : IntPtr
        AddScriptlet               : IntPtr
        ParseScriptText            : IntPtr
        GetScriptTextAttributes    : IntPtr
        GetScriptletTextAttributes : IntPtr
        GetRoot                    : IntPtr
        GetLanguageFlags           : IntPtr
        GetEventHandler            : IntPtr
        RemoveNamedItem            : IntPtr
        AddTypeLib                 : IntPtr
        RemoveTypeLib              : IntPtr
        GetChars                   : IntPtr
        GetInfoFromContext         : IntPtr
        IsCommitChar               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptAuthor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} dwFlags 
     * @param {IDispatch} pdisp 
     * @returns {HRESULT} 
     */
    AddNamedItem(pszName, dwFlags, pdisp) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "uint", dwFlags, "ptr", pdisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDefaultName 
     * @param {PWSTR} pszCode 
     * @param {PWSTR} pszItemName 
     * @param {PWSTR} pszSubItemName 
     * @param {PWSTR} pszEventName 
     * @param {PWSTR} pszDelimiter 
     * @param {Integer} dwCookie 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddScriptlet(pszDefaultName, pszCode, pszItemName, pszSubItemName, pszEventName, pszDelimiter, dwCookie, dwFlags) {
        pszDefaultName := pszDefaultName is String ? StrPtr(pszDefaultName) : pszDefaultName
        pszCode := pszCode is String ? StrPtr(pszCode) : pszCode
        pszItemName := pszItemName is String ? StrPtr(pszItemName) : pszItemName
        pszSubItemName := pszSubItemName is String ? StrPtr(pszSubItemName) : pszSubItemName
        pszEventName := pszEventName is String ? StrPtr(pszEventName) : pszEventName
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        result := ComCall(4, this, "ptr", pszDefaultName, "ptr", pszCode, "ptr", pszItemName, "ptr", pszSubItemName, "ptr", pszEventName, "ptr", pszDelimiter, "uint", dwCookie, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszCode 
     * @param {PWSTR} pszItemName 
     * @param {PWSTR} pszDelimiter 
     * @param {Integer} dwCookie 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    ParseScriptText(pszCode, pszItemName, pszDelimiter, dwCookie, dwFlags) {
        pszCode := pszCode is String ? StrPtr(pszCode) : pszCode
        pszItemName := pszItemName is String ? StrPtr(pszItemName) : pszItemName
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        result := ComCall(5, this, "ptr", pszCode, "ptr", pszItemName, "ptr", pszDelimiter, "uint", dwCookie, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszCode 
     * @param {Integer} cch 
     * @param {PWSTR} pszDelimiter 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pattr 
     * @returns {HRESULT} 
     */
    GetScriptTextAttributes(pszCode, cch, pszDelimiter, dwFlags, pattr) {
        pszCode := pszCode is String ? StrPtr(pszCode) : pszCode
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        pattrMarshal := pattr is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ptr", pszCode, "uint", cch, "ptr", pszDelimiter, "uint", dwFlags, pattrMarshal, pattr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszCode 
     * @param {Integer} cch 
     * @param {PWSTR} pszDelimiter 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pattr 
     * @returns {HRESULT} 
     */
    GetScriptletTextAttributes(pszCode, cch, pszDelimiter, dwFlags, pattr) {
        pszCode := pszCode is String ? StrPtr(pszCode) : pszCode
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        pattrMarshal := pattr is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "ptr", pszCode, "uint", cch, "ptr", pszDelimiter, "uint", dwFlags, pattrMarshal, pattr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IScriptNode} 
     */
    GetRoot() {
        result := ComCall(8, this, "ptr*", &ppsp := 0, "HRESULT")
        return IScriptNode(ppsp)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLanguageFlags() {
        result := ComCall(9, this, "uint*", &pgrfasa := 0, "HRESULT")
        return pgrfasa
    }

    /**
     * 
     * @param {IDispatch} pdisp 
     * @param {PWSTR} pszItem 
     * @param {PWSTR} pszSubItem 
     * @param {PWSTR} pszEvent 
     * @returns {IScriptEntry} 
     */
    GetEventHandler(pdisp, pszItem, pszSubItem, pszEvent) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem
        pszSubItem := pszSubItem is String ? StrPtr(pszSubItem) : pszSubItem
        pszEvent := pszEvent is String ? StrPtr(pszEvent) : pszEvent

        result := ComCall(10, this, "ptr", pdisp, "ptr", pszItem, "ptr", pszSubItem, "ptr", pszEvent, "ptr*", &ppse := 0, "HRESULT")
        return IScriptEntry(ppse)
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    RemoveNamedItem(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(11, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidTypeLib 
     * @param {Integer} dwMajor 
     * @param {Integer} dwMinor 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddTypeLib(rguidTypeLib, dwMajor, dwMinor, dwFlags) {
        result := ComCall(12, this, Guid.Ptr, rguidTypeLib, "uint", dwMajor, "uint", dwMinor, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidTypeLib 
     * @param {Integer} dwMajor 
     * @param {Integer} dwMinor 
     * @returns {HRESULT} 
     */
    RemoveTypeLib(rguidTypeLib, dwMajor, dwMinor) {
        result := ComCall(13, this, Guid.Ptr, rguidTypeLib, "uint", dwMajor, "uint", dwMinor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fRequestedList 
     * @returns {BSTR} 
     */
    GetChars(fRequestedList) {
        pbstrChars := BSTR.Owned()
        result := ComCall(14, this, "uint", fRequestedList, BSTR.Ptr, pbstrChars, "HRESULT")
        return pbstrChars
    }

    /**
     * 
     * @param {PWSTR} pszCode 
     * @param {Integer} cchCode 
     * @param {Integer} ichCurrentPosition 
     * @param {Integer} dwListTypesRequested 
     * @param {Pointer<Integer>} pdwListTypesProvided 
     * @param {Pointer<Integer>} pichListAnchorPosition 
     * @param {Pointer<Integer>} pichFuncAnchorPosition 
     * @param {Pointer<Integer>} pmemid 
     * @param {Pointer<Integer>} piCurrentParameter 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetInfoFromContext(pszCode, cchCode, ichCurrentPosition, dwListTypesRequested, pdwListTypesProvided, pichListAnchorPosition, pichFuncAnchorPosition, pmemid, piCurrentParameter, ppunk) {
        pszCode := pszCode is String ? StrPtr(pszCode) : pszCode

        pdwListTypesProvidedMarshal := pdwListTypesProvided is VarRef ? "uint*" : "ptr"
        pichListAnchorPositionMarshal := pichListAnchorPosition is VarRef ? "uint*" : "ptr"
        pichFuncAnchorPositionMarshal := pichFuncAnchorPosition is VarRef ? "uint*" : "ptr"
        pmemidMarshal := pmemid is VarRef ? "int*" : "ptr"
        piCurrentParameterMarshal := piCurrentParameter is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "ptr", pszCode, "uint", cchCode, "uint", ichCurrentPosition, "uint", dwListTypesRequested, pdwListTypesProvidedMarshal, pdwListTypesProvided, pichListAnchorPositionMarshal, pichListAnchorPosition, pichFuncAnchorPositionMarshal, pichFuncAnchorPosition, pmemidMarshal, pmemid, piCurrentParameterMarshal, piCurrentParameter, IUnknown.Ptr, ppunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ch 
     * @returns {BOOL} 
     */
    IsCommitChar(ch) {
        result := ComCall(16, this, "char", ch, BOOL.Ptr, &pfcommit := 0, "HRESULT")
        return pfcommit
    }

    Query(iid) {
        if (IActiveScriptAuthor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddNamedItem := CallbackCreate(GetMethod(implObj, "AddNamedItem"), flags, 4)
        this.vtbl.AddScriptlet := CallbackCreate(GetMethod(implObj, "AddScriptlet"), flags, 9)
        this.vtbl.ParseScriptText := CallbackCreate(GetMethod(implObj, "ParseScriptText"), flags, 6)
        this.vtbl.GetScriptTextAttributes := CallbackCreate(GetMethod(implObj, "GetScriptTextAttributes"), flags, 6)
        this.vtbl.GetScriptletTextAttributes := CallbackCreate(GetMethod(implObj, "GetScriptletTextAttributes"), flags, 6)
        this.vtbl.GetRoot := CallbackCreate(GetMethod(implObj, "GetRoot"), flags, 2)
        this.vtbl.GetLanguageFlags := CallbackCreate(GetMethod(implObj, "GetLanguageFlags"), flags, 2)
        this.vtbl.GetEventHandler := CallbackCreate(GetMethod(implObj, "GetEventHandler"), flags, 6)
        this.vtbl.RemoveNamedItem := CallbackCreate(GetMethod(implObj, "RemoveNamedItem"), flags, 2)
        this.vtbl.AddTypeLib := CallbackCreate(GetMethod(implObj, "AddTypeLib"), flags, 5)
        this.vtbl.RemoveTypeLib := CallbackCreate(GetMethod(implObj, "RemoveTypeLib"), flags, 4)
        this.vtbl.GetChars := CallbackCreate(GetMethod(implObj, "GetChars"), flags, 3)
        this.vtbl.GetInfoFromContext := CallbackCreate(GetMethod(implObj, "GetInfoFromContext"), flags, 11)
        this.vtbl.IsCommitChar := CallbackCreate(GetMethod(implObj, "IsCommitChar"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddNamedItem)
        CallbackFree(this.vtbl.AddScriptlet)
        CallbackFree(this.vtbl.ParseScriptText)
        CallbackFree(this.vtbl.GetScriptTextAttributes)
        CallbackFree(this.vtbl.GetScriptletTextAttributes)
        CallbackFree(this.vtbl.GetRoot)
        CallbackFree(this.vtbl.GetLanguageFlags)
        CallbackFree(this.vtbl.GetEventHandler)
        CallbackFree(this.vtbl.RemoveNamedItem)
        CallbackFree(this.vtbl.AddTypeLib)
        CallbackFree(this.vtbl.RemoveTypeLib)
        CallbackFree(this.vtbl.GetChars)
        CallbackFree(this.vtbl.GetInfoFromContext)
        CallbackFree(this.vtbl.IsCommitChar)
    }
}

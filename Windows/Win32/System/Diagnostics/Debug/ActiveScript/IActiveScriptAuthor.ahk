#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptAuthor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptAuthor
     * @type {Guid}
     */
    static IID => Guid("{9c109da0-7006-11d1-b36c-00a0c911e8b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddNamedItem", "AddScriptlet", "ParseScriptText", "GetScriptTextAttributes", "GetScriptletTextAttributes", "GetRoot", "GetLanguageFlags", "GetEventHandler", "RemoveNamedItem", "AddTypeLib", "RemoveTypeLib", "GetChars", "GetInfoFromContext", "IsCommitChar"]

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
     * @param {Pointer<IScriptNode>} ppsp 
     * @returns {HRESULT} 
     */
    GetRoot(ppsp) {
        result := ComCall(8, this, "ptr*", ppsp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pgrfasa 
     * @returns {HRESULT} 
     */
    GetLanguageFlags(pgrfasa) {
        pgrfasaMarshal := pgrfasa is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pgrfasaMarshal, pgrfasa, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pdisp 
     * @param {PWSTR} pszItem 
     * @param {PWSTR} pszSubItem 
     * @param {PWSTR} pszEvent 
     * @param {Pointer<IScriptEntry>} ppse 
     * @returns {HRESULT} 
     */
    GetEventHandler(pdisp, pszItem, pszSubItem, pszEvent, ppse) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem
        pszSubItem := pszSubItem is String ? StrPtr(pszSubItem) : pszSubItem
        pszEvent := pszEvent is String ? StrPtr(pszEvent) : pszEvent

        result := ComCall(10, this, "ptr", pdisp, "ptr", pszItem, "ptr", pszSubItem, "ptr", pszEvent, "ptr*", ppse, "HRESULT")
        return result
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
        result := ComCall(12, this, "ptr", rguidTypeLib, "uint", dwMajor, "uint", dwMinor, "uint", dwFlags, "HRESULT")
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
        result := ComCall(13, this, "ptr", rguidTypeLib, "uint", dwMajor, "uint", dwMinor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fRequestedList 
     * @param {Pointer<BSTR>} pbstrChars 
     * @returns {HRESULT} 
     */
    GetChars(fRequestedList, pbstrChars) {
        result := ComCall(14, this, "uint", fRequestedList, "ptr", pbstrChars, "HRESULT")
        return result
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

        result := ComCall(15, this, "ptr", pszCode, "uint", cchCode, "uint", ichCurrentPosition, "uint", dwListTypesRequested, pdwListTypesProvidedMarshal, pdwListTypesProvided, pichListAnchorPositionMarshal, pichListAnchorPosition, pichFuncAnchorPositionMarshal, pichFuncAnchorPosition, pmemidMarshal, pmemid, piCurrentParameterMarshal, piCurrentParameter, "ptr*", ppunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ch 
     * @param {Pointer<BOOL>} pfcommit 
     * @returns {HRESULT} 
     */
    IsCommitChar(ch, pfcommit) {
        result := ComCall(16, this, "char", ch, "ptr", pfcommit, "HRESULT")
        return result
    }
}

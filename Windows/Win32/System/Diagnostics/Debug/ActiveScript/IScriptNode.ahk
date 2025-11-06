#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IScriptNode.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IScriptEntry.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IScriptNode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScriptNode
     * @type {Guid}
     */
    static IID => Guid("{0aee2a94-bcbb-11d0-8c72-00c04fc2b085}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Alive", "Delete", "GetParent", "GetIndexInParent", "GetCookie", "GetNumberOfChildren", "GetChild", "GetLanguage", "CreateChildEntry", "CreateChildHandler"]

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
     * @returns {IScriptNode} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
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
        pbstr := BSTR()
        result := ComCall(10, this, "ptr", pbstr, "HRESULT")
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
}

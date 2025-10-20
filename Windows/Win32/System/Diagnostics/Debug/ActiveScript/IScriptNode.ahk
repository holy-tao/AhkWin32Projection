#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<IScriptNode>} ppsnParent 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the window is a child window, the return value is a handle to the parent window. If the window is a top-level window with the <b>WS_POPUP</b> style, the return value is a handle to the owner window. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * This function typically fails for one of the following reasons:
     * 
     * 
     * <ul>
     * <li>The window is a top-level window that is unowned or does not have the <b>WS_POPUP</b> style. </li>
     * <li>The owner window has <b>WS_POPUP</b> style.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent(ppsnParent) {
        result := ComCall(5, this, "ptr*", ppsnParent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pisn 
     * @returns {HRESULT} 
     */
    GetIndexInParent(pisn) {
        result := ComCall(6, this, "uint*", pisn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     */
    GetCookie(pdwCookie) {
        result := ComCall(7, this, "uint*", pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcsn 
     * @returns {HRESULT} 
     */
    GetNumberOfChildren(pcsn) {
        result := ComCall(8, this, "uint*", pcsn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} isn 
     * @param {Pointer<IScriptNode>} ppsn 
     * @returns {HRESULT} 
     */
    GetChild(isn, ppsn) {
        result := ComCall(9, this, "uint", isn, "ptr*", ppsn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetLanguage(pbstr) {
        result := ComCall(10, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} isn 
     * @param {Integer} dwCookie 
     * @param {PWSTR} pszDelimiter 
     * @param {Pointer<IScriptEntry>} ppse 
     * @returns {HRESULT} 
     */
    CreateChildEntry(isn, dwCookie, pszDelimiter, ppse) {
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        result := ComCall(11, this, "uint", isn, "uint", dwCookie, "ptr", pszDelimiter, "ptr*", ppse, "HRESULT")
        return result
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
     * @param {Pointer<IScriptEntry>} ppse 
     * @returns {HRESULT} 
     */
    CreateChildHandler(pszDefaultName, prgpszNames, cpszNames, pszEvent, pszDelimiter, ptiSignature, iMethodSignature, isn, dwCookie, ppse) {
        pszDefaultName := pszDefaultName is String ? StrPtr(pszDefaultName) : pszDefaultName
        pszEvent := pszEvent is String ? StrPtr(pszEvent) : pszEvent
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        result := ComCall(12, this, "ptr", pszDefaultName, "ptr", prgpszNames, "uint", cpszNames, "ptr", pszEvent, "ptr", pszDelimiter, "ptr", ptiSignature, "uint", iMethodSignature, "uint", isn, "uint", dwCookie, "ptr*", ppse, "HRESULT")
        return result
    }
}

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
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @returns {IScriptNode} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(5, this, "ptr*", &ppsnParent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IScriptNode(ppsnParent)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetIndexInParent() {
        result := ComCall(6, this, "uint*", &pisn := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pisn
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCookie() {
        result := ComCall(7, this, "uint*", &pdwCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCookie
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberOfChildren() {
        result := ComCall(8, this, "uint*", &pcsn := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcsn
    }

    /**
     * GetChildren Method (ADO)
     * @remarks
     * The provider determines what columns exist in the returned **Recordset**. For example, a document source provider always returns a resource **Recordset**.
     * @param {Integer} isn 
     * @returns {IScriptNode} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getchildren-method-ado
     */
    GetChild(isn) {
        result := ComCall(9, this, "uint", isn, "ptr*", &ppsn := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IScriptNode(ppsn)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetLanguage() {
        pbstr := BSTR()
        result := ComCall(10, this, "ptr", pbstr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(11, this, "uint", isn, "uint", dwCookie, "ptr", pszDelimiter, "ptr*", &ppse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(12, this, "ptr", pszDefaultName, prgpszNamesMarshal, prgpszNames, "uint", cpszNames, "ptr", pszEvent, "ptr", pszDelimiter, "ptr", ptiSignature, "uint", iMethodSignature, "uint", isn, "uint", dwCookie, "ptr*", &ppse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IScriptEntry(ppse)
    }
}

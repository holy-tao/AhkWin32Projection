#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 * @charset ANSI
 */
class IMLangStringBufA extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangStringBufA
     * @type {Guid}
     */
    static IID => Guid("{d24acd23-ba72-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "LockBuf", "UnlockBuf", "Insert", "Delete"]

    /**
     * 
     * @param {Pointer<Integer>} plFlags 
     * @param {Pointer<Integer>} pcchBuf 
     * @returns {HRESULT} 
     */
    GetStatus(plFlags, pcchBuf) {
        plFlagsMarshal := plFlags is VarRef ? "int*" : "ptr"
        pcchBufMarshal := pcchBuf is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plFlagsMarshal, plFlags, pcchBufMarshal, pcchBuf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchMaxLock 
     * @param {Pointer<Pointer<CHAR>>} ppszBuf 
     * @param {Pointer<Integer>} pcchBuf 
     * @returns {HRESULT} 
     */
    LockBuf(cchOffset, cchMaxLock, ppszBuf, pcchBuf) {
        ppszBufMarshal := ppszBuf is VarRef ? "ptr*" : "ptr"
        pcchBufMarshal := pcchBuf is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", cchOffset, "int", cchMaxLock, ppszBufMarshal, ppszBuf, pcchBufMarshal, pcchBuf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} pszBuf 
     * @param {Integer} cchOffset 
     * @param {Integer} cchWrite 
     * @returns {HRESULT} 
     */
    UnlockBuf(pszBuf, cchOffset, cchWrite) {
        pszBuf := pszBuf is String ? StrPtr(pszBuf) : pszBuf

        result := ComCall(5, this, "ptr", pszBuf, "int", cchOffset, "int", cchWrite, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Inserts a file into the cache.
     * @param {Integer} cchOffset 
     * @param {Integer} cchMaxInsert 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/filehc/nf-filehc-insertfile
     */
    Insert(cchOffset, cchMaxInsert) {
        result := ComCall(6, this, "int", cchOffset, "int", cchMaxInsert, "int*", &pcchActual := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcchActual
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @param {Integer} cchOffset 
     * @param {Integer} cchDelete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete(cchOffset, cchDelete) {
        result := ComCall(7, this, "int", cchOffset, "int", cchDelete, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

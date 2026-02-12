#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IBindResource.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IScopedOperations extends IBindResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScopedOperations
     * @type {Guid}
     */
    static IID => Guid("{0c733ab0-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Copy", "Move", "Delete", "OpenRowset"]

    /**
     * Describes the four steps to take to copy and paste a formula from one cell into another using CTRL+C and CTRL+V.
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszSourceURLs 
     * @param {Pointer<PWSTR>} rgpwszDestURLs 
     * @param {Integer} dwCopyFlags 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<Integer>} rgdwStatus 
     * @param {Pointer<PWSTR>} rgpwszNewURLs 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/copy-and-paste-a-formula-from-one-cell-into-another
     */
    Copy(cRows, rgpwszSourceURLs, rgpwszDestURLs, dwCopyFlags, pAuthenticate, rgdwStatus, rgpwszNewURLs, ppStringsBuffer) {
        rgpwszSourceURLsMarshal := rgpwszSourceURLs is VarRef ? "ptr*" : "ptr"
        rgpwszDestURLsMarshal := rgpwszDestURLs is VarRef ? "ptr*" : "ptr"
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"
        rgpwszNewURLsMarshal := rgpwszNewURLs is VarRef ? "ptr*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", cRows, rgpwszSourceURLsMarshal, rgpwszSourceURLs, rgpwszDestURLsMarshal, rgpwszDestURLs, "uint", dwCopyFlags, "ptr", pAuthenticate, rgdwStatusMarshal, rgdwStatus, rgpwszNewURLsMarshal, rgpwszNewURLs, ppStringsBufferMarshal, ppStringsBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Move Method Example (VC++)
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszSourceURLs 
     * @param {Pointer<PWSTR>} rgpwszDestURLs 
     * @param {Integer} dwMoveFlags 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<Integer>} rgdwStatus 
     * @param {Pointer<PWSTR>} rgpwszNewURLs 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/move-method-example-vc
     */
    Move(cRows, rgpwszSourceURLs, rgpwszDestURLs, dwMoveFlags, pAuthenticate, rgdwStatus, rgpwszNewURLs, ppStringsBuffer) {
        rgpwszSourceURLsMarshal := rgpwszSourceURLs is VarRef ? "ptr*" : "ptr"
        rgpwszDestURLsMarshal := rgpwszDestURLs is VarRef ? "ptr*" : "ptr"
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"
        rgpwszNewURLsMarshal := rgpwszNewURLs is VarRef ? "ptr*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", cRows, rgpwszSourceURLsMarshal, rgpwszSourceURLs, rgpwszDestURLsMarshal, rgpwszDestURLs, "uint", dwMoveFlags, "ptr", pAuthenticate, rgdwStatusMarshal, rgdwStatus, rgpwszNewURLsMarshal, rgpwszNewURLs, ppStringsBufferMarshal, ppStringsBuffer, "int")
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
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszURLs 
     * @param {Integer} dwDeleteFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete(cRows, rgpwszURLs, dwDeleteFlags) {
        rgpwszURLsMarshal := rgpwszURLs is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", cRows, rgpwszURLsMarshal, rgpwszURLs, "uint", dwDeleteFlags, "uint*", &rgdwStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return rgdwStatus
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pIndexID 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {IUnknown} 
     */
    OpenRowset(pUnkOuter, pTableID, pIndexID, riid, cPropertySets, rgPropertySets) {
        result := ComCall(7, this, "ptr", pUnkOuter, "ptr", pTableID, "ptr", pIndexID, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr*", &ppRowset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppRowset)
    }
}

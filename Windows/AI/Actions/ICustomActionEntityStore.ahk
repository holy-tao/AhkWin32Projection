#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ICustomActionEntityStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomActionEntityStore
     * @type {Guid}
     */
    static IID => Guid("{fa7b44d0-1762-5828-9938-e7cae5199e01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLastModifiedTime", "Insert", "InsertMany", "Delete"]

    /**
     * 
     * @param {HSTRING} kind 
     * @returns {DateTime} 
     */
    GetLastModifiedTime(kind) {
        if(kind is String) {
            pin := HSTRING.Create(kind)
            kind := pin.Value
        }
        kind := kind is Win32Handle ? NumGet(kind, "ptr") : kind

        result_ := DateTime()
        result := ComCall(6, this, "ptr", kind, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Inserts a file into the cache.
     * @param {CustomTextActionEntity} entity 
     * @returns {HRESULT} Returns <b>TRUE</b> if the file is inserted; otherwise, it returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/filehc/nf-filehc-insertfile
     */
    Insert(entity) {
        result := ComCall(7, this, "ptr", entity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} entities_length 
     * @param {Pointer<CustomTextActionEntity>} entities 
     * @returns {HRESULT} 
     */
    InsertMany(entities_length, entities) {
        result := ComCall(8, this, "uint", entities_length, "ptr*", entities, "int")
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
     * @param {HSTRING} kind 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete(kind) {
        if(kind is String) {
            pin := HSTRING.Create(kind)
            kind := pin.Value
        }
        kind := kind is Win32Handle ? NumGet(kind, "ptr") : kind

        result := ComCall(9, this, "ptr", kind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuConfigure extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcLuConfigure
     * @type {Guid}
     */
    static IID => Guid("{4131e760-1aea-11d0-944b-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Delete"]

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {Pointer<Integer>} pucLuPair 
     * @param {Integer} cbLuPair 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(pucLuPair, cbLuPair) {
        pucLuPairMarshal := pucLuPair is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pucLuPairMarshal, pucLuPair, "uint", cbLuPair, "int")
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
     * @param {Pointer<Integer>} pucLuPair 
     * @param {Integer} cbLuPair 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete(pucLuPair, cbLuPair) {
        pucLuPairMarshal := pucLuPair is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pucLuPairMarshal, pucLuPair, "uint", cbLuPair, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

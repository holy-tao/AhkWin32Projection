#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IPropertyStoreCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyStoreCollection
     * @type {Guid}
     */
    static IID => Guid("{d14d9c30-12d2-42d8-bce4-c60c2bb226fa}")

    /**
     * The class identifier for PropertyStoreCollection
     * @type {Guid}
     */
    static CLSID => Guid("{edd36029-d753-4862-aa5b-5bccad2a4d29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "Get", "Item", "Add", "Remove", "Delete", "DeleteAll"]

    /**
     * Retrieves the number of tagged elements in a given color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/icm/nf-icm-getcountcolorprofileelements
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCount
    }

    /**
     * Get Mutual Kerberos Authentication
     * @param {PWSTR} pszInstanceIdentity 
     * @param {Pointer<Integer>} pdwIndex 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-odbc-how-to/get-mutual-kerberos-authentication
     */
    Get(pszInstanceIdentity, pdwIndex) {
        pszInstanceIdentity := pszInstanceIdentity is String ? StrPtr(pszInstanceIdentity) : pszInstanceIdentity

        pdwIndexMarshal := pdwIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszInstanceIdentity, pdwIndexMarshal, pdwIndex, "ptr*", &ppIPropertyStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertyStore(ppIPropertyStore)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} dwIndex 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", &ppIPropertyStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertyStore(ppIPropertyStore)
    }

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {IPropertyStore} pIPropertyStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(pIPropertyStore) {
        result := ComCall(6, this, "ptr", pIPropertyStore, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {Integer} dwIndex 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &pIPropertyStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertyStore(pIPropertyStore)
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DeleteAllGPOLinks function deletes all GPO links for the specified site, domain, or organizational unit.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/gpedit/nf-gpedit-deleteallgpolinks
     */
    DeleteAll() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

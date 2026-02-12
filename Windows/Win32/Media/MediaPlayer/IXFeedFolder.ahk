#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXFeedsEnum.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedFolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedFolder
     * @type {Guid}
     */
    static IID => Guid("{4c963678-3a51-4b88-8531-98b90b6508f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Feeds", "Subfolders", "CreateFeed", "CreateSubfolder", "ExistsFeed", "ExistsSubfolder", "GetFeed", "GetSubfolder", "Delete", "Name", "Rename", "Path", "Move", "Parent", "IsRoot", "GetWatcher", "TotalUnreadItemCount", "TotalItemCount"]

    /**
     * 
     * @returns {IXFeedsEnum} 
     */
    Feeds() {
        result := ComCall(3, this, "ptr*", &ppfe := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXFeedsEnum(ppfe)
    }

    /**
     * 
     * @returns {IXFeedsEnum} 
     */
    Subfolders() {
        result := ComCall(4, this, "ptr*", &ppfe := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXFeedsEnum(ppfe)
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {PWSTR} pszUrl 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    CreateFeed(pszName, pszUrl, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(5, this, "ptr", pszName, "ptr", pszUrl, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    CreateSubfolder(pszName, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<BOOL>} pbFeedExists 
     * @returns {HRESULT} 
     */
    ExistsFeed(pszName, pbFeedExists) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pbFeedExistsMarshal := pbFeedExists is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pszName, pbFeedExistsMarshal, pbFeedExists, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<BOOL>} pbSubfolderExists 
     * @returns {HRESULT} 
     */
    ExistsSubfolder(pszName, pbSubfolderExists) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pbSubfolderExistsMarshal := pbSubfolderExists is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", pszName, pbSubfolderExistsMarshal, pbSubfolderExists, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    GetFeed(pszName, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "ptr", pszName, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    GetSubfolder(pszName, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(10, this, "ptr", pszName, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
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
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Name Property (SecurityCertificate Class)
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/securitycertificate-class/name-property-securitycertificate-class
     */
    Name() {
        result := ComCall(12, this, "ptr*", &ppszName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszName
    }

    /**
     * Learn more about: RenameColumnGrbit enumeration
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/renamecolumngrbit-enumeration
     */
    Rename(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(13, this, "ptr", pszName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The path to the image used for the background of a Journal note.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/path-element
     */
    Path() {
        result := ComCall(14, this, "ptr*", &ppszPath := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszPath
    }

    /**
     * Move Method Example (VC++)
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/move-method-example-vc
     */
    Move(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(15, this, "ptr", pszPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Parent Property (ADO MD)
     * @remarks
     * A member that is at the top level of a hierarchy (the root) has no parent. This property is supported only on **Member** objects belonging to a [Level](./level-object-ado-md.md) object. An error occurs when this property is referenced from **Member** objects belonging to a [Position](./position-object-ado-md.md) object.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-md-api/parent-property-ado-md
     */
    Parent(riid) {
        result := ComCall(16, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsRoot() {
        result := ComCall(17, this, "int*", &pbIsRootFeedFolder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsRootFeedFolder
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    GetWatcher(scope, mask, riid) {
        result := ComCall(18, this, "int", scope, "int", mask, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @returns {Integer} 
     */
    TotalUnreadItemCount() {
        result := ComCall(19, this, "uint*", &puiTotalUnreadItemCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiTotalUnreadItemCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    TotalItemCount() {
        result := ComCall(20, this, "uint*", &puiTotalItemCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiTotalItemCount
    }
}

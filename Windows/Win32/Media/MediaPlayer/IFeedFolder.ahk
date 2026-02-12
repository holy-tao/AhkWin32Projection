#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedFolder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedFolder
     * @type {Guid}
     */
    static IID => Guid("{81f04ad1-4194-4d7d-86d6-11813cec163c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Feeds", "get_Subfolders", "CreateFeed", "CreateSubfolder", "ExistsFeed", "GetFeed", "ExistsSubfolder", "GetSubfolder", "Delete", "get_Name", "Rename", "get_Path", "Move", "get_Parent", "get_IsRoot", "get_TotalUnreadItemCount", "get_TotalItemCount", "GetWatcher"]

    /**
     * @type {IDispatch} 
     */
    Feeds {
        get => this.get_Feeds()
    }

    /**
     * @type {IDispatch} 
     */
    Subfolders {
        get => this.get_Subfolders()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsRoot {
        get => this.get_IsRoot()
    }

    /**
     * @type {Integer} 
     */
    TotalUnreadItemCount {
        get => this.get_TotalUnreadItemCount()
    }

    /**
     * @type {Integer} 
     */
    TotalItemCount {
        get => this.get_TotalItemCount()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Feeds() {
        result := ComCall(7, this, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Subfolders() {
        result := ComCall(8, this, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @param {BSTR} feedUrl 
     * @returns {IDispatch} 
     */
    CreateFeed(feedName, feedUrl) {
        if(feedName is String) {
            pin := BSTR.Alloc(feedName)
            feedName := pin.Value
        }
        if(feedUrl is String) {
            pin := BSTR.Alloc(feedUrl)
            feedUrl := pin.Value
        }

        result := ComCall(9, this, "ptr", feedName, "ptr", feedUrl, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {IDispatch} 
     */
    CreateSubfolder(folderName) {
        if(folderName is String) {
            pin := BSTR.Alloc(folderName)
            folderName := pin.Value
        }

        result := ComCall(10, this, "ptr", folderName, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFeed(feedName) {
        if(feedName is String) {
            pin := BSTR.Alloc(feedName)
            feedName := pin.Value
        }

        result := ComCall(11, this, "ptr", feedName, "short*", &exists := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return exists
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @returns {IDispatch} 
     */
    GetFeed(feedName) {
        if(feedName is String) {
            pin := BSTR.Alloc(feedName)
            feedName := pin.Value
        }

        result := ComCall(12, this, "ptr", feedName, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {VARIANT_BOOL} 
     */
    ExistsSubfolder(folderName) {
        if(folderName is String) {
            pin := BSTR.Alloc(folderName)
            folderName := pin.Value
        }

        result := ComCall(13, this, "ptr", folderName, "short*", &exists := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return exists
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {IDispatch} 
     */
    GetSubfolder(folderName) {
        if(folderName is String) {
            pin := BSTR.Alloc(folderName)
            folderName := pin.Value
        }

        result := ComCall(14, this, "ptr", folderName, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
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
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        folderName := BSTR()
        result := ComCall(16, this, "ptr", folderName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return folderName
    }

    /**
     * Learn more about: RenameColumnGrbit enumeration
     * @param {BSTR} folderName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/renamecolumngrbit-enumeration
     */
    Rename(folderName) {
        if(folderName is String) {
            pin := BSTR.Alloc(folderName)
            folderName := pin.Value
        }

        result := ComCall(17, this, "ptr", folderName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        folderPath := BSTR()
        result := ComCall(18, this, "ptr", folderPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return folderPath
    }

    /**
     * Move Method Example (VC++)
     * @param {BSTR} newParentPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/move-method-example-vc
     */
    Move(newParentPath) {
        if(newParentPath is String) {
            pin := BSTR.Alloc(newParentPath)
            newParentPath := pin.Value
        }

        result := ComCall(19, this, "ptr", newParentPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(20, this, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsRoot() {
        result := ComCall(21, this, "short*", &isRoot := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isRoot
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalUnreadItemCount() {
        result := ComCall(22, this, "int*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalItemCount() {
        result := ComCall(23, this, "int*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @returns {IDispatch} 
     */
    GetWatcher(scope, mask) {
        result := ComCall(24, this, "int", scope, "int", mask, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }
}

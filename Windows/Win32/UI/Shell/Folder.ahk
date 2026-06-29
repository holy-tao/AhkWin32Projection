#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\FolderItem.ahk" { FolderItem }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FolderItems.ahk" { FolderItems }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents a Shell folder. This object contains properties and methods that allow you to retrieve information about the folder.
 * @remarks
 * The **Folder** object has these types of members:
 * 
 * -   [Methods](#methods)
 * -   [Properties](#properties)
 * 
 * 
 * > [!Note]  
 * > Not all methods are implemented for all folders. For example, the [**ParseName**](folder-parsename.md) method is not implemented for the Control Panel folder (CSIDL\_CONTROLS). If you attempt to call an unimplemented method, a 0x800A01BD (decimal 445) error is raised.
 * @see https://learn.microsoft.com/windows/win32/shell/folder
 * @namespace Windows.Win32.UI.Shell
 */
export default struct Folder extends IDispatch {
    /**
     * The interface identifier for Folder
     * @type {Guid}
     */
    static IID := Guid("{bbcbde60-c3ff-11ce-8350-444553540000}")

    /**
     * The class identifier for Folder
     * @type {Guid}
     */
    static CLSID := Guid("{bbcbde60-c3ff-11ce-8350-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Folder interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Title        : IntPtr
        get_Application  : IntPtr
        get_Parent       : IntPtr
        get_ParentFolder : IntPtr
        Items            : IntPtr
        ParseName        : IntPtr
        NewFolder        : IntPtr
        MoveHere         : IntPtr
        CopyHere         : IntPtr
        GetDetailsOf     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Folder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {IDispatch} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {Folder} 
     */
    ParentFolder {
        get => this.get_ParentFolder()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Title() {
        pbs := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(9, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {Folder} 
     */
    get_ParentFolder() {
        result := ComCall(10, this, "ptr*", &ppsf := 0, "HRESULT")
        return Folder(ppsf)
    }

    /**
     * Retrieves a FolderItems object that represents the collection of items in the folder.
     * @remarks
     * > [!Note]  
     * > Not all methods are implemented for all folders. For example, the [**ParseName**](folder-parsename.md) method is not implemented for the Control Panel folder (CSIDL\_CONTROLS). If you attempt to call an unimplemented method, a 0x800A01BD (decimal 445) error is raised.
     * @returns {FolderItems} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder-items
     */
    Items() {
        result := ComCall(11, this, "ptr*", &ppid := 0, "HRESULT")
        return FolderItems(ppid)
    }

    /**
     * Creates and returns a FolderItem object that represents a specified item.
     * @remarks
     * **ParseName** should not be used for virtual folders such as My Documents.
     * @param {BSTR} bName Type: **[**BSTR**](/previous-versions/windows/desktop/automat/bstr)**
     * 
     * A string that specifies the name of the item.
     * @returns {FolderItem} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder-parsename
     */
    ParseName(bName) {
        bName := bName is String ? BSTR.Alloc(bName).Value : bName

        result := ComCall(12, this, BSTR, bName, "ptr*", &ppid := 0, "HRESULT")
        return FolderItem(ppid)
    }

    /**
     * Creates a new folder.
     * @remarks
     * > [!Note]  
     * > Not all methods are implemented for all folders. For example, the [**ParseName**](folder-parsename.md) method is not implemented for the Control Panel folder (CSIDL\_CONTROLS). If you attempt to call an unimplemented method, a 0x800A01BD (decimal 445) error is raised.
     * @param {BSTR} bName Type: **[**BSTR**](/previous-versions/windows/desktop/automat/bstr)**
     * 
     * A string that specifies the name of the new folder.
     * @param {VARIANT} vOptions Type: **Variant**
     * 
     * This value is not currently used.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/shell/folder-newfolder
     */
    NewFolder(bName, vOptions) {
        bName := bName is String ? BSTR.Alloc(bName).Value : bName

        result := ComCall(13, this, BSTR, bName, VARIANT, vOptions, "HRESULT")
        return result
    }

    /**
     * Moves an item or items to this folder.
     * @remarks
     * > [!Note]  
     * > Not all methods are implemented for all folders. For example, the [**ParseName**](folder-parsename.md) method is not implemented for the Control Panel folder (CSIDL\_CONTROLS). If you attempt to call an unimplemented method, a 0x800A01BD (decimal 445) error is raised.
     * @param {VARIANT} vItem Type: **Variant**
     * 
     * The item or items to move. This can be a string that represents a file name, a [**FolderItem**](folderitem.md) object, or a [**FolderItems**](folderitems.md) object.
     * @param {VARIANT} vOptions Type: **Variant**
     * 
     * Options for the move operation. This value can be zero or a combination of the following values. These values are based upon flags defined for use with the **fFlags** member of the C++ [**SHFILEOPSTRUCT**](/windows/desktop/api/Shellapi/ns-shellapi-shfileopstructa) structure. These flags are not defined as such for Visual Basic, VBScript, or JScript, so you must define them yourself or use their numeric equivalents.
     * 
     * 
     * 
     * 
     *  (4)
     * 
     * 
     * 
     * Do not display a progress dialog box.
     * 
     * 
     * 
     * 
     *  (8)
     * 
     * 
     * 
     * Give the file being operated on a new name in a move, copy, or rename operation if a file with the target name already exists.
     * 
     * 
     * 
     * 
     *  (16)
     * 
     * 
     * 
     * Respond with "Yes to All" for any dialog box that is displayed.
     * 
     * 
     * 
     * 
     *  (64)
     * 
     * 
     * 
     * Preserve undo information, if possible.
     * 
     * 
     * 
     * 
     *  (128)
     * 
     * 
     * 
     * Perform the operation on files only if a wildcard file name (\*.\*) is specified.
     * 
     * 
     * 
     * 
     *  (256)
     * 
     * 
     * 
     * Display a progress dialog box but do not show the file names.
     * 
     * 
     * 
     * 
     *  (512)
     * 
     * 
     * 
     * Do not confirm the creation of a new directory if the operation requires one to be created.
     * 
     * 
     * 
     * 
     *  (1024)
     * 
     * 
     * 
     * Do not display a user interface if an error occurs.
     * 
     * 
     * 
     * 
     *  (2048)
     * 
     * 
     * 
     * [Version 4.71.](versions.md) Do not copy the security attributes of the file.
     * 
     * 
     * 
     * 
     *  (4096)
     * 
     * 
     * 
     * Only operate in the local directory. Do not operate recursively into subdirectories.
     * 
     * 
     * 
     * 
     *  (9182)
     * 
     * 
     * 
     * [Version 5.0.](versions.md) Do not move connected files as a group. Only move the specified files.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/shell/folder-movehere
     */
    MoveHere(vItem, vOptions) {
        result := ComCall(14, this, VARIANT, vItem, VARIANT, vOptions, "HRESULT")
        return result
    }

    /**
     * Copies an item or items to a folder.
     * @remarks
     * No notification is given to the calling program to indicate that the copy has completed.
     * 
     * > [!Note]  
     * > Not all methods are implemented for all folders. For example, the [**ParseName**](folder-parsename.md) method is not implemented for the Control Panel folder (CSIDL\_CONTROLS). If you attempt to call an unimplemented method, a 0x800A01BD (decimal 445) error is raised.
     * @param {VARIANT} vItem Type: **Variant**
     * 
     * The item or items to copy. This can be a string that represents a file name, a [**FolderItem**](folderitem.md) object, or a [**FolderItems**](folderitems.md) object.
     * @param {VARIANT} vOptions Type: **Variant**
     * 
     * Options for the copy operation. This value can be zero or a combination of the following values. These values are based upon flags defined for use with the **fFlags** member of the C++ [**SHFILEOPSTRUCT**](/windows/desktop/api/Shellapi/ns-shellapi-shfileopstructa) structure. Each Shell namespace must provide its own implementation of these flags, and each namespace can choose to ignore some or even all of these flags. These flags are not defined by name for Visual Basic, VBScript, or JScript, so you must define them yourself or use their numeric equivalents.
     * 
     * > [!Note]  
     * > In some cases, such as compressed (.zip) files, some option flags may be ignored by design.
     * 
     *  
     * 
     * 
     * 
     * 
     *  (4)
     * 
     * 
     * 
     * Do not display a progress dialog box.
     * 
     * 
     * 
     * 
     *  (8)
     * 
     * 
     * 
     * Give the file being operated on a new name in a move, copy, or rename operation if a file with the target name already exists.
     * 
     * 
     * 
     * 
     *  (16)
     * 
     * 
     * 
     * Respond with "Yes to All" for any dialog box that is displayed.
     * 
     * 
     * 
     * 
     *  (64)
     * 
     * 
     * 
     * Preserve undo information, if possible.
     * 
     * 
     * 
     * 
     *  (128)
     * 
     * 
     * 
     * Perform the operation on files only if a wildcard file name (\*.\*) is specified.
     * 
     * 
     * 
     * 
     *  (256)
     * 
     * 
     * 
     * Display a progress dialog box but do not show the file names.
     * 
     * 
     * 
     * 
     *  (512)
     * 
     * 
     * 
     * Do not confirm the creation of a new directory if the operation requires one to be created.
     * 
     * 
     * 
     * 
     *  (1024)
     * 
     * 
     * 
     * Do not display a user interface if an error occurs.
     * 
     * 
     * 
     * 
     *  (2048)
     * 
     * 
     * 
     * [Version 4.71.](versions.md) Do not copy the security attributes of the file.
     * 
     * 
     * 
     * 
     *  (4096)
     * 
     * 
     * 
     * Only operate in the local directory. Do not operate recursively into subdirectories.
     * 
     * 
     * 
     * 
     *  (8192)
     * 
     * 
     * 
     * [Version 5.0.](versions.md) Do not copy connected files as a group. Only copy the specified files.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/shell/folder-copyhere
     */
    CopyHere(vItem, vOptions) {
        result := ComCall(15, this, VARIANT, vItem, VARIANT, vOptions, "HRESULT")
        return result
    }

    /**
     * Retrieves details about an item in a folder. For example, its size, type, or the time of its last modification.
     * @remarks
     * > [!Note]  
     * > Not all methods are implemented for all folders. For example, the [**ParseName**](folder-parsename.md) method is not implemented for the Control Panel folder (CSIDL\_CONTROLS). If you attempt to call an unimplemented method, a 0x800A01BD (decimal 445) error is raised.
     * @param {VARIANT} vItem Type: **Variant**
     * 
     * The item for which to retrieve the information. This must be a [**FolderItem**](folderitem.md) object.
     * @param {Integer} iColumn Type: **Integer**
     * 
     * An **Integer** value that specifies the information to be retrieved. The information available for an item depends on the folder in which it is displayed. This value corresponds to the zero-based column number that is displayed in a Shell view. For an item in the file system, this can be one of the following values:
     * 
     * 
     * 
     * 
     *  (0)
     * 
     * 
     * 
     * Retrieves the name of the item.
     * 
     * 
     * 
     * 
     *  (1)
     * 
     * 
     * 
     * Retrieves the size of the item.
     * 
     * 
     * 
     * 
     *  (2)
     * 
     * 
     * 
     * Retrieves the type of the item.
     * 
     * 
     * 
     * 
     *  (3)
     * 
     * 
     * 
     * Retrieves the date and time that the item was last modified.
     * 
     * 
     * 
     * 
     *  (4)
     * 
     * 
     * 
     * Retrieves the attributes of the item.
     * 
     * 
     * 
     * 
     *  (-1)
     * 
     * 
     * 
     * Retrieves the info tip information for the item.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder-getdetailsof
     */
    GetDetailsOf(vItem, iColumn) {
        pbs := BSTR.Owned()
        result := ComCall(16, this, VARIANT, vItem, "int", iColumn, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    Query(iid) {
        if (Folder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.get_Application := CallbackCreate(GetMethod(implObj, "get_Application"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_ParentFolder := CallbackCreate(GetMethod(implObj, "get_ParentFolder"), flags, 2)
        this.vtbl.Items := CallbackCreate(GetMethod(implObj, "Items"), flags, 2)
        this.vtbl.ParseName := CallbackCreate(GetMethod(implObj, "ParseName"), flags, 3)
        this.vtbl.NewFolder := CallbackCreate(GetMethod(implObj, "NewFolder"), flags, 3)
        this.vtbl.MoveHere := CallbackCreate(GetMethod(implObj, "MoveHere"), flags, 3)
        this.vtbl.CopyHere := CallbackCreate(GetMethod(implObj, "CopyHere"), flags, 3)
        this.vtbl.GetDetailsOf := CallbackCreate(GetMethod(implObj, "GetDetailsOf"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.get_Application)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_ParentFolder)
        CallbackFree(this.vtbl.Items)
        CallbackFree(this.vtbl.ParseName)
        CallbackFree(this.vtbl.NewFolder)
        CallbackFree(this.vtbl.MoveHere)
        CallbackFree(this.vtbl.CopyHere)
        CallbackFree(this.vtbl.GetDetailsOf)
    }
}

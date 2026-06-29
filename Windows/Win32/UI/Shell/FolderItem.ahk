#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\FolderItemVerbs.ahk" { FolderItemVerbs }

/**
 * Represents an item in a Shell folder. This object contains properties and methods that allow you to retrieve information about the item.
 * @see https://learn.microsoft.com/windows/win32/shell/folderitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FolderItem extends IDispatch {
    /**
     * The interface identifier for FolderItem
     * @type {Guid}
     */
    static IID := Guid("{fac32c80-cbe4-11ce-8350-444553540000}")

    /**
     * The class identifier for FolderItem
     * @type {Guid}
     */
    static CLSID := Guid("{fac32c80-cbe4-11ce-8350-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for FolderItem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Application  : IntPtr
        get_Parent       : IntPtr
        get_Name         : IntPtr
        put_Name         : IntPtr
        get_Path         : IntPtr
        get_GetLink      : IntPtr
        get_GetFolder    : IntPtr
        get_IsLink       : IntPtr
        get_IsFolder     : IntPtr
        get_IsFileSystem : IntPtr
        get_IsBrowsable  : IntPtr
        get_ModifyDate   : IntPtr
        put_ModifyDate   : IntPtr
        get_Size         : IntPtr
        get_Type         : IntPtr
        Verbs            : IntPtr
        InvokeVerb       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := FolderItem.Vtbl()
        }
        super.__New(implObj, flags)
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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
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
    GetLink {
        get => this.get_GetLink()
    }

    /**
     * @type {IDispatch} 
     */
    GetFolder {
        get => this.get_GetFolder()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsLink {
        get => this.get_IsLink()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsFolder {
        get => this.get_IsFolder()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsFileSystem {
        get => this.get_IsFileSystem()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsBrowsable {
        get => this.get_IsBrowsable()
    }

    /**
     * @type {Float} 
     */
    ModifyDate {
        get => this.get_ModifyDate()
        set => this.put_ModifyDate(value)
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(7, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbs := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Name(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(10, this, BSTR, bs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pbs := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_GetLink() {
        result := ComCall(12, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_GetFolder() {
        result := ComCall(13, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLink() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &pb := 0, "HRESULT")
        return pb
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsFolder() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &pb := 0, "HRESULT")
        return pb
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsFileSystem() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &pb := 0, "HRESULT")
        return pb
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsBrowsable() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &pb := 0, "HRESULT")
        return pb
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ModifyDate() {
        result := ComCall(18, this, "double*", &pdt := 0, "HRESULT")
        return pdt
    }

    /**
     * 
     * @param {Float} dt 
     * @returns {HRESULT} 
     */
    put_ModifyDate(dt) {
        result := ComCall(19, this, "double", dt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(20, this, "int*", &pul := 0, "HRESULT")
        return pul
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        pbs := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * Retrieves the item's FolderItemVerbs object. This object is the collection of verbs that can be executed on the item.
     * @returns {FolderItemVerbs} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitem-verbs
     */
    Verbs() {
        result := ComCall(22, this, "ptr*", &ppfic := 0, "HRESULT")
        return FolderItemVerbs(ppfic)
    }

    /**
     * Executes a verb on the item.
     * @remarks
     * A verb is a string used to specify a particular action that an item supports. Invoking a verb is equivalent to selecting a command from an item's shortcut menu. Typically, invoking a verb launches a related application. For example, invoking the "open" verb on a .txt file opens the file with a text editor, usually Microsoft Notepad. See [Launching Applications](launch.md) for further discussion of verbs.
     * 
     * The [**FolderItemVerbs**](folderitemverbs.md) object represents the collection of verbs associated with the item. The default verb may vary for different items, but it is typically "open".
     * @param {VARIANT} vVerb Type: **Variant**
     * 
     * A string that specifies the verb to be executed. It must be one of the values returned by the item's [**FolderItemVerb.Name**](folderitemverb-name.md) property. If no verb is specified, the default verb will be invoked.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/shell/folderitem-invokeverb
     */
    InvokeVerb(vVerb) {
        result := ComCall(23, this, VARIANT, vVerb, "HRESULT")
        return result
    }

    Query(iid) {
        if (FolderItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Application := CallbackCreate(GetMethod(implObj, "get_Application"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_GetLink := CallbackCreate(GetMethod(implObj, "get_GetLink"), flags, 2)
        this.vtbl.get_GetFolder := CallbackCreate(GetMethod(implObj, "get_GetFolder"), flags, 2)
        this.vtbl.get_IsLink := CallbackCreate(GetMethod(implObj, "get_IsLink"), flags, 2)
        this.vtbl.get_IsFolder := CallbackCreate(GetMethod(implObj, "get_IsFolder"), flags, 2)
        this.vtbl.get_IsFileSystem := CallbackCreate(GetMethod(implObj, "get_IsFileSystem"), flags, 2)
        this.vtbl.get_IsBrowsable := CallbackCreate(GetMethod(implObj, "get_IsBrowsable"), flags, 2)
        this.vtbl.get_ModifyDate := CallbackCreate(GetMethod(implObj, "get_ModifyDate"), flags, 2)
        this.vtbl.put_ModifyDate := CallbackCreate(GetMethod(implObj, "put_ModifyDate"), flags, 2)
        this.vtbl.get_Size := CallbackCreate(GetMethod(implObj, "get_Size"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.Verbs := CallbackCreate(GetMethod(implObj, "Verbs"), flags, 2)
        this.vtbl.InvokeVerb := CallbackCreate(GetMethod(implObj, "InvokeVerb"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Application)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_GetLink)
        CallbackFree(this.vtbl.get_GetFolder)
        CallbackFree(this.vtbl.get_IsLink)
        CallbackFree(this.vtbl.get_IsFolder)
        CallbackFree(this.vtbl.get_IsFileSystem)
        CallbackFree(this.vtbl.get_IsBrowsable)
        CallbackFree(this.vtbl.get_ModifyDate)
        CallbackFree(this.vtbl.put_ModifyDate)
        CallbackFree(this.vtbl.get_Size)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.Verbs)
        CallbackFree(this.vtbl.InvokeVerb)
    }
}

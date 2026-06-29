#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FEEDS_EVENTS_MASK.ahk" { FEEDS_EVENTS_MASK }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FEEDS_EVENTS_SCOPE.ahk" { FEEDS_EVENTS_SCOPE }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IFeedFolder extends IDispatch {
    /**
     * The interface identifier for IFeedFolder
     * @type {Guid}
     */
    static IID := Guid("{81f04ad1-4194-4d7d-86d6-11813cec163c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeedFolder interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Feeds                : IntPtr
        get_Subfolders           : IntPtr
        CreateFeed               : IntPtr
        CreateSubfolder          : IntPtr
        ExistsFeed               : IntPtr
        GetFeed                  : IntPtr
        ExistsSubfolder          : IntPtr
        GetSubfolder             : IntPtr
        Delete                   : IntPtr
        get_Name                 : IntPtr
        Rename                   : IntPtr
        get_Path                 : IntPtr
        Move                     : IntPtr
        get_Parent               : IntPtr
        get_IsRoot               : IntPtr
        get_TotalUnreadItemCount : IntPtr
        get_TotalItemCount       : IntPtr
        GetWatcher               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeedFolder.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(7, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Subfolders() {
        result := ComCall(8, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @param {BSTR} feedUrl 
     * @returns {IDispatch} 
     */
    CreateFeed(feedName, feedUrl) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(9, this, BSTR, feedName, BSTR, feedUrl, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {IDispatch} 
     */
    CreateSubfolder(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(10, this, BSTR, folderName, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFeed(feedName) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName

        result := ComCall(11, this, BSTR, feedName, VARIANT_BOOL.Ptr, &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @returns {IDispatch} 
     */
    GetFeed(feedName) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName

        result := ComCall(12, this, BSTR, feedName, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {VARIANT_BOOL} 
     */
    ExistsSubfolder(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(13, this, BSTR, folderName, VARIANT_BOOL.Ptr, &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {IDispatch} 
     */
    GetSubfolder(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(14, this, BSTR, folderName, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        folderName := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, folderName, "HRESULT")
        return folderName
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {HRESULT} 
     */
    Rename(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(17, this, BSTR, folderName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        folderPath := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, folderPath, "HRESULT")
        return folderPath
    }

    /**
     * 
     * @param {BSTR} newParentPath 
     * @returns {HRESULT} 
     */
    Move(newParentPath) {
        newParentPath := newParentPath is String ? BSTR.Alloc(newParentPath).Value : newParentPath

        result := ComCall(19, this, BSTR, newParentPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(20, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsRoot() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &isRoot := 0, "HRESULT")
        return isRoot
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalUnreadItemCount() {
        result := ComCall(22, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalItemCount() {
        result := ComCall(23, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {FEEDS_EVENTS_SCOPE} scope 
     * @param {FEEDS_EVENTS_MASK} mask 
     * @returns {IDispatch} 
     */
    GetWatcher(scope, mask) {
        result := ComCall(24, this, FEEDS_EVENTS_SCOPE, scope, FEEDS_EVENTS_MASK, mask, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    Query(iid) {
        if (IFeedFolder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Feeds := CallbackCreate(GetMethod(implObj, "get_Feeds"), flags, 2)
        this.vtbl.get_Subfolders := CallbackCreate(GetMethod(implObj, "get_Subfolders"), flags, 2)
        this.vtbl.CreateFeed := CallbackCreate(GetMethod(implObj, "CreateFeed"), flags, 4)
        this.vtbl.CreateSubfolder := CallbackCreate(GetMethod(implObj, "CreateSubfolder"), flags, 3)
        this.vtbl.ExistsFeed := CallbackCreate(GetMethod(implObj, "ExistsFeed"), flags, 3)
        this.vtbl.GetFeed := CallbackCreate(GetMethod(implObj, "GetFeed"), flags, 3)
        this.vtbl.ExistsSubfolder := CallbackCreate(GetMethod(implObj, "ExistsSubfolder"), flags, 3)
        this.vtbl.GetSubfolder := CallbackCreate(GetMethod(implObj, "GetSubfolder"), flags, 3)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.Rename := CallbackCreate(GetMethod(implObj, "Rename"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.Move := CallbackCreate(GetMethod(implObj, "Move"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_IsRoot := CallbackCreate(GetMethod(implObj, "get_IsRoot"), flags, 2)
        this.vtbl.get_TotalUnreadItemCount := CallbackCreate(GetMethod(implObj, "get_TotalUnreadItemCount"), flags, 2)
        this.vtbl.get_TotalItemCount := CallbackCreate(GetMethod(implObj, "get_TotalItemCount"), flags, 2)
        this.vtbl.GetWatcher := CallbackCreate(GetMethod(implObj, "GetWatcher"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Feeds)
        CallbackFree(this.vtbl.get_Subfolders)
        CallbackFree(this.vtbl.CreateFeed)
        CallbackFree(this.vtbl.CreateSubfolder)
        CallbackFree(this.vtbl.ExistsFeed)
        CallbackFree(this.vtbl.GetFeed)
        CallbackFree(this.vtbl.ExistsSubfolder)
        CallbackFree(this.vtbl.GetSubfolder)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.Rename)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.Move)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_IsRoot)
        CallbackFree(this.vtbl.get_TotalUnreadItemCount)
        CallbackFree(this.vtbl.get_TotalItemCount)
        CallbackFree(this.vtbl.GetWatcher)
    }
}

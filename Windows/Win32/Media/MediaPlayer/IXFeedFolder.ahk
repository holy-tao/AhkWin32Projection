#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FEEDS_EVENTS_MASK.ahk" { FEEDS_EVENTS_MASK }
#Import ".\FEEDS_EVENTS_SCOPE.ahk" { FEEDS_EVENTS_SCOPE }
#Import ".\IXFeedsEnum.ahk" { IXFeedsEnum }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IXFeedFolder extends IUnknown {
    /**
     * The interface identifier for IXFeedFolder
     * @type {Guid}
     */
    static IID := Guid("{4c963678-3a51-4b88-8531-98b90b6508f2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeedFolder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Feeds                : IntPtr
        Subfolders           : IntPtr
        CreateFeed           : IntPtr
        CreateSubfolder      : IntPtr
        ExistsFeed           : IntPtr
        ExistsSubfolder      : IntPtr
        GetFeed              : IntPtr
        GetSubfolder         : IntPtr
        Delete               : IntPtr
        Name                 : IntPtr
        Rename               : IntPtr
        Path                 : IntPtr
        Move                 : IntPtr
        Parent               : IntPtr
        IsRoot               : IntPtr
        GetWatcher           : IntPtr
        TotalUnreadItemCount : IntPtr
        TotalItemCount       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXFeedFolder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @returns {IXFeedsEnum} 
     */
    Feeds() {
        result := ComCall(3, this, "ptr*", &ppfe := 0, "HRESULT")
        return IXFeedsEnum(ppfe)
    }

    /**
     * @returns {IXFeedsEnum} 
     */
    Subfolders() {
        result := ComCall(4, this, "ptr*", &ppfe := 0, "HRESULT")
        return IXFeedsEnum(ppfe)
    }

    /**
     * @param {PWSTR} pszName 
     * @param {PWSTR} pszUrl 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateFeed(pszName, pszUrl, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(5, this, "ptr", pszName, "ptr", pszUrl, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateSubfolder(pszName, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * @param {PWSTR} pszName 
     * @param {Pointer<BOOL>} pbFeedExists 
     * @returns {HRESULT} 
     */
    ExistsFeed(pszName, pbFeedExists) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pbFeedExistsMarshal := pbFeedExists is VarRef ? "int*" : IntPtr

        result := ComCall(7, this, "ptr", pszName, pbFeedExistsMarshal, pbFeedExists, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} pszName 
     * @param {Pointer<BOOL>} pbSubfolderExists 
     * @returns {HRESULT} 
     */
    ExistsSubfolder(pszName, pbSubfolderExists) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pbSubfolderExistsMarshal := pbSubfolderExists is VarRef ? "int*" : IntPtr

        result := ComCall(8, this, "ptr", pszName, pbSubfolderExistsMarshal, pbSubfolderExists, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetFeed(pszName, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "ptr", pszName, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetSubfolder(pszName, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(10, this, "ptr", pszName, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Contains the name of a header field in an email message.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-name-headerfieldtype-element
     */
    Name() {
        result := ComCall(12, this, PWSTR.Ptr, &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    Rename(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(13, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * The path to the image used for the background of a Journal note.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/tablet/path-element
     */
    Path() {
        result := ComCall(14, this, PWSTR.Ptr, &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    Move(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(15, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Parent(riid) {
        result := ComCall(16, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * @returns {BOOL} 
     */
    IsRoot() {
        result := ComCall(17, this, BOOL.Ptr, &pbIsRootFeedFolder := 0, "HRESULT")
        return pbIsRootFeedFolder
    }

    /**
     * @param {FEEDS_EVENTS_SCOPE} scope 
     * @param {FEEDS_EVENTS_MASK} mask 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetWatcher(scope, mask, riid) {
        result := ComCall(18, this, FEEDS_EVENTS_SCOPE, scope, FEEDS_EVENTS_MASK, mask, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * @returns {Integer} 
     */
    TotalUnreadItemCount() {
        result := ComCall(19, this, "uint*", &puiTotalUnreadItemCount := 0, "HRESULT")
        return puiTotalUnreadItemCount
    }

    /**
     * @returns {Integer} 
     */
    TotalItemCount() {
        result := ComCall(20, this, "uint*", &puiTotalItemCount := 0, "HRESULT")
        return puiTotalItemCount
    }

    _Query(iid) {
        if (IXFeedFolder.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Feeds := CallbackCreate(ObjBindMethod(implObj, "Feeds"), flags, 2)
        this.vtbl.Subfolders := CallbackCreate(ObjBindMethod(implObj, "Subfolders"), flags, 2)
        this.vtbl.CreateFeed := CallbackCreate(ObjBindMethod(implObj, "CreateFeed"), flags, 5)
        this.vtbl.CreateSubfolder := CallbackCreate(ObjBindMethod(implObj, "CreateSubfolder"), flags, 4)
        this.vtbl.ExistsFeed := CallbackCreate(ObjBindMethod(implObj, "ExistsFeed"), flags, 3)
        this.vtbl.ExistsSubfolder := CallbackCreate(ObjBindMethod(implObj, "ExistsSubfolder"), flags, 3)
        this.vtbl.GetFeed := CallbackCreate(ObjBindMethod(implObj, "GetFeed"), flags, 4)
        this.vtbl.GetSubfolder := CallbackCreate(ObjBindMethod(implObj, "GetSubfolder"), flags, 4)
        this.vtbl.Delete := CallbackCreate(ObjBindMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Name := CallbackCreate(ObjBindMethod(implObj, "Name"), flags, 2)
        this.vtbl.Rename := CallbackCreate(ObjBindMethod(implObj, "Rename"), flags, 2)
        this.vtbl.Path := CallbackCreate(ObjBindMethod(implObj, "Path"), flags, 2)
        this.vtbl.Move := CallbackCreate(ObjBindMethod(implObj, "Move"), flags, 2)
        this.vtbl.Parent := CallbackCreate(ObjBindMethod(implObj, "Parent"), flags, 3)
        this.vtbl.IsRoot := CallbackCreate(ObjBindMethod(implObj, "IsRoot"), flags, 2)
        this.vtbl.GetWatcher := CallbackCreate(ObjBindMethod(implObj, "GetWatcher"), flags, 5)
        this.vtbl.TotalUnreadItemCount := CallbackCreate(ObjBindMethod(implObj, "TotalUnreadItemCount"), flags, 2)
        this.vtbl.TotalItemCount := CallbackCreate(ObjBindMethod(implObj, "TotalItemCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Feeds)
        CallbackFree(this.vtbl.Subfolders)
        CallbackFree(this.vtbl.CreateFeed)
        CallbackFree(this.vtbl.CreateSubfolder)
        CallbackFree(this.vtbl.ExistsFeed)
        CallbackFree(this.vtbl.ExistsSubfolder)
        CallbackFree(this.vtbl.GetFeed)
        CallbackFree(this.vtbl.GetSubfolder)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Name)
        CallbackFree(this.vtbl.Rename)
        CallbackFree(this.vtbl.Path)
        CallbackFree(this.vtbl.Move)
        CallbackFree(this.vtbl.Parent)
        CallbackFree(this.vtbl.IsRoot)
        CallbackFree(this.vtbl.GetWatcher)
        CallbackFree(this.vtbl.TotalUnreadItemCount)
        CallbackFree(this.vtbl.TotalItemCount)
    }
}

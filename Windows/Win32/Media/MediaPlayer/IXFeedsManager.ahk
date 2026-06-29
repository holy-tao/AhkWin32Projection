#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FEEDS_BACKGROUNDSYNC_STATUS.ahk" { FEEDS_BACKGROUNDSYNC_STATUS }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FEEDS_BACKGROUNDSYNC_ACTION.ahk" { FEEDS_BACKGROUNDSYNC_ACTION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IXFeedsManager extends IUnknown {
    /**
     * The interface identifier for IXFeedsManager
     * @type {Guid}
     */
    static IID := Guid("{5357e238-fb12-4aca-a930-cab7832b84bf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeedsManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RootFolder           : IntPtr
        IsSubscribed         : IntPtr
        ExistsFeed           : IntPtr
        GetFeed              : IntPtr
        GetFeedByUrl         : IntPtr
        ExistsFolder         : IntPtr
        GetFolder            : IntPtr
        DeleteFeed           : IntPtr
        DeleteFolder         : IntPtr
        BackgroundSync       : IntPtr
        BackgroundSyncStatus : IntPtr
        DefaultInterval      : IntPtr
        SetDefaultInterval   : IntPtr
        AsyncSyncAll         : IntPtr
        Normalize            : IntPtr
        ItemCountLimit       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXFeedsManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RootFolder(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @returns {BOOL} 
     */
    IsSubscribed(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(4, this, "ptr", pszUrl, BOOL.Ptr, &pbSubscribed := 0, "HRESULT")
        return pbSubscribed
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {BOOL} 
     */
    ExistsFeed(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(5, this, "ptr", pszPath, BOOL.Ptr, &pbFeedExists := 0, "HRESULT")
        return pbFeedExists
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetFeed(pszPath, riid) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(6, this, "ptr", pszPath, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetFeedByUrl(pszUrl, riid) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(7, this, "ptr", pszUrl, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {BOOL} 
     */
    ExistsFolder(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(8, this, "ptr", pszPath, BOOL.Ptr, &pbFolderExists := 0, "HRESULT")
        return pbFolderExists
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetFolder(pszPath, riid) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(9, this, "ptr", pszPath, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    DeleteFeed(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    DeleteFolder(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(11, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {FEEDS_BACKGROUNDSYNC_ACTION} fbsa 
     * @returns {HRESULT} 
     */
    BackgroundSync(fbsa) {
        result := ComCall(12, this, FEEDS_BACKGROUNDSYNC_ACTION, fbsa, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FEEDS_BACKGROUNDSYNC_STATUS} 
     */
    BackgroundSyncStatus() {
        result := ComCall(13, this, "int*", &pfbss := 0, "HRESULT")
        return pfbss
    }

    /**
     * 
     * @returns {Integer} 
     */
    DefaultInterval() {
        result := ComCall(14, this, "uint*", &puiInterval := 0, "HRESULT")
        return puiInterval
    }

    /**
     * 
     * @param {Integer} uiInterval 
     * @returns {HRESULT} 
     */
    SetDefaultInterval(uiInterval) {
        result := ComCall(15, this, "uint", uiInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncSyncAll() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStreamIn 
     * @returns {IStream} 
     */
    Normalize(pStreamIn) {
        result := ComCall(17, this, "ptr", pStreamIn, "ptr*", &ppStreamOut := 0, "HRESULT")
        return IStream(ppStreamOut)
    }

    /**
     * 
     * @returns {Integer} 
     */
    ItemCountLimit() {
        result := ComCall(18, this, "uint*", &puiItemCountLimit := 0, "HRESULT")
        return puiItemCountLimit
    }

    Query(iid) {
        if (IXFeedsManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RootFolder := CallbackCreate(GetMethod(implObj, "RootFolder"), flags, 3)
        this.vtbl.IsSubscribed := CallbackCreate(GetMethod(implObj, "IsSubscribed"), flags, 3)
        this.vtbl.ExistsFeed := CallbackCreate(GetMethod(implObj, "ExistsFeed"), flags, 3)
        this.vtbl.GetFeed := CallbackCreate(GetMethod(implObj, "GetFeed"), flags, 4)
        this.vtbl.GetFeedByUrl := CallbackCreate(GetMethod(implObj, "GetFeedByUrl"), flags, 4)
        this.vtbl.ExistsFolder := CallbackCreate(GetMethod(implObj, "ExistsFolder"), flags, 3)
        this.vtbl.GetFolder := CallbackCreate(GetMethod(implObj, "GetFolder"), flags, 4)
        this.vtbl.DeleteFeed := CallbackCreate(GetMethod(implObj, "DeleteFeed"), flags, 2)
        this.vtbl.DeleteFolder := CallbackCreate(GetMethod(implObj, "DeleteFolder"), flags, 2)
        this.vtbl.BackgroundSync := CallbackCreate(GetMethod(implObj, "BackgroundSync"), flags, 2)
        this.vtbl.BackgroundSyncStatus := CallbackCreate(GetMethod(implObj, "BackgroundSyncStatus"), flags, 2)
        this.vtbl.DefaultInterval := CallbackCreate(GetMethod(implObj, "DefaultInterval"), flags, 2)
        this.vtbl.SetDefaultInterval := CallbackCreate(GetMethod(implObj, "SetDefaultInterval"), flags, 2)
        this.vtbl.AsyncSyncAll := CallbackCreate(GetMethod(implObj, "AsyncSyncAll"), flags, 1)
        this.vtbl.Normalize := CallbackCreate(GetMethod(implObj, "Normalize"), flags, 3)
        this.vtbl.ItemCountLimit := CallbackCreate(GetMethod(implObj, "ItemCountLimit"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RootFolder)
        CallbackFree(this.vtbl.IsSubscribed)
        CallbackFree(this.vtbl.ExistsFeed)
        CallbackFree(this.vtbl.GetFeed)
        CallbackFree(this.vtbl.GetFeedByUrl)
        CallbackFree(this.vtbl.ExistsFolder)
        CallbackFree(this.vtbl.GetFolder)
        CallbackFree(this.vtbl.DeleteFeed)
        CallbackFree(this.vtbl.DeleteFolder)
        CallbackFree(this.vtbl.BackgroundSync)
        CallbackFree(this.vtbl.BackgroundSyncStatus)
        CallbackFree(this.vtbl.DefaultInterval)
        CallbackFree(this.vtbl.SetDefaultInterval)
        CallbackFree(this.vtbl.AsyncSyncAll)
        CallbackFree(this.vtbl.Normalize)
        CallbackFree(this.vtbl.ItemCountLimit)
    }
}

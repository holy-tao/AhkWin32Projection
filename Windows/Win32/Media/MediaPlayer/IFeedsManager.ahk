#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FEEDS_BACKGROUNDSYNC_STATUS.ahk" { FEEDS_BACKGROUNDSYNC_STATUS }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\FEEDS_BACKGROUNDSYNC_ACTION.ahk" { FEEDS_BACKGROUNDSYNC_ACTION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IFeedsManager extends IDispatch {
    /**
     * The interface identifier for IFeedsManager
     * @type {Guid}
     */
    static IID := Guid("{a74029cc-1f1a-4906-88f0-810638d86591}")

    /**
     * The class identifier for FeedsManager
     * @type {Guid}
     */
    static CLSID := Guid("{faeb54c4-f66f-4806-83a0-805299f5e3ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeedsManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RootFolder           : IntPtr
        IsSubscribed             : IntPtr
        ExistsFeed               : IntPtr
        GetFeed                  : IntPtr
        GetFeedByUrl             : IntPtr
        ExistsFolder             : IntPtr
        GetFolder                : IntPtr
        DeleteFeed               : IntPtr
        DeleteFolder             : IntPtr
        BackgroundSync           : IntPtr
        get_BackgroundSyncStatus : IntPtr
        get_DefaultInterval      : IntPtr
        put_DefaultInterval      : IntPtr
        AsyncSyncAll             : IntPtr
        Normalize                : IntPtr
        get_ItemCountLimit       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeedsManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    RootFolder {
        get => this.get_RootFolder()
    }

    /**
     * @type {FEEDS_BACKGROUNDSYNC_STATUS} 
     */
    BackgroundSyncStatus {
        get => this.get_BackgroundSyncStatus()
    }

    /**
     * @type {Integer} 
     */
    DefaultInterval {
        get => this.get_DefaultInterval()
        set => this.put_DefaultInterval(value)
    }

    /**
     * @type {Integer} 
     */
    ItemCountLimit {
        get => this.get_ItemCountLimit()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_RootFolder() {
        result := ComCall(7, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @returns {VARIANT_BOOL} 
     */
    IsSubscribed(feedUrl) {
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(8, this, BSTR, feedUrl, VARIANT_BOOL.Ptr, &subscribed := 0, "HRESULT")
        return subscribed
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFeed(feedPath) {
        feedPath := feedPath is String ? BSTR.Alloc(feedPath).Value : feedPath

        result := ComCall(9, this, BSTR, feedPath, VARIANT_BOOL.Ptr, &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @returns {IDispatch} 
     */
    GetFeed(feedPath) {
        feedPath := feedPath is String ? BSTR.Alloc(feedPath).Value : feedPath

        result := ComCall(10, this, BSTR, feedPath, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @returns {IDispatch} 
     */
    GetFeedByUrl(feedUrl) {
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(11, this, BSTR, feedUrl, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFolder(folderPath) {
        folderPath := folderPath is String ? BSTR.Alloc(folderPath).Value : folderPath

        result := ComCall(12, this, BSTR, folderPath, VARIANT_BOOL.Ptr, &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @returns {IDispatch} 
     */
    GetFolder(folderPath) {
        folderPath := folderPath is String ? BSTR.Alloc(folderPath).Value : folderPath

        result := ComCall(13, this, BSTR, folderPath, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @returns {HRESULT} 
     */
    DeleteFeed(feedPath) {
        feedPath := feedPath is String ? BSTR.Alloc(feedPath).Value : feedPath

        result := ComCall(14, this, BSTR, feedPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @returns {HRESULT} 
     */
    DeleteFolder(folderPath) {
        folderPath := folderPath is String ? BSTR.Alloc(folderPath).Value : folderPath

        result := ComCall(15, this, BSTR, folderPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {FEEDS_BACKGROUNDSYNC_ACTION} action 
     * @returns {HRESULT} 
     */
    BackgroundSync(action) {
        result := ComCall(16, this, FEEDS_BACKGROUNDSYNC_ACTION, action, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FEEDS_BACKGROUNDSYNC_STATUS} 
     */
    get_BackgroundSyncStatus() {
        result := ComCall(17, this, "int*", &_status := 0, "HRESULT")
        return _status
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultInterval() {
        result := ComCall(18, this, "int*", &minutes := 0, "HRESULT")
        return minutes
    }

    /**
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     */
    put_DefaultInterval(minutes) {
        result := ComCall(19, this, "int", minutes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncSyncAll() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} feedXmlIn 
     * @returns {BSTR} 
     */
    Normalize(feedXmlIn) {
        feedXmlIn := feedXmlIn is String ? BSTR.Alloc(feedXmlIn).Value : feedXmlIn

        feedXmlOut := BSTR.Owned()
        result := ComCall(21, this, BSTR, feedXmlIn, BSTR.Ptr, feedXmlOut, "HRESULT")
        return feedXmlOut
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemCountLimit() {
        result := ComCall(22, this, "int*", &itemCountLimit := 0, "HRESULT")
        return itemCountLimit
    }

    Query(iid) {
        if (IFeedsManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RootFolder := CallbackCreate(GetMethod(implObj, "get_RootFolder"), flags, 2)
        this.vtbl.IsSubscribed := CallbackCreate(GetMethod(implObj, "IsSubscribed"), flags, 3)
        this.vtbl.ExistsFeed := CallbackCreate(GetMethod(implObj, "ExistsFeed"), flags, 3)
        this.vtbl.GetFeed := CallbackCreate(GetMethod(implObj, "GetFeed"), flags, 3)
        this.vtbl.GetFeedByUrl := CallbackCreate(GetMethod(implObj, "GetFeedByUrl"), flags, 3)
        this.vtbl.ExistsFolder := CallbackCreate(GetMethod(implObj, "ExistsFolder"), flags, 3)
        this.vtbl.GetFolder := CallbackCreate(GetMethod(implObj, "GetFolder"), flags, 3)
        this.vtbl.DeleteFeed := CallbackCreate(GetMethod(implObj, "DeleteFeed"), flags, 2)
        this.vtbl.DeleteFolder := CallbackCreate(GetMethod(implObj, "DeleteFolder"), flags, 2)
        this.vtbl.BackgroundSync := CallbackCreate(GetMethod(implObj, "BackgroundSync"), flags, 2)
        this.vtbl.get_BackgroundSyncStatus := CallbackCreate(GetMethod(implObj, "get_BackgroundSyncStatus"), flags, 2)
        this.vtbl.get_DefaultInterval := CallbackCreate(GetMethod(implObj, "get_DefaultInterval"), flags, 2)
        this.vtbl.put_DefaultInterval := CallbackCreate(GetMethod(implObj, "put_DefaultInterval"), flags, 2)
        this.vtbl.AsyncSyncAll := CallbackCreate(GetMethod(implObj, "AsyncSyncAll"), flags, 1)
        this.vtbl.Normalize := CallbackCreate(GetMethod(implObj, "Normalize"), flags, 3)
        this.vtbl.get_ItemCountLimit := CallbackCreate(GetMethod(implObj, "get_ItemCountLimit"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RootFolder)
        CallbackFree(this.vtbl.IsSubscribed)
        CallbackFree(this.vtbl.ExistsFeed)
        CallbackFree(this.vtbl.GetFeed)
        CallbackFree(this.vtbl.GetFeedByUrl)
        CallbackFree(this.vtbl.ExistsFolder)
        CallbackFree(this.vtbl.GetFolder)
        CallbackFree(this.vtbl.DeleteFeed)
        CallbackFree(this.vtbl.DeleteFolder)
        CallbackFree(this.vtbl.BackgroundSync)
        CallbackFree(this.vtbl.get_BackgroundSyncStatus)
        CallbackFree(this.vtbl.get_DefaultInterval)
        CallbackFree(this.vtbl.put_DefaultInterval)
        CallbackFree(this.vtbl.AsyncSyncAll)
        CallbackFree(this.vtbl.Normalize)
        CallbackFree(this.vtbl.get_ItemCountLimit)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FEEDS_XML_SORT_ORDER.ahk" { FEEDS_XML_SORT_ORDER }
#Import ".\FEEDS_XML_SORT_PROPERTY.ahk" { FEEDS_XML_SORT_PROPERTY }
#Import ".\FEEDS_XML_FILTER_FLAGS.ahk" { FEEDS_XML_FILTER_FLAGS }
#Import ".\FEEDS_XML_INCLUDE_FLAGS.ahk" { FEEDS_XML_INCLUDE_FLAGS }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FEEDS_SYNC_SETTING.ahk" { FEEDS_SYNC_SETTING }
#Import ".\FEEDS_DOWNLOAD_ERROR.ahk" { FEEDS_DOWNLOAD_ERROR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\FEEDS_EVENTS_MASK.ahk" { FEEDS_EVENTS_MASK }
#Import ".\FEEDS_EVENTS_SCOPE.ahk" { FEEDS_EVENTS_SCOPE }
#Import ".\FEEDS_DOWNLOAD_STATUS.ahk" { FEEDS_DOWNLOAD_STATUS }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IFeed extends IDispatch {
    /**
     * The interface identifier for IFeed
     * @type {Guid}
     */
    static IID := Guid("{f7f915d8-2ede-42bc-98e7-a5d05063a757}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeed interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Xml                                 : IntPtr
        get_Name                            : IntPtr
        Rename                              : IntPtr
        get_Url                             : IntPtr
        put_Url                             : IntPtr
        get_LocalId                         : IntPtr
        get_Path                            : IntPtr
        Move                                : IntPtr
        get_Parent                          : IntPtr
        get_LastWriteTime                   : IntPtr
        Delete                              : IntPtr
        Download                            : IntPtr
        AsyncDownload                       : IntPtr
        CancelAsyncDownload                 : IntPtr
        get_SyncSetting                     : IntPtr
        put_SyncSetting                     : IntPtr
        get_Interval                        : IntPtr
        put_Interval                        : IntPtr
        get_LastDownloadTime                : IntPtr
        get_LocalEnclosurePath              : IntPtr
        get_Items                           : IntPtr
        GetItem                             : IntPtr
        get_Title                           : IntPtr
        get_Description                     : IntPtr
        get_Link                            : IntPtr
        get_Image                           : IntPtr
        get_LastBuildDate                   : IntPtr
        get_PubDate                         : IntPtr
        get_Ttl                             : IntPtr
        get_Language                        : IntPtr
        get_Copyright                       : IntPtr
        get_MaxItemCount                    : IntPtr
        put_MaxItemCount                    : IntPtr
        get_DownloadEnclosuresAutomatically : IntPtr
        put_DownloadEnclosuresAutomatically : IntPtr
        get_DownloadStatus                  : IntPtr
        get_LastDownloadError               : IntPtr
        Merge                               : IntPtr
        get_DownloadUrl                     : IntPtr
        get_IsList                          : IntPtr
        MarkAllItemsRead                    : IntPtr
        GetWatcher                          : IntPtr
        get_UnreadItemCount                 : IntPtr
        get_ItemCount                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeed.Vtbl()
        }
        super.__New(implObj, flags)
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
    Url {
        get => this.get_Url()
        set => this.put_Url(value)
    }

    /**
     * @type {BSTR} 
     */
    LocalId {
        get => this.get_LocalId()
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
     * @type {Float} 
     */
    LastWriteTime {
        get => this.get_LastWriteTime()
    }

    /**
     * @type {FEEDS_SYNC_SETTING} 
     */
    SyncSetting {
        get => this.get_SyncSetting()
        set => this.put_SyncSetting(value)
    }

    /**
     * @type {Integer} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     * @type {Float} 
     */
    LastDownloadTime {
        get => this.get_LastDownloadTime()
    }

    /**
     * @type {BSTR} 
     */
    LocalEnclosurePath {
        get => this.get_LocalEnclosurePath()
    }

    /**
     * @type {IDispatch} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * @type {BSTR} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {BSTR} 
     */
    Link {
        get => this.get_Link()
    }

    /**
     * @type {BSTR} 
     */
    Image {
        get => this.get_Image()
    }

    /**
     * @type {Float} 
     */
    LastBuildDate {
        get => this.get_LastBuildDate()
    }

    /**
     * @type {Float} 
     */
    PubDate {
        get => this.get_PubDate()
    }

    /**
     * @type {Integer} 
     */
    Ttl {
        get => this.get_Ttl()
    }

    /**
     * @type {BSTR} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * @type {BSTR} 
     */
    Copyright {
        get => this.get_Copyright()
    }

    /**
     * @type {Integer} 
     */
    MaxItemCount {
        get => this.get_MaxItemCount()
        set => this.put_MaxItemCount(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DownloadEnclosuresAutomatically {
        get => this.get_DownloadEnclosuresAutomatically()
        set => this.put_DownloadEnclosuresAutomatically(value)
    }

    /**
     * @type {FEEDS_DOWNLOAD_STATUS} 
     */
    DownloadStatus {
        get => this.get_DownloadStatus()
    }

    /**
     * @type {FEEDS_DOWNLOAD_ERROR} 
     */
    LastDownloadError {
        get => this.get_LastDownloadError()
    }

    /**
     * @type {BSTR} 
     */
    DownloadUrl {
        get => this.get_DownloadUrl()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsList {
        get => this.get_IsList()
    }

    /**
     * @type {Integer} 
     */
    UnreadItemCount {
        get => this.get_UnreadItemCount()
    }

    /**
     * @type {Integer} 
     */
    ItemCount {
        get => this.get_ItemCount()
    }

    /**
     * 
     * @param {Integer} count 
     * @param {FEEDS_XML_SORT_PROPERTY} sortProperty 
     * @param {FEEDS_XML_SORT_ORDER} sortOrder 
     * @param {FEEDS_XML_FILTER_FLAGS} filterFlags 
     * @param {FEEDS_XML_INCLUDE_FLAGS} includeFlags 
     * @returns {BSTR} 
     */
    Xml(count, sortProperty, sortOrder, filterFlags, includeFlags) {
        xml := BSTR.Owned()
        result := ComCall(7, this, "int", count, FEEDS_XML_SORT_PROPERTY, sortProperty, FEEDS_XML_SORT_ORDER, sortOrder, FEEDS_XML_FILTER_FLAGS, filterFlags, FEEDS_XML_INCLUDE_FLAGS, includeFlags, BSTR.Ptr, xml, "HRESULT")
        return xml
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    Rename(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Url() {
        feedUrl := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, feedUrl, "HRESULT")
        return feedUrl
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @returns {HRESULT} 
     */
    put_Url(feedUrl) {
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(11, this, BSTR, feedUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalId() {
        feedGuid := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, feedGuid, "HRESULT")
        return feedGuid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        _path := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * 
     * @param {BSTR} newParentPath 
     * @returns {HRESULT} 
     */
    Move(newParentPath) {
        newParentPath := newParentPath is String ? BSTR.Alloc(newParentPath).Value : newParentPath

        result := ComCall(14, this, BSTR, newParentPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(15, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastWriteTime() {
        result := ComCall(16, this, "double*", &lastWrite := 0, "HRESULT")
        return lastWrite
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Download() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FEEDS_SYNC_SETTING} 
     */
    get_SyncSetting() {
        result := ComCall(21, this, "int*", &syncSetting := 0, "HRESULT")
        return syncSetting
    }

    /**
     * 
     * @param {FEEDS_SYNC_SETTING} syncSetting 
     * @returns {HRESULT} 
     */
    put_SyncSetting(syncSetting) {
        result := ComCall(22, this, FEEDS_SYNC_SETTING, syncSetting, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Interval() {
        result := ComCall(23, this, "int*", &minutes := 0, "HRESULT")
        return minutes
    }

    /**
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     */
    put_Interval(minutes) {
        result := ComCall(24, this, "int", minutes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastDownloadTime() {
        result := ComCall(25, this, "double*", &lastDownload := 0, "HRESULT")
        return lastDownload
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalEnclosurePath() {
        _path := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Items() {
        result := ComCall(27, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {Integer} itemId 
     * @returns {IDispatch} 
     */
    GetItem(itemId) {
        result := ComCall(28, this, "int", itemId, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Title() {
        title := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, title, "HRESULT")
        return title
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        description := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Link() {
        _homePage := BSTR.Owned()
        result := ComCall(31, this, BSTR.Ptr, _homePage, "HRESULT")
        return _homePage
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Image() {
        imageUrl := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, imageUrl, "HRESULT")
        return imageUrl
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastBuildDate() {
        result := ComCall(33, this, "double*", &lastBuildDate := 0, "HRESULT")
        return lastBuildDate
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PubDate() {
        result := ComCall(34, this, "double*", &lastPopulateDate := 0, "HRESULT")
        return lastPopulateDate
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ttl() {
        result := ComCall(35, this, "int*", &ttl := 0, "HRESULT")
        return ttl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Language() {
        language := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, language, "HRESULT")
        return language
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Copyright() {
        copyright := BSTR.Owned()
        result := ComCall(37, this, BSTR.Ptr, copyright, "HRESULT")
        return copyright
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxItemCount() {
        result := ComCall(38, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    put_MaxItemCount(count) {
        result := ComCall(39, this, "int", count, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_DownloadEnclosuresAutomatically() {
        result := ComCall(40, this, VARIANT_BOOL.Ptr, &downloadEnclosuresAutomatically := 0, "HRESULT")
        return downloadEnclosuresAutomatically
    }

    /**
     * 
     * @param {VARIANT_BOOL} downloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    put_DownloadEnclosuresAutomatically(downloadEnclosuresAutomatically) {
        result := ComCall(41, this, VARIANT_BOOL, downloadEnclosuresAutomatically, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FEEDS_DOWNLOAD_STATUS} 
     */
    get_DownloadStatus() {
        result := ComCall(42, this, "int*", &_status := 0, "HRESULT")
        return _status
    }

    /**
     * 
     * @returns {FEEDS_DOWNLOAD_ERROR} 
     */
    get_LastDownloadError() {
        result := ComCall(43, this, "int*", &_error := 0, "HRESULT")
        return _error
    }

    /**
     * 
     * @param {BSTR} feedXml 
     * @param {BSTR} feedUrl 
     * @returns {HRESULT} 
     */
    Merge(feedXml, feedUrl) {
        feedXml := feedXml is String ? BSTR.Alloc(feedXml).Value : feedXml
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(44, this, BSTR, feedXml, BSTR, feedUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadUrl() {
        feedUrl := BSTR.Owned()
        result := ComCall(45, this, BSTR.Ptr, feedUrl, "HRESULT")
        return feedUrl
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsList() {
        result := ComCall(46, this, VARIANT_BOOL.Ptr, &isList := 0, "HRESULT")
        return isList
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MarkAllItemsRead() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {FEEDS_EVENTS_SCOPE} scope 
     * @param {FEEDS_EVENTS_MASK} mask 
     * @returns {IDispatch} 
     */
    GetWatcher(scope, mask) {
        result := ComCall(48, this, FEEDS_EVENTS_SCOPE, scope, FEEDS_EVENTS_MASK, mask, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnreadItemCount() {
        result := ComCall(49, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemCount() {
        result := ComCall(50, this, "int*", &count := 0, "HRESULT")
        return count
    }

    Query(iid) {
        if (IFeed.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Xml := CallbackCreate(GetMethod(implObj, "Xml"), flags, 7)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.Rename := CallbackCreate(GetMethod(implObj, "Rename"), flags, 2)
        this.vtbl.get_Url := CallbackCreate(GetMethod(implObj, "get_Url"), flags, 2)
        this.vtbl.put_Url := CallbackCreate(GetMethod(implObj, "put_Url"), flags, 2)
        this.vtbl.get_LocalId := CallbackCreate(GetMethod(implObj, "get_LocalId"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.Move := CallbackCreate(GetMethod(implObj, "Move"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_LastWriteTime := CallbackCreate(GetMethod(implObj, "get_LastWriteTime"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Download := CallbackCreate(GetMethod(implObj, "Download"), flags, 1)
        this.vtbl.AsyncDownload := CallbackCreate(GetMethod(implObj, "AsyncDownload"), flags, 1)
        this.vtbl.CancelAsyncDownload := CallbackCreate(GetMethod(implObj, "CancelAsyncDownload"), flags, 1)
        this.vtbl.get_SyncSetting := CallbackCreate(GetMethod(implObj, "get_SyncSetting"), flags, 2)
        this.vtbl.put_SyncSetting := CallbackCreate(GetMethod(implObj, "put_SyncSetting"), flags, 2)
        this.vtbl.get_Interval := CallbackCreate(GetMethod(implObj, "get_Interval"), flags, 2)
        this.vtbl.put_Interval := CallbackCreate(GetMethod(implObj, "put_Interval"), flags, 2)
        this.vtbl.get_LastDownloadTime := CallbackCreate(GetMethod(implObj, "get_LastDownloadTime"), flags, 2)
        this.vtbl.get_LocalEnclosurePath := CallbackCreate(GetMethod(implObj, "get_LocalEnclosurePath"), flags, 2)
        this.vtbl.get_Items := CallbackCreate(GetMethod(implObj, "get_Items"), flags, 2)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 3)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_Link := CallbackCreate(GetMethod(implObj, "get_Link"), flags, 2)
        this.vtbl.get_Image := CallbackCreate(GetMethod(implObj, "get_Image"), flags, 2)
        this.vtbl.get_LastBuildDate := CallbackCreate(GetMethod(implObj, "get_LastBuildDate"), flags, 2)
        this.vtbl.get_PubDate := CallbackCreate(GetMethod(implObj, "get_PubDate"), flags, 2)
        this.vtbl.get_Ttl := CallbackCreate(GetMethod(implObj, "get_Ttl"), flags, 2)
        this.vtbl.get_Language := CallbackCreate(GetMethod(implObj, "get_Language"), flags, 2)
        this.vtbl.get_Copyright := CallbackCreate(GetMethod(implObj, "get_Copyright"), flags, 2)
        this.vtbl.get_MaxItemCount := CallbackCreate(GetMethod(implObj, "get_MaxItemCount"), flags, 2)
        this.vtbl.put_MaxItemCount := CallbackCreate(GetMethod(implObj, "put_MaxItemCount"), flags, 2)
        this.vtbl.get_DownloadEnclosuresAutomatically := CallbackCreate(GetMethod(implObj, "get_DownloadEnclosuresAutomatically"), flags, 2)
        this.vtbl.put_DownloadEnclosuresAutomatically := CallbackCreate(GetMethod(implObj, "put_DownloadEnclosuresAutomatically"), flags, 2)
        this.vtbl.get_DownloadStatus := CallbackCreate(GetMethod(implObj, "get_DownloadStatus"), flags, 2)
        this.vtbl.get_LastDownloadError := CallbackCreate(GetMethod(implObj, "get_LastDownloadError"), flags, 2)
        this.vtbl.Merge := CallbackCreate(GetMethod(implObj, "Merge"), flags, 3)
        this.vtbl.get_DownloadUrl := CallbackCreate(GetMethod(implObj, "get_DownloadUrl"), flags, 2)
        this.vtbl.get_IsList := CallbackCreate(GetMethod(implObj, "get_IsList"), flags, 2)
        this.vtbl.MarkAllItemsRead := CallbackCreate(GetMethod(implObj, "MarkAllItemsRead"), flags, 1)
        this.vtbl.GetWatcher := CallbackCreate(GetMethod(implObj, "GetWatcher"), flags, 4)
        this.vtbl.get_UnreadItemCount := CallbackCreate(GetMethod(implObj, "get_UnreadItemCount"), flags, 2)
        this.vtbl.get_ItemCount := CallbackCreate(GetMethod(implObj, "get_ItemCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Xml)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.Rename)
        CallbackFree(this.vtbl.get_Url)
        CallbackFree(this.vtbl.put_Url)
        CallbackFree(this.vtbl.get_LocalId)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.Move)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_LastWriteTime)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Download)
        CallbackFree(this.vtbl.AsyncDownload)
        CallbackFree(this.vtbl.CancelAsyncDownload)
        CallbackFree(this.vtbl.get_SyncSetting)
        CallbackFree(this.vtbl.put_SyncSetting)
        CallbackFree(this.vtbl.get_Interval)
        CallbackFree(this.vtbl.put_Interval)
        CallbackFree(this.vtbl.get_LastDownloadTime)
        CallbackFree(this.vtbl.get_LocalEnclosurePath)
        CallbackFree(this.vtbl.get_Items)
        CallbackFree(this.vtbl.GetItem)
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_Link)
        CallbackFree(this.vtbl.get_Image)
        CallbackFree(this.vtbl.get_LastBuildDate)
        CallbackFree(this.vtbl.get_PubDate)
        CallbackFree(this.vtbl.get_Ttl)
        CallbackFree(this.vtbl.get_Language)
        CallbackFree(this.vtbl.get_Copyright)
        CallbackFree(this.vtbl.get_MaxItemCount)
        CallbackFree(this.vtbl.put_MaxItemCount)
        CallbackFree(this.vtbl.get_DownloadEnclosuresAutomatically)
        CallbackFree(this.vtbl.put_DownloadEnclosuresAutomatically)
        CallbackFree(this.vtbl.get_DownloadStatus)
        CallbackFree(this.vtbl.get_LastDownloadError)
        CallbackFree(this.vtbl.Merge)
        CallbackFree(this.vtbl.get_DownloadUrl)
        CallbackFree(this.vtbl.get_IsList)
        CallbackFree(this.vtbl.MarkAllItemsRead)
        CallbackFree(this.vtbl.GetWatcher)
        CallbackFree(this.vtbl.get_UnreadItemCount)
        CallbackFree(this.vtbl.get_ItemCount)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeed extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeed
     * @type {Guid}
     */
    static IID => Guid("{f7f915d8-2ede-42bc-98e7-a5d05063a757}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Xml", "get_Name", "Rename", "get_Url", "put_Url", "get_LocalId", "get_Path", "Move", "get_Parent", "get_LastWriteTime", "Delete", "Download", "AsyncDownload", "CancelAsyncDownload", "get_SyncSetting", "put_SyncSetting", "get_Interval", "put_Interval", "get_LastDownloadTime", "get_LocalEnclosurePath", "get_Items", "GetItem", "get_Title", "get_Description", "get_Link", "get_Image", "get_LastBuildDate", "get_PubDate", "get_Ttl", "get_Language", "get_Copyright", "get_MaxItemCount", "put_MaxItemCount", "get_DownloadEnclosuresAutomatically", "put_DownloadEnclosuresAutomatically", "get_DownloadStatus", "get_LastDownloadError", "Merge", "get_DownloadUrl", "get_IsList", "MarkAllItemsRead", "GetWatcher", "get_UnreadItemCount", "get_ItemCount"]

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
     * @type {Integer} 
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
     * @type {Integer} 
     */
    DownloadStatus {
        get => this.get_DownloadStatus()
    }

    /**
     * @type {Integer} 
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
     * @param {Integer} sortProperty 
     * @param {Integer} sortOrder 
     * @param {Integer} filterFlags 
     * @param {Integer} includeFlags 
     * @returns {BSTR} 
     */
    Xml(count, sortProperty, sortOrder, filterFlags, includeFlags) {
        xml := BSTR()
        result := ComCall(7, this, "int", count, "int", sortProperty, "int", sortOrder, "int", filterFlags, "int", includeFlags, "ptr", xml, "HRESULT")
        return xml
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        name := BSTR()
        result := ComCall(8, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    Rename(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Url() {
        feedUrl := BSTR()
        result := ComCall(10, this, "ptr", feedUrl, "HRESULT")
        return feedUrl
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @returns {HRESULT} 
     */
    put_Url(feedUrl) {
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(11, this, "ptr", feedUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalId() {
        feedGuid := BSTR()
        result := ComCall(12, this, "ptr", feedGuid, "HRESULT")
        return feedGuid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        path := BSTR()
        result := ComCall(13, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * 
     * @param {BSTR} newParentPath 
     * @returns {HRESULT} 
     */
    Move(newParentPath) {
        newParentPath := newParentPath is String ? BSTR.Alloc(newParentPath).Value : newParentPath

        result := ComCall(14, this, "ptr", newParentPath, "HRESULT")
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
     * @returns {Integer} 
     */
    get_SyncSetting() {
        result := ComCall(21, this, "int*", &syncSetting := 0, "HRESULT")
        return syncSetting
    }

    /**
     * 
     * @param {Integer} syncSetting 
     * @returns {HRESULT} 
     */
    put_SyncSetting(syncSetting) {
        result := ComCall(22, this, "int", syncSetting, "HRESULT")
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
        path := BSTR()
        result := ComCall(26, this, "ptr", path, "HRESULT")
        return path
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
        title := BSTR()
        result := ComCall(29, this, "ptr", title, "HRESULT")
        return title
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        description := BSTR()
        result := ComCall(30, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Link() {
        homePage := BSTR()
        result := ComCall(31, this, "ptr", homePage, "HRESULT")
        return homePage
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Image() {
        imageUrl := BSTR()
        result := ComCall(32, this, "ptr", imageUrl, "HRESULT")
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
        language := BSTR()
        result := ComCall(36, this, "ptr", language, "HRESULT")
        return language
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Copyright() {
        copyright := BSTR()
        result := ComCall(37, this, "ptr", copyright, "HRESULT")
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
        result := ComCall(40, this, "short*", &downloadEnclosuresAutomatically := 0, "HRESULT")
        return downloadEnclosuresAutomatically
    }

    /**
     * 
     * @param {VARIANT_BOOL} downloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    put_DownloadEnclosuresAutomatically(downloadEnclosuresAutomatically) {
        result := ComCall(41, this, "short", downloadEnclosuresAutomatically, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadStatus() {
        result := ComCall(42, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastDownloadError() {
        result := ComCall(43, this, "int*", &error := 0, "HRESULT")
        return error
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

        result := ComCall(44, this, "ptr", feedXml, "ptr", feedUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadUrl() {
        feedUrl := BSTR()
        result := ComCall(45, this, "ptr", feedUrl, "HRESULT")
        return feedUrl
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsList() {
        result := ComCall(46, this, "short*", &isList := 0, "HRESULT")
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
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @returns {IDispatch} 
     */
    GetWatcher(scope, mask) {
        result := ComCall(48, this, "int", scope, "int", mask, "ptr*", &disp := 0, "HRESULT")
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
}

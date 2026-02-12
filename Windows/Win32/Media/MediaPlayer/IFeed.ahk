#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * IFeedbackHubAppInfo interface - This API is not available to all apps. Unless your app is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/DevNotes/ifeebackhubappinfo
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
     * Resource string ids set by caller to be returned in xml data for visualizing objects.
     * @param {Integer} count 
     * @param {Integer} sortProperty 
     * @param {Integer} sortOrder 
     * @param {Integer} filterFlags 
     * @param {Integer} includeFlags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dtools/xml-resource-ids
     */
    Xml(count, sortProperty, sortOrder, filterFlags, includeFlags) {
        xml := BSTR()
        result := ComCall(7, this, "int", count, "int", sortProperty, "int", sortOrder, "int", filterFlags, "int", includeFlags, "ptr", xml, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return xml
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        name := BSTR()
        result := ComCall(8, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }

    /**
     * Learn more about: RenameColumnGrbit enumeration
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/renamecolumngrbit-enumeration
     */
    Rename(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(9, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Url() {
        feedUrl := BSTR()
        result := ComCall(10, this, "ptr", feedUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return feedUrl
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @returns {HRESULT} 
     */
    put_Url(feedUrl) {
        if(feedUrl is String) {
            pin := BSTR.Alloc(feedUrl)
            feedUrl := pin.Value
        }

        result := ComCall(11, this, "ptr", feedUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalId() {
        feedGuid := BSTR()
        result := ComCall(12, this, "ptr", feedGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return feedGuid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        path_ := BSTR()
        result := ComCall(13, this, "ptr", path_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return path_
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

        result := ComCall(14, this, "ptr", newParentPath, "int")
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
        result := ComCall(15, this, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastWriteTime() {
        result := ComCall(16, this, "double*", &lastWrite := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lastWrite
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
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Clear method removes all items from a download collection.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/downloadcollection-clear
     */
    Download() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SyncSetting() {
        result := ComCall(21, this, "int*", &syncSetting := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return syncSetting
    }

    /**
     * 
     * @param {Integer} syncSetting 
     * @returns {HRESULT} 
     */
    put_SyncSetting(syncSetting) {
        result := ComCall(22, this, "int", syncSetting, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Interval() {
        result := ComCall(23, this, "int*", &minutes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return minutes
    }

    /**
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     */
    put_Interval(minutes) {
        result := ComCall(24, this, "int", minutes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastDownloadTime() {
        result := ComCall(25, this, "double*", &lastDownload := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lastDownload
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalEnclosurePath() {
        path_ := BSTR()
        result := ComCall(26, this, "ptr", path_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return path_
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Items() {
        result := ComCall(27, this, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @param {Integer} itemId 
     * @returns {IDispatch} 
     */
    GetItem(itemId) {
        result := ComCall(28, this, "int", itemId, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Title() {
        title := BSTR()
        result := ComCall(29, this, "ptr", title, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return title
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        description := BSTR()
        result := ComCall(30, this, "ptr", description, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return description
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Link() {
        homePage_ := BSTR()
        result := ComCall(31, this, "ptr", homePage_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return homePage_
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Image() {
        imageUrl := BSTR()
        result := ComCall(32, this, "ptr", imageUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return imageUrl
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastBuildDate() {
        result := ComCall(33, this, "double*", &lastBuildDate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lastBuildDate
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PubDate() {
        result := ComCall(34, this, "double*", &lastPopulateDate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lastPopulateDate
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ttl() {
        result := ComCall(35, this, "int*", &ttl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ttl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Language() {
        language := BSTR()
        result := ComCall(36, this, "ptr", language, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return language
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Copyright() {
        copyright := BSTR()
        result := ComCall(37, this, "ptr", copyright, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return copyright
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxItemCount() {
        result := ComCall(38, this, "int*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    put_MaxItemCount(count) {
        result := ComCall(39, this, "int", count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_DownloadEnclosuresAutomatically() {
        result := ComCall(40, this, "short*", &downloadEnclosuresAutomatically := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return downloadEnclosuresAutomatically
    }

    /**
     * 
     * @param {VARIANT_BOOL} downloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    put_DownloadEnclosuresAutomatically(downloadEnclosuresAutomatically) {
        result := ComCall(41, this, "short", downloadEnclosuresAutomatically, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadStatus() {
        result := ComCall(42, this, "int*", &status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastDownloadError() {
        result := ComCall(43, this, "int*", &error := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return error
    }

    /**
     * The CloseDatabase method of the Merge object closes the currently open Windows Installer database.
     * @remarks
     * Closing a database clears all dependency information but does not affect any errors that have not been retrieved.
     * @param {BSTR} feedXml 
     * @param {BSTR} feedUrl 
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Msi/merge-closedatabase
     */
    Merge(feedXml, feedUrl) {
        if(feedXml is String) {
            pin := BSTR.Alloc(feedXml)
            feedXml := pin.Value
        }
        if(feedUrl is String) {
            pin := BSTR.Alloc(feedUrl)
            feedUrl := pin.Value
        }

        result := ComCall(44, this, "ptr", feedXml, "ptr", feedUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadUrl() {
        feedUrl := BSTR()
        result := ComCall(45, this, "ptr", feedUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return feedUrl
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsList() {
        result := ComCall(46, this, "short*", &isList := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isList
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MarkAllItemsRead() {
        result := ComCall(47, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @returns {IDispatch} 
     */
    GetWatcher(scope, mask) {
        result := ComCall(48, this, "int", scope, "int", mask, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnreadItemCount() {
        result := ComCall(49, this, "int*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemCount() {
        result := ComCall(50, this, "int*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }
}

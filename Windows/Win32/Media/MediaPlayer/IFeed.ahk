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
     * 
     * @param {Integer} count 
     * @param {Integer} sortProperty 
     * @param {Integer} sortOrder 
     * @param {Integer} filterFlags 
     * @param {Integer} includeFlags 
     * @param {Pointer<BSTR>} xml 
     * @returns {HRESULT} 
     */
    Xml(count, sortProperty, sortOrder, filterFlags, includeFlags, xml) {
        result := ComCall(7, this, "int", count, "int", sortProperty, "int", sortOrder, "int", filterFlags, "int", includeFlags, "ptr", xml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} feedUrl 
     * @returns {HRESULT} 
     */
    get_Url(feedUrl) {
        result := ComCall(10, this, "ptr", feedUrl, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} feedGuid 
     * @returns {HRESULT} 
     */
    get_LocalId(feedGuid) {
        result := ComCall(12, this, "ptr", feedGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_Path(path) {
        result := ComCall(13, this, "ptr", path, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Parent(disp) {
        result := ComCall(15, this, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} lastWrite 
     * @returns {HRESULT} 
     */
    get_LastWriteTime(lastWrite) {
        result := ComCall(16, this, "double*", lastWrite, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} syncSetting 
     * @returns {HRESULT} 
     */
    get_SyncSetting(syncSetting) {
        result := ComCall(21, this, "int*", syncSetting, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} minutes 
     * @returns {HRESULT} 
     */
    get_Interval(minutes) {
        result := ComCall(23, this, "int*", minutes, "HRESULT")
        return result
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
     * @param {Pointer<Float>} lastDownload 
     * @returns {HRESULT} 
     */
    get_LastDownloadTime(lastDownload) {
        result := ComCall(25, this, "double*", lastDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_LocalEnclosurePath(path) {
        result := ComCall(26, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Items(disp) {
        result := ComCall(27, this, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} itemId 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    GetItem(itemId, disp) {
        result := ComCall(28, this, "int", itemId, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} title 
     * @returns {HRESULT} 
     */
    get_Title(title) {
        result := ComCall(29, this, "ptr", title, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     */
    get_Description(description) {
        result := ComCall(30, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} homePage 
     * @returns {HRESULT} 
     */
    get_Link(homePage) {
        result := ComCall(31, this, "ptr", homePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} imageUrl 
     * @returns {HRESULT} 
     */
    get_Image(imageUrl) {
        result := ComCall(32, this, "ptr", imageUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} lastBuildDate 
     * @returns {HRESULT} 
     */
    get_LastBuildDate(lastBuildDate) {
        result := ComCall(33, this, "double*", lastBuildDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} lastPopulateDate 
     * @returns {HRESULT} 
     */
    get_PubDate(lastPopulateDate) {
        result := ComCall(34, this, "double*", lastPopulateDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ttl 
     * @returns {HRESULT} 
     */
    get_Ttl(ttl) {
        result := ComCall(35, this, "int*", ttl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} language 
     * @returns {HRESULT} 
     */
    get_Language(language) {
        result := ComCall(36, this, "ptr", language, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} copyright 
     * @returns {HRESULT} 
     */
    get_Copyright(copyright) {
        result := ComCall(37, this, "ptr", copyright, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     */
    get_MaxItemCount(count) {
        result := ComCall(38, this, "int*", count, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} downloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    get_DownloadEnclosuresAutomatically(downloadEnclosuresAutomatically) {
        result := ComCall(40, this, "ptr", downloadEnclosuresAutomatically, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} status 
     * @returns {HRESULT} 
     */
    get_DownloadStatus(status) {
        result := ComCall(42, this, "int*", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} error 
     * @returns {HRESULT} 
     */
    get_LastDownloadError(error) {
        result := ComCall(43, this, "int*", error, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} feedUrl 
     * @returns {HRESULT} 
     */
    get_DownloadUrl(feedUrl) {
        result := ComCall(45, this, "ptr", feedUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isList 
     * @returns {HRESULT} 
     */
    get_IsList(isList) {
        result := ComCall(46, this, "ptr", isList, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    GetWatcher(scope, mask, disp) {
        result := ComCall(48, this, "int", scope, "int", mask, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     */
    get_UnreadItemCount(count) {
        result := ComCall(49, this, "int*", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     */
    get_ItemCount(count) {
        result := ComCall(50, this, "int*", count, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\IXFeedsEnum.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeed extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeed
     * @type {Guid}
     */
    static IID => Guid("{a44179a4-e0f6-403b-af8d-d080f425a451}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Xml", "Name", "Rename", "Url", "SetUrl", "LocalId", "Path", "Move", "Parent", "LastWriteTime", "Delete", "Download", "AsyncDownload", "CancelAsyncDownload", "SyncSetting", "SetSyncSetting", "Interval", "SetInterval", "LastDownloadTime", "LocalEnclosurePath", "Items", "GetItem", "MarkAllItemsRead", "MaxItemCount", "SetMaxItemCount", "DownloadEnclosuresAutomatically", "SetDownloadEnclosuresAutomatically", "DownloadStatus", "LastDownloadError", "Merge", "DownloadUrl", "Title", "Description", "Link", "Image", "LastBuildDate", "PubDate", "Ttl", "Language", "Copyright", "IsList", "GetWatcher", "UnreadItemCount", "ItemCount"]

    /**
     * 
     * @param {Integer} uiItemCount 
     * @param {Integer} sortProperty 
     * @param {Integer} sortOrder 
     * @param {Integer} filterFlags 
     * @param {Integer} includeFlags 
     * @returns {IStream} 
     */
    Xml(uiItemCount, sortProperty, sortOrder, filterFlags, includeFlags) {
        result := ComCall(3, this, "uint", uiItemCount, "int", sortProperty, "int", sortOrder, "int", filterFlags, "int", includeFlags, "ptr*", &pps := 0, "HRESULT")
        return IStream(pps)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Name() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    Rename(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Url() {
        result := ComCall(6, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} 
     */
    SetUrl(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(7, this, "ptr", pszUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    LocalId() {
        pguid := Guid()
        result := ComCall(8, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Path() {
        result := ComCall(9, this, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    Move(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Parent(riid) {
        result := ComCall(11, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastWriteTime() {
        pstLastWriteTime := SYSTEMTIME()
        result := ComCall(12, this, "ptr", pstLastWriteTime, "HRESULT")
        return pstLastWriteTime
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Download() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    SyncSetting() {
        result := ComCall(17, this, "int*", &pfss := 0, "HRESULT")
        return pfss
    }

    /**
     * 
     * @param {Integer} fss 
     * @returns {HRESULT} 
     */
    SetSyncSetting(fss) {
        result := ComCall(18, this, "int", fss, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Interval() {
        result := ComCall(19, this, "uint*", &puiInterval := 0, "HRESULT")
        return puiInterval
    }

    /**
     * 
     * @param {Integer} uiInterval 
     * @returns {HRESULT} 
     */
    SetInterval(uiInterval) {
        result := ComCall(20, this, "uint", uiInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastDownloadTime() {
        pstLastDownloadTime := SYSTEMTIME()
        result := ComCall(21, this, "ptr", pstLastDownloadTime, "HRESULT")
        return pstLastDownloadTime
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    LocalEnclosurePath() {
        result := ComCall(22, this, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * 
     * @returns {IXFeedsEnum} 
     */
    Items() {
        result := ComCall(23, this, "ptr*", &ppfe := 0, "HRESULT")
        return IXFeedsEnum(ppfe)
    }

    /**
     * 
     * @param {Integer} uiId 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetItem(uiId, riid) {
        result := ComCall(24, this, "uint", uiId, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MarkAllItemsRead() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    MaxItemCount() {
        result := ComCall(26, this, "uint*", &puiMaxItemCount := 0, "HRESULT")
        return puiMaxItemCount
    }

    /**
     * 
     * @param {Integer} uiMaxItemCount 
     * @returns {HRESULT} 
     */
    SetMaxItemCount(uiMaxItemCount) {
        result := ComCall(27, this, "uint", uiMaxItemCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    DownloadEnclosuresAutomatically() {
        result := ComCall(28, this, "int*", &pbDownloadEnclosuresAutomatically := 0, "HRESULT")
        return pbDownloadEnclosuresAutomatically
    }

    /**
     * 
     * @param {BOOL} bDownloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    SetDownloadEnclosuresAutomatically(bDownloadEnclosuresAutomatically) {
        result := ComCall(29, this, "int", bDownloadEnclosuresAutomatically, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    DownloadStatus() {
        result := ComCall(30, this, "int*", &pfds := 0, "HRESULT")
        return pfds
    }

    /**
     * 
     * @returns {Integer} 
     */
    LastDownloadError() {
        result := ComCall(31, this, "int*", &pfde := 0, "HRESULT")
        return pfde
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} 
     */
    Merge(pStream, pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(32, this, "ptr", pStream, "ptr", pszUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(33, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Title() {
        result := ComCall(34, this, "ptr*", &ppszTitle := 0, "HRESULT")
        return ppszTitle
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Description() {
        result := ComCall(35, this, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Link() {
        result := ComCall(36, this, "ptr*", &ppszHomePage := 0, "HRESULT")
        return ppszHomePage
    }

    /**
     * The Image class provides methods for loading and saving raster images (bitmaps) and vector images (metafiles).
     * @returns {PWSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-image
     */
    Image() {
        result := ComCall(37, this, "ptr*", &ppszImageUrl := 0, "HRESULT")
        return ppszImageUrl
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastBuildDate() {
        pstLastBuildDate := SYSTEMTIME()
        result := ComCall(38, this, "ptr", pstLastBuildDate, "HRESULT")
        return pstLastBuildDate
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    PubDate() {
        pstPubDate := SYSTEMTIME()
        result := ComCall(39, this, "ptr", pstPubDate, "HRESULT")
        return pstPubDate
    }

    /**
     * 
     * @returns {Integer} 
     */
    Ttl() {
        result := ComCall(40, this, "uint*", &puiTtl := 0, "HRESULT")
        return puiTtl
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Language() {
        result := ComCall(41, this, "ptr*", &ppszLanguage := 0, "HRESULT")
        return ppszLanguage
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Copyright() {
        result := ComCall(42, this, "ptr*", &ppszCopyright := 0, "HRESULT")
        return ppszCopyright
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsList() {
        result := ComCall(43, this, "int*", &pbIsList := 0, "HRESULT")
        return pbIsList
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetWatcher(scope, mask, riid) {
        result := ComCall(44, this, "int", scope, "int", mask, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {Integer} 
     */
    UnreadItemCount() {
        result := ComCall(45, this, "uint*", &puiUnreadItemCount := 0, "HRESULT")
        return puiUnreadItemCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    ItemCount() {
        result := ComCall(46, this, "uint*", &puiItemCount := 0, "HRESULT")
        return puiItemCount
    }
}

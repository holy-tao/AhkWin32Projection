#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IStream>} pps 
     * @returns {HRESULT} 
     */
    Xml(uiItemCount, sortProperty, sortOrder, filterFlags, includeFlags, pps) {
        result := ComCall(3, this, "uint", uiItemCount, "int", sortProperty, "int", sortOrder, "int", filterFlags, "int", includeFlags, "ptr*", pps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    Name(ppszName) {
        result := ComCall(4, this, "ptr", ppszName, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} ppszUrl 
     * @returns {HRESULT} 
     */
    Url(ppszUrl) {
        result := ComCall(6, this, "ptr", ppszUrl, "HRESULT")
        return result
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
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    LocalId(pguid) {
        result := ComCall(8, this, "ptr", pguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} 
     */
    Path(ppszPath) {
        result := ComCall(9, this, "ptr", ppszPath, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    Parent(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstLastWriteTime 
     * @returns {HRESULT} 
     */
    LastWriteTime(pstLastWriteTime) {
        result := ComCall(12, this, "ptr", pstLastWriteTime, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pfss 
     * @returns {HRESULT} 
     */
    SyncSetting(pfss) {
        pfssMarshal := pfss is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pfssMarshal, pfss, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} puiInterval 
     * @returns {HRESULT} 
     */
    Interval(puiInterval) {
        puiIntervalMarshal := puiInterval is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, puiIntervalMarshal, puiInterval, "HRESULT")
        return result
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
     * @param {Pointer<SYSTEMTIME>} pstLastDownloadTime 
     * @returns {HRESULT} 
     */
    LastDownloadTime(pstLastDownloadTime) {
        result := ComCall(21, this, "ptr", pstLastDownloadTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} 
     */
    LocalEnclosurePath(ppszPath) {
        result := ComCall(22, this, "ptr", ppszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXFeedsEnum>} ppfe 
     * @returns {HRESULT} 
     */
    Items(ppfe) {
        result := ComCall(23, this, "ptr*", ppfe, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetItem(uiId, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(24, this, "uint", uiId, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} puiMaxItemCount 
     * @returns {HRESULT} 
     */
    MaxItemCount(puiMaxItemCount) {
        puiMaxItemCountMarshal := puiMaxItemCount is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, puiMaxItemCountMarshal, puiMaxItemCount, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbDownloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    DownloadEnclosuresAutomatically(pbDownloadEnclosuresAutomatically) {
        result := ComCall(28, this, "ptr", pbDownloadEnclosuresAutomatically, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pfds 
     * @returns {HRESULT} 
     */
    DownloadStatus(pfds) {
        pfdsMarshal := pfds is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, pfdsMarshal, pfds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pfde 
     * @returns {HRESULT} 
     */
    LastDownloadError(pfde) {
        pfdeMarshal := pfde is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, pfdeMarshal, pfde, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} ppszUrl 
     * @returns {HRESULT} 
     */
    DownloadUrl(ppszUrl) {
        result := ComCall(33, this, "ptr", ppszUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTitle 
     * @returns {HRESULT} 
     */
    Title(ppszTitle) {
        result := ComCall(34, this, "ptr", ppszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDescription 
     * @returns {HRESULT} 
     */
    Description(ppszDescription) {
        result := ComCall(35, this, "ptr", ppszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszHomePage 
     * @returns {HRESULT} 
     */
    Link(ppszHomePage) {
        result := ComCall(36, this, "ptr", ppszHomePage, "HRESULT")
        return result
    }

    /**
     * The Image class provides methods for loading and saving raster images (bitmaps) and vector images (metafiles).
     * @param {Pointer<PWSTR>} ppszImageUrl 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-image
     */
    Image(ppszImageUrl) {
        result := ComCall(37, this, "ptr", ppszImageUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstLastBuildDate 
     * @returns {HRESULT} 
     */
    LastBuildDate(pstLastBuildDate) {
        result := ComCall(38, this, "ptr", pstLastBuildDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstPubDate 
     * @returns {HRESULT} 
     */
    PubDate(pstPubDate) {
        result := ComCall(39, this, "ptr", pstPubDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiTtl 
     * @returns {HRESULT} 
     */
    Ttl(puiTtl) {
        puiTtlMarshal := puiTtl is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, puiTtlMarshal, puiTtl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszLanguage 
     * @returns {HRESULT} 
     */
    Language(ppszLanguage) {
        result := ComCall(41, this, "ptr", ppszLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszCopyright 
     * @returns {HRESULT} 
     */
    Copyright(ppszCopyright) {
        result := ComCall(42, this, "ptr", ppszCopyright, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbIsList 
     * @returns {HRESULT} 
     */
    IsList(pbIsList) {
        result := ComCall(43, this, "ptr", pbIsList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetWatcher(scope, mask, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(44, this, "int", scope, "int", mask, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiUnreadItemCount 
     * @returns {HRESULT} 
     */
    UnreadItemCount(puiUnreadItemCount) {
        puiUnreadItemCountMarshal := puiUnreadItemCount is VarRef ? "uint*" : "ptr"

        result := ComCall(45, this, puiUnreadItemCountMarshal, puiUnreadItemCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiItemCount 
     * @returns {HRESULT} 
     */
    ItemCount(puiItemCount) {
        puiItemCountMarshal := puiItemCount is VarRef ? "uint*" : "ptr"

        result := ComCall(46, this, puiItemCountMarshal, puiItemCount, "HRESULT")
        return result
    }
}

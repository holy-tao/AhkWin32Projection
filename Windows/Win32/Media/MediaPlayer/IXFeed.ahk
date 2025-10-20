#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeed extends IUnknown{
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
        result := ComCall(3, this, "uint", uiItemCount, "int", sortProperty, "int", sortOrder, "int", filterFlags, "int", includeFlags, "ptr", pps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    Name(ppszName) {
        result := ComCall(4, this, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    Rename(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUrl 
     * @returns {HRESULT} 
     */
    Url(ppszUrl) {
        result := ComCall(6, this, "ptr", ppszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} 
     */
    SetUrl(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(7, this, "ptr", pszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    LocalId(pguid) {
        result := ComCall(8, this, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} 
     */
    Path(ppszPath) {
        result := ComCall(9, this, "ptr", ppszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    Move(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    Parent(riid, ppv) {
        result := ComCall(11, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstLastWriteTime 
     * @returns {HRESULT} 
     */
    LastWriteTime(pstLastWriteTime) {
        result := ComCall(12, this, "ptr", pstLastWriteTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Download() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pfss 
     * @returns {HRESULT} 
     */
    SyncSetting(pfss) {
        result := ComCall(17, this, "int*", pfss, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fss 
     * @returns {HRESULT} 
     */
    SetSyncSetting(fss) {
        result := ComCall(18, this, "int", fss, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiInterval 
     * @returns {HRESULT} 
     */
    Interval(puiInterval) {
        result := ComCall(19, this, "uint*", puiInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiInterval 
     * @returns {HRESULT} 
     */
    SetInterval(uiInterval) {
        result := ComCall(20, this, "uint", uiInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstLastDownloadTime 
     * @returns {HRESULT} 
     */
    LastDownloadTime(pstLastDownloadTime) {
        result := ComCall(21, this, "ptr", pstLastDownloadTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} 
     */
    LocalEnclosurePath(ppszPath) {
        result := ComCall(22, this, "ptr", ppszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXFeedsEnum>} ppfe 
     * @returns {HRESULT} 
     */
    Items(ppfe) {
        result := ComCall(23, this, "ptr", ppfe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetItem(uiId, riid, ppv) {
        result := ComCall(24, this, "uint", uiId, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MarkAllItemsRead() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiMaxItemCount 
     * @returns {HRESULT} 
     */
    MaxItemCount(puiMaxItemCount) {
        result := ComCall(26, this, "uint*", puiMaxItemCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiMaxItemCount 
     * @returns {HRESULT} 
     */
    SetMaxItemCount(uiMaxItemCount) {
        result := ComCall(27, this, "uint", uiMaxItemCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbDownloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    DownloadEnclosuresAutomatically(pbDownloadEnclosuresAutomatically) {
        result := ComCall(28, this, "ptr", pbDownloadEnclosuresAutomatically, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bDownloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    SetDownloadEnclosuresAutomatically(bDownloadEnclosuresAutomatically) {
        result := ComCall(29, this, "int", bDownloadEnclosuresAutomatically, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pfds 
     * @returns {HRESULT} 
     */
    DownloadStatus(pfds) {
        result := ComCall(30, this, "int*", pfds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pfde 
     * @returns {HRESULT} 
     */
    LastDownloadError(pfde) {
        result := ComCall(31, this, "int*", pfde, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} 
     */
    Merge(pStream, pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(32, this, "ptr", pStream, "ptr", pszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUrl 
     * @returns {HRESULT} 
     */
    DownloadUrl(ppszUrl) {
        result := ComCall(33, this, "ptr", ppszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTitle 
     * @returns {HRESULT} 
     */
    Title(ppszTitle) {
        result := ComCall(34, this, "ptr", ppszTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDescription 
     * @returns {HRESULT} 
     */
    Description(ppszDescription) {
        result := ComCall(35, this, "ptr", ppszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszHomePage 
     * @returns {HRESULT} 
     */
    Link(ppszHomePage) {
        result := ComCall(36, this, "ptr", ppszHomePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The Image class provides methods for loading and saving raster images (bitmaps) and vector images (metafiles).
     * @param {Pointer<PWSTR>} ppszImageUrl 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-image
     */
    Image(ppszImageUrl) {
        result := ComCall(37, this, "ptr", ppszImageUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstLastBuildDate 
     * @returns {HRESULT} 
     */
    LastBuildDate(pstLastBuildDate) {
        result := ComCall(38, this, "ptr", pstLastBuildDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstPubDate 
     * @returns {HRESULT} 
     */
    PubDate(pstPubDate) {
        result := ComCall(39, this, "ptr", pstPubDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiTtl 
     * @returns {HRESULT} 
     */
    Ttl(puiTtl) {
        result := ComCall(40, this, "uint*", puiTtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszLanguage 
     * @returns {HRESULT} 
     */
    Language(ppszLanguage) {
        result := ComCall(41, this, "ptr", ppszLanguage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszCopyright 
     * @returns {HRESULT} 
     */
    Copyright(ppszCopyright) {
        result := ComCall(42, this, "ptr", ppszCopyright, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbIsList 
     * @returns {HRESULT} 
     */
    IsList(pbIsList) {
        result := ComCall(43, this, "ptr", pbIsList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetWatcher(scope, mask, riid, ppv) {
        result := ComCall(44, this, "int", scope, "int", mask, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiUnreadItemCount 
     * @returns {HRESULT} 
     */
    UnreadItemCount(puiUnreadItemCount) {
        result := ComCall(45, this, "uint*", puiUnreadItemCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiItemCount 
     * @returns {HRESULT} 
     */
    ItemCount(puiItemCount) {
        result := ComCall(46, this, "uint*", puiItemCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

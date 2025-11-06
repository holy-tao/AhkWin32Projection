#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedsManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedsManager
     * @type {Guid}
     */
    static IID => Guid("{5357e238-fb12-4aca-a930-cab7832b84bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RootFolder", "IsSubscribed", "ExistsFeed", "GetFeed", "GetFeedByUrl", "ExistsFolder", "GetFolder", "DeleteFeed", "DeleteFolder", "BackgroundSync", "BackgroundSyncStatus", "DefaultInterval", "SetDefaultInterval", "AsyncSyncAll", "Normalize", "ItemCountLimit"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RootFolder(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @returns {BOOL} 
     */
    IsSubscribed(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(4, this, "ptr", pszUrl, "int*", &pbSubscribed := 0, "HRESULT")
        return pbSubscribed
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {BOOL} 
     */
    ExistsFeed(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(5, this, "ptr", pszPath, "int*", &pbFeedExists := 0, "HRESULT")
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

        result := ComCall(6, this, "ptr", pszPath, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
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

        result := ComCall(7, this, "ptr", pszUrl, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {BOOL} 
     */
    ExistsFolder(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(8, this, "ptr", pszPath, "int*", &pbFolderExists := 0, "HRESULT")
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

        result := ComCall(9, this, "ptr", pszPath, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
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
     * @param {Integer} fbsa 
     * @returns {HRESULT} 
     */
    BackgroundSync(fbsa) {
        result := ComCall(12, this, "int", fbsa, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
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
}

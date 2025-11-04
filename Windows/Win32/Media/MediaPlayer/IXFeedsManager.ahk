#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    RootFolder(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @param {Pointer<BOOL>} pbSubscribed 
     * @returns {HRESULT} 
     */
    IsSubscribed(pszUrl, pbSubscribed) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(4, this, "ptr", pszUrl, "ptr", pbSubscribed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<BOOL>} pbFeedExists 
     * @returns {HRESULT} 
     */
    ExistsFeed(pszPath, pbFeedExists) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(5, this, "ptr", pszPath, "ptr", pbFeedExists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetFeed(pszPath, riid, ppv) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pszPath, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetFeedByUrl(pszUrl, riid, ppv) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pszUrl, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<BOOL>} pbFolderExists 
     * @returns {HRESULT} 
     */
    ExistsFolder(pszPath, pbFolderExists) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(8, this, "ptr", pszPath, "ptr", pbFolderExists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetFolder(pszPath, riid, ppv) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", pszPath, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pfbss 
     * @returns {HRESULT} 
     */
    BackgroundSyncStatus(pfbss) {
        pfbssMarshal := pfbss is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pfbssMarshal, pfbss, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiInterval 
     * @returns {HRESULT} 
     */
    DefaultInterval(puiInterval) {
        puiIntervalMarshal := puiInterval is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, puiIntervalMarshal, puiInterval, "HRESULT")
        return result
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
     * @param {Pointer<IStream>} ppStreamOut 
     * @returns {HRESULT} 
     */
    Normalize(pStreamIn, ppStreamOut) {
        result := ComCall(17, this, "ptr", pStreamIn, "ptr*", ppStreamOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiItemCountLimit 
     * @returns {HRESULT} 
     */
    ItemCountLimit(puiItemCountLimit) {
        puiItemCountLimitMarshal := puiItemCountLimit is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, puiItemCountLimitMarshal, puiItemCountLimit, "HRESULT")
        return result
    }
}

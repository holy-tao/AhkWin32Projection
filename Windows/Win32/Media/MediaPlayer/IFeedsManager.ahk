#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedsManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedsManager
     * @type {Guid}
     */
    static IID => Guid("{a74029cc-1f1a-4906-88f0-810638d86591}")

    /**
     * The class identifier for FeedsManager
     * @type {Guid}
     */
    static CLSID => Guid("{faeb54c4-f66f-4806-83a0-805299f5e3ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RootFolder", "IsSubscribed", "ExistsFeed", "GetFeed", "GetFeedByUrl", "ExistsFolder", "GetFolder", "DeleteFeed", "DeleteFolder", "BackgroundSync", "get_BackgroundSyncStatus", "get_DefaultInterval", "put_DefaultInterval", "AsyncSyncAll", "Normalize", "get_ItemCountLimit"]

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

        result := ComCall(8, this, "ptr", feedUrl, "short*", &subscribed := 0, "HRESULT")
        return subscribed
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFeed(feedPath) {
        feedPath := feedPath is String ? BSTR.Alloc(feedPath).Value : feedPath

        result := ComCall(9, this, "ptr", feedPath, "short*", &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @returns {IDispatch} 
     */
    GetFeed(feedPath) {
        feedPath := feedPath is String ? BSTR.Alloc(feedPath).Value : feedPath

        result := ComCall(10, this, "ptr", feedPath, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @returns {IDispatch} 
     */
    GetFeedByUrl(feedUrl) {
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(11, this, "ptr", feedUrl, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFolder(folderPath) {
        folderPath := folderPath is String ? BSTR.Alloc(folderPath).Value : folderPath

        result := ComCall(12, this, "ptr", folderPath, "short*", &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @returns {IDispatch} 
     */
    GetFolder(folderPath) {
        folderPath := folderPath is String ? BSTR.Alloc(folderPath).Value : folderPath

        result := ComCall(13, this, "ptr", folderPath, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @returns {HRESULT} 
     */
    DeleteFeed(feedPath) {
        feedPath := feedPath is String ? BSTR.Alloc(feedPath).Value : feedPath

        result := ComCall(14, this, "ptr", feedPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @returns {HRESULT} 
     */
    DeleteFolder(folderPath) {
        folderPath := folderPath is String ? BSTR.Alloc(folderPath).Value : folderPath

        result := ComCall(15, this, "ptr", folderPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    BackgroundSync(action) {
        result := ComCall(16, this, "int", action, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSyncStatus() {
        result := ComCall(17, this, "int*", &status := 0, "HRESULT")
        return status
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

        feedXmlOut := BSTR()
        result := ComCall(21, this, "ptr", feedXmlIn, "ptr", feedXmlOut, "HRESULT")
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
}

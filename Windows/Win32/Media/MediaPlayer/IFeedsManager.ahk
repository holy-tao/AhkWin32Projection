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
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_RootFolder(disp) {
        result := ComCall(7, this, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @param {Pointer<VARIANT_BOOL>} subscribed 
     * @returns {HRESULT} 
     */
    IsSubscribed(feedUrl, subscribed) {
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(8, this, "ptr", feedUrl, "ptr", subscribed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @param {Pointer<VARIANT_BOOL>} exists 
     * @returns {HRESULT} 
     */
    ExistsFeed(feedPath, exists) {
        feedPath := feedPath is String ? BSTR.Alloc(feedPath).Value : feedPath

        result := ComCall(9, this, "ptr", feedPath, "ptr", exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    GetFeed(feedPath, disp) {
        feedPath := feedPath is String ? BSTR.Alloc(feedPath).Value : feedPath

        result := ComCall(10, this, "ptr", feedPath, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    GetFeedByUrl(feedUrl, disp) {
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(11, this, "ptr", feedUrl, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @param {Pointer<VARIANT_BOOL>} exists 
     * @returns {HRESULT} 
     */
    ExistsFolder(folderPath, exists) {
        folderPath := folderPath is String ? BSTR.Alloc(folderPath).Value : folderPath

        result := ComCall(12, this, "ptr", folderPath, "ptr", exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    GetFolder(folderPath, disp) {
        folderPath := folderPath is String ? BSTR.Alloc(folderPath).Value : folderPath

        result := ComCall(13, this, "ptr", folderPath, "ptr*", disp, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} status 
     * @returns {HRESULT} 
     */
    get_BackgroundSyncStatus(status) {
        result := ComCall(17, this, "int*", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} minutes 
     * @returns {HRESULT} 
     */
    get_DefaultInterval(minutes) {
        result := ComCall(18, this, "int*", minutes, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} feedXmlOut 
     * @returns {HRESULT} 
     */
    Normalize(feedXmlIn, feedXmlOut) {
        feedXmlIn := feedXmlIn is String ? BSTR.Alloc(feedXmlIn).Value : feedXmlIn

        result := ComCall(21, this, "ptr", feedXmlIn, "ptr", feedXmlOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} itemCountLimit 
     * @returns {HRESULT} 
     */
    get_ItemCountLimit(itemCountLimit) {
        result := ComCall(22, this, "int*", itemCountLimit, "HRESULT")
        return result
    }
}

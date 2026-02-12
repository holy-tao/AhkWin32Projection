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
     * @type {IDispatch} 
     */
    RootFolder {
        get => this.get_RootFolder()
    }

    /**
     * @type {Integer} 
     */
    BackgroundSyncStatus {
        get => this.get_BackgroundSyncStatus()
    }

    /**
     * @type {Integer} 
     */
    DefaultInterval {
        get => this.get_DefaultInterval()
        set => this.put_DefaultInterval(value)
    }

    /**
     * @type {Integer} 
     */
    ItemCountLimit {
        get => this.get_ItemCountLimit()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_RootFolder() {
        result := ComCall(7, this, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @returns {VARIANT_BOOL} 
     */
    IsSubscribed(feedUrl) {
        if(feedUrl is String) {
            pin := BSTR.Alloc(feedUrl)
            feedUrl := pin.Value
        }

        result := ComCall(8, this, "ptr", feedUrl, "short*", &subscribed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return subscribed
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFeed(feedPath) {
        if(feedPath is String) {
            pin := BSTR.Alloc(feedPath)
            feedPath := pin.Value
        }

        result := ComCall(9, this, "ptr", feedPath, "short*", &exists := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return exists
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @returns {IDispatch} 
     */
    GetFeed(feedPath) {
        if(feedPath is String) {
            pin := BSTR.Alloc(feedPath)
            feedPath := pin.Value
        }

        result := ComCall(10, this, "ptr", feedPath, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @returns {IDispatch} 
     */
    GetFeedByUrl(feedUrl) {
        if(feedUrl is String) {
            pin := BSTR.Alloc(feedUrl)
            feedUrl := pin.Value
        }

        result := ComCall(11, this, "ptr", feedUrl, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFolder(folderPath) {
        if(folderPath is String) {
            pin := BSTR.Alloc(folderPath)
            folderPath := pin.Value
        }

        result := ComCall(12, this, "ptr", folderPath, "short*", &exists := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return exists
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @returns {IDispatch} 
     */
    GetFolder(folderPath) {
        if(folderPath is String) {
            pin := BSTR.Alloc(folderPath)
            folderPath := pin.Value
        }

        result := ComCall(13, this, "ptr", folderPath, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedPath 
     * @returns {HRESULT} 
     */
    DeleteFeed(feedPath) {
        if(feedPath is String) {
            pin := BSTR.Alloc(feedPath)
            feedPath := pin.Value
        }

        result := ComCall(14, this, "ptr", feedPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} folderPath 
     * @returns {HRESULT} 
     */
    DeleteFolder(folderPath) {
        if(folderPath is String) {
            pin := BSTR.Alloc(folderPath)
            folderPath := pin.Value
        }

        result := ComCall(15, this, "ptr", folderPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    BackgroundSync(action) {
        result := ComCall(16, this, "int", action, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSyncStatus() {
        result := ComCall(17, this, "int*", &status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultInterval() {
        result := ComCall(18, this, "int*", &minutes := 0, "int")
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
    put_DefaultInterval(minutes) {
        result := ComCall(19, this, "int", minutes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncSyncAll() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Contains values that specify the behavior of UiaGetUpdatedCache.
     * @param {BSTR} feedXmlIn 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate
     */
    Normalize(feedXmlIn) {
        if(feedXmlIn is String) {
            pin := BSTR.Alloc(feedXmlIn)
            feedXmlIn := pin.Value
        }

        feedXmlOut := BSTR()
        result := ComCall(21, this, "ptr", feedXmlIn, "ptr", feedXmlOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return feedXmlOut
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemCountLimit() {
        result := ComCall(22, this, "int*", &itemCountLimit := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return itemCountLimit
    }
}

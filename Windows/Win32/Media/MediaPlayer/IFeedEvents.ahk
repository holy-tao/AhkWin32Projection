#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedEvents
     * @type {Guid}
     */
    static IID => Guid("{abf35c99-0681-47ea-9a8c-1436a375a99e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Error", "FeedDeleted", "FeedRenamed", "FeedUrlChanged", "FeedMoved", "FeedDownloading", "FeedDownloadCompleted", "FeedItemCountChanged"]

    /**
     * Indicates a significant problem.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//timeprov/nc-timeprov-logtimeproveventfunc
     */
    Error() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    FeedDeleted(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(8, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedRenamed(path, oldPath) {
        path := path is String ? BSTR.Alloc(path).Value : path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(9, this, "ptr", path, "ptr", oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    FeedUrlChanged(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(10, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedMoved(path, oldPath) {
        path := path is String ? BSTR.Alloc(path).Value : path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(11, this, "ptr", path, "ptr", oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    FeedDownloading(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(12, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Integer} error 
     * @returns {HRESULT} 
     */
    FeedDownloadCompleted(path, error) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(13, this, "ptr", path, "int", error, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Integer} itemCountType 
     * @returns {HRESULT} 
     */
    FeedItemCountChanged(path, itemCountType) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(14, this, "ptr", path, "int", itemCountType, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedFolderEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedFolderEvents
     * @type {Guid}
     */
    static IID => Guid("{20a59fa6-a844-4630-9e98-175f70b4d55b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Error", "FolderAdded", "FolderDeleted", "FolderRenamed", "FolderMovedFrom", "FolderMovedTo", "FolderItemCountChanged", "FeedAdded", "FeedDeleted", "FeedRenamed", "FeedUrlChanged", "FeedMovedFrom", "FeedMovedTo", "FeedDownloading", "FeedDownloadCompleted", "FeedItemCountChanged"]

    /**
     * The Error event occurs when the Windows Media Player control has an error condition.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/axwmplib-axwindowsmediaplayer-error
     */
    Error() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FolderAdded(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(8, this, "ptr", _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FolderDeleted(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(9, this, "ptr", _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FolderRenamed(_path, oldPath) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(10, this, "ptr", _path, "ptr", oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FolderMovedFrom(_path, oldPath) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(11, this, "ptr", _path, "ptr", oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FolderMovedTo(_path, oldPath) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(12, this, "ptr", _path, "ptr", oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {Integer} itemCountType 
     * @returns {HRESULT} 
     */
    FolderItemCountChanged(_path, itemCountType) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(13, this, "ptr", _path, "int", itemCountType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedAdded(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(14, this, "ptr", _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedDeleted(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(15, this, "ptr", _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedRenamed(_path, oldPath) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(16, this, "ptr", _path, "ptr", oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedUrlChanged(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(17, this, "ptr", _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedMovedFrom(_path, oldPath) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(18, this, "ptr", _path, "ptr", oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedMovedTo(_path, oldPath) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(19, this, "ptr", _path, "ptr", oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedDownloading(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(20, this, "ptr", _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {Integer} error 
     * @returns {HRESULT} 
     */
    FeedDownloadCompleted(_path, error) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(21, this, "ptr", _path, "int", error, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {Integer} itemCountType 
     * @returns {HRESULT} 
     */
    FeedItemCountChanged(_path, itemCountType) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(22, this, "ptr", _path, "int", itemCountType, "HRESULT")
        return result
    }
}

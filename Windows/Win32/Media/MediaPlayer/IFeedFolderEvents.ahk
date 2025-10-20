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
     * Indicates a significant problem.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//timeprov/nc-timeprov-logtimeproveventfunc
     */
    Error() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    FolderAdded(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(8, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    FolderDeleted(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(9, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FolderRenamed(path, oldPath) {
        path := path is String ? BSTR.Alloc(path).Value : path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(10, this, "ptr", path, "ptr", oldPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FolderMovedFrom(path, oldPath) {
        path := path is String ? BSTR.Alloc(path).Value : path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(11, this, "ptr", path, "ptr", oldPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FolderMovedTo(path, oldPath) {
        path := path is String ? BSTR.Alloc(path).Value : path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(12, this, "ptr", path, "ptr", oldPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Integer} itemCountType 
     * @returns {HRESULT} 
     */
    FolderItemCountChanged(path, itemCountType) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(13, this, "ptr", path, "int", itemCountType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    FeedAdded(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(14, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    FeedDeleted(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(15, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(16, this, "ptr", path, "ptr", oldPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    FeedUrlChanged(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(17, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedMovedFrom(path, oldPath) {
        path := path is String ? BSTR.Alloc(path).Value : path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(18, this, "ptr", path, "ptr", oldPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedMovedTo(path, oldPath) {
        path := path is String ? BSTR.Alloc(path).Value : path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(19, this, "ptr", path, "ptr", oldPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    FeedDownloading(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(20, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(21, this, "ptr", path, "int", error, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(22, this, "ptr", path, "int", itemCountType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

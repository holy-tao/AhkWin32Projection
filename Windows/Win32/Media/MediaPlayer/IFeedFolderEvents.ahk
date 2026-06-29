#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FEEDS_DOWNLOAD_ERROR.ahk" { FEEDS_DOWNLOAD_ERROR }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IFeedFolderEvents extends IDispatch {
    /**
     * The interface identifier for IFeedFolderEvents
     * @type {Guid}
     */
    static IID := Guid("{20a59fa6-a844-4630-9e98-175f70b4d55b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeedFolderEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Error                  : IntPtr
        FolderAdded            : IntPtr
        FolderDeleted          : IntPtr
        FolderRenamed          : IntPtr
        FolderMovedFrom        : IntPtr
        FolderMovedTo          : IntPtr
        FolderItemCountChanged : IntPtr
        FeedAdded              : IntPtr
        FeedDeleted            : IntPtr
        FeedRenamed            : IntPtr
        FeedUrlChanged         : IntPtr
        FeedMovedFrom          : IntPtr
        FeedMovedTo            : IntPtr
        FeedDownloading        : IntPtr
        FeedDownloadCompleted  : IntPtr
        FeedItemCountChanged   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeedFolderEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(8, this, BSTR, _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FolderDeleted(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(9, this, BSTR, _path, "HRESULT")
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

        result := ComCall(10, this, BSTR, _path, BSTR, oldPath, "HRESULT")
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

        result := ComCall(11, this, BSTR, _path, BSTR, oldPath, "HRESULT")
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

        result := ComCall(12, this, BSTR, _path, BSTR, oldPath, "HRESULT")
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

        result := ComCall(13, this, BSTR, _path, "int", itemCountType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedAdded(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(14, this, BSTR, _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedDeleted(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(15, this, BSTR, _path, "HRESULT")
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

        result := ComCall(16, this, BSTR, _path, BSTR, oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedUrlChanged(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(17, this, BSTR, _path, "HRESULT")
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

        result := ComCall(18, this, BSTR, _path, BSTR, oldPath, "HRESULT")
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

        result := ComCall(19, this, BSTR, _path, BSTR, oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedDownloading(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(20, this, BSTR, _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {FEEDS_DOWNLOAD_ERROR} _error 
     * @returns {HRESULT} 
     */
    FeedDownloadCompleted(_path, _error) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(21, this, BSTR, _path, FEEDS_DOWNLOAD_ERROR, _error, "HRESULT")
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

        result := ComCall(22, this, BSTR, _path, "int", itemCountType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFeedFolderEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Error := CallbackCreate(GetMethod(implObj, "Error"), flags, 1)
        this.vtbl.FolderAdded := CallbackCreate(GetMethod(implObj, "FolderAdded"), flags, 2)
        this.vtbl.FolderDeleted := CallbackCreate(GetMethod(implObj, "FolderDeleted"), flags, 2)
        this.vtbl.FolderRenamed := CallbackCreate(GetMethod(implObj, "FolderRenamed"), flags, 3)
        this.vtbl.FolderMovedFrom := CallbackCreate(GetMethod(implObj, "FolderMovedFrom"), flags, 3)
        this.vtbl.FolderMovedTo := CallbackCreate(GetMethod(implObj, "FolderMovedTo"), flags, 3)
        this.vtbl.FolderItemCountChanged := CallbackCreate(GetMethod(implObj, "FolderItemCountChanged"), flags, 3)
        this.vtbl.FeedAdded := CallbackCreate(GetMethod(implObj, "FeedAdded"), flags, 2)
        this.vtbl.FeedDeleted := CallbackCreate(GetMethod(implObj, "FeedDeleted"), flags, 2)
        this.vtbl.FeedRenamed := CallbackCreate(GetMethod(implObj, "FeedRenamed"), flags, 3)
        this.vtbl.FeedUrlChanged := CallbackCreate(GetMethod(implObj, "FeedUrlChanged"), flags, 2)
        this.vtbl.FeedMovedFrom := CallbackCreate(GetMethod(implObj, "FeedMovedFrom"), flags, 3)
        this.vtbl.FeedMovedTo := CallbackCreate(GetMethod(implObj, "FeedMovedTo"), flags, 3)
        this.vtbl.FeedDownloading := CallbackCreate(GetMethod(implObj, "FeedDownloading"), flags, 2)
        this.vtbl.FeedDownloadCompleted := CallbackCreate(GetMethod(implObj, "FeedDownloadCompleted"), flags, 3)
        this.vtbl.FeedItemCountChanged := CallbackCreate(GetMethod(implObj, "FeedItemCountChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Error)
        CallbackFree(this.vtbl.FolderAdded)
        CallbackFree(this.vtbl.FolderDeleted)
        CallbackFree(this.vtbl.FolderRenamed)
        CallbackFree(this.vtbl.FolderMovedFrom)
        CallbackFree(this.vtbl.FolderMovedTo)
        CallbackFree(this.vtbl.FolderItemCountChanged)
        CallbackFree(this.vtbl.FeedAdded)
        CallbackFree(this.vtbl.FeedDeleted)
        CallbackFree(this.vtbl.FeedRenamed)
        CallbackFree(this.vtbl.FeedUrlChanged)
        CallbackFree(this.vtbl.FeedMovedFrom)
        CallbackFree(this.vtbl.FeedMovedTo)
        CallbackFree(this.vtbl.FeedDownloading)
        CallbackFree(this.vtbl.FeedDownloadCompleted)
        CallbackFree(this.vtbl.FeedItemCountChanged)
    }
}

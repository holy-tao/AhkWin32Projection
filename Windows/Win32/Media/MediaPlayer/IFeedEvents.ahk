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
export default struct IFeedEvents extends IDispatch {
    /**
     * The interface identifier for IFeedEvents
     * @type {Guid}
     */
    static IID := Guid("{abf35c99-0681-47ea-9a8c-1436a375a99e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeedEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Error                 : IntPtr
        FeedDeleted           : IntPtr
        FeedRenamed           : IntPtr
        FeedUrlChanged        : IntPtr
        FeedMoved             : IntPtr
        FeedDownloading       : IntPtr
        FeedDownloadCompleted : IntPtr
        FeedItemCountChanged  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeedEvents.Vtbl()
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
    FeedDeleted(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(8, this, BSTR, _path, "HRESULT")
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

        result := ComCall(9, this, BSTR, _path, BSTR, oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedUrlChanged(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(10, this, BSTR, _path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedMoved(_path, oldPath) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path
        oldPath := oldPath is String ? BSTR.Alloc(oldPath).Value : oldPath

        result := ComCall(11, this, BSTR, _path, BSTR, oldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     */
    FeedDownloading(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(12, this, BSTR, _path, "HRESULT")
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

        result := ComCall(13, this, BSTR, _path, FEEDS_DOWNLOAD_ERROR, _error, "HRESULT")
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

        result := ComCall(14, this, BSTR, _path, "int", itemCountType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFeedEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Error := CallbackCreate(GetMethod(implObj, "Error"), flags, 1)
        this.vtbl.FeedDeleted := CallbackCreate(GetMethod(implObj, "FeedDeleted"), flags, 2)
        this.vtbl.FeedRenamed := CallbackCreate(GetMethod(implObj, "FeedRenamed"), flags, 3)
        this.vtbl.FeedUrlChanged := CallbackCreate(GetMethod(implObj, "FeedUrlChanged"), flags, 2)
        this.vtbl.FeedMoved := CallbackCreate(GetMethod(implObj, "FeedMoved"), flags, 3)
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
        CallbackFree(this.vtbl.FeedDeleted)
        CallbackFree(this.vtbl.FeedRenamed)
        CallbackFree(this.vtbl.FeedUrlChanged)
        CallbackFree(this.vtbl.FeedMoved)
        CallbackFree(this.vtbl.FeedDownloading)
        CallbackFree(this.vtbl.FeedDownloadCompleted)
        CallbackFree(this.vtbl.FeedItemCountChanged)
    }
}

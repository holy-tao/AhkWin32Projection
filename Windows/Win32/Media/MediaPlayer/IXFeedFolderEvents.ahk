#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FEEDS_DOWNLOAD_ERROR.ahk" { FEEDS_DOWNLOAD_ERROR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IXFeedFolderEvents extends IUnknown {
    /**
     * The interface identifier for IXFeedFolderEvents
     * @type {Guid}
     */
    static IID := Guid("{7964b769-234a-4bb1-a5f4-90454c8ad07e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeedFolderEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
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
            this.vtbl := IXFeedFolderEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Error event occurs when the Windows Media Player control has an error condition.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/axwmplib-axwindowsmediaplayer-error
     */
    Error() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FolderAdded(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FolderDeleted(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(5, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {PWSTR} pszOldPath 
     * @returns {HRESULT} 
     */
    FolderRenamed(pszPath, pszOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath

        result := ComCall(6, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {PWSTR} pszOldPath 
     * @returns {HRESULT} 
     */
    FolderMovedFrom(pszPath, pszOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath

        result := ComCall(7, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {PWSTR} pszOldPath 
     * @returns {HRESULT} 
     */
    FolderMovedTo(pszPath, pszOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath

        result := ComCall(8, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} feicfFlags 
     * @returns {HRESULT} 
     */
    FolderItemCountChanged(pszPath, feicfFlags) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(9, this, "ptr", pszPath, "int", feicfFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FeedAdded(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FeedDeleted(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(11, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {PWSTR} pszOldPath 
     * @returns {HRESULT} 
     */
    FeedRenamed(pszPath, pszOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath

        result := ComCall(12, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FeedUrlChanged(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(13, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {PWSTR} pszOldPath 
     * @returns {HRESULT} 
     */
    FeedMovedFrom(pszPath, pszOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath

        result := ComCall(14, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {PWSTR} pszOldPath 
     * @returns {HRESULT} 
     */
    FeedMovedTo(pszPath, pszOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath

        result := ComCall(15, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FeedDownloading(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(16, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {FEEDS_DOWNLOAD_ERROR} fde 
     * @returns {HRESULT} 
     */
    FeedDownloadCompleted(pszPath, fde) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(17, this, "ptr", pszPath, FEEDS_DOWNLOAD_ERROR, fde, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} feicfFlags 
     * @returns {HRESULT} 
     */
    FeedItemCountChanged(pszPath, feicfFlags) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(18, this, "ptr", pszPath, "int", feicfFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXFeedFolderEvents.IID.Equals(iid)) {
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

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
export default struct IXFeedEvents extends IUnknown {
    /**
     * The interface identifier for IXFeedEvents
     * @type {Guid}
     */
    static IID := Guid("{1630852e-1263-465b-98e5-fe60ffec4ac2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeedEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
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
            this.vtbl := IXFeedEvents.Vtbl()
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
    FeedDeleted(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszPath, "HRESULT")
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

        result := ComCall(5, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FeedUrlChanged(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(6, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {PWSTR} pszOldPath 
     * @returns {HRESULT} 
     */
    FeedMoved(pszPath, pszOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath

        result := ComCall(7, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FeedDownloading(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(8, this, "ptr", pszPath, "HRESULT")
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

        result := ComCall(9, this, "ptr", pszPath, FEEDS_DOWNLOAD_ERROR, fde, "HRESULT")
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

        result := ComCall(10, this, "ptr", pszPath, "int", feicfFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXFeedEvents.IID.Equals(iid)) {
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

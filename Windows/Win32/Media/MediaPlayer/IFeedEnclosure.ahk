#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FEEDS_DOWNLOAD_ERROR.ahk" { FEEDS_DOWNLOAD_ERROR }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FEEDS_DOWNLOAD_STATUS.ahk" { FEEDS_DOWNLOAD_STATUS }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IFeedEnclosure extends IDispatch {
    /**
     * The interface identifier for IFeedEnclosure
     * @type {Guid}
     */
    static IID := Guid("{361c26f7-90a4-4e67-ae09-3a36a546436a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeedEnclosure interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Url               : IntPtr
        get_Type              : IntPtr
        get_Length            : IntPtr
        AsyncDownload         : IntPtr
        CancelAsyncDownload   : IntPtr
        get_DownloadStatus    : IntPtr
        get_LastDownloadError : IntPtr
        get_LocalPath         : IntPtr
        get_Parent            : IntPtr
        get_DownloadUrl       : IntPtr
        get_DownloadMimeType  : IntPtr
        RemoveFile            : IntPtr
        SetFile               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeedEnclosure.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Url {
        get => this.get_Url()
    }

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * @type {FEEDS_DOWNLOAD_STATUS} 
     */
    DownloadStatus {
        get => this.get_DownloadStatus()
    }

    /**
     * @type {FEEDS_DOWNLOAD_ERROR} 
     */
    LastDownloadError {
        get => this.get_LastDownloadError()
    }

    /**
     * @type {BSTR} 
     */
    LocalPath {
        get => this.get_LocalPath()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {BSTR} 
     */
    DownloadUrl {
        get => this.get_DownloadUrl()
    }

    /**
     * @type {BSTR} 
     */
    DownloadMimeType {
        get => this.get_DownloadMimeType()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Url() {
        enclosureUrl := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, enclosureUrl, "HRESULT")
        return enclosureUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        mimeType := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, mimeType, "HRESULT")
        return mimeType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(9, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FEEDS_DOWNLOAD_STATUS} 
     */
    get_DownloadStatus() {
        result := ComCall(12, this, "int*", &_status := 0, "HRESULT")
        return _status
    }

    /**
     * 
     * @returns {FEEDS_DOWNLOAD_ERROR} 
     */
    get_LastDownloadError() {
        result := ComCall(13, this, "int*", &_error := 0, "HRESULT")
        return _error
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalPath() {
        localPath := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, localPath, "HRESULT")
        return localPath
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(15, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadUrl() {
        enclosureUrl := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, enclosureUrl, "HRESULT")
        return enclosureUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadMimeType() {
        mimeType := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, mimeType, "HRESULT")
        return mimeType
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFile() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} downloadUrl 
     * @param {BSTR} downloadFilePath 
     * @param {BSTR} downloadMimeType 
     * @param {BSTR} enclosureFilename 
     * @returns {HRESULT} 
     */
    SetFile(downloadUrl, downloadFilePath, downloadMimeType, enclosureFilename) {
        downloadUrl := downloadUrl is String ? BSTR.Alloc(downloadUrl).Value : downloadUrl
        downloadFilePath := downloadFilePath is String ? BSTR.Alloc(downloadFilePath).Value : downloadFilePath
        downloadMimeType := downloadMimeType is String ? BSTR.Alloc(downloadMimeType).Value : downloadMimeType
        enclosureFilename := enclosureFilename is String ? BSTR.Alloc(enclosureFilename).Value : enclosureFilename

        result := ComCall(19, this, BSTR, downloadUrl, BSTR, downloadFilePath, BSTR, downloadMimeType, BSTR, enclosureFilename, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFeedEnclosure.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Url := CallbackCreate(GetMethod(implObj, "get_Url"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Length := CallbackCreate(GetMethod(implObj, "get_Length"), flags, 2)
        this.vtbl.AsyncDownload := CallbackCreate(GetMethod(implObj, "AsyncDownload"), flags, 1)
        this.vtbl.CancelAsyncDownload := CallbackCreate(GetMethod(implObj, "CancelAsyncDownload"), flags, 1)
        this.vtbl.get_DownloadStatus := CallbackCreate(GetMethod(implObj, "get_DownloadStatus"), flags, 2)
        this.vtbl.get_LastDownloadError := CallbackCreate(GetMethod(implObj, "get_LastDownloadError"), flags, 2)
        this.vtbl.get_LocalPath := CallbackCreate(GetMethod(implObj, "get_LocalPath"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_DownloadUrl := CallbackCreate(GetMethod(implObj, "get_DownloadUrl"), flags, 2)
        this.vtbl.get_DownloadMimeType := CallbackCreate(GetMethod(implObj, "get_DownloadMimeType"), flags, 2)
        this.vtbl.RemoveFile := CallbackCreate(GetMethod(implObj, "RemoveFile"), flags, 1)
        this.vtbl.SetFile := CallbackCreate(GetMethod(implObj, "SetFile"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Url)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Length)
        CallbackFree(this.vtbl.AsyncDownload)
        CallbackFree(this.vtbl.CancelAsyncDownload)
        CallbackFree(this.vtbl.get_DownloadStatus)
        CallbackFree(this.vtbl.get_LastDownloadError)
        CallbackFree(this.vtbl.get_LocalPath)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_DownloadUrl)
        CallbackFree(this.vtbl.get_DownloadMimeType)
        CallbackFree(this.vtbl.RemoveFile)
        CallbackFree(this.vtbl.SetFile)
    }
}

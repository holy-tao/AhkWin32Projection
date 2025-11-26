#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedEnclosure extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedEnclosure
     * @type {Guid}
     */
    static IID => Guid("{361c26f7-90a4-4e67-ae09-3a36a546436a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Url", "get_Type", "get_Length", "AsyncDownload", "CancelAsyncDownload", "get_DownloadStatus", "get_LastDownloadError", "get_LocalPath", "get_Parent", "get_DownloadUrl", "get_DownloadMimeType", "RemoveFile", "SetFile"]

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
     * @type {Integer} 
     */
    DownloadStatus {
        get => this.get_DownloadStatus()
    }

    /**
     * @type {Integer} 
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
        enclosureUrl := BSTR()
        result := ComCall(7, this, "ptr", enclosureUrl, "HRESULT")
        return enclosureUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        mimeType := BSTR()
        result := ComCall(8, this, "ptr", mimeType, "HRESULT")
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
     * @returns {Integer} 
     */
    get_DownloadStatus() {
        result := ComCall(12, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastDownloadError() {
        result := ComCall(13, this, "int*", &error := 0, "HRESULT")
        return error
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalPath() {
        localPath := BSTR()
        result := ComCall(14, this, "ptr", localPath, "HRESULT")
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
        enclosureUrl := BSTR()
        result := ComCall(16, this, "ptr", enclosureUrl, "HRESULT")
        return enclosureUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadMimeType() {
        mimeType := BSTR()
        result := ComCall(17, this, "ptr", mimeType, "HRESULT")
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

        result := ComCall(19, this, "ptr", downloadUrl, "ptr", downloadFilePath, "ptr", downloadMimeType, "ptr", enclosureFilename, "HRESULT")
        return result
    }
}

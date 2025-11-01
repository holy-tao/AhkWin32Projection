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
     * 
     * @param {Pointer<BSTR>} enclosureUrl 
     * @returns {HRESULT} 
     */
    get_Url(enclosureUrl) {
        result := ComCall(7, this, "ptr", enclosureUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mimeType 
     * @returns {HRESULT} 
     */
    get_Type(mimeType) {
        result := ComCall(8, this, "ptr", mimeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} length 
     * @returns {HRESULT} 
     */
    get_Length(length) {
        lengthMarshal := length is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, lengthMarshal, length, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} status 
     * @returns {HRESULT} 
     */
    get_DownloadStatus(status) {
        statusMarshal := status is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, statusMarshal, status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} error 
     * @returns {HRESULT} 
     */
    get_LastDownloadError(error) {
        errorMarshal := error is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, errorMarshal, error, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} localPath 
     * @returns {HRESULT} 
     */
    get_LocalPath(localPath) {
        result := ComCall(14, this, "ptr", localPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Parent(disp) {
        result := ComCall(15, this, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} enclosureUrl 
     * @returns {HRESULT} 
     */
    get_DownloadUrl(enclosureUrl) {
        result := ComCall(16, this, "ptr", enclosureUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mimeType 
     * @returns {HRESULT} 
     */
    get_DownloadMimeType(mimeType) {
        result := ComCall(17, this, "ptr", mimeType, "HRESULT")
        return result
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

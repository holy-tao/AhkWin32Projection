#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedEnclosure extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedEnclosure
     * @type {Guid}
     */
    static IID => Guid("{bfbfb953-644f-4792-b69c-dfaca4cbf89a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Url", "Type", "Length", "AsyncDownload", "CancelAsyncDownload", "DownloadStatus", "LastDownloadError", "LocalPath", "Parent", "DownloadUrl", "DownloadMimeType", "RemoveFile", "SetFile"]

    /**
     * 
     * @returns {PWSTR} 
     */
    Url() {
        result := ComCall(3, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Type() {
        result := ComCall(4, this, "ptr*", &ppszMimeType := 0, "HRESULT")
        return ppszMimeType
    }

    /**
     * 
     * @returns {Integer} 
     */
    Length() {
        result := ComCall(5, this, "uint*", &puiLength := 0, "HRESULT")
        return puiLength
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    DownloadStatus() {
        result := ComCall(8, this, "int*", &pfds := 0, "HRESULT")
        return pfds
    }

    /**
     * 
     * @returns {Integer} 
     */
    LastDownloadError() {
        result := ComCall(9, this, "int*", &pfde := 0, "HRESULT")
        return pfde
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    LocalPath() {
        result := ComCall(10, this, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Parent(riid) {
        result := ComCall(11, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(12, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadMimeType() {
        result := ComCall(13, this, "ptr*", &ppszMimeType := 0, "HRESULT")
        return ppszMimeType
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFile() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDownloadUrl 
     * @param {PWSTR} pszDownloadFilePath 
     * @param {PWSTR} pszDownloadMimeType 
     * @param {PWSTR} pszEnclosureFilename 
     * @returns {HRESULT} 
     */
    SetFile(pszDownloadUrl, pszDownloadFilePath, pszDownloadMimeType, pszEnclosureFilename) {
        pszDownloadUrl := pszDownloadUrl is String ? StrPtr(pszDownloadUrl) : pszDownloadUrl
        pszDownloadFilePath := pszDownloadFilePath is String ? StrPtr(pszDownloadFilePath) : pszDownloadFilePath
        pszDownloadMimeType := pszDownloadMimeType is String ? StrPtr(pszDownloadMimeType) : pszDownloadMimeType
        pszEnclosureFilename := pszEnclosureFilename is String ? StrPtr(pszEnclosureFilename) : pszEnclosureFilename

        result := ComCall(15, this, "ptr", pszDownloadUrl, "ptr", pszDownloadFilePath, "ptr", pszDownloadMimeType, "ptr", pszEnclosureFilename, "HRESULT")
        return result
    }
}

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
     * @param {Pointer<PWSTR>} ppszUrl 
     * @returns {HRESULT} 
     */
    Url(ppszUrl) {
        result := ComCall(3, this, "ptr", ppszUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszMimeType 
     * @returns {HRESULT} 
     */
    Type(ppszMimeType) {
        result := ComCall(4, this, "ptr", ppszMimeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiLength 
     * @returns {HRESULT} 
     */
    Length(puiLength) {
        puiLengthMarshal := puiLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, puiLengthMarshal, puiLength, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pfds 
     * @returns {HRESULT} 
     */
    DownloadStatus(pfds) {
        pfdsMarshal := pfds is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pfdsMarshal, pfds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pfde 
     * @returns {HRESULT} 
     */
    LastDownloadError(pfde) {
        pfdeMarshal := pfde is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pfdeMarshal, pfde, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} 
     */
    LocalPath(ppszPath) {
        result := ComCall(10, this, "ptr", ppszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    Parent(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUrl 
     * @returns {HRESULT} 
     */
    DownloadUrl(ppszUrl) {
        result := ComCall(12, this, "ptr", ppszUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszMimeType 
     * @returns {HRESULT} 
     */
    DownloadMimeType(ppszMimeType) {
        result := ComCall(13, this, "ptr", ppszMimeType, "HRESULT")
        return result
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

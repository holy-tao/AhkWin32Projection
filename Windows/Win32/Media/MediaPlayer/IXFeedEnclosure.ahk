#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FEEDS_DOWNLOAD_STATUS.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FEEDS_DOWNLOAD_ERROR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
class IXFeedEnclosure extends IUnknown {

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
     * Defines the placeholder element for the method type selected and method-specific configuration.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/eaphost/baseeapconnectionpropertiesv1schema-type-baseeapparameters-element
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
     * Note This section describes functionality designed for use by online stores. | DownloadStatus Element (Msfeeds.h)
     * @remarks
     * Windows Media Player displays a message to users when a download is in progress. If the current active services defines a download status URL, the user can click the message text. When the user clicks the message, the Player navigates to the URL specified by the **DownloadStatus** element so the current active store can provide details about downloads in progress.
     * @returns {FEEDS_DOWNLOAD_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/WMP/downloadstatus-element
     */
    DownloadStatus() {
        result := ComCall(8, this, "int*", &pfds := 0, "HRESULT")
        return pfds
    }

    /**
     * 
     * @returns {FEEDS_DOWNLOAD_ERROR} 
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

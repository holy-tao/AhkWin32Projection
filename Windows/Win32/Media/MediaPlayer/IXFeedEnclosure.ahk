#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FEEDS_DOWNLOAD_ERROR.ahk" { FEEDS_DOWNLOAD_ERROR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\FEEDS_DOWNLOAD_STATUS.ahk" { FEEDS_DOWNLOAD_STATUS }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IXFeedEnclosure extends IUnknown {
    /**
     * The interface identifier for IXFeedEnclosure
     * @type {Guid}
     */
    static IID := Guid("{bfbfb953-644f-4792-b69c-dfaca4cbf89a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeedEnclosure interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Url                 : IntPtr
        Type                : IntPtr
        Length              : IntPtr
        AsyncDownload       : IntPtr
        CancelAsyncDownload : IntPtr
        DownloadStatus      : IntPtr
        LastDownloadError   : IntPtr
        LocalPath           : IntPtr
        Parent              : IntPtr
        DownloadUrl         : IntPtr
        DownloadMimeType    : IntPtr
        RemoveFile          : IntPtr
        SetFile             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXFeedEnclosure.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Url() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * Defines the placeholder element for the method type selected and method-specific configuration.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/eaphost/baseeapconnectionpropertiesv1schema-type-baseeapparameters-element
     */
    Type() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszMimeType := 0, "HRESULT")
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
        result := ComCall(10, this, PWSTR.Ptr, &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Parent(riid) {
        result := ComCall(11, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(12, this, PWSTR.Ptr, &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadMimeType() {
        result := ComCall(13, this, PWSTR.Ptr, &ppszMimeType := 0, "HRESULT")
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

    Query(iid) {
        if (IXFeedEnclosure.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Url := CallbackCreate(GetMethod(implObj, "Url"), flags, 2)
        this.vtbl.Type := CallbackCreate(GetMethod(implObj, "Type"), flags, 2)
        this.vtbl.Length := CallbackCreate(GetMethod(implObj, "Length"), flags, 2)
        this.vtbl.AsyncDownload := CallbackCreate(GetMethod(implObj, "AsyncDownload"), flags, 1)
        this.vtbl.CancelAsyncDownload := CallbackCreate(GetMethod(implObj, "CancelAsyncDownload"), flags, 1)
        this.vtbl.DownloadStatus := CallbackCreate(GetMethod(implObj, "DownloadStatus"), flags, 2)
        this.vtbl.LastDownloadError := CallbackCreate(GetMethod(implObj, "LastDownloadError"), flags, 2)
        this.vtbl.LocalPath := CallbackCreate(GetMethod(implObj, "LocalPath"), flags, 2)
        this.vtbl.Parent := CallbackCreate(GetMethod(implObj, "Parent"), flags, 3)
        this.vtbl.DownloadUrl := CallbackCreate(GetMethod(implObj, "DownloadUrl"), flags, 2)
        this.vtbl.DownloadMimeType := CallbackCreate(GetMethod(implObj, "DownloadMimeType"), flags, 2)
        this.vtbl.RemoveFile := CallbackCreate(GetMethod(implObj, "RemoveFile"), flags, 1)
        this.vtbl.SetFile := CallbackCreate(GetMethod(implObj, "SetFile"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Url)
        CallbackFree(this.vtbl.Type)
        CallbackFree(this.vtbl.Length)
        CallbackFree(this.vtbl.AsyncDownload)
        CallbackFree(this.vtbl.CancelAsyncDownload)
        CallbackFree(this.vtbl.DownloadStatus)
        CallbackFree(this.vtbl.LastDownloadError)
        CallbackFree(this.vtbl.LocalPath)
        CallbackFree(this.vtbl.Parent)
        CallbackFree(this.vtbl.DownloadUrl)
        CallbackFree(this.vtbl.DownloadMimeType)
        CallbackFree(this.vtbl.RemoveFile)
        CallbackFree(this.vtbl.SetFile)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFHttpDownloadSession.ahk" { IMFHttpDownloadSession }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Applications implement this interface in order to provide custom a custom HTTP or HTTPS download implementation.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfhttpdownloadsessionprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFHttpDownloadSessionProvider extends IUnknown {
    /**
     * The interface identifier for IMFHttpDownloadSessionProvider
     * @type {Guid}
     */
    static IID := Guid("{1b4cf4b9-3a16-4115-839d-03cc5c99df01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFHttpDownloadSessionProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateHttpDownloadSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFHttpDownloadSessionProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the Microsoft Media Foundation to open HTTP or HTTPS URLs instead of using the default implementation.
     * @remarks
     * Specifying “https” as the value of <i>wszScheme</i> does not imply that HTTPS will be used for a particular request, as that is specified on a per-request basis in <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfhttpdownloadsession-createrequest">IMFhttpDownloadSession::CreateRequest</a>.
     * @param {PWSTR} wszScheme The name of the protocol to for which an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfhttpdownloadsession">IMFHttpDownloadSession</a> is being requested.  Microsoft Media Foundation specifies the protocol scheme of the URL that the application provided the Media Foundation Source Resolver. Valid values include “http” for HTTP, and “https” for HTTPS. URL scheme names are generally not case-sensitive.
     * @returns {IMFHttpDownloadSession} On successful execution, the parameter is set to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfhttpdownloadsession">IMFHttpDownloadSession</a> interface. The returned interface is used by Microsoft Media Foundation to open a single HTTP or HTTPS URL.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadsessionprovider-createhttpdownloadsession
     */
    CreateHttpDownloadSession(wszScheme) {
        wszScheme := wszScheme is String ? StrPtr(wszScheme) : wszScheme

        result := ComCall(3, this, "ptr", wszScheme, "ptr*", &ppDownloadSession := 0, "HRESULT")
        return IMFHttpDownloadSession(ppDownloadSession)
    }

    Query(iid) {
        if (IMFHttpDownloadSessionProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateHttpDownloadSession := CallbackCreate(GetMethod(implObj, "CreateHttpDownloadSession"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateHttpDownloadSession)
    }
}

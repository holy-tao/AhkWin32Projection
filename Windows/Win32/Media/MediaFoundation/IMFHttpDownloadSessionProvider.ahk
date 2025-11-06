#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFHttpDownloadSession.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications implement this interface in order to provide custom a custom HTTP or HTTPS download implementation.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfhttpdownloadsessionprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFHttpDownloadSessionProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFHttpDownloadSessionProvider
     * @type {Guid}
     */
    static IID => Guid("{1b4cf4b9-3a16-4115-839d-03cc5c99df01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateHttpDownloadSession"]

    /**
     * 
     * @param {PWSTR} wszScheme 
     * @returns {IMFHttpDownloadSession} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadsessionprovider-createhttpdownloadsession
     */
    CreateHttpDownloadSession(wszScheme) {
        wszScheme := wszScheme is String ? StrPtr(wszScheme) : wszScheme

        result := ComCall(3, this, "ptr", wszScheme, "ptr*", &ppDownloadSession := 0, "HRESULT")
        return IMFHttpDownloadSession(ppDownloadSession)
    }
}

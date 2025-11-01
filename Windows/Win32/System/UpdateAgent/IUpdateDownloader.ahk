#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Downloads updates from the server.
 * @remarks
 * 
  * You can create an instance of this interface by using the UpdateDownloader coclass. Use the Microsoft.Update.Downloader program identifier to create the object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatedownloader
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateDownloader extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateDownloader
     * @type {Guid}
     */
    static IID => Guid("{68f1c6f9-7ecc-4666-a464-247fe12496c3}")

    /**
     * The class identifier for UpdateDownloader
     * @type {Guid}
     */
    static CLSID => Guid("{5baf654a-5a07-4264-a255-9ff54c7151e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClientApplicationID", "put_ClientApplicationID", "get_IsForced", "put_IsForced", "get_Priority", "put_Priority", "get_Updates", "put_Updates", "BeginDownload", "Download", "EndDownload"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-get_clientapplicationid
     */
    get_ClientApplicationID(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-get_isforced
     */
    get_IsForced(retval) {
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-put_isforced
     */
    put_IsForced(value) {
        result := ComCall(10, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-get_priority
     */
    get_Priority(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-put_priority
     */
    put_Priority(value) {
        result := ComCall(12, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-get_updates
     */
    get_Updates(retval) {
        result := ComCall(13, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUpdateCollection} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-put_updates
     */
    put_Updates(value) {
        result := ComCall(14, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} onProgressChanged 
     * @param {IUnknown} onCompleted 
     * @param {VARIANT} state 
     * @param {Pointer<IDownloadJob>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-begindownload
     */
    BeginDownload(onProgressChanged, onCompleted, state, retval) {
        result := ComCall(15, this, "ptr", onProgressChanged, "ptr", onCompleted, "ptr", state, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDownloadResult>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-download
     */
    Download(retval) {
        result := ComCall(16, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDownloadJob} value 
     * @param {Pointer<IDownloadResult>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-enddownload
     */
    EndDownload(value, retval) {
        result := ComCall(17, this, "ptr", value, "ptr*", retval, "HRESULT")
        return result
    }
}

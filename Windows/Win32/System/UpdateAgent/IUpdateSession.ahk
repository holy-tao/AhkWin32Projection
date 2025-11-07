#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWebProxy.ahk
#Include .\IUpdateSearcher.ahk
#Include .\IUpdateDownloader.ahk
#Include .\IUpdateInstaller.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a session in which the caller can perform operations that involve updates. For example, this interface represents sessions in which the caller performs a search, download, installation, or uninstallation operation.
 * @remarks
 * 
  * You can create an instance of this interface by using the UpdateSession coclass. Use the Microsoft.Update.Session program identifier to create the object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatesession
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateSession extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateSession
     * @type {Guid}
     */
    static IID => Guid("{816858a4-260d-4260-933a-2585f1abc76b}")

    /**
     * The class identifier for UpdateSession
     * @type {Guid}
     */
    static CLSID => Guid("{4cb43d7f-7eee-4906-8698-60da1c38f2fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClientApplicationID", "put_ClientApplicationID", "get_ReadOnly", "get_WebProxy", "put_WebProxy", "CreateUpdateSearcher", "CreateUpdateDownloader", "CreateUpdateInstaller"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-get_readonly
     */
    get_ReadOnly() {
        result := ComCall(9, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IWebProxy} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-get_webproxy
     */
    get_WebProxy() {
        result := ComCall(10, this, "ptr*", &retval := 0, "HRESULT")
        return IWebProxy(retval)
    }

    /**
     * 
     * @param {IWebProxy} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-put_webproxy
     */
    put_WebProxy(value) {
        result := ComCall(11, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUpdateSearcher} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher
     */
    CreateUpdateSearcher() {
        result := ComCall(12, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateSearcher(retval)
    }

    /**
     * 
     * @returns {IUpdateDownloader} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-createupdatedownloader
     */
    CreateUpdateDownloader() {
        result := ComCall(13, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloader(retval)
    }

    /**
     * 
     * @returns {IUpdateInstaller} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-createupdateinstaller
     */
    CreateUpdateInstaller() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateInstaller(retval)
    }
}

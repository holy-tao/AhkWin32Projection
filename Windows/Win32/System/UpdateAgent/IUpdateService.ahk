#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IStringCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about a service that is registered with Windows Update Agent (WUA) or with Automatic Updates.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateservice
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateService extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateService
     * @type {Guid}
     */
    static IID => Guid("{76b3b17e-aed6-4da5-85f0-83587f81abe3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_ContentValidationCert", "get_ExpirationDate", "get_IsManaged", "get_IsRegisteredWithAU", "get_IssueDate", "get_OffersWindowsUpdates", "get_RedirectUrls", "get_ServiceID", "get_IsScanPackageService", "get_CanRegisterWithAU", "get_ServiceUrl", "get_SetupPrefix"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_name
     */
    get_Name() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_contentvalidationcert
     */
    get_ContentValidationCert() {
        retval := VARIANT()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_expirationdate
     */
    get_ExpirationDate() {
        result := ComCall(9, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_ismanaged
     */
    get_IsManaged() {
        result := ComCall(10, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_isregisteredwithau
     */
    get_IsRegisteredWithAU() {
        result := ComCall(11, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_issuedate
     */
    get_IssueDate() {
        result := ComCall(12, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_offerswindowsupdates
     */
    get_OffersWindowsUpdates() {
        result := ComCall(13, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_redirecturls
     */
    get_RedirectUrls() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_serviceid
     */
    get_ServiceID() {
        retval := BSTR()
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_isscanpackageservice
     */
    get_IsScanPackageService() {
        result := ComCall(16, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_canregisterwithau
     */
    get_CanRegisterWithAU() {
        result := ComCall(17, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_serviceurl
     */
    get_ServiceUrl() {
        retval := BSTR()
        result := ComCall(18, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_setupprefix
     */
    get_SetupPrefix() {
        retval := BSTR()
        result := ComCall(19, this, "ptr", retval, "HRESULT")
        return retval
    }
}

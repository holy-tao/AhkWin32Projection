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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT} 
     */
    ContentValidationCert {
        get => this.get_ContentValidationCert()
    }

    /**
     * @type {Float} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsManaged {
        get => this.get_IsManaged()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsRegisteredWithAU {
        get => this.get_IsRegisteredWithAU()
    }

    /**
     * @type {Float} 
     */
    IssueDate {
        get => this.get_IssueDate()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    OffersWindowsUpdates {
        get => this.get_OffersWindowsUpdates()
    }

    /**
     * @type {IStringCollection} 
     */
    RedirectUrls {
        get => this.get_RedirectUrls()
    }

    /**
     * @type {BSTR} 
     */
    ServiceID {
        get => this.get_ServiceID()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsScanPackageService {
        get => this.get_IsScanPackageService()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    CanRegisterWithAU {
        get => this.get_CanRegisterWithAU()
    }

    /**
     * @type {BSTR} 
     */
    ServiceUrl {
        get => this.get_ServiceUrl()
    }

    /**
     * @type {BSTR} 
     */
    SetupPrefix {
        get => this.get_SetupPrefix()
    }

    /**
     * Gets the name of the service.
     * @remarks
     * 
     * The localized properties of an update are returned in the language that corresponds to the user default user interface (UI) language of the caller. If a property of an update is unavailable in such language, it will be returned in the system default UI language on the specified computer. If the property is unavailable in either languages mentioned, then it will be returned in the language recommended, if any, by the provider of the Update. Otherwise the Update Service will choose a language as it sees fit for the property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_name
     */
    get_Name() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets an SHA-1 hash of the certificate that is used to sign the contents of the service.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_contentvalidationcert
     */
    get_ContentValidationCert() {
        retval := VARIANT()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the date on which the authorization cabinet file expires.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_expirationdate
     */
    get_ExpirationDate() {
        result := ComCall(9, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether a service is a managed service.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_ismanaged
     */
    get_IsManaged() {
        result := ComCall(10, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether a service is registered with Automatic Updates.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_isregisteredwithau
     */
    get_IsRegisteredWithAU() {
        result := ComCall(11, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the date on which the authorization cabinet file was issued.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_issuedate
     */
    get_IssueDate() {
        result := ComCall(12, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value indicates whether the current service offers updates from Windows Updates.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_offerswindowsupdates
     */
    get_OffersWindowsUpdates() {
        result := ComCall(13, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Contains the URLs for the redirector cabinet file.
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_redirecturls
     */
    get_RedirectUrls() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Retrieves or sets the identifier for a service.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_serviceid
     */
    get_ServiceID() {
        retval := BSTR()
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether a service is based on a scan package.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_isscanpackageservice
     */
    get_IsScanPackageService() {
        result := ComCall(16, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the service can register with Automatic Updates.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_canregisterwithau
     */
    get_CanRegisterWithAU() {
        result := ComCall(17, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Retrieves the URL for the service.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_serviceurl
     */
    get_ServiceUrl() {
        retval := BSTR()
        result := ComCall(18, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Identifies the prefix for the setup files.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice-get_setupprefix
     */
    get_SetupPrefix() {
        retval := BSTR()
        result := ComCall(19, this, "ptr", retval, "HRESULT")
        return retval
    }
}

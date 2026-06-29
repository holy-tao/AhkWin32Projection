#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStringCollection.ahk" { IStringCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Contains information about a service that is registered with Windows Update Agent (WUA) or with Automatic Updates. (IUpdateService)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateservice
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateService extends IDispatch {
    /**
     * The interface identifier for IUpdateService
     * @type {Guid}
     */
    static IID := Guid("{76b3b17e-aed6-4da5-85f0-83587f81abe3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateService interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name                  : IntPtr
        get_ContentValidationCert : IntPtr
        get_ExpirationDate        : IntPtr
        get_IsManaged             : IntPtr
        get_IsRegisteredWithAU    : IntPtr
        get_IssueDate             : IntPtr
        get_OffersWindowsUpdates  : IntPtr
        get_RedirectUrls          : IntPtr
        get_ServiceID             : IntPtr
        get_IsScanPackageService  : IntPtr
        get_CanRegisterWithAU     : IntPtr
        get_ServiceUrl            : IntPtr
        get_SetupPrefix           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateService.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The localized properties of an update are returned in the language that corresponds to the user default user interface (UI) language of the caller. If a property of an update is unavailable in such language, it will be returned in the system default UI language on the specified computer. If the property is unavailable in either languages mentioned, then it will be returned in the language recommended, if any, by the provider of the Update. Otherwise the Update Service will choose a language as it sees fit for the property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_name
     */
    get_Name() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets an SHA-1 hash of the certificate that is used to sign the contents of the service.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_contentvalidationcert
     */
    get_ContentValidationCert() {
        retval := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the date on which the authorization cabinet file expires.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_expirationdate
     */
    get_ExpirationDate() {
        result := ComCall(9, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether a service is a managed service.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_ismanaged
     */
    get_IsManaged() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether a service is registered with Automatic Updates.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_isregisteredwithau
     */
    get_IsRegisteredWithAU() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the date on which the authorization cabinet file was issued.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_issuedate
     */
    get_IssueDate() {
        result := ComCall(12, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value indicates whether the current service offers updates from Windows Updates.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_offerswindowsupdates
     */
    get_OffersWindowsUpdates() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Contains the URLs for the redirector cabinet file.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_redirecturls
     */
    get_RedirectUrls() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Retrieves or sets the identifier for a service.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_serviceid
     */
    get_ServiceID() {
        retval := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether a service is based on a scan package.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_isscanpackageservice
     */
    get_IsScanPackageService() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the service can register with Automatic Updates.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_canregisterwithau
     */
    get_CanRegisterWithAU() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Retrieves the URL for the service.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_serviceurl
     */
    get_ServiceUrl() {
        retval := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Identifies the prefix for the setup files.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice-get_setupprefix
     */
    get_SetupPrefix() {
        retval := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_ContentValidationCert := CallbackCreate(GetMethod(implObj, "get_ContentValidationCert"), flags, 2)
        this.vtbl.get_ExpirationDate := CallbackCreate(GetMethod(implObj, "get_ExpirationDate"), flags, 2)
        this.vtbl.get_IsManaged := CallbackCreate(GetMethod(implObj, "get_IsManaged"), flags, 2)
        this.vtbl.get_IsRegisteredWithAU := CallbackCreate(GetMethod(implObj, "get_IsRegisteredWithAU"), flags, 2)
        this.vtbl.get_IssueDate := CallbackCreate(GetMethod(implObj, "get_IssueDate"), flags, 2)
        this.vtbl.get_OffersWindowsUpdates := CallbackCreate(GetMethod(implObj, "get_OffersWindowsUpdates"), flags, 2)
        this.vtbl.get_RedirectUrls := CallbackCreate(GetMethod(implObj, "get_RedirectUrls"), flags, 2)
        this.vtbl.get_ServiceID := CallbackCreate(GetMethod(implObj, "get_ServiceID"), flags, 2)
        this.vtbl.get_IsScanPackageService := CallbackCreate(GetMethod(implObj, "get_IsScanPackageService"), flags, 2)
        this.vtbl.get_CanRegisterWithAU := CallbackCreate(GetMethod(implObj, "get_CanRegisterWithAU"), flags, 2)
        this.vtbl.get_ServiceUrl := CallbackCreate(GetMethod(implObj, "get_ServiceUrl"), flags, 2)
        this.vtbl.get_SetupPrefix := CallbackCreate(GetMethod(implObj, "get_SetupPrefix"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_ContentValidationCert)
        CallbackFree(this.vtbl.get_ExpirationDate)
        CallbackFree(this.vtbl.get_IsManaged)
        CallbackFree(this.vtbl.get_IsRegisteredWithAU)
        CallbackFree(this.vtbl.get_IssueDate)
        CallbackFree(this.vtbl.get_OffersWindowsUpdates)
        CallbackFree(this.vtbl.get_RedirectUrls)
        CallbackFree(this.vtbl.get_ServiceID)
        CallbackFree(this.vtbl.get_IsScanPackageService)
        CallbackFree(this.vtbl.get_CanRegisterWithAU)
        CallbackFree(this.vtbl.get_ServiceUrl)
        CallbackFree(this.vtbl.get_SetupPrefix)
    }
}

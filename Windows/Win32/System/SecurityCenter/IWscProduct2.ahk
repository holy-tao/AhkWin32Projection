#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WSC_SECURITY_PRODUCT_SUBSTATUS.ahk" { WSC_SECURITY_PRODUCT_SUBSTATUS }
#Import ".\IWscProduct.ahk" { IWscProduct }

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */
export default struct IWscProduct2 extends IWscProduct {
    /**
     * The interface identifier for IWscProduct2
     * @type {Guid}
     */
    static IID := Guid("{f896ca54-fe09-4403-86d4-23cb488d81d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWscProduct2 interfaces
    */
    struct Vtbl extends IWscProduct.Vtbl {
        get_AntivirusScanSubstatus             : IntPtr
        get_AntivirusSettingsSubstatus         : IntPtr
        get_AntivirusProtectionUpdateSubstatus : IntPtr
        get_FirewallDomainProfileSubstatus     : IntPtr
        get_FirewallPrivateProfileSubstatus    : IntPtr
        get_FirewallPublicProfileSubstatus     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWscProduct2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    AntivirusScanSubstatus {
        get => this.get_AntivirusScanSubstatus()
    }

    /**
     * @type {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    AntivirusSettingsSubstatus {
        get => this.get_AntivirusSettingsSubstatus()
    }

    /**
     * @type {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    AntivirusProtectionUpdateSubstatus {
        get => this.get_AntivirusProtectionUpdateSubstatus()
    }

    /**
     * @type {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    FirewallDomainProfileSubstatus {
        get => this.get_FirewallDomainProfileSubstatus()
    }

    /**
     * @type {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    FirewallPrivateProfileSubstatus {
        get => this.get_FirewallPrivateProfileSubstatus()
    }

    /**
     * @type {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    FirewallPublicProfileSubstatus {
        get => this.get_FirewallPublicProfileSubstatus()
    }

    /**
     * 
     * @returns {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    get_AntivirusScanSubstatus() {
        result := ComCall(14, this, "int*", &peStatus := 0, "HRESULT")
        return peStatus
    }

    /**
     * 
     * @returns {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    get_AntivirusSettingsSubstatus() {
        result := ComCall(15, this, "int*", &peStatus := 0, "HRESULT")
        return peStatus
    }

    /**
     * 
     * @returns {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    get_AntivirusProtectionUpdateSubstatus() {
        result := ComCall(16, this, "int*", &peStatus := 0, "HRESULT")
        return peStatus
    }

    /**
     * 
     * @returns {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    get_FirewallDomainProfileSubstatus() {
        result := ComCall(17, this, "int*", &peStatus := 0, "HRESULT")
        return peStatus
    }

    /**
     * 
     * @returns {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    get_FirewallPrivateProfileSubstatus() {
        result := ComCall(18, this, "int*", &peStatus := 0, "HRESULT")
        return peStatus
    }

    /**
     * 
     * @returns {WSC_SECURITY_PRODUCT_SUBSTATUS} 
     */
    get_FirewallPublicProfileSubstatus() {
        result := ComCall(19, this, "int*", &peStatus := 0, "HRESULT")
        return peStatus
    }

    Query(iid) {
        if (IWscProduct2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AntivirusScanSubstatus := CallbackCreate(GetMethod(implObj, "get_AntivirusScanSubstatus"), flags, 2)
        this.vtbl.get_AntivirusSettingsSubstatus := CallbackCreate(GetMethod(implObj, "get_AntivirusSettingsSubstatus"), flags, 2)
        this.vtbl.get_AntivirusProtectionUpdateSubstatus := CallbackCreate(GetMethod(implObj, "get_AntivirusProtectionUpdateSubstatus"), flags, 2)
        this.vtbl.get_FirewallDomainProfileSubstatus := CallbackCreate(GetMethod(implObj, "get_FirewallDomainProfileSubstatus"), flags, 2)
        this.vtbl.get_FirewallPrivateProfileSubstatus := CallbackCreate(GetMethod(implObj, "get_FirewallPrivateProfileSubstatus"), flags, 2)
        this.vtbl.get_FirewallPublicProfileSubstatus := CallbackCreate(GetMethod(implObj, "get_FirewallPublicProfileSubstatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AntivirusScanSubstatus)
        CallbackFree(this.vtbl.get_AntivirusSettingsSubstatus)
        CallbackFree(this.vtbl.get_AntivirusProtectionUpdateSubstatus)
        CallbackFree(this.vtbl.get_FirewallDomainProfileSubstatus)
        CallbackFree(this.vtbl.get_FirewallPrivateProfileSubstatus)
        CallbackFree(this.vtbl.get_FirewallPublicProfileSubstatus)
    }
}

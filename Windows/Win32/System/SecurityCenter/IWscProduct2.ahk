#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WSC_SECURITY_PRODUCT_SUBSTATUS.ahk
#Include .\IWscProduct.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */
class IWscProduct2 extends IWscProduct {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWscProduct2
     * @type {Guid}
     */
    static IID => Guid("{f896ca54-fe09-4403-86d4-23cb488d81d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AntivirusScanSubstatus", "get_AntivirusSettingsSubstatus", "get_AntivirusProtectionUpdateSubstatus", "get_FirewallDomainProfileSubstatus", "get_FirewallPrivateProfileSubstatus", "get_FirewallPublicProfileSubstatus"]

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
}

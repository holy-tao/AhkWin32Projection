#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactListSyncConstraints extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactListSyncConstraints
     * @type {Guid}
     */
    static IID => Guid("{b2b0bf01-3062-4e2e-969d-018d1987f314}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanSyncDescriptions", "put_CanSyncDescriptions", "get_MaxHomePhoneNumbers", "put_MaxHomePhoneNumbers", "get_MaxMobilePhoneNumbers", "put_MaxMobilePhoneNumbers", "get_MaxWorkPhoneNumbers", "put_MaxWorkPhoneNumbers", "get_MaxOtherPhoneNumbers", "put_MaxOtherPhoneNumbers", "get_MaxPagerPhoneNumbers", "put_MaxPagerPhoneNumbers", "get_MaxBusinessFaxPhoneNumbers", "put_MaxBusinessFaxPhoneNumbers", "get_MaxHomeFaxPhoneNumbers", "put_MaxHomeFaxPhoneNumbers", "get_MaxCompanyPhoneNumbers", "put_MaxCompanyPhoneNumbers", "get_MaxAssistantPhoneNumbers", "put_MaxAssistantPhoneNumbers", "get_MaxRadioPhoneNumbers", "put_MaxRadioPhoneNumbers", "get_MaxPersonalEmailAddresses", "put_MaxPersonalEmailAddresses", "get_MaxWorkEmailAddresses", "put_MaxWorkEmailAddresses", "get_MaxOtherEmailAddresses", "put_MaxOtherEmailAddresses", "get_MaxHomeAddresses", "put_MaxHomeAddresses", "get_MaxWorkAddresses", "put_MaxWorkAddresses", "get_MaxOtherAddresses", "put_MaxOtherAddresses", "get_MaxBirthdayDates", "put_MaxBirthdayDates", "get_MaxAnniversaryDates", "put_MaxAnniversaryDates", "get_MaxOtherDates", "put_MaxOtherDates", "get_MaxOtherRelationships", "put_MaxOtherRelationships", "get_MaxSpouseRelationships", "put_MaxSpouseRelationships", "get_MaxPartnerRelationships", "put_MaxPartnerRelationships", "get_MaxSiblingRelationships", "put_MaxSiblingRelationships", "get_MaxParentRelationships", "put_MaxParentRelationships", "get_MaxChildRelationships", "put_MaxChildRelationships", "get_MaxJobInfo", "put_MaxJobInfo", "get_MaxWebsites", "put_MaxWebsites"]

    /**
     * @type {Boolean} 
     */
    CanSyncDescriptions {
        get => this.get_CanSyncDescriptions()
        set => this.put_CanSyncDescriptions(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxHomePhoneNumbers {
        get => this.get_MaxHomePhoneNumbers()
        set => this.put_MaxHomePhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxMobilePhoneNumbers {
        get => this.get_MaxMobilePhoneNumbers()
        set => this.put_MaxMobilePhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxWorkPhoneNumbers {
        get => this.get_MaxWorkPhoneNumbers()
        set => this.put_MaxWorkPhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxOtherPhoneNumbers {
        get => this.get_MaxOtherPhoneNumbers()
        set => this.put_MaxOtherPhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxPagerPhoneNumbers {
        get => this.get_MaxPagerPhoneNumbers()
        set => this.put_MaxPagerPhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxBusinessFaxPhoneNumbers {
        get => this.get_MaxBusinessFaxPhoneNumbers()
        set => this.put_MaxBusinessFaxPhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxHomeFaxPhoneNumbers {
        get => this.get_MaxHomeFaxPhoneNumbers()
        set => this.put_MaxHomeFaxPhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxCompanyPhoneNumbers {
        get => this.get_MaxCompanyPhoneNumbers()
        set => this.put_MaxCompanyPhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxAssistantPhoneNumbers {
        get => this.get_MaxAssistantPhoneNumbers()
        set => this.put_MaxAssistantPhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxRadioPhoneNumbers {
        get => this.get_MaxRadioPhoneNumbers()
        set => this.put_MaxRadioPhoneNumbers(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxPersonalEmailAddresses {
        get => this.get_MaxPersonalEmailAddresses()
        set => this.put_MaxPersonalEmailAddresses(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxWorkEmailAddresses {
        get => this.get_MaxWorkEmailAddresses()
        set => this.put_MaxWorkEmailAddresses(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxOtherEmailAddresses {
        get => this.get_MaxOtherEmailAddresses()
        set => this.put_MaxOtherEmailAddresses(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxHomeAddresses {
        get => this.get_MaxHomeAddresses()
        set => this.put_MaxHomeAddresses(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxWorkAddresses {
        get => this.get_MaxWorkAddresses()
        set => this.put_MaxWorkAddresses(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxOtherAddresses {
        get => this.get_MaxOtherAddresses()
        set => this.put_MaxOtherAddresses(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxBirthdayDates {
        get => this.get_MaxBirthdayDates()
        set => this.put_MaxBirthdayDates(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxAnniversaryDates {
        get => this.get_MaxAnniversaryDates()
        set => this.put_MaxAnniversaryDates(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxOtherDates {
        get => this.get_MaxOtherDates()
        set => this.put_MaxOtherDates(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxOtherRelationships {
        get => this.get_MaxOtherRelationships()
        set => this.put_MaxOtherRelationships(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxSpouseRelationships {
        get => this.get_MaxSpouseRelationships()
        set => this.put_MaxSpouseRelationships(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxPartnerRelationships {
        get => this.get_MaxPartnerRelationships()
        set => this.put_MaxPartnerRelationships(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxSiblingRelationships {
        get => this.get_MaxSiblingRelationships()
        set => this.put_MaxSiblingRelationships(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxParentRelationships {
        get => this.get_MaxParentRelationships()
        set => this.put_MaxParentRelationships(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxChildRelationships {
        get => this.get_MaxChildRelationships()
        set => this.put_MaxChildRelationships(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxJobInfo {
        get => this.get_MaxJobInfo()
        set => this.put_MaxJobInfo(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxWebsites {
        get => this.get_MaxWebsites()
        set => this.put_MaxWebsites(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSyncDescriptions() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanSyncDescriptions(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxHomePhoneNumbers() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxHomePhoneNumbers(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxMobilePhoneNumbers() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxMobilePhoneNumbers(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxWorkPhoneNumbers() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxWorkPhoneNumbers(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherPhoneNumbers() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherPhoneNumbers(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxPagerPhoneNumbers() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxPagerPhoneNumbers(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxBusinessFaxPhoneNumbers() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxBusinessFaxPhoneNumbers(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxHomeFaxPhoneNumbers() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxHomeFaxPhoneNumbers(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxCompanyPhoneNumbers() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxCompanyPhoneNumbers(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxAssistantPhoneNumbers() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxAssistantPhoneNumbers(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxRadioPhoneNumbers() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxRadioPhoneNumbers(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxPersonalEmailAddresses() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxPersonalEmailAddresses(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxWorkEmailAddresses() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxWorkEmailAddresses(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherEmailAddresses() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherEmailAddresses(value) {
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxHomeAddresses() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxHomeAddresses(value) {
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxWorkAddresses() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxWorkAddresses(value) {
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherAddresses() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherAddresses(value) {
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxBirthdayDates() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxBirthdayDates(value) {
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxAnniversaryDates() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxAnniversaryDates(value) {
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherDates() {
        result := ComCall(44, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherDates(value) {
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherRelationships() {
        result := ComCall(46, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherRelationships(value) {
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxSpouseRelationships() {
        result := ComCall(48, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxSpouseRelationships(value) {
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxPartnerRelationships() {
        result := ComCall(50, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxPartnerRelationships(value) {
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxSiblingRelationships() {
        result := ComCall(52, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxSiblingRelationships(value) {
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxParentRelationships() {
        result := ComCall(54, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxParentRelationships(value) {
        result := ComCall(55, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxChildRelationships() {
        result := ComCall(56, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxChildRelationships(value) {
        result := ComCall(57, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxJobInfo() {
        result := ComCall(58, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxJobInfo(value) {
        result := ComCall(59, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxWebsites() {
        result := ComCall(60, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxWebsites(value) {
        result := ComCall(61, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

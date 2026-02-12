#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListSyncConstraints.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies limits on how much contact list data can be synchronized.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactListSyncConstraints extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListSyncConstraints

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListSyncConstraints.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a Boolean value that indicates whether to synchronize contact descriptions.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.cansyncdescriptions
     * @type {Boolean} 
     */
    CanSyncDescriptions {
        get => this.get_CanSyncDescriptions()
        set => this.put_CanSyncDescriptions(value)
    }

    /**
     * Gets or sets the maximum number of home phone numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxhomephonenumbers
     * @type {IReference<Integer>} 
     */
    MaxHomePhoneNumbers {
        get => this.get_MaxHomePhoneNumbers()
        set => this.put_MaxHomePhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of mobile phone numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxmobilephonenumbers
     * @type {IReference<Integer>} 
     */
    MaxMobilePhoneNumbers {
        get => this.get_MaxMobilePhoneNumbers()
        set => this.put_MaxMobilePhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of work phone numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxworkphonenumbers
     * @type {IReference<Integer>} 
     */
    MaxWorkPhoneNumbers {
        get => this.get_MaxWorkPhoneNumbers()
        set => this.put_MaxWorkPhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of 'other phone' numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxotherphonenumbers
     * @type {IReference<Integer>} 
     */
    MaxOtherPhoneNumbers {
        get => this.get_MaxOtherPhoneNumbers()
        set => this.put_MaxOtherPhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of page phone numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxpagerphonenumbers
     * @type {IReference<Integer>} 
     */
    MaxPagerPhoneNumbers {
        get => this.get_MaxPagerPhoneNumbers()
        set => this.put_MaxPagerPhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of business fax numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxbusinessfaxphonenumbers
     * @type {IReference<Integer>} 
     */
    MaxBusinessFaxPhoneNumbers {
        get => this.get_MaxBusinessFaxPhoneNumbers()
        set => this.put_MaxBusinessFaxPhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of home fax phone numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxhomefaxphonenumbers
     * @type {IReference<Integer>} 
     */
    MaxHomeFaxPhoneNumbers {
        get => this.get_MaxHomeFaxPhoneNumbers()
        set => this.put_MaxHomeFaxPhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of company phone numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxcompanyphonenumbers
     * @type {IReference<Integer>} 
     */
    MaxCompanyPhoneNumbers {
        get => this.get_MaxCompanyPhoneNumbers()
        set => this.put_MaxCompanyPhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of assistant phone numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxassistantphonenumbers
     * @type {IReference<Integer>} 
     */
    MaxAssistantPhoneNumbers {
        get => this.get_MaxAssistantPhoneNumbers()
        set => this.put_MaxAssistantPhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of radio phone numbers that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxradiophonenumbers
     * @type {IReference<Integer>} 
     */
    MaxRadioPhoneNumbers {
        get => this.get_MaxRadioPhoneNumbers()
        set => this.put_MaxRadioPhoneNumbers(value)
    }

    /**
     * Gets or sets the maximum number of personal email addresses that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxpersonalemailaddresses
     * @type {IReference<Integer>} 
     */
    MaxPersonalEmailAddresses {
        get => this.get_MaxPersonalEmailAddresses()
        set => this.put_MaxPersonalEmailAddresses(value)
    }

    /**
     * Gets or sets the maximum number of work email addresses that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxworkemailaddresses
     * @type {IReference<Integer>} 
     */
    MaxWorkEmailAddresses {
        get => this.get_MaxWorkEmailAddresses()
        set => this.put_MaxWorkEmailAddresses(value)
    }

    /**
     * Gets or sets the maximum number of 'other email' addresses that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxotheremailaddresses
     * @type {IReference<Integer>} 
     */
    MaxOtherEmailAddresses {
        get => this.get_MaxOtherEmailAddresses()
        set => this.put_MaxOtherEmailAddresses(value)
    }

    /**
     * Gets or sets the maximum number of home addresses that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxhomeaddresses
     * @type {IReference<Integer>} 
     */
    MaxHomeAddresses {
        get => this.get_MaxHomeAddresses()
        set => this.put_MaxHomeAddresses(value)
    }

    /**
     * Gets or sets the maximum number of work addresses that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxworkaddresses
     * @type {IReference<Integer>} 
     */
    MaxWorkAddresses {
        get => this.get_MaxWorkAddresses()
        set => this.put_MaxWorkAddresses(value)
    }

    /**
     * Gets or sets the maximum number of 'other address' entries that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxotheraddresses
     * @type {IReference<Integer>} 
     */
    MaxOtherAddresses {
        get => this.get_MaxOtherAddresses()
        set => this.put_MaxOtherAddresses(value)
    }

    /**
     * Gets or sets the maximum number of birthday dates that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxbirthdaydates
     * @type {IReference<Integer>} 
     */
    MaxBirthdayDates {
        get => this.get_MaxBirthdayDates()
        set => this.put_MaxBirthdayDates(value)
    }

    /**
     * Gets or sets the maximum number of anniversary dates that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxanniversarydates
     * @type {IReference<Integer>} 
     */
    MaxAnniversaryDates {
        get => this.get_MaxAnniversaryDates()
        set => this.put_MaxAnniversaryDates(value)
    }

    /**
     * Gets or sets the maximum number of 'other dates' that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxotherdates
     * @type {IReference<Integer>} 
     */
    MaxOtherDates {
        get => this.get_MaxOtherDates()
        set => this.put_MaxOtherDates(value)
    }

    /**
     * Gets or sets the maximum number of 'other relationship' entries that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxotherrelationships
     * @type {IReference<Integer>} 
     */
    MaxOtherRelationships {
        get => this.get_MaxOtherRelationships()
        set => this.put_MaxOtherRelationships(value)
    }

    /**
     * Gets or sets the maximum number of spouse relationships that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxspouserelationships
     * @type {IReference<Integer>} 
     */
    MaxSpouseRelationships {
        get => this.get_MaxSpouseRelationships()
        set => this.put_MaxSpouseRelationships(value)
    }

    /**
     * Gets or sets the maximum number of partner relationships that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxpartnerrelationships
     * @type {IReference<Integer>} 
     */
    MaxPartnerRelationships {
        get => this.get_MaxPartnerRelationships()
        set => this.put_MaxPartnerRelationships(value)
    }

    /**
     * Gets or sets the maximum number of sibling relationships that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxsiblingrelationships
     * @type {IReference<Integer>} 
     */
    MaxSiblingRelationships {
        get => this.get_MaxSiblingRelationships()
        set => this.put_MaxSiblingRelationships(value)
    }

    /**
     * Gets or sets the maximum number of parent relationships that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxparentrelationships
     * @type {IReference<Integer>} 
     */
    MaxParentRelationships {
        get => this.get_MaxParentRelationships()
        set => this.put_MaxParentRelationships(value)
    }

    /**
     * Gets or sets the maximum number of child relationships that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxchildrelationships
     * @type {IReference<Integer>} 
     */
    MaxChildRelationships {
        get => this.get_MaxChildRelationships()
        set => this.put_MaxChildRelationships(value)
    }

    /**
     * Gets or sets the maximum number of job info entries that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxjobinfo
     * @type {IReference<Integer>} 
     */
    MaxJobInfo {
        get => this.get_MaxJobInfo()
        set => this.put_MaxJobInfo(value)
    }

    /**
     * Gets or sets the maximum number of website entries that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncconstraints.maxwebsites
     * @type {IReference<Integer>} 
     */
    MaxWebsites {
        get => this.get_MaxWebsites()
        set => this.put_MaxWebsites(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSyncDescriptions() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_CanSyncDescriptions()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanSyncDescriptions(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_CanSyncDescriptions(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxHomePhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxHomePhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxHomePhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxHomePhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxMobilePhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxMobilePhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxMobilePhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxMobilePhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxWorkPhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxWorkPhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxWorkPhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxWorkPhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherPhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxOtherPhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherPhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxOtherPhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxPagerPhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxPagerPhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxPagerPhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxPagerPhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxBusinessFaxPhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxBusinessFaxPhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxBusinessFaxPhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxBusinessFaxPhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxHomeFaxPhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxHomeFaxPhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxHomeFaxPhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxHomeFaxPhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxCompanyPhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxCompanyPhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxCompanyPhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxCompanyPhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxAssistantPhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxAssistantPhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxAssistantPhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxAssistantPhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxRadioPhoneNumbers() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxRadioPhoneNumbers()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxRadioPhoneNumbers(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxRadioPhoneNumbers(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxPersonalEmailAddresses() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxPersonalEmailAddresses()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxPersonalEmailAddresses(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxPersonalEmailAddresses(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxWorkEmailAddresses() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxWorkEmailAddresses()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxWorkEmailAddresses(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxWorkEmailAddresses(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherEmailAddresses() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxOtherEmailAddresses()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherEmailAddresses(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxOtherEmailAddresses(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxHomeAddresses() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxHomeAddresses()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxHomeAddresses(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxHomeAddresses(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxWorkAddresses() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxWorkAddresses()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxWorkAddresses(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxWorkAddresses(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherAddresses() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxOtherAddresses()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherAddresses(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxOtherAddresses(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxBirthdayDates() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxBirthdayDates()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxBirthdayDates(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxBirthdayDates(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxAnniversaryDates() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxAnniversaryDates()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxAnniversaryDates(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxAnniversaryDates(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherDates() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxOtherDates()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherDates(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxOtherDates(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxOtherRelationships() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxOtherRelationships()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxOtherRelationships(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxOtherRelationships(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxSpouseRelationships() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxSpouseRelationships()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxSpouseRelationships(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxSpouseRelationships(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxPartnerRelationships() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxPartnerRelationships()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxPartnerRelationships(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxPartnerRelationships(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxSiblingRelationships() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxSiblingRelationships()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxSiblingRelationships(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxSiblingRelationships(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxParentRelationships() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxParentRelationships()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxParentRelationships(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxParentRelationships(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxChildRelationships() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxChildRelationships()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxChildRelationships(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxChildRelationships(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxJobInfo() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxJobInfo()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxJobInfo(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxJobInfo(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxWebsites() {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.get_MaxWebsites()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxWebsites(value) {
        if (!this.HasProp("__IContactListSyncConstraints")) {
            if ((queryResult := this.QueryInterface(IContactListSyncConstraints.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncConstraints := IContactListSyncConstraints(outPtr)
        }

        return this.__IContactListSyncConstraints.put_MaxWebsites(value)
    }

;@endregion Instance Methods
}

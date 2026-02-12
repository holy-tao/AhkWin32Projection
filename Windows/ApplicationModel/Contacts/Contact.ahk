#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContact.ahk
#Include .\IContact2.ahk
#Include .\IContactName.ahk
#Include .\IContact3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a contact.
 * @remarks
 * No matter how you store contact information in your app, you must be able to put that information into a Contact object. This way, other apps that allow users to select contacts can use your app and process the contact information it provides.
 * 
 * For info about how to manage contacts, see [Contacts and calendar](/windows/uwp/contacts-and-calendar/).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class Contact extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContact

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContact.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Sets and gets the name of the contact.
     * 
     * > [!NOTE]
     * > Name may be altered or unavailable for releases after Windows 8.1. Instead, use [FirstName](contact_firstname.md), [MiddleName](contact_middlename.md), and [LastName](contact_lastname.md).
     * @remarks
     * An app can set the name property to any value that matches the name of a contact. We recommend that you set this value to contain both the first and last names of the contact, if that information is available.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets a thumbnail image that represents this contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.thumbnail
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * Sets the fields that contain information about a contact.
     * 
     * > [!NOTE]
     * > `Fields` may be altered or unavailable for releases after Windows 8.1. Instead, use [Phones](contact_phones.md), [Emails](contact_emails.md), [Addresses](contact_addresses.md), or [ConnectedServiceAccounts](contact_connectedserviceaccounts.md).
     * @remarks
     * The [ContactFieldCategory](contactfieldcategory.md) and [ContactFieldType](contactfieldtype.md) classes provide information about what kind of information you can put into a field.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.fields
     * @type {IVector<IContactField>} 
     */
    Fields {
        get => this.get_Fields()
    }

    /**
     * Gets or sets the identifier for a contact. The maximum string length for the identifier is 256 characters.
     * @remarks
     * > [!NOTE]
     * > The `Id` property must be set when you call [AddContact](../windows.applicationmodel.contacts.provider/contactpickerui_addcontact_79336216.md), [ContainsContact](../windows.applicationmodel.contacts.provider/contactpickerui_containscontact_2082214775.md), or [RemoveContact](../windows.applicationmodel.contacts.provider/contactpickerui_removecontact_591776620.md). If `Id` isn't set when you call [AddContact](../windows.applicationmodel.contacts.provider/contactpickerui_addcontact_79336216.md), your app will fail. If `Id` isn't set when you call [ContainsContact](../windows.applicationmodel.contacts.provider/contactpickerui_containscontact_2082214775.md) or [RemoveContact](../windows.applicationmodel.contacts.provider/contactpickerui_removecontact_591776620.md), your app won't be able to find or remove the contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets or sets notes for a contact. The maximum string length for notes is 4096 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.notes
     * @type {HSTRING} 
     */
    Notes {
        get => this.get_Notes()
        set => this.put_Notes(value)
    }

    /**
     * Gets info about the phones for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.phones
     * @type {IVector<ContactPhone>} 
     */
    Phones {
        get => this.get_Phones()
    }

    /**
     * Gets the email addresses for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.emails
     * @type {IVector<ContactEmail>} 
     */
    Emails {
        get => this.get_Emails()
    }

    /**
     * Gets the contact addresses for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.addresses
     * @type {IVector<ContactAddress>} 
     */
    Addresses {
        get => this.get_Addresses()
    }

    /**
     * Gets the connected service accounts for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.connectedserviceaccounts
     * @type {IVector<ContactConnectedServiceAccount>} 
     */
    ConnectedServiceAccounts {
        get => this.get_ConnectedServiceAccounts()
    }

    /**
     * Gets the important dates for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.importantdates
     * @type {IVector<ContactDate>} 
     */
    ImportantDates {
        get => this.get_ImportantDates()
    }

    /**
     * Gets the data suppliers for a contact. The maximum string length for each data supplier is 50 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.datasuppliers
     * @type {IVector<HSTRING>} 
     */
    DataSuppliers {
        get => this.get_DataSuppliers()
    }

    /**
     * Gets the job info items for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.jobinfo
     * @type {IVector<ContactJobInfo>} 
     */
    JobInfo {
        get => this.get_JobInfo()
    }

    /**
     * Gets the significant others for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.significantothers
     * @type {IVector<ContactSignificantOther>} 
     */
    SignificantOthers {
        get => this.get_SignificantOthers()
    }

    /**
     * Gets the Web sites for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.websites
     * @type {IVector<ContactWebsite>} 
     */
    Websites {
        get => this.get_Websites()
    }

    /**
     * Gets the property set object for the contact.
     * @remarks
     * The value of this property is not persisted if set by an application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.providerproperties
     * @type {IPropertySet} 
     */
    ProviderProperties {
        get => this.get_ProviderProperties()
    }

    /**
     * Gets or sets the first name for a contact. The maximum string length for the first name is 64 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.firstname
     * @type {HSTRING} 
     */
    FirstName {
        get => this.get_FirstName()
        set => this.put_FirstName(value)
    }

    /**
     * Gets or sets the last name for a contact. The maximum string length for the last name is 64 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.lastname
     * @type {HSTRING} 
     */
    LastName {
        get => this.get_LastName()
        set => this.put_LastName(value)
    }

    /**
     * Gets or sets the middle name for a contact. The maximum string length for the middle name is 64 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.middlename
     * @type {HSTRING} 
     */
    MiddleName {
        get => this.get_MiddleName()
        set => this.put_MiddleName(value)
    }

    /**
     * Gets or sets the Yomi (phonetic Japanese equivalent) given name for a contact. The maximum string length for the Yomi given name is 120 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.yomigivenname
     * @type {HSTRING} 
     */
    YomiGivenName {
        get => this.get_YomiGivenName()
        set => this.put_YomiGivenName(value)
    }

    /**
     * Gets or sets the Yomi (phonetic Japanese equivalent) family name for a contact. The maximum string length for the Yomi family name is 120 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.yomifamilyname
     * @type {HSTRING} 
     */
    YomiFamilyName {
        get => this.get_YomiFamilyName()
        set => this.put_YomiFamilyName(value)
    }

    /**
     * Gets or sets the honorific suffix for the name for a contact. The maximum string length for the honorific suffix is 32 characters.
     * @remarks
     * A suffix follows the contact's name and provides additional info about the contact, like an academic degree (M.D. for medical doctor).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.honorificnamesuffix
     * @type {HSTRING} 
     */
    HonorificNameSuffix {
        get => this.get_HonorificNameSuffix()
        set => this.put_HonorificNameSuffix(value)
    }

    /**
     * Gets or sets the honorific prefix for the name for a contact. The maximum string length for the honorific prefix is 32 characters.
     * @remarks
     * Common name prefixes are Ms, Miss, Mrs, Mr, Dr, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.honorificnameprefix
     * @type {HSTRING} 
     */
    HonorificNamePrefix {
        get => this.get_HonorificNamePrefix()
        set => this.put_HonorificNamePrefix(value)
    }

    /**
     * Gets the display name for a contact.
     * @remarks
     * > [!NOTE]
     * > You can only access this property from a UI thread.
     * 
     * Windows calculates the DisplayName property by using the values from the [FirstName](contact_firstname.md), [MiddleName](contact_middlename.md), and [LastName](contact_lastname.md) properties if any are specified. If these values aren't available, Windows uses the Yomi (phonetic Japanese equivalent) name values ([YomiGivenName](contact_yomigivenname.md) and [YomiFamilyName](contact_yomifamilyname.md)). The calculation for DisplayName takes into account different locale hints such as script of the text in the names, resource context, and default user locale to determine the proper formatting template for the name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the Yomi (phonetic Japanese equivalent) display name for a contact.
     * @remarks
     * Windows calculates the YomiDisplayName property by using the values from the [YomiGivenName](contact_yomigivenname.md) and [YomiFamilyName](contact_yomifamilyname.md) properties. The calculation for YomiDisplayName takes into account different locale hints such as script of the text in the names, resource context, and default user locale to determine the proper formatting template for the name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.yomidisplayname
     * @type {HSTRING} 
     */
    YomiDisplayName {
        get => this.get_YomiDisplayName()
    }

    /**
     * Gets a string that identifies the [ContactList](contactlist.md) of which this contact is a member.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.contactlistid
     * @type {HSTRING} 
     */
    ContactListId {
        get => this.get_ContactListId()
    }

    /**
     * Gets or sets the last time the user updated their display picture.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.displaypictureuserupdatetime
     * @type {DateTime} 
     */
    DisplayPictureUserUpdateTime {
        get => this.get_DisplayPictureUserUpdateTime()
        set => this.put_DisplayPictureUserUpdateTime(value)
    }

    /**
     * Gets a Boolean value that indicates whether this [Contact](contact.md) represents the user logged into the device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.isme
     * @type {Boolean} 
     */
    IsMe {
        get => this.get_IsMe()
    }

    /**
     * If this is a raw contact that is part of an aggregate contact, then this property identifies the parent aggregate.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.aggregateid
     * @type {HSTRING} 
     */
    AggregateId {
        get => this.get_AggregateId()
    }

    /**
     * Gets or sets an ID that can be used by a service provider to access the [Contact](contact.md) in their remote system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets or sets the path to the ringtone file for the [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.ringtonetoken
     * @type {HSTRING} 
     */
    RingToneToken {
        get => this.get_RingToneToken()
        set => this.put_RingToneToken(value)
    }

    /**
     * Gets a Boolean value that indicates whether the user manually set the picture for the [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.isdisplaypicturemanuallyset
     * @type {Boolean} 
     */
    IsDisplayPictureManuallySet {
        get => this.get_IsDisplayPictureManuallySet()
    }

    /**
     * Gets a large version of the display picture for the [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.largedisplaypicture
     * @type {IRandomAccessStreamReference} 
     */
    LargeDisplayPicture {
        get => this.get_LargeDisplayPicture()
    }

    /**
     * Gets a small version of the display picture for the [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.smalldisplaypicture
     * @type {IRandomAccessStreamReference} 
     */
    SmallDisplayPicture {
        get => this.get_SmallDisplayPicture()
    }

    /**
     * Gets or sets the display picture for the [Contact](contact.md) in its original size.
     * @remarks
     * The [SmallDisplayPicture](contact_smalldisplaypicture.md), [LargeDisplayPicture](contact_largedisplaypicture.md) and [Thumbnail](contact_thumbnail.md) are generated from this picture.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.sourcedisplaypicture
     * @type {IRandomAccessStreamReference} 
     */
    SourceDisplayPicture {
        get => this.get_SourceDisplayPicture()
        set => this.put_SourceDisplayPicture(value)
    }

    /**
     * Gets or sets the path to the audio file to play when an SMS/MMS message is received from the [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.texttonetoken
     * @type {HSTRING} 
     */
    TextToneToken {
        get => this.get_TextToneToken()
        set => this.put_TextToneToken(value)
    }

    /**
     * Gets a value that indicates whether this is an aggregate [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.isaggregate
     * @type {Boolean} 
     */
    IsAggregate {
        get => this.get_IsAggregate()
    }

    /**
     * Gets the full name of the [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.fullname
     * @type {HSTRING} 
     */
    FullName {
        get => this.get_FullName()
    }

    /**
     * Gets or sets the display name that was manually entered by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.displaynameoverride
     * @type {HSTRING} 
     */
    DisplayNameOverride {
        get => this.get_DisplayNameOverride()
        set => this.put_DisplayNameOverride(value)
    }

    /**
     * Gets or sets the nickname for the [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.nickname
     * @type {HSTRING} 
     */
    Nickname {
        get => this.get_Nickname()
        set => this.put_Nickname(value)
    }

    /**
     * Gets the name used to sort the contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact.sortname
     * @type {HSTRING} 
     */
    SortName {
        get => this.get_SortName()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [Contact](contact.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.Contact")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IContact")) {
            if ((queryResult := this.QueryInterface(IContact.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact := IContact(outPtr)
        }

        return this.__IContact.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IContact")) {
            if ((queryResult := this.QueryInterface(IContact.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact := IContact(outPtr)
        }

        return this.__IContact.put_Name(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IContact")) {
            if ((queryResult := this.QueryInterface(IContact.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact := IContact(outPtr)
        }

        return this.__IContact.get_Thumbnail()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__IContact")) {
            if ((queryResult := this.QueryInterface(IContact.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact := IContact(outPtr)
        }

        return this.__IContact.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {IVector<IContactField>} 
     */
    get_Fields() {
        if (!this.HasProp("__IContact")) {
            if ((queryResult := this.QueryInterface(IContact.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact := IContact(outPtr)
        }

        return this.__IContact.get_Fields()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Notes() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_Notes()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Notes(value) {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.put_Notes(value)
    }

    /**
     * 
     * @returns {IVector<ContactPhone>} 
     */
    get_Phones() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_Phones()
    }

    /**
     * 
     * @returns {IVector<ContactEmail>} 
     */
    get_Emails() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_Emails()
    }

    /**
     * 
     * @returns {IVector<ContactAddress>} 
     */
    get_Addresses() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_Addresses()
    }

    /**
     * 
     * @returns {IVector<ContactConnectedServiceAccount>} 
     */
    get_ConnectedServiceAccounts() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_ConnectedServiceAccounts()
    }

    /**
     * 
     * @returns {IVector<ContactDate>} 
     */
    get_ImportantDates() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_ImportantDates()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DataSuppliers() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_DataSuppliers()
    }

    /**
     * 
     * @returns {IVector<ContactJobInfo>} 
     */
    get_JobInfo() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_JobInfo()
    }

    /**
     * 
     * @returns {IVector<ContactSignificantOther>} 
     */
    get_SignificantOthers() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_SignificantOthers()
    }

    /**
     * 
     * @returns {IVector<ContactWebsite>} 
     */
    get_Websites() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_Websites()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_ProviderProperties() {
        if (!this.HasProp("__IContact2")) {
            if ((queryResult := this.QueryInterface(IContact2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact2 := IContact2(outPtr)
        }

        return this.__IContact2.get_ProviderProperties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirstName() {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.get_FirstName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FirstName(value) {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.put_FirstName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LastName() {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.get_LastName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LastName(value) {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.put_LastName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MiddleName() {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.get_MiddleName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MiddleName(value) {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.put_MiddleName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_YomiGivenName() {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.get_YomiGivenName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_YomiGivenName(value) {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.put_YomiGivenName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_YomiFamilyName() {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.get_YomiFamilyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_YomiFamilyName(value) {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.put_YomiFamilyName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HonorificNameSuffix() {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.get_HonorificNameSuffix()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_HonorificNameSuffix(value) {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.put_HonorificNameSuffix(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HonorificNamePrefix() {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.get_HonorificNamePrefix()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_HonorificNamePrefix(value) {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.put_HonorificNamePrefix(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_YomiDisplayName() {
        if (!this.HasProp("__IContactName")) {
            if ((queryResult := this.QueryInterface(IContactName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactName := IContactName(outPtr)
        }

        return this.__IContactName.get_YomiDisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactListId() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_ContactListId()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DisplayPictureUserUpdateTime() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_DisplayPictureUserUpdateTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_DisplayPictureUserUpdateTime(value) {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.put_DisplayPictureUserUpdateTime(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMe() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_IsMe()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AggregateId() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_AggregateId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.put_RemoteId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RingToneToken() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_RingToneToken()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RingToneToken(value) {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.put_RingToneToken(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisplayPictureManuallySet() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_IsDisplayPictureManuallySet()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_LargeDisplayPicture() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_LargeDisplayPicture()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_SmallDisplayPicture() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_SmallDisplayPicture()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_SourceDisplayPicture() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_SourceDisplayPicture()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_SourceDisplayPicture(value) {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.put_SourceDisplayPicture(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TextToneToken() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_TextToneToken()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TextToneToken(value) {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.put_TextToneToken(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAggregate() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_IsAggregate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FullName() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_FullName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayNameOverride() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_DisplayNameOverride()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayNameOverride(value) {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.put_DisplayNameOverride(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Nickname() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_Nickname()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Nickname(value) {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.put_Nickname(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SortName() {
        if (!this.HasProp("__IContact3")) {
            if ((queryResult := this.QueryInterface(IContact3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContact3 := IContact3(outPtr)
        }

        return this.__IContact3.get_SortName()
    }

;@endregion Instance Methods
}

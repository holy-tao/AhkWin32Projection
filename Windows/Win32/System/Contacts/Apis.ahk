#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class Contacts {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static CGD_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CGD_UNKNOWN_PROPERTY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CGD_STRING_PROPERTY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CGD_DATE_PROPERTY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CGD_BINARY_PROPERTY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CGD_ARRAY_NODE => 8

    /**
     * @type {Guid}
     */
    static CLSID_ContactAggregationManager => Guid("{96c8ad95-c199-44de-b34e-ac33c442df39}")

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_NOTES => "Notes"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_MAILER => "Mailer"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_PROGID => "ProgID"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_GENDER => "Gender"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_GENDER_UNSPECIFIED => "Unspecified"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_GENDER_MALE => "Male"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_GENDER_FEMALE => "Female"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_CREATIONDATE => "CreationDate"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_CONTACTIDCOLLECTION => "ContactIDCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_CONTACTID => "/ContactID"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_VALUE => "/Value"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_NAMECOLLECTION => "NameCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_NAME => "/Name"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_FORMATTEDNAME => "/FormattedName"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_PHONETIC => "/Phonetic"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_PREFIX => "/Prefix"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_TITLE => "/Title"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_GIVENNAME => "/GivenName"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_FAMILYNAME => "/FamilyName"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_MIDDLENAME => "/MiddleName"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_GENERATION => "/Generation"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_SUFFIX => "/Suffix"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_NICKNAME => "/NickName"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_POSITIONCOLLECTION => "PositionCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_POSITION => "/Position"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_ORGANIZATION => "/Organization"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_COMPANY => "/Company"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_DEPARTMENT => "/Department"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_OFFICE => "/Office"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_JOB_TITLE => "/JobTitle"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_PROFESSION => "/Profession"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_ROLE => "/Role"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_PERSONCOLLECTION => "PersonCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_PERSON => "/Person"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_PERSONID => "/PersonID"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_DATECOLLECTION => "DateCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_DATE => "/Date"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_EMAILADDRESSCOLLECTION => "EmailAddressCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_EMAILADDRESS => "/EmailAddress"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_ADDRESS => "/Address"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_TYPE => "/Type"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_CERTIFICATECOLLECTION => "CertificateCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_CERTIFICATE => "/Certificate"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_THUMBPRINT => "/ThumbPrint"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_PHONENUMBERCOLLECTION => "PhoneNumberCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_PHONENUMBER => "/PhoneNumber"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_NUMBER => "/Number"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_ALTERNATE => "/Alternate"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_PHYSICALADDRESSCOLLECTION => "PhysicalAddressCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_PHYSICALADDRESS => "/PhysicalAddress"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_ADDRESSLABEL => "/AddressLabel"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_STREET => "/Street"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_LOCALITY => "/Locality"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_REGION => "/Region"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_POSTALCODE => "/PostalCode"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_COUNTRY => "/Country"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_POBOX => "/POBox"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_EXTENDEDADDRESS => "/ExtendedAddress"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_IMADDRESSCOLLECTION => "IMAddressCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_IMADDRESSENTRY => "/IMAddress"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_PROTOCOL => "/Protocol"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_URLCOLLECTION => "UrlCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_URL => "/Url"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L1_PHOTOCOLLECTION => "PhotoCollection"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L2_PHOTO => "/Photo"

    /**
     * @type {String}
     */
    static CONTACTPROP_PUB_L3_URL => "/Url"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_PREFERRED => "Preferred"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_PERSONAL => "Personal"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_BUSINESS => "Business"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_OTHER => "Other"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_VOICE => "Voice"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_MOBILE => "Mobile"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_PCS => "PCS"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_CELLULAR => "Cellular"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_CAR => "Car"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_PAGER => "Pager"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_TTY => "TTY"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_FAX => "Fax"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_VIDEO => "Video"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_MODEM => "Modem"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_BBS => "BBS"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_ISDN => "ISDN"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_AGENT => "Agent"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_DOMESTIC => "Domestic"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_INTERNATIONAL => "International"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_POSTAL => "Postal"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_PARCEL => "Parcel"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_USERTILE => "UserTile"

    /**
     * @type {String}
     */
    static CONTACTLABEL_PUB_LOGO => "Logo"

    /**
     * @type {String}
     */
    static CONTACTLABEL_WAB_SPOUSE => "wab:Spouse"

    /**
     * @type {String}
     */
    static CONTACTLABEL_WAB_CHILD => "wab:Child"

    /**
     * @type {String}
     */
    static CONTACTLABEL_WAB_MANAGER => "wab:Manager"

    /**
     * @type {String}
     */
    static CONTACTLABEL_WAB_ASSISTANT => "wab:Assistant"

    /**
     * @type {String}
     */
    static CONTACTLABEL_WAB_BIRTHDAY => "wab:Birthday"

    /**
     * @type {String}
     */
    static CONTACTLABEL_WAB_ANNIVERSARY => "wab:Anniversary"

    /**
     * @type {String}
     */
    static CONTACTLABEL_WAB_SOCIALNETWORK => "wab:SocialNetwork"

    /**
     * @type {String}
     */
    static CONTACTLABEL_WAB_SCHOOL => "wab:School"

    /**
     * @type {String}
     */
    static CONTACTLABEL_WAB_WISHLIST => "wab:WishList"
;@endregion Constants

;@region Methods
;@endregion Methods
}

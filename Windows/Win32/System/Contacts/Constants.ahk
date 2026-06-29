#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Contacts
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global CGD_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CGD_UNKNOWN_PROPERTY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CGD_STRING_PROPERTY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CGD_DATE_PROPERTY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CGD_BINARY_PROPERTY := 4

/**
 * @type {Integer (UInt32)}
 */
export global CGD_ARRAY_NODE := 8

/**
 * @type {Guid}
 */
export global CLSID_ContactAggregationManager := Guid("{96c8ad95-c199-44de-b34e-ac33c442df39}")

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_NOTES := "Notes"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_MAILER := "Mailer"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_PROGID := "ProgID"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_GENDER := "Gender"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_GENDER_UNSPECIFIED := "Unspecified"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_GENDER_MALE := "Male"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_GENDER_FEMALE := "Female"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_CREATIONDATE := "CreationDate"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_CONTACTIDCOLLECTION := "ContactIDCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_CONTACTID := "/ContactID"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_VALUE := "/Value"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_NAMECOLLECTION := "NameCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_NAME := "/Name"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_FORMATTEDNAME := "/FormattedName"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_PHONETIC := "/Phonetic"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_PREFIX := "/Prefix"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_TITLE := "/Title"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_GIVENNAME := "/GivenName"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_FAMILYNAME := "/FamilyName"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_MIDDLENAME := "/MiddleName"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_GENERATION := "/Generation"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_SUFFIX := "/Suffix"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_NICKNAME := "/NickName"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_POSITIONCOLLECTION := "PositionCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_POSITION := "/Position"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_ORGANIZATION := "/Organization"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_COMPANY := "/Company"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_DEPARTMENT := "/Department"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_OFFICE := "/Office"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_JOB_TITLE := "/JobTitle"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_PROFESSION := "/Profession"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_ROLE := "/Role"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_PERSONCOLLECTION := "PersonCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_PERSON := "/Person"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_PERSONID := "/PersonID"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_DATECOLLECTION := "DateCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_DATE := "/Date"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_EMAILADDRESSCOLLECTION := "EmailAddressCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_EMAILADDRESS := "/EmailAddress"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_ADDRESS := "/Address"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_TYPE := "/Type"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_CERTIFICATECOLLECTION := "CertificateCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_CERTIFICATE := "/Certificate"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_THUMBPRINT := "/ThumbPrint"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_PHONENUMBERCOLLECTION := "PhoneNumberCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_PHONENUMBER := "/PhoneNumber"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_NUMBER := "/Number"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_ALTERNATE := "/Alternate"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_PHYSICALADDRESSCOLLECTION := "PhysicalAddressCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_PHYSICALADDRESS := "/PhysicalAddress"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_ADDRESSLABEL := "/AddressLabel"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_STREET := "/Street"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_LOCALITY := "/Locality"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_REGION := "/Region"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_POSTALCODE := "/PostalCode"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_COUNTRY := "/Country"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_POBOX := "/POBox"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_EXTENDEDADDRESS := "/ExtendedAddress"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_IMADDRESSCOLLECTION := "IMAddressCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_IMADDRESSENTRY := "/IMAddress"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_PROTOCOL := "/Protocol"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_URLCOLLECTION := "UrlCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_URL := "/Url"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L1_PHOTOCOLLECTION := "PhotoCollection"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L2_PHOTO := "/Photo"

/**
 * @type {String}
 */
export global CONTACTPROP_PUB_L3_URL := "/Url"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_PREFERRED := "Preferred"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_PERSONAL := "Personal"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_BUSINESS := "Business"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_OTHER := "Other"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_VOICE := "Voice"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_MOBILE := "Mobile"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_PCS := "PCS"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_CELLULAR := "Cellular"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_CAR := "Car"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_PAGER := "Pager"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_TTY := "TTY"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_FAX := "Fax"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_VIDEO := "Video"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_MODEM := "Modem"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_BBS := "BBS"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_ISDN := "ISDN"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_AGENT := "Agent"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_DOMESTIC := "Domestic"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_INTERNATIONAL := "International"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_POSTAL := "Postal"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_PARCEL := "Parcel"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_USERTILE := "UserTile"

/**
 * @type {String}
 */
export global CONTACTLABEL_PUB_LOGO := "Logo"

/**
 * @type {String}
 */
export global CONTACTLABEL_WAB_SPOUSE := "wab:Spouse"

/**
 * @type {String}
 */
export global CONTACTLABEL_WAB_CHILD := "wab:Child"

/**
 * @type {String}
 */
export global CONTACTLABEL_WAB_MANAGER := "wab:Manager"

/**
 * @type {String}
 */
export global CONTACTLABEL_WAB_ASSISTANT := "wab:Assistant"

/**
 * @type {String}
 */
export global CONTACTLABEL_WAB_BIRTHDAY := "wab:Birthday"

/**
 * @type {String}
 */
export global CONTACTLABEL_WAB_ANNIVERSARY := "wab:Anniversary"

/**
 * @type {String}
 */
export global CONTACTLABEL_WAB_SOCIALNETWORK := "wab:SocialNetwork"

/**
 * @type {String}
 */
export global CONTACTLABEL_WAB_SCHOOL := "wab:School"

/**
 * @type {String}
 */
export global CONTACTLABEL_WAB_WISHLIST := "wab:WishList"
;@endregion Constants

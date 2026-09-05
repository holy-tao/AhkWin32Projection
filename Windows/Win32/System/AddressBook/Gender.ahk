#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/gender
 * @namespace Windows.Win32.System.AddressBook
 */
class Gender extends Win32Enum {

    /**
     * > The gender is not specified for the messaging user.
     * Native name: genderUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * > The messaging user is female.
     * Native name: genderFemale
     * @type {Integer (Int32)}
     */
    static Female => 1

    /**
     * > The messaging user is male.
     * Native name: genderMale
     * @type {Integer (Int32)}
     */
    static Male => 2
}

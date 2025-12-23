#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/gender
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class Gender extends Win32Enum{

    /**
     * > The gender is not specified for the messaging user.
     * @type {Integer (Int32)}
     */
    static genderUnspecified => 0

    /**
     * > The messaging user is female.
     * @type {Integer (Int32)}
     */
    static genderFemale => 1

    /**
     * > The messaging user is male.
     * @type {Integer (Int32)}
     */
    static genderMale => 2
}

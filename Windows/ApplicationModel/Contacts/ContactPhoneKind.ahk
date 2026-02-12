#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kinds of phones for a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactphonekind
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactPhoneKind extends Win32Enum{

    /**
     * The home phone of the contact.
     * @type {Integer (Int32)}
     */
    static Home => 0

    /**
     * The mobile phone of the contact.
     * @type {Integer (Int32)}
     */
    static Mobile => 1

    /**
     * The work phone of the contact.
     * @type {Integer (Int32)}
     */
    static Work => 2

    /**
     * A phone of the contact other than home, mobile, or work.
     * @type {Integer (Int32)}
     */
    static Other => 3

    /**
     * The pager number of the contact.
     * @type {Integer (Int32)}
     */
    static Pager => 4

    /**
     * The business fax of the contact.
     * @type {Integer (Int32)}
     */
    static BusinessFax => 5

    /**
     * The home fax of the contact.
     * @type {Integer (Int32)}
     */
    static HomeFax => 6

    /**
     * The company phone of the contact.
     * @type {Integer (Int32)}
     */
    static Company => 7

    /**
     * The phone number of the contact's assistant.
     * @type {Integer (Int32)}
     */
    static Assistant => 8

    /**
     * The radio address of the contact.
     * @type {Integer (Int32)}
     */
    static Radio => 9
}

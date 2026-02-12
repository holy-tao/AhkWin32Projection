#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of contact data.
 * @remarks
 * Only the **PhoneNumber**, **Email**, and **Address** values are supported on Windows Phone.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldtype
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactFieldType extends Win32Enum{

    /**
     * The contact's email address. Supported on Windows Phone.
     * @type {Integer (Int32)}
     */
    static Email => 0

    /**
     * The contact's phone number. Supported on Windows Phone.
     * @type {Integer (Int32)}
     */
    static PhoneNumber => 1

    /**
     * The contact's location.
     * @type {Integer (Int32)}
     */
    static Location => 2

    /**
     * The contact's instant message user name.
     * @type {Integer (Int32)}
     */
    static InstantMessage => 3

    /**
     * A custom value.
     * @type {Integer (Int32)}
     */
    static Custom => 4

    /**
     * The contact's connected service account.
     * @type {Integer (Int32)}
     */
    static ConnectedServiceAccount => 5

    /**
     * The contact's important dates.
     * @type {Integer (Int32)}
     */
    static ImportantDate => 6

    /**
     * The contact's address. Supported on Windows Phone.
     * @type {Integer (Int32)}
     */
    static Address => 7

    /**
     * The contact's significant other.
     * @type {Integer (Int32)}
     */
    static SignificantOther => 8

    /**
     * The contact's notes.
     * @type {Integer (Int32)}
     */
    static Notes => 9

    /**
     * The contact's Web site.
     * @type {Integer (Int32)}
     */
    static Website => 10

    /**
     * The contact's job info.
     * @type {Integer (Int32)}
     */
    static JobInfo => 11
}

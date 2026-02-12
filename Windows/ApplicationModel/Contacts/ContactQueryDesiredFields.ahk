#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines which fields must exist on a contact in order to match a search operation.
 * @remarks
 * Use the OR operator to combine these values together into a single bit field.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactquerydesiredfields
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactQueryDesiredFields extends Win32BitflagEnum{

    /**
     * No required fields
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The contact must have a phone number.
     * @type {Integer (UInt32)}
     */
    static PhoneNumber => 1

    /**
     * The contact must have an email address.
     * @type {Integer (UInt32)}
     */
    static EmailAddress => 2

    /**
     * The contact must have a postal address.
     * @type {Integer (UInt32)}
     */
    static PostalAddress => 4
}

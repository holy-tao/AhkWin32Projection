#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the name order for a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactnameorder
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactNameOrder extends Win32Enum{

    /**
     * Show name by first name, then last name.
     * @type {Integer (Int32)}
     */
    static FirstNameLastName => 0

    /**
     * Show name by last name, then first.
     * @type {Integer (Int32)}
     */
    static LastNameFirstName => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kinds of important dates for a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactdatekind
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactDateKind extends Win32Enum{

    /**
     * The birthday of the contact.
     * @type {Integer (Int32)}
     */
    static Birthday => 0

    /**
     * The anniversary of the contact.
     * @type {Integer (Int32)}
     */
    static Anniversary => 1

    /**
     * An important date of the contact other than birthday or anniversary.
     * @type {Integer (Int32)}
     */
    static Other => 2
}

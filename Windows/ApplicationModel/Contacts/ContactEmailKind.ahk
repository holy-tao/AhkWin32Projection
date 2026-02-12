#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kinds of email addresses for a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactemailkind
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactEmailKind extends Win32Enum{

    /**
     * The personal email address of the contact.
     * @type {Integer (Int32)}
     */
    static Personal => 0

    /**
     * The work email address of the contact.
     * @type {Integer (Int32)}
     */
    static Work => 1

    /**
     * An email address of the contact other than personal or work.
     * @type {Integer (Int32)}
     */
    static Other => 2
}

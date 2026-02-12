#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the reasons that a [Contact](contact.md) matched a search.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmatchreasonkind
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactMatchReasonKind extends Win32Enum{

    /**
     * The contact name field matched.
     * @type {Integer (Int32)}
     */
    static Name => 0

    /**
     * The contact email address field matched.
     * @type {Integer (Int32)}
     */
    static EmailAddress => 1

    /**
     * The contact phone number field matched.
     * @type {Integer (Int32)}
     */
    static PhoneNumber => 2

    /**
     * The contact job info field matched.
     * @type {Integer (Int32)}
     */
    static JobInfo => 3

    /**
     * The contact phonetic name field matched.
     * @type {Integer (Int32)}
     */
    static YomiName => 4

    /**
     * The contact matched on a field that is not one of the others list in this enum.
     * @type {Integer (Int32)}
     */
    static Other => 5
}

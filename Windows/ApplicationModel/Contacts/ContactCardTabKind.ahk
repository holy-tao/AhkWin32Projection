#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies which tab to display on a mini contact card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactcardtabkind
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactCardTabKind extends Win32Enum{

    /**
     * The default tab.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The email tab.
     * @type {Integer (Int32)}
     */
    static Email => 1

    /**
     * The messaging tab.
     * @type {Integer (Int32)}
     */
    static Messaging => 2

    /**
     * The phone tab.
     * @type {Integer (Int32)}
     */
    static Phone => 3

    /**
     * The video tab.
     * @type {Integer (Int32)}
     */
    static Video => 4

    /**
     * The organizational hierarchy tab.
     * @type {Integer (Int32)}
     */
    static OrganizationalHierarchy => 5
}

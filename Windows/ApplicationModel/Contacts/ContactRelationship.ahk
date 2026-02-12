#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines a value that indicates the nature of a contact relationship, such as spouse, partner, sibling, parent and so on.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactrelationship
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactRelationship extends Win32Enum{

    /**
     * Other
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Spouse
     * @type {Integer (Int32)}
     */
    static Spouse => 1

    /**
     * Partner
     * @type {Integer (Int32)}
     */
    static Partner => 2

    /**
     * Sibling
     * @type {Integer (Int32)}
     */
    static Sibling => 3

    /**
     * Parent
     * @type {Integer (Int32)}
     */
    static Parent => 4

    /**
     * Child
     * @type {Integer (Int32)}
     */
    static Child => 5
}

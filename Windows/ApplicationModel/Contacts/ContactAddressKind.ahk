#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kinds of contact addresses.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactaddresskind
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactAddressKind extends Win32Enum{

    /**
     * The home address of the contact.
     * @type {Integer (Int32)}
     */
    static Home => 0

    /**
     * The work address of the contact.
     * @type {Integer (Int32)}
     */
    static Work => 1

    /**
     * An address of the contact other than home or work.
     * @type {Integer (Int32)}
     */
    static Other => 2
}

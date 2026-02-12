#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of header information to show on a contact card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactcardheaderkind
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactCardHeaderKind extends Win32Enum{

    /**
     * Display the default header.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Display a basic header.
     * @type {Integer (Int32)}
     */
    static Basic => 1

    /**
     * Display an enterprise header.
     * @type {Integer (Int32)}
     */
    static Enterprise => 2
}

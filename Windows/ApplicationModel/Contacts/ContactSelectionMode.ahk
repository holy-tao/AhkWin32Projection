#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether you want to request an entire contact, or only specific fields.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactselectionmode
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactSelectionMode extends Win32Enum{

    /**
     * Specifies that you want to select the entire contact.
     * @type {Integer (Int32)}
     */
    static Contacts => 0

    /**
     * Specifies that you want to select only certain fields.
     * @type {Integer (Int32)}
     */
    static Fields => 1
}

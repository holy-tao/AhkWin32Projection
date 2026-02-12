#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines which contact fields to search for a text match.
 * @remarks
 * Use the OR operator to combine these values together into a single bit field.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactquerysearchfields
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactQuerySearchFields extends Win32BitflagEnum{

    /**
     * None
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Name
     * @type {Integer (UInt32)}
     */
    static Name => 1

    /**
     * Email address
     * @type {Integer (UInt32)}
     */
    static Email => 2

    /**
     * Phone number
     * @type {Integer (UInt32)}
     */
    static Phone => 4

    /**
     * All
     * @type {Integer (UInt32)}
     */
    static All => 4294967295
}

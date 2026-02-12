#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the field(s) by which to search a collection of email messages. Use the OR operator to combine these values together into a single bit field.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailquerysearchfields
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailQuerySearchFields extends Win32BitflagEnum{

    /**
     * No search field defined.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Search by subject field.
     * @type {Integer (UInt32)}
     */
    static Subject => 1

    /**
     * Search by sender field.
     * @type {Integer (UInt32)}
     */
    static Sender => 2

    /**
     * Search by preview text field.
     * @type {Integer (UInt32)}
     */
    static Preview => 4

    /**
     * Search by members of the recipient list.
     * @type {Integer (UInt32)}
     */
    static Recipients => 8

    /**
     * Search by all searchable fields.
     * @type {Integer (UInt32)}
     */
    static All => 4294967295
}

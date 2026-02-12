#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether a contact was added successfully.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.addcontactresult
 * @namespace Windows.ApplicationModel.Contacts.Provider
 * @version WindowsRuntime 1.4
 */
class AddContactResult extends Win32Enum{

    /**
     * The contact was added.
     * @type {Integer (Int32)}
     */
    static Added => 0

    /**
     * The contact was already selected by the user.
     * @type {Integer (Int32)}
     */
    static AlreadyAdded => 1

    /**
     * The contact was unavailable and was not added.
     * @type {Integer (Int32)}
     */
    static Unavailable => 2
}

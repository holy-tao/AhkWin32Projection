#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of access the app has to the [ContactStore](contactstore.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstoreaccesstype
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactStoreAccessType extends Win32Enum{

    /**
     * Read and write contacts that belong to the app only.
     * @type {Integer (Int32)}
     */
    static AppContactsReadWrite => 0

    /**
     * Read access to all contacts, those provided by the calling app and from other sources. This value requires the contacts capability. See [App capability declarations](/windows/uwp/packaging/app-capability-declarations) for more information.
     * @type {Integer (Int32)}
     */
    static AllContactsReadOnly => 1

    /**
     * Read and write access to all contacts. This value is not available to all apps. Your developer account must be specially provisioned by Microsoft in order to request this level of access.
     * @type {Integer (Int32)}
     */
    static AllContactsReadWrite => 2
}

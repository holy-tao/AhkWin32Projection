#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines whether to search the local [ContactStore](contactstore.md) or a server.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactquerysearchscope
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactQuerySearchScope extends Win32Enum{

    /**
     * Local
     * @type {Integer (Int32)}
     */
    static Local => 0

    /**
     * Server
     * @type {Integer (Int32)}
     */
    static Server => 1
}

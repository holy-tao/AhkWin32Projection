#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the level of contact write access granted to other apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistotherappwriteaccess
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactListOtherAppWriteAccess extends Win32Enum{

    /**
     * No write access is granted.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Other apps can only write system contacts.
     * @type {Integer (Int32)}
     */
    static SystemOnly => 1

    /**
     * Other apps can only write contacts for this app.
     * @type {Integer (Int32)}
     */
    static Limited => 2
}

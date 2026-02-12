#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the level of contact read access granted to other apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistotherappreadaccess
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactListOtherAppReadAccess extends Win32Enum{

    /**
     * Only apps specially provisioned by Microsoft can read these contacts.
     * @type {Integer (Int32)}
     */
    static SystemOnly => 0

    /**
     * All apps can read the DisplayName and Picture properties, other properites are only available to specially provisioned apps.
     * @type {Integer (Int32)}
     */
    static Limited => 1

    /**
     * All apps can read all properties.
     * @type {Integer (Int32)}
     */
    static Full => 2

    /**
     * No other apps can read any of the contact information.
     * @type {Integer (Int32)}
     */
    static None => 3
}

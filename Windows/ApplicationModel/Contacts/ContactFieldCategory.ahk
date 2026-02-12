#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the categories that contact data can belong to.
  * 
  * > [!NOTE]
  * > ContactFieldCategory may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhoneKind](contactphonekind.md), [ContactEmailKind](contactemailkind.md), and [ContactAddressKind](contactaddresskind.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldcategory
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactFieldCategory extends Win32Enum{

    /**
     * The data doesn't belong to a category
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The Home category.
     * @type {Integer (Int32)}
     */
    static Home => 1

    /**
     * The Work category.
     * @type {Integer (Int32)}
     */
    static Work => 2

    /**
     * The Mobile category.
     * @type {Integer (Int32)}
     */
    static Mobile => 3

    /**
     * The Other category.
     * @type {Integer (Int32)}
     */
    static Other => 4
}

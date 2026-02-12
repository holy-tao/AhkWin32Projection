#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies if the app can read and write all annotations or only those belonging to the app itself.
 * @remarks
 * Use the OR operator to combine these values together into a single bit field.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstoreaccesstype
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactAnnotationStoreAccessType extends Win32Enum{

    /**
     * Only local app contact annotations.
     * @type {Integer (Int32)}
     */
    static AppAnnotationsReadWrite => 0

    /**
     * All contact annotations.
     * @type {Integer (Int32)}
     */
    static AllAnnotationsReadWrite => 1
}

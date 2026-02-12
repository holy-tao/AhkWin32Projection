#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of change that occurred for a [ContactChanged](contactstore_contactchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangetype
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactChangeType extends Win32Enum{

    /**
     * A contact was created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * A contact was modified.
     * @type {Integer (Int32)}
     */
    static Modified => 1

    /**
     * A contact was deleted.
     * @type {Integer (Int32)}
     */
    static Deleted => 2

    /**
     * Change tracking was lost. Call [Reset](contactchangetracker_reset_1636126115.md) to reestablish continuity with the [ContactStore](contactstore.md).
     * @type {Integer (Int32)}
     */
    static ChangeTrackingLost => 3
}

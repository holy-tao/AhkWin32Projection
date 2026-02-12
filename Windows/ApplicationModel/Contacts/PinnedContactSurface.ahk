#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the location in the Windows user interface to which a contact can be pinned.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactsurface
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class PinnedContactSurface extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StartMenu => 0

    /**
     * @type {Integer (Int32)}
     */
    static Taskbar => 1
}

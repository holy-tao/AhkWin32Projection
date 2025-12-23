#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the File History reassociation feature, which allows a user to reestablish a relationship with a backup target that was used by the same user in the past. Reassociation is performed by calling the methods of the IFhReassociation interface.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/fhreassociation
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FhReassociation extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

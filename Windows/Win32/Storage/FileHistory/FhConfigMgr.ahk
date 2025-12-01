#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the File History configuration of the user under which the FhConfigMgr object is created. All configuration operations are performed by calling the methods of the IFhConfigMgr interface.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/fhconfigmgr
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FhConfigMgr extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

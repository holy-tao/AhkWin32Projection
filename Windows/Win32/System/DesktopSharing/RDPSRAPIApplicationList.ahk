#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An enumerator interface for the application collection.
 * @remarks
 * The enumerator provides a snapshot of the collection. If an application is destroyed during enumeration, the API still has access to all the elements that were present when the snapshot was taken.
 * @see https://learn.microsoft.com/windows/win32/api//content/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationlist-get__newenum
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSRAPIApplicationList extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

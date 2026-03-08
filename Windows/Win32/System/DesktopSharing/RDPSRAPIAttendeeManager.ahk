#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An enumerator interface for the attendee collection.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendeemanager-get__newenum
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSRAPIAttendeeManager extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The attendee that was disconnected.
 * @remarks
 * Applications can query properties, but any attempt to modify properties fails with <b>E_UNEXPECTED</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/rdpencomapi/nf-rdpencomapi-irdpsrapiattendeedisconnectinfo-get_attendee
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSRAPIAttendeeDisconnectInfo extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

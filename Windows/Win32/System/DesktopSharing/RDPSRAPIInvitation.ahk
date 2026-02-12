#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The maximum number of attendees that can connect to the session. (Put)
 * @remarks
 * The password is set when the invitation is created and can be modified using <b>put_AttendeeLimit</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-put_attendeelimit
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSRAPIInvitation extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Returns an object implementing the IRDPSRAPIApplicationFilter interface. (IRDPSRAPISharingSession.get_ApplicationFilter)
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_applicationfilter
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSession extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

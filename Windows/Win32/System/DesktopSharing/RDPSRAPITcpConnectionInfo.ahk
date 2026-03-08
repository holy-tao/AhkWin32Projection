#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the local IP address that is being used by the sharer or by the viewer for communication.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_localip
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSRAPITcpConnectionInfo extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

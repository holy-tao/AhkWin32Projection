#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Increments the reference count on a buffer owned by the multicast client.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientaddrefbuffer
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WdsTransportClient extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

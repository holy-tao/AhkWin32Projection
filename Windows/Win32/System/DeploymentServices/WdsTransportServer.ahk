#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Allocates a buffer in memory.
 * @see https://learn.microsoft.com/windows/win32/api//content/wdstpdi/nf-wdstpdi-wdstransportserverallocatebuffer
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WdsTransportServer extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Returns a pointer to the application object that the window belongs to.
 * @see https://learn.microsoft.com/windows/win32/api//content/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_application
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSRAPIWindow extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

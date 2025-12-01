#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMGPOLink interface supports methods that allow you to remove a GPO link from the scope of management (SOM), and to set and retrieve various properties of GPO links, including enabling and enforcing links.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmgpolink
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMGPOLink extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

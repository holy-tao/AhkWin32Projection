#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMSOM interface contains methods that allow you to create and retrieve GPO links for a scope of management (SOM), and to set and retrieve security attributes and various properties for a SOM. A SOM can be a site, domain or OU.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmsom
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMSOM extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

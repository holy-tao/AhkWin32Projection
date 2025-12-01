#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a given domain and supports methods that allow you to query scope of management (SOM) objects, create, restore and query GPOs, and create and query WMI filters when you are using the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmdomain
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMDomain extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

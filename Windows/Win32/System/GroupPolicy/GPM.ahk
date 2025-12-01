#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPM interface provides methods that access other interfaces of the Group Policy Management Console (GPMC) and methods that create other objects on which various search operations can be performed.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpm
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPM extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

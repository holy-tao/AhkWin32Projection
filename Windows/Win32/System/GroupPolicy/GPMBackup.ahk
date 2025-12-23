#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMBackup interface supports methods that allow you to delete GPMBackup objects and to retrieve various properties of GPMBackup objects.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmbackup
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMBackup extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

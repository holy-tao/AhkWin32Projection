#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMStatusMsgCollection interface contains methods that enable applications to access a collection of status messages when using the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMStatusMsgCollection extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

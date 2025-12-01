#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMTrustee interface contains methods to retrieve information about a given trustee when using the Group Policy Management Console (GPMC).
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmtrustee
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMTrustee extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

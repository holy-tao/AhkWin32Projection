#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMCSECollection interface contains methods that enable applications to query a collection of client-side extensions (CSEs) when you use the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmcsecollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMCSECollection extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

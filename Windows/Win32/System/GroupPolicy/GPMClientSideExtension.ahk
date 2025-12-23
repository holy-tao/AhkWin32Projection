#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMClientSideExtension interface supports methods that allow you to query client-side extension properties when you use the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmclientsideextension
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMClientSideExtension extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMSitesContainer interface provides the methods required to access the scope of management (SOM) objects that represent sites in a forest.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmsitescontainer
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMSitesContainer extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

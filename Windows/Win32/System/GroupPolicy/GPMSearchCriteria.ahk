#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMSearchCriteria interface allows you to define the criteria to use for search operations when using the Group Policy Management Console (GPMC) interfaces. To create a GPMSearchCriteria object, call the IGPM::CreateSearchCriteria method.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmsearchcriteria
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMSearchCriteria extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

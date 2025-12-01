#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The Starter Group Policy object is a system Starter Group Policy object or a custom Starter Group Policy object.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/ne-gpmgmt-gpmstartergpotype
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMStarterGPOType extends Win32Enum{

    /**
     * A system Starter Group Policy object
     * @type {Integer (Int32)}
     */
    static typeSystem => 0

    /**
     * A  custom Starter Group Policy object
     * @type {Integer (Int32)}
     */
    static typeCustom => 1
}

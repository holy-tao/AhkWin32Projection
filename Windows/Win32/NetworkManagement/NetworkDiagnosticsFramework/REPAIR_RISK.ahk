#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The REPAIR_RISK enumeration specifies whether repair changes are persistent and whether they can be undone.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ne-ndattrib-repair_risk
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class REPAIR_RISK extends Win32Enum{

    /**
     * The repair performs persistent changes that cannot be undone.
     * @type {Integer (Int32)}
     */
    static RR_NOROLLBACK => 0

    /**
     * The repair performs persistent changes that can be undone.
     * @type {Integer (Int32)}
     */
    static RR_ROLLBACK => 1

    /**
     * The repair does not perform persistent changes.
     * @type {Integer (Int32)}
     */
    static RR_NORISK => 2
}

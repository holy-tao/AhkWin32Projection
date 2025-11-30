#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The REPAIR_STATUS enumeration describes the result of a helper class attempting a repair option.
 * @see https://docs.microsoft.com/windows/win32/api//ndhelper/ne-ndhelper-repair_status
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class REPAIR_STATUS extends Win32Enum{

    /**
     * The helper class does not have a repair option implemented.
     * @type {Integer (Int32)}
     */
    static RS_NOT_IMPLEMENTED => 0

    /**
     * The helper class has repaired a problem.
     * @type {Integer (Int32)}
     */
    static RS_REPAIRED => 1

    /**
     * The helper class has attempted to repair a problem but validation indicates the repair operation has not succeeded.
     * @type {Integer (Int32)}
     */
    static RS_UNREPAIRED => 2

    /**
     * The helper class is unable to perform the repair at this time.
     * @type {Integer (Int32)}
     */
    static RS_DEFERRED => 3

    /**
     * The helper class needs the user to perform an action before the repair can continue.
     * @type {Integer (Int32)}
     */
    static RS_USER_ACTION => 4
}

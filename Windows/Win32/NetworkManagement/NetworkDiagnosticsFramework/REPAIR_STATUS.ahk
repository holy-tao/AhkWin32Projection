#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The REPAIR_STATUS enumeration describes the result of a helper class attempting a repair option.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ne-ndhelper-repair_status
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct REPAIR_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The REPAIR_RISK enumeration specifies whether repair changes are persistent and whether they can be undone.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ne-ndattrib-repair_risk
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct REPAIR_RISK {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

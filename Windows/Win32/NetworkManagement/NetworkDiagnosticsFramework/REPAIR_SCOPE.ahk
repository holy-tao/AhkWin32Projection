#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The REPAIR_SCOPE enumeration describes the scope of modification for a given repair.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ne-ndattrib-repair_scope
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct REPAIR_SCOPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The repair effect is system-wide.
     * @type {Integer (Int32)}
     */
    static RS_SYSTEM => 0

    /**
     * The repair effect is user-specific.
     * @type {Integer (Int32)}
     */
    static RS_USER => 1

    /**
     * The repair effect is application-specific.
     * @type {Integer (Int32)}
     */
    static RS_APPLICATION => 2

    /**
     * The repair effect is process-specific.
     * @type {Integer (Int32)}
     */
    static RS_PROCESS => 3
}

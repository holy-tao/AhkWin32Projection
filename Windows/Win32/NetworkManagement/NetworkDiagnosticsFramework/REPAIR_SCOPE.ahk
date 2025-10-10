#Requires AutoHotkey v2.0.0 64-bit

/**
 * The REPAIR_SCOPE enumeration describes the scope of modification for a given repair.
 * @see https://docs.microsoft.com/windows/win32/api//ndattrib/ne-ndattrib-repair_scope
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class REPAIR_SCOPE{

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

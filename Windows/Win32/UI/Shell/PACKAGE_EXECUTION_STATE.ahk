#Requires AutoHotkey v2.0.0 64-bit

/**
 * . (PACKAGE_EXECUTION_STATE)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-package_execution_state
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PACKAGE_EXECUTION_STATE{

    /**
     * The package is in an unknown state.
     * @type {Integer (Int32)}
     */
    static PES_UNKNOWN => 0

    /**
     * The package is running.
     * @type {Integer (Int32)}
     */
    static PES_RUNNING => 1

    /**
     * The package is being suspended.
     * @type {Integer (Int32)}
     */
    static PES_SUSPENDING => 2

    /**
     * The package is suspended.
     * @type {Integer (Int32)}
     */
    static PES_SUSPENDED => 3

    /**
     * The package was terminated.
     * @type {Integer (Int32)}
     */
    static PES_TERMINATED => 4
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * . (PACKAGE_EXECUTION_STATE)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-package_execution_state
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PACKAGE_EXECUTION_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

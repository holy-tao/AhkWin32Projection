#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The UI_INFO_TYPE enumeration identifies repairs that perform user interface tasks.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ne-ndattrib-ui_info_type
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct UI_INFO_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static UIT_INVALID => 0

    /**
     * No additional repair interfaces are present.
     * @type {Integer (Int32)}
     */
    static UIT_NONE => 1

    /**
     * Execute shell command.
     * @type {Integer (Int32)}
     */
    static UIT_SHELL_COMMAND => 2

    /**
     * Launch help pane.
     * @type {Integer (Int32)}
     */
    static UIT_HELP_PANE => 3

    /**
     * Direct UI.
     * @type {Integer (Int32)}
     */
    static UIT_DUI => 4
}

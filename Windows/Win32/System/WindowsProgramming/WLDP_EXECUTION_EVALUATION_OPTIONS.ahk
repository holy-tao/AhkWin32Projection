#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies execution options when querying for execution authorization with WldpCanExecuteBuffer, WldpCanExecuteFile, and WldpCanExecuteStream.
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_execution_evaluation_options
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WLDP_EXECUTION_EVALUATION_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No options.
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_EVALUATION_OPTION_NONE => 0

    /**
     * The execution is requested for an interactive session, such as using Powershell or cmd.
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_EVALUATION_OPTION_EXECUTE_IN_INTERACTIVE_SESSION => 1
}

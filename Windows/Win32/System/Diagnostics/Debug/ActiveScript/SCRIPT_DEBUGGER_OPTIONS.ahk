#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct SCRIPT_DEBUGGER_OPTIONS {
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
    static SDO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SDO_ENABLE_FIRST_CHANCE_EXCEPTIONS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SDO_ENABLE_WEB_WORKER_SUPPORT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SDO_ENABLE_NONUSER_CODE_SUPPORT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SDO_ENABLE_LIBRARY_STACK_FRAME => 8
}

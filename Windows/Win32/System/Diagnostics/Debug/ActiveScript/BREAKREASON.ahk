#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct BREAKREASON {
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
    static BREAKREASON_STEP => 0

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_BREAKPOINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_DEBUGGER_BLOCK => 2

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_HOST_INITIATED => 3

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_LANGUAGE_INITIATED => 4

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_DEBUGGER_HALT => 5

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_ERROR => 6

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_JIT => 7

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_MUTATION_BREAKPOINT => 8
}

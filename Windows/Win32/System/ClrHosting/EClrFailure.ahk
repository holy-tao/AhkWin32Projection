#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct EClrFailure {
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
    static FAIL_NonCriticalResource => 0

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_CriticalResource => 1

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_FatalRuntime => 2

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_OrphanedLock => 3

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_StackOverflow => 4

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_AccessViolation => 5

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_CodeContract => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxClrFailure => 7
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_TASK_TRANSITION {
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
    static PM_TASK_TRANSITION_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_TURNSTILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_SLIDE => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_SWIVEL => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_READERBOARD => 5

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_CUSTOM => 6

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_INVALID => 7
}

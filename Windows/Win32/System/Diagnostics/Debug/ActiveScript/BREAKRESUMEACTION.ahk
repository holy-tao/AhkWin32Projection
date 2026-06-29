#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct BREAKRESUMEACTION {
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
    static BREAKRESUMEACTION_ABORT => 0

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_CONTINUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_STEP_INTO => 2

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_STEP_OVER => 3

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_STEP_OUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_IGNORE => 5

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_STEP_DOCUMENT => 6
}

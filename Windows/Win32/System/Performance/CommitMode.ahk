#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the action to take when committing changes to the data collector set.
 * @remarks
 * All commit modes validate the set.
 * @see https://learn.microsoft.com/windows/win32/api/pla/ne-pla-commitmode
 * @namespace Windows.Win32.System.Performance
 */
export default struct CommitMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Save the set. The set must not already exist. 
     * 
     * The set is not saved if it is a trace session.
     * @type {Integer (Int32)}
     */
    static plaCreateNew => 1

    /**
     * Update a previously saved set.
     * @type {Integer (Int32)}
     */
    static plaModify => 2

    /**
     * Save the set. If the set already exists, update the set.
     * 
     * The set is not saved if it is a trace session.
     * @type {Integer (Int32)}
     */
    static plaCreateOrModify => 3

    /**
     * Apply the updated property values to the currently running data set.
     * @type {Integer (Int32)}
     */
    static plaUpdateRunningInstance => 16

    /**
     * Flush the buffers for an Event Tracing for Windows trace session. This action applies only to sets that contain trace data collectors.
     * @type {Integer (Int32)}
     */
    static plaFlushTrace => 32

    /**
     * Perform validation only on the set.
     * @type {Integer (Int32)}
     */
    static plaValidateOnly => 4096
}

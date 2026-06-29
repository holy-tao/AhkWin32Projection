#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct SYNCHRONIZATION_ACCESS_RIGHTS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ALL_ACCESS => 2031619

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_MODIFY_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MUTEX_ALL_ACCESS => 2031617

    /**
     * @type {Integer (UInt32)}
     */
    static MUTEX_MODIFY_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEMAPHORE_ALL_ACCESS => 2031619

    /**
     * @type {Integer (UInt32)}
     */
    static SEMAPHORE_MODIFY_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_ALL_ACCESS => 2031619

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_MODIFY_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_QUERY_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZATION_DELETE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZATION_READ_CONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZATION_WRITE_DAC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZATION_WRITE_OWNER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZATION_SYNCHRONIZE => 1048576
}

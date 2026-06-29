#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct KSPIN_LOCK_QUEUE_NUMBER {
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
    static LockQueueUnusedSpare0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueUnusedSpare1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueUnusedSpare2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueUnusedSpare3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueVacbLock => 4

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueMasterLock => 5

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueNonPagedPoolLock => 6

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueIoCancelLock => 7

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueUnusedSpare8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueIoVpbLock => 9

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueIoDatabaseLock => 10

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueIoCompletionLock => 11

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueNtfsStructLock => 12

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueAfdWorkQueueLock => 13

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueBcbLock => 14

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueUnusedSpare15 => 15

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueUnusedSpare16 => 16

    /**
     * @type {Integer (Int32)}
     */
    static LockQueueMaximumLock => 17
}

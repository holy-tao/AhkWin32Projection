#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class KSPIN_LOCK_QUEUE_NUMBER extends Win32Enum{

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

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class KSPIN_LOCK_QUEUE_NUMBER extends Win32Enum {

    /**
     * Native name: LockQueueUnusedSpare0
     * @type {Integer (Int32)}
     */
    static UnusedSpare0 => 0

    /**
     * Native name: LockQueueUnusedSpare1
     * @type {Integer (Int32)}
     */
    static UnusedSpare1 => 1

    /**
     * Native name: LockQueueUnusedSpare2
     * @type {Integer (Int32)}
     */
    static UnusedSpare2 => 2

    /**
     * Native name: LockQueueUnusedSpare3
     * @type {Integer (Int32)}
     */
    static UnusedSpare3 => 3

    /**
     * Native name: LockQueueVacbLock
     * @type {Integer (Int32)}
     */
    static VacbLock => 4

    /**
     * Native name: LockQueueMasterLock
     * @type {Integer (Int32)}
     */
    static MasterLock => 5

    /**
     * Native name: LockQueueNonPagedPoolLock
     * @type {Integer (Int32)}
     */
    static NonPagedPoolLock => 6

    /**
     * Native name: LockQueueIoCancelLock
     * @type {Integer (Int32)}
     */
    static IoCancelLock => 7

    /**
     * Native name: LockQueueUnusedSpare8
     * @type {Integer (Int32)}
     */
    static UnusedSpare8 => 8

    /**
     * Native name: LockQueueIoVpbLock
     * @type {Integer (Int32)}
     */
    static IoVpbLock => 9

    /**
     * Native name: LockQueueIoDatabaseLock
     * @type {Integer (Int32)}
     */
    static IoDatabaseLock => 10

    /**
     * Native name: LockQueueIoCompletionLock
     * @type {Integer (Int32)}
     */
    static IoCompletionLock => 11

    /**
     * Native name: LockQueueNtfsStructLock
     * @type {Integer (Int32)}
     */
    static NtfsStructLock => 12

    /**
     * Native name: LockQueueAfdWorkQueueLock
     * @type {Integer (Int32)}
     */
    static AfdWorkQueueLock => 13

    /**
     * Native name: LockQueueBcbLock
     * @type {Integer (Int32)}
     */
    static BcbLock => 14

    /**
     * Native name: LockQueueUnusedSpare15
     * @type {Integer (Int32)}
     */
    static UnusedSpare15 => 15

    /**
     * Native name: LockQueueUnusedSpare16
     * @type {Integer (Int32)}
     */
    static UnusedSpare16 => 16

    /**
     * Native name: LockQueueMaximumLock
     * @type {Integer (Int32)}
     */
    static MaximumLock => 17
}

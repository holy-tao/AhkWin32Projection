#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_RESERVATION_ACQUIRE_ACTIONS extends Win32Enum {

    /**
     * Native name: NVME_RESERVATION_ACQUIRE_ACTION_ACQUIRE
     * @type {Integer (Int32)}
     */
    static ACTION_ACQUIRE => 0

    /**
     * Native name: NVME_RESERVATION_ACQUIRE_ACTION_PREEMPT
     * @type {Integer (Int32)}
     */
    static ACTION_PREEMPT => 1

    /**
     * Native name: NVME_RESERVATION_ACQUIRE_ACTION_PREEMPT_AND_ABORT
     * @type {Integer (Int32)}
     */
    static ACTION_PREEMPT_AND_ABORT => 2
}

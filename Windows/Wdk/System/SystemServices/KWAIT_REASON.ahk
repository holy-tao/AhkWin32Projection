#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KWAIT_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Executive => 0

    /**
     * @type {Integer (Int32)}
     */
    static FreePage => 1

    /**
     * @type {Integer (Int32)}
     */
    static PageIn => 2

    /**
     * @type {Integer (Int32)}
     */
    static PoolAllocation => 3

    /**
     * @type {Integer (Int32)}
     */
    static DelayExecution => 4

    /**
     * @type {Integer (Int32)}
     */
    static Suspended => 5

    /**
     * @type {Integer (Int32)}
     */
    static UserRequest => 6

    /**
     * @type {Integer (Int32)}
     */
    static WrExecutive => 7

    /**
     * @type {Integer (Int32)}
     */
    static WrFreePage => 8

    /**
     * @type {Integer (Int32)}
     */
    static WrPageIn => 9

    /**
     * @type {Integer (Int32)}
     */
    static WrPoolAllocation => 10

    /**
     * @type {Integer (Int32)}
     */
    static WrDelayExecution => 11

    /**
     * @type {Integer (Int32)}
     */
    static WrSuspended => 12

    /**
     * @type {Integer (Int32)}
     */
    static WrUserRequest => 13

    /**
     * @type {Integer (Int32)}
     */
    static WrSpare0 => 14

    /**
     * @type {Integer (Int32)}
     */
    static WrQueue => 15

    /**
     * @type {Integer (Int32)}
     */
    static WrLpcReceive => 16

    /**
     * @type {Integer (Int32)}
     */
    static WrLpcReply => 17

    /**
     * @type {Integer (Int32)}
     */
    static WrVirtualMemory => 18

    /**
     * @type {Integer (Int32)}
     */
    static WrPageOut => 19

    /**
     * @type {Integer (Int32)}
     */
    static WrRendezvous => 20

    /**
     * @type {Integer (Int32)}
     */
    static WrKeyedEvent => 21

    /**
     * @type {Integer (Int32)}
     */
    static WrTerminated => 22

    /**
     * @type {Integer (Int32)}
     */
    static WrProcessInSwap => 23

    /**
     * @type {Integer (Int32)}
     */
    static WrCpuRateControl => 24

    /**
     * @type {Integer (Int32)}
     */
    static WrCalloutStack => 25

    /**
     * @type {Integer (Int32)}
     */
    static WrKernel => 26

    /**
     * @type {Integer (Int32)}
     */
    static WrResource => 27

    /**
     * @type {Integer (Int32)}
     */
    static WrPushLock => 28

    /**
     * @type {Integer (Int32)}
     */
    static WrMutex => 29

    /**
     * @type {Integer (Int32)}
     */
    static WrQuantumEnd => 30

    /**
     * @type {Integer (Int32)}
     */
    static WrDispatchInt => 31

    /**
     * @type {Integer (Int32)}
     */
    static WrPreempted => 32

    /**
     * @type {Integer (Int32)}
     */
    static WrYieldExecution => 33

    /**
     * @type {Integer (Int32)}
     */
    static WrFastMutex => 34

    /**
     * @type {Integer (Int32)}
     */
    static WrGuardedMutex => 35

    /**
     * @type {Integer (Int32)}
     */
    static WrRundown => 36

    /**
     * @type {Integer (Int32)}
     */
    static WrAlertByThreadId => 37

    /**
     * @type {Integer (Int32)}
     */
    static WrDeferredPreempt => 38

    /**
     * @type {Integer (Int32)}
     */
    static WrPhysicalFault => 39

    /**
     * @type {Integer (Int32)}
     */
    static WrIoRing => 40

    /**
     * @type {Integer (Int32)}
     */
    static WrMdlCache => 41

    /**
     * @type {Integer (Int32)}
     */
    static MaximumWaitReason => 42
}

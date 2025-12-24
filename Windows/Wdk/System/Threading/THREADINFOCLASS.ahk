#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.Threading
 * @version v4.0.30319
 */
class THREADINFOCLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ThreadBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static ThreadTimes => 1

    /**
     * @type {Integer (Int32)}
     */
    static ThreadPriority => 2

    /**
     * @type {Integer (Int32)}
     */
    static ThreadBasePriority => 3

    /**
     * @type {Integer (Int32)}
     */
    static ThreadAffinityMask => 4

    /**
     * @type {Integer (Int32)}
     */
    static ThreadImpersonationToken => 5

    /**
     * @type {Integer (Int32)}
     */
    static ThreadDescriptorTableEntry => 6

    /**
     * @type {Integer (Int32)}
     */
    static ThreadEnableAlignmentFaultFixup => 7

    /**
     * @type {Integer (Int32)}
     */
    static ThreadEventPair_Reusable => 8

    /**
     * @type {Integer (Int32)}
     */
    static ThreadQuerySetWin32StartAddress => 9

    /**
     * @type {Integer (Int32)}
     */
    static ThreadZeroTlsCell => 10

    /**
     * @type {Integer (Int32)}
     */
    static ThreadPerformanceCount => 11

    /**
     * @type {Integer (Int32)}
     */
    static ThreadAmILastThread => 12

    /**
     * @type {Integer (Int32)}
     */
    static ThreadIdealProcessor => 13

    /**
     * @type {Integer (Int32)}
     */
    static ThreadPriorityBoost => 14

    /**
     * @type {Integer (Int32)}
     */
    static ThreadSetTlsArrayAddress => 15

    /**
     * @type {Integer (Int32)}
     */
    static ThreadIsIoPending => 16

    /**
     * @type {Integer (Int32)}
     */
    static ThreadHideFromDebugger => 17

    /**
     * @type {Integer (Int32)}
     */
    static ThreadBreakOnTermination => 18

    /**
     * @type {Integer (Int32)}
     */
    static ThreadSwitchLegacyState => 19

    /**
     * @type {Integer (Int32)}
     */
    static ThreadIsTerminated => 20

    /**
     * @type {Integer (Int32)}
     */
    static ThreadLastSystemCall => 21

    /**
     * @type {Integer (Int32)}
     */
    static ThreadIoPriority => 22

    /**
     * @type {Integer (Int32)}
     */
    static ThreadCycleTime => 23

    /**
     * @type {Integer (Int32)}
     */
    static ThreadPagePriority => 24

    /**
     * @type {Integer (Int32)}
     */
    static ThreadActualBasePriority => 25

    /**
     * @type {Integer (Int32)}
     */
    static ThreadTebInformation => 26

    /**
     * @type {Integer (Int32)}
     */
    static ThreadCSwitchMon => 27

    /**
     * @type {Integer (Int32)}
     */
    static ThreadCSwitchPmu => 28

    /**
     * @type {Integer (Int32)}
     */
    static ThreadWow64Context => 29

    /**
     * @type {Integer (Int32)}
     */
    static ThreadGroupInformation => 30

    /**
     * @type {Integer (Int32)}
     */
    static ThreadUmsInformation => 31

    /**
     * @type {Integer (Int32)}
     */
    static ThreadCounterProfiling => 32

    /**
     * @type {Integer (Int32)}
     */
    static ThreadIdealProcessorEx => 33

    /**
     * @type {Integer (Int32)}
     */
    static ThreadCpuAccountingInformation => 34

    /**
     * @type {Integer (Int32)}
     */
    static ThreadSuspendCount => 35

    /**
     * @type {Integer (Int32)}
     */
    static ThreadActualGroupAffinity => 41

    /**
     * @type {Integer (Int32)}
     */
    static ThreadDynamicCodePolicyInfo => 42

    /**
     * @type {Integer (Int32)}
     */
    static ThreadSubsystemInformation => 45

    /**
     * @type {Integer (Int32)}
     */
    static MaxThreadInfoClass => 56

    /**
     * @type {Integer (Int32)}
     */
    static ThreadNameInformation => 38
}

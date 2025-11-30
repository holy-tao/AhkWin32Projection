#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WORK_QUEUE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CriticalWorkQueue => 0

    /**
     * @type {Integer (Int32)}
     */
    static DelayedWorkQueue => 1

    /**
     * @type {Integer (Int32)}
     */
    static HyperCriticalWorkQueue => 2

    /**
     * @type {Integer (Int32)}
     */
    static NormalWorkQueue => 3

    /**
     * @type {Integer (Int32)}
     */
    static BackgroundWorkQueue => 4

    /**
     * @type {Integer (Int32)}
     */
    static RealTimeWorkQueue => 5

    /**
     * @type {Integer (Int32)}
     */
    static SuperCriticalWorkQueue => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaximumWorkQueue => 7

    /**
     * @type {Integer (Int32)}
     */
    static CustomPriorityWorkQueue => 32
}

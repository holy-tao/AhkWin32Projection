#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.Threading
 */
class TIMER_SET_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: TimerSetCoalescableTimer
     * @type {Integer (Int32)}
     */
    static CoalescableTimer => 0

    /**
     * @type {Integer (Int32)}
     */
    static MaxTimerInfoClass => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.Threading
 * @version v4.0.30319
 */
class TIMER_SET_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TimerSetCoalescableTimer => 0

    /**
     * @type {Integer (Int32)}
     */
    static MaxTimerInfoClass => 1
}

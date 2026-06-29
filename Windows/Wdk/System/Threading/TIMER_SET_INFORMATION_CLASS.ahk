#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.Threading
 */
export default struct TIMER_SET_INFORMATION_CLASS {
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
    static TimerSetCoalescableTimer => 0

    /**
     * @type {Integer (Int32)}
     */
    static MaxTimerInfoClass => 1
}

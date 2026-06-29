#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct SignalAndServiceStatusSpanningEvent_State {
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
    static SignalAndServiceStatusSpanningEvent_None => -1

    /**
     * @type {Integer (Int32)}
     */
    static SignalAndServiceStatusSpanningEvent_Clear => 0

    /**
     * @type {Integer (Int32)}
     */
    static SignalAndServiceStatusSpanningEvent_NoTVSignal => 1

    /**
     * @type {Integer (Int32)}
     */
    static SignalAndServiceStatusSpanningEvent_ServiceOffAir => 2

    /**
     * @type {Integer (Int32)}
     */
    static SignalAndServiceStatusSpanningEvent_WeakTVSignal => 3

    /**
     * @type {Integer (Int32)}
     */
    static SignalAndServiceStatusSpanningEvent_NoSubscription => 4

    /**
     * @type {Integer (Int32)}
     */
    static SignalAndServiceStatusSpanningEvent_AllAVScrambled => 5
}

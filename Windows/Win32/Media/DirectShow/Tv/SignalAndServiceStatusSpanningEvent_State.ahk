#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class SignalAndServiceStatusSpanningEvent_State extends Win32Enum {

    /**
     * Native name: SignalAndServiceStatusSpanningEvent_None
     * @type {Integer (Int32)}
     */
    static None => -1

    /**
     * Native name: SignalAndServiceStatusSpanningEvent_Clear
     * @type {Integer (Int32)}
     */
    static Clear => 0

    /**
     * Native name: SignalAndServiceStatusSpanningEvent_NoTVSignal
     * @type {Integer (Int32)}
     */
    static NoTVSignal => 1

    /**
     * Native name: SignalAndServiceStatusSpanningEvent_ServiceOffAir
     * @type {Integer (Int32)}
     */
    static ServiceOffAir => 2

    /**
     * Native name: SignalAndServiceStatusSpanningEvent_WeakTVSignal
     * @type {Integer (Int32)}
     */
    static WeakTVSignal => 3

    /**
     * Native name: SignalAndServiceStatusSpanningEvent_NoSubscription
     * @type {Integer (Int32)}
     */
    static NoSubscription => 4

    /**
     * Native name: SignalAndServiceStatusSpanningEvent_AllAVScrambled
     * @type {Integer (Int32)}
     */
    static AllAVScrambled => 5
}

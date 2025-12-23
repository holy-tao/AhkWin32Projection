#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class SignalAndServiceStatusSpanningEvent_State extends Win32Enum{

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

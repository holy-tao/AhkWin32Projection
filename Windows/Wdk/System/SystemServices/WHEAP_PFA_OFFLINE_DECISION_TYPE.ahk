#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_PFA_OFFLINE_DECISION_TYPE extends Win32Enum {

    /**
     * Native name: WheapPfaOfflinePredictiveFailure
     * @type {Integer (Int32)}
     */
    static PredictiveFailure => 1

    /**
     * Native name: WheapPfaOfflineUncorrectedError
     * @type {Integer (Int32)}
     */
    static UncorrectedError => 2
}

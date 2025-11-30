#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEAP_PFA_OFFLINE_DECISION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheapPfaOfflinePredictiveFailure => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheapPfaOfflineUncorrectedError => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_BUGCHECK_RECOVERY_LOG_TYPE extends Win32Enum {

    /**
     * Native name: WheaEventBugCheckRecoveryEntry
     * @type {Integer (Int32)}
     */
    static EventBugCheckRecoveryEntry => 0

    /**
     * Native name: WheaEventBugCheckRecoveryReturn
     * @type {Integer (Int32)}
     */
    static EventBugCheckRecoveryReturn => 1

    /**
     * Native name: WheaEventBugCheckRecoveryMax
     * @type {Integer (Int32)}
     */
    static EventBugCheckRecoveryMax => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_BUGCHECK_RECOVERY_LOG_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventBugCheckRecoveryEntry => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventBugCheckRecoveryReturn => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventBugCheckRecoveryMax => 2
}

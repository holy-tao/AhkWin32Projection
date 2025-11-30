#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_ACTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_BLOCK => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_PERMIT => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_CALLOUT_TERMINATING => 20483

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_CALLOUT_INSPECTION => 24580

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_CALLOUT_UNKNOWN => 16389

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_CONTINUE => 8198

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_NONE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_NONE_NO_MATCH => 8
}

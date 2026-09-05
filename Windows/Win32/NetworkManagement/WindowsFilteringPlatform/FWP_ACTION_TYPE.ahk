#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWP_ACTION_TYPE extends Win32Enum {

    /**
     * Native name: FWP_ACTION_BLOCK
     * @type {Integer (UInt32)}
     */
    static BLOCK => 4097

    /**
     * Native name: FWP_ACTION_PERMIT
     * @type {Integer (UInt32)}
     */
    static PERMIT => 4098

    /**
     * Native name: FWP_ACTION_CALLOUT_TERMINATING
     * @type {Integer (UInt32)}
     */
    static CALLOUT_TERMINATING => 20483

    /**
     * Native name: FWP_ACTION_CALLOUT_INSPECTION
     * @type {Integer (UInt32)}
     */
    static CALLOUT_INSPECTION => 24580

    /**
     * Native name: FWP_ACTION_CALLOUT_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static CALLOUT_UNKNOWN => 16389

    /**
     * Native name: FWP_ACTION_CONTINUE
     * @type {Integer (UInt32)}
     */
    static CONTINUE => 8198

    /**
     * Native name: FWP_ACTION_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 7

    /**
     * Native name: FWP_ACTION_NONE_NO_MATCH
     * @type {Integer (UInt32)}
     */
    static NONE_NO_MATCH => 8
}

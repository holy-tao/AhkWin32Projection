#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_FILTER_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_PERSISTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_BOOTTIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_HAS_PROVIDER_CONTEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_CLEAR_ACTION_RIGHT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_PERMIT_IF_CALLOUT_UNREGISTERED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_DISABLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_INDEXED => 64
}

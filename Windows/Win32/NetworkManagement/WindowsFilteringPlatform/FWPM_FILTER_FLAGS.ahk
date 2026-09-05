#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_FILTER_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: FWPM_FILTER_FLAG_NONE
     * @type {Integer (UInt32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: FWPM_FILTER_FLAG_PERSISTENT
     * @type {Integer (UInt32)}
     */
    static FLAG_PERSISTENT => 1

    /**
     * Native name: FWPM_FILTER_FLAG_BOOTTIME
     * @type {Integer (UInt32)}
     */
    static FLAG_BOOTTIME => 2

    /**
     * Native name: FWPM_FILTER_FLAG_HAS_PROVIDER_CONTEXT
     * @type {Integer (UInt32)}
     */
    static FLAG_HAS_PROVIDER_CONTEXT => 4

    /**
     * Native name: FWPM_FILTER_FLAG_CLEAR_ACTION_RIGHT
     * @type {Integer (UInt32)}
     */
    static FLAG_CLEAR_ACTION_RIGHT => 8

    /**
     * Native name: FWPM_FILTER_FLAG_PERMIT_IF_CALLOUT_UNREGISTERED
     * @type {Integer (UInt32)}
     */
    static FLAG_PERMIT_IF_CALLOUT_UNREGISTERED => 16

    /**
     * Native name: FWPM_FILTER_FLAG_DISABLED
     * @type {Integer (UInt32)}
     */
    static FLAG_DISABLED => 32

    /**
     * Native name: FWPM_FILTER_FLAG_INDEXED
     * @type {Integer (UInt32)}
     */
    static FLAG_INDEXED => 64
}

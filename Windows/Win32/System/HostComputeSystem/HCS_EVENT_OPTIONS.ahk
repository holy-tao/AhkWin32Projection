#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HCS_EVENT_OPTIONS
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_EVENT_OPTIONS
 * @namespace Windows.Win32.System.HostComputeSystem
 */
class HCS_EVENT_OPTIONS extends Win32BitflagEnum {

    /**
     * Native name: HcsEventOptionNone
     * @type {Integer (Int32)}
     */
    static OptionNone => 0

    /**
     * Native name: HcsEventOptionEnableOperationCallbacks
     * @type {Integer (Int32)}
     */
    static OptionEnableOperationCallbacks => 1

    /**
     * Native name: HcsEventOptionEnableVmLifecycle
     * @type {Integer (Int32)}
     */
    static OptionEnableVmLifecycle => 2

    /**
     * Native name: HcsEventOptionEnableLiveMigrationEvents
     * @type {Integer (Int32)}
     */
    static OptionEnableLiveMigrationEvents => 4
}

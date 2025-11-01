#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_EVENT_OPTIONS
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_EVENT_OPTIONS{

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventOptionNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventOptionEnableOperationCallbacks => 1

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventOptionEnableVmLifecycle => 2

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventOptionEnableLiveMigrationEvents => 4
}

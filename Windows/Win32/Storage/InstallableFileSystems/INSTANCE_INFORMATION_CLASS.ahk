#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
class INSTANCE_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: InstanceBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 0

    /**
     * Native name: InstancePartialInformation
     * @type {Integer (Int32)}
     */
    static PartialInformation => 1

    /**
     * Native name: InstanceFullInformation
     * @type {Integer (Int32)}
     */
    static FullInformation => 2

    /**
     * Native name: InstanceAggregateStandardInformation
     * @type {Integer (Int32)}
     */
    static AggregateStandardInformation => 3
}

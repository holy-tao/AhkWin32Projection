#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 * @version v4.0.30319
 */
class INSTANCE_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InstanceBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static InstancePartialInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static InstanceFullInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static InstanceAggregateStandardInformation => 3
}

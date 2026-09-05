#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
class FILTER_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: FilterFullInformation
     * @type {Integer (Int32)}
     */
    static FullInformation => 0

    /**
     * Native name: FilterAggregateBasicInformation
     * @type {Integer (Int32)}
     */
    static AggregateBasicInformation => 1

    /**
     * Native name: FilterAggregateStandardInformation
     * @type {Integer (Int32)}
     */
    static AggregateStandardInformation => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class ETW_PMC_COUNTER_OWNER_TYPE extends Win32Enum {

    /**
     * Native name: EtwPmcOwnerFree
     * @type {Integer (Int32)}
     */
    static Free => 0

    /**
     * Native name: EtwPmcOwnerUntagged
     * @type {Integer (Int32)}
     */
    static Untagged => 1

    /**
     * Native name: EtwPmcOwnerTagged
     * @type {Integer (Int32)}
     */
    static Tagged => 2

    /**
     * Native name: EtwPmcOwnerTaggedWithSource
     * @type {Integer (Int32)}
     */
    static TaggedWithSource => 3
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.Registry
 */
class KEY_SET_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: KeyWriteTimeInformation
     * @type {Integer (Int32)}
     */
    static WriteTimeInformation => 0

    /**
     * Native name: KeyWow64FlagsInformation
     * @type {Integer (Int32)}
     */
    static Wow64FlagsInformation => 1

    /**
     * Native name: KeyControlFlagsInformation
     * @type {Integer (Int32)}
     */
    static ControlFlagsInformation => 2

    /**
     * Native name: KeySetVirtualizationInformation
     * @type {Integer (Int32)}
     */
    static VirtualizationInformation => 3

    /**
     * Native name: KeySetDebugInformation
     * @type {Integer (Int32)}
     */
    static DebugInformation => 4

    /**
     * Native name: KeySetHandleTagsInformation
     * @type {Integer (Int32)}
     */
    static HandleTagsInformation => 5

    /**
     * Native name: KeySetLayerInformation
     * @type {Integer (Int32)}
     */
    static LayerInformation => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxKeySetInfoClass => 7
}

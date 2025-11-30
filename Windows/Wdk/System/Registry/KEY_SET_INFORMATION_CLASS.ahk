#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.Registry
 * @version v4.0.30319
 */
class KEY_SET_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KeyWriteTimeInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeyWow64FlagsInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeyControlFlagsInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static KeySetVirtualizationInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static KeySetDebugInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static KeySetHandleTagsInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static KeySetLayerInformation => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxKeySetInfoClass => 7
}

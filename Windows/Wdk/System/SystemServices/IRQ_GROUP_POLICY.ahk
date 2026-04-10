#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IRQ_GROUP_POLICY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static GroupAffinityAllGroupZero => 0

    /**
     * @type {Integer (Int32)}
     */
    static GroupAffinityDontCare => 1
}

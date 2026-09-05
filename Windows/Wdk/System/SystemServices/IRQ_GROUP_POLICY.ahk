#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IRQ_GROUP_POLICY extends Win32Enum {

    /**
     * Native name: GroupAffinityAllGroupZero
     * @type {Integer (Int32)}
     */
    static AffinityAllGroupZero => 0

    /**
     * Native name: GroupAffinityDontCare
     * @type {Integer (Int32)}
     */
    static AffinityDontCare => 1
}
